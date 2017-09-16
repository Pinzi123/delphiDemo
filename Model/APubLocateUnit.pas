unit APubLocateUnit;

interface

{$i wwIfDef.pas}

uses
  Windows, Messages, SysUtils,  Classes, Controls, Forms,  Dialogs, 
  DB, ComCtrls, DBTables,wwstr, wwDialog, wwintl, wwSystem,wwCommon,dbitypes;

type
  TwwLocateMatchType = (mtExactMatch,  mtPartialMatchStart, mtPartialMatchAny);

 Function wwFindMatch(FromBeginning: boolean;
	       DataSet: TDataSet; searchField: string;
	       searchValue: string; matchType: TwwLocateMatchType;
	       caseSens: boolean;UseLocateMethod: boolean = False): boolean;
  
implementation

uses APubUnit;

{$ifdef wwDelphi3Up}
Function MemoMatch(field : TField;
	       memoBuffer: PChar; val1 :Pchar;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean;
               RichEditControl: TRichEdit): boolean;
var matchPos: Integer;
    s: string;
begin
{   result:= False;}

   if RichEditControl<>Nil then
   begin
      RichEditControl.PlainText:= False;
      RichEditControl.Lines.Assign(Field);
      RichEditControl.PlainText:= True;
      s:= RichEditControl.Text;
   end
   else s:= field.asstring;

   if not caseSens then s := AnsiUpperCase(s);

   if MatchType = mtExactMatch then begin
      {$WARNINGS OFF}
      if strlen(val1)<>length(s) then result:= False
      {$WARNINGS ON}
      else begin
         matchPos:= AnsiPos(StrPas(val1),s);
         result:= (matchPos=1);
      end
   end
   else if matchType = mtPartialMatchStart then begin
       matchPos:= AnsiPos(StrPas(val1),s);
       result:= (matchPos=1);
   end
   else if MatchType = mtPartialMatchAny then begin
       matchPos:= AnsiPos(StrPas(val1),s);
       result:= (matchPos<>0);
   end
   else result:= False;
end;

{$else}
Function MemoMatch(field : TField;
	       memoBuffer: PChar; val1 :Pchar;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean): boolean;
var matchPtr: PChar;
    numread: integer;
    blobStream: TBlobStream;
begin
   result:= False;
   blobStream:= Nil;
   try
      blobStream:= TBlobStream.create(TBlobField(field), bmRead);
      if blobStream=Nil then
        begin
          ShowWarning('建立Blob欄位失敗!');
	        Exit;
        end;

      numread:= blobStream.read(memobuffer^, 32767);
      memobuffer[numread]:= #0; { null-terminate }

      if numread = 0 then strcopy(memobuffer, '');

      if not caseSens then
        StrUpper(memobuffer);

      if MatchType = mtExactMatch then begin
	 if strlen(val1)<>numread then result:= False
	else begin
	    matchPtr:= strPos(memobuffer, val1);
	    if matchPtr<>Nil then
	       result:= (matchPtr=memoBuffer);
	 end
      end else if matchType = mtPartialMatchStart then
      begin
	 matchPtr:= strPos(memobuffer, val1);
	 if matchPtr<>Nil then
	    result:= (matchPtr=memoBuffer);
      end
      else if MatchType = mtPartialMatchAny then
      begin
	 matchPtr:= strPos(memobuffer, val1);
	 result:= (matchPtr<>Nil);
      end
      else result:= False;
   finally
       blobStream.free;
   end;
end;

{$endif}

Function ValueAsString(field : TField; buffer: PChar) : string;
type
   WordPtr =^Word;
   IntegerPtr = ^Integer;
   LongPtr =^LongInt;
   FloatPtr = ^Double;
   Int64Ptr=^Int64;

   TDateTimeRec = record
     case TFieldType of
       ftDate: (Date: Longint);
       ftTime: (Time: Longint);
       ftDateTime: (DateTime: TDateTime);
   end;
   DateTimePtr = ^TDateTimeRec;

var
   DateTimeData: TDateTimeRec;
   floatValue: Double;

{$ifdef win32}
    TimeStamp: TTimeStamp;
{$endif}

{$ifndef wwDelphi3Up}
    Len:Integer;
{$endif}

begin
   result:= '';

   case field.DataType of
      ftString:
	 begin
	    if (field is TStringField) then
	       if TStringField(field).transliterate then
               begin
                  { 11/06/1997 - Added international character support.}
                  {$ifdef wwDelphi3Up}
                     Field.DataSet.Translate(Buffer,Buffer,False);
                  {$else}
                  Len := Strlen(Buffer);     
                  NativeToAnsiBuf(Field.Dataset.Locale,Buffer,Buffer,Len);
                  {$endif}
               end;
	    result:= strPas(buffer);
	 end;

      ftSmallInt, ftWord: result:= inttostr(WordPtr(buffer)^);

      ftInteger: result:= inttostr(LongPtr(buffer)^);

      ftLargeInt: result := inttostr(Int64Ptr(Buffer)^);  //10/16/2001-Support ftLargeInt?

      {$ifdef win32}
      ftAutoInc: result:= inttostr(LongPtr(buffer)^);  { 12/2/96 - Support autoincrement field }
      {$endif}

      {$ifdef wwDelphi6Up}
      ftFMTBcd,
      {$endif}
      ftFloat, ftBCD, ftCurrency:
	 begin
	    floatValue:= FloatPtr(buffer)^;
	    result:= floattostr(floatValue);
	 end;

      ftBoolean: begin
		     if buffer[0]<>char(0) then result:= 'True'
		     else result:= 'False';
		 end;

      ftDateTime:  begin
	    DateTimeData:= DateTimePtr(buffer)^;
	    {$ifdef win32}
            result := DateToStr(TimeStampToDateTime(MSecsToTimeStamp(FloatPtr(Buffer)^))); {12/10/96 }
	    {$else}
	    result:= DateToStr(DateTimeData.DateTime/MSecsPerDay);
	    {$endif}
	 end;

      ftDate :  begin
	    DateTimeData:= DateTimePtr(buffer)^;
	    {$ifdef win32}
	    TimeStamp.Time:= 0;
	    TimeStamp.Date:= DateTimeData.Date;
	    result:= DateToStr(TimeStampToDateTime(TimeStamp));
	    {$else}
	    result:= DateToStr(DateTimeData.Date);
	    {$endif}
	 end;

      ftTime :  begin
	    DateTimeData:= DateTimePtr(buffer)^;
	    result:= TimeToStr(DateTimeData.Time/MSecsPerDay);
	 end;

      else;
   end
end;

Function Match(val1: string; val2: string;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean): boolean;
var matchPos: integer;
begin
   if not caseSens then val1:= AnsiUppercase(val1); {11/06/1997 - Changed to AnsiUppercase}

   if MatchType = mtExactMatch then begin
      if length(val1)<>length(val2) then result:= False
      else begin
	 if length(val1)=0 then result:= True
	 else begin
	    matchPos:= Pos(val2, val1);
	    result:= (matchPos=1);
	 end
      end
   end else if matchType = mtPartialMatchStart then
   begin
      matchPos:= Pos(val2, val1);
      result:= (matchPos=1);
   end
   else if MatchType = mtPartialMatchAny then
   begin
      matchPos:= Pos(val2, val1);
      result:= (matchPos<>0);
   end
   else result:= False;

end;


Function wwFindMatch(FromBeginning: boolean;
	       DataSet: TDataSet;
	       searchField: string;
	       searchValue: string;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean;
               UseLocateMethod: boolean = False): boolean;
var FindText, TableFieldValue: string;
    fieldNo: integer;
    MatchFound: boolean;
    cfindText, recBuffer, buffer, memobuffer: PChar;
    isBlank: Bool;
    Bookmark: TBookmark;
    fldtype: TFieldType;
    curfield: TField;
    currentValue: string;
    stopOnMismatch: boolean;
    firstIndexField: TField;
    IndexFieldCount: integer;
    TempRichEdit: TRichEdit;

  Function IndexCaseSensitive(Tbl: TDataSet): boolean;
  var i: integer;
  begin
     result:= False;
     if Tbl is TTable then with Tbl as TTable do begin
        for i:= 0 to IndexDefs.count-1 do begin      {11/06/1997-Changed to AnsiUpperCase}
           if (AnsiUppercase(IndexDefs.Items[i].Name)=AnsiUppercase(IndexName)) then begin
    	      result:= not (ixCaseInsensitive in IndexDefs.Items[i].Options);
              break;
           end
        end
     end
  end;

   { Make sure indexed field is in field map}
   Function ValidIndexField: boolean;
   var parts: TStrings;
       i: integer;
   begin
      result:= False;
      parts:= TStringList.create;

      with (DataSet as TTable) do for i:= 0 to IndexDefs.count-1 do begin
	 with IndexDefs do begin
	     if (AnsiUppercase(IndexName)=AnsiUppercase(Items[i].name)) then {Changed to AnsiUpperCase}
	     begin
		strBreakApart(Items[i].fields, ';', parts);
		if parts.count<=0 then continue;
		result:= FindField(parts[0])<>Nil;
		break;
	     end
	 end
      end;

      parts.Free;
   end;

   procedure ApplyMatch;
   begin
      dataset.updatecursorpos;  {4/14/97}
      dataset.resync([rmExact,rmCenter]); { Always call resync }
      MatchFound := True;
   end;

   Function FloatingType(field: TField): boolean;
   begin
      result:= field.DataType in [ftFloat, ftBCD,
      {$ifdef wwDelphi6Up}
      ftFMTBcd,
      {$endif}
      ftCurrency];
   end;

   Function GetNextFieldValue(Forward: boolean; var FieldValue: string): boolean;
   begin
      FieldValue:= '';

      if wwisNonBDEField(curField) then begin
	 Result:= not DataSet.eof;
	 if Result then begin
	    Dataset.Next;
            // 10/25/2001 - Need to check EOF again. (PYW)
            result := not Dataset.eof;
            if result then FieldValue:= curField.asString;
	 end
      end
      else begin
	 result:=dbiGetNextRecord((Dataset as TDBDataSet).handle, dbiNoLock, buffer, nil)=0;
	 if result then begin
	    dbiGetField((DataSet as TDBDataSet).handle, FieldNo+1, buffer, recBuffer, isBlank);
            if isBlank then FieldValue:= ''  { 4/29/97 - Delphi 1 bug with null fields requires this }
            else FieldValue:= ValueAsString(curField, recBuffer); {5/24/95}
	 end
      end
   end;


   Function FindRecord: boolean;
   begin
     if caseSens then begin
         if (MatchType=mtExactMatch) then result:= DataSet.Locate(searchField, SearchValue, [])
         else result:= DataSet.Locate(searchField, SearchValue, [loPartialKey]);
     end
     else begin
        if (MatchType=mtExactMatch) then result:= DataSet.Locate(searchField, SearchValue, [loCaseInsensitive])
        else result:= DataSet.Locate(searchField, SearchValue, [loPartialKey, loCaseInsensitive]);
     end;
   end;


begin
   Result:= False;
   DataSet.checkBrowseMode;

   curField:= DataSet.findField(searchField);
   if curField=Nil then begin
      ShowWarning('欄位'+ searchField +'找不到!');
      exit;
   end;

   FieldNo:= curField.FieldNo - 1;

   if wwMemAvail(32767) then begin
      ShowWarning('超出內存容量!');
      exit;
   end;

   DataSet.updateCursorPos;

   if not caseSens then FindText:= AnsiUppercase(SearchValue) {11/06/1997 - Changed to AnsiUpperCase}
   else FindText:= SearchValue;

   stopOnMismatch:= False;


   if (dataSet is TTable)
      and (curField.dataType<>ftMemo) and (not wwIsTableQuery(DataSet)) then
   begin
      (dataset as TTable).IndexDefs.update;
      IndexFieldCount:= (dataSet as TTable).indexFieldCount;
      if IndexFieldCount>0 then FirstIndexField:= (dataSet as TTable).indexfields[0]
      else FirstIndexField:= nil;

      if not caseSens then currentValue:= AnsiUppercase(curField.asString) {11/06/1997- Changed to AnsiUpperCase}
      else currentValue:= curField.asString;;

      if (indexFieldCount>0) and (matchType=mtExactMatch) and
	 validIndexField and
	 (AnsiUppercase(curField.fieldName) = AnsiUppercase(FirstIndexField.fieldName)) and
	 ((currentValue<>FindText) or FromBeginning) and (curField.dataType<>ftBoolean) then
      begin
	 if (curField.DataType <> ftString) or {case sensitive matches index }
	    (IndexCaseSensitive(dataSet) = caseSens) then
	 begin
            if (dataSet is TTable) then
               result:= (dataSet as TTable).findKey([FindText]);
	    exit;
	 end
      end;

      { Partial match start using index}
      if (indexFieldCount>0) and (matchType=mtPartialMatchStart) and
	 validIndexField and
	 (AnsiUppercase(curField.fieldName) = AnsiUppercase(FirstIndexField.fieldName)) and
	 (curField.dataType=ftString) then
      begin
	 if (IndexCaseSensitive(dataSet) = caseSens) then
	 begin
	    stopOnMismatch:= True;

	    if ((not Match(FirstIndexField.asString, FindText, matchType, caseSens)) or
		fromBeginning) then
	    begin

	       if not FromBeginning then begin
		 if not caseSens then begin
		    if (FindText<Ansiuppercase(FirstIndexField.asString)) then exit;  {Not found} {11/07/1997 - Changed to AnsiUpperCase}
		 end
		 else begin
		    if (FindText<FirstIndexField.asString) then exit;  {Not found}
		 end
	       end;

               if (dataSet is TTable) then
                  (dataSet as TTAble).findNearest([FindText]);
	       result:= Match(FirstIndexField.asString, FindText, matchType, caseSens);
	       exit;
	    end
	 end
      end
   end;

   buffer:= Nil;
   recBuffer:= Nil;
   cfindText:= Nil;
   memoBuffer:= Nil;
   bookmark:= nil;
   tempRichEdit:= nil;

   try
      fldType:= curField.DataType;

      GetMem(buffer, 32767);
      GetMem(recBuffer, 256);
      Bookmark:= Dataset.GetBookmark;
      if FromBeginning then begin
	 DataSet.First; { do before allocating blob }
	 DataSet.updateCursorPos;
      end;

      if fldType = ftMemo then begin
	 GetMem(memoBuffer, 32767);
	 GetMem(cFindText, 256);
	 strpcopy(cfindText, FindText);
	 if not caseSens then
      {$ifdef wwDelphi3Up}
           AnsiStrUpper(cfindText); {11/06/1997 - Changed to AnsiStrUpper}
      {$else}
           StrUpper(cfindText);
      {$endif}
         if wwIsRichEditField(curField, True) then begin
            tempRichEdit:= TRichEdit.create(Screen.ActiveForm);
            tempRichEdit.visible:= False;
            tempRichEdit.parent:= Screen.ActiveForm;
         end
      end;

      Screen.cursor:= crHourGlass;

      if FromBeginning then begin
	 if fldType <> ftMemo then begin
	    if (matchType = mtExactMatch) and FloatingType(curField) and (FindText<>'') then begin
	       if wwStrToFloat(FindText) and (curField.asFloat=StrToFloat(FindText)) then
	       begin
		  ApplyMatch;
		  exit;
	       end
	    end
	    else if Match(curField.asString, FindText, matchType, caseSens) then
	    begin
	       ApplyMatch;
	       exit;
	    end
	 end
	 else begin
	    if MemoMatch(curField, memoBuffer, CFindText, matchType, caseSens, TempRichEdit) then
	    begin
	       ApplyMatch;
               exit;
            end
	 end;
	 DataSet.updateCursorPos;

      end;

      MatchFound:= False;
      if fldType <> ftMemo then begin
	 if wwisNonBDEField(curField) then Dataset.DisableControls;

         { 2/24/2000 - Optimization for ADO datasets - Use locate method }
         if FromBeginning and (matchType in [mtExactMatch, mtPartialMatchStart]) then
         begin
            if (wwInternational.ADO.UseLocateWhenFindingValue and
                wwIsClass(DataSet.ClassType, 'TCustomADODataSet')) or
                UseLocateMethod then
            begin
               if (curField.dataType<>ftMemo) and not (curField.calculated) and
                  not (curfield.lookup) then
               begin
                  if FindRecord then ApplyMatch;
                  exit;
               end
            end
         end;

	 while GetNextFieldValue(True, TableFieldValue) do
	 begin
	    if (matchType = mtExactMatch) and FloatingType(curField) and (FindText<>'') then begin
	       if wwStrToFloat(FindText) and (TableFieldValue<>'') and {1/7/98 - Ensure non-null value }
                 (StrToFloat(TableFieldValue)=StrToFloat(FindText)) then
	       begin
		  ApplyMatch;
		  exit;
	       end
	    end
	    else if Match(TableFieldValue, FindText, matchType, caseSens) then
	    begin
	       ApplyMatch;
	       break;
	    end
	    else if StopOnMismatch then break;
	 end
      end
      else begin
	 Dataset.DisableControls;
         while True do
         begin
            { 11/10/97 - Do not call dbiGetNextRecord for memo field }
            if DataSet.eof then break;
            DataSet.Next;
            if DataSet.eof then break;  { 4/20/98 - Test eof after calling Next }

            if MemoMatch(curField, memoBuffer, CFindText, matchType, caseSens, TempRichEdit) then
	    begin
               ApplyMatch;
               break;
            end
	 end;
	 Dataset.EnableControls;
      end;

   finally
      if wwisNonBDEField(curField) then Dataset.EnableControls;

      FreeMem(recBuffer, 256);
      FreeMem(buffer, 32767);
      if curField.dataType = ftMemo then begin
	 FreeMem(cFindText, 256);
	 FreeMem(memoBuffer, 32767);
      end;
      Screen.cursor:= crDefault;
      if (not MatchFound) then dataSet.gotoBookmark(bookmark);
      dataSet.FreeBookmark(bookmark);
      tempRichEdit.Free;

      result:= MatchFound;
   end;
end;

end.
