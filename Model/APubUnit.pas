unit APubUnit;

interface

uses  Windows, Forms,SysUtils, Controls, Variants, ShellApi, DB, AModelBrowser, ShlObj,ActiveX,ComObj
,cxPC;
type
  PFrameNode=^TFrameNode;

  TFrameNode=Record
    PriorNode:PFrameNode;
    NextNode:PFrameNode;
    AFrame:TAModelBrowserFrame;
    ATabSheet:TcxTabSheet;
    ACaption:string;
  end;
function GetPCName: AnsiString;
function GUserName: String;
procedure CreateShellLink;
function GetIniDirectory(const IniFile:string):string;
function GetTempDirectory(const FileName:string):string;
function Decrypt(const S: string; Key: Word): string;
function EnCrypt(const S: string; Key: Word): string;
procedure ShowWarning(Msg:string);
function  ShowQuestion(Msg:string):boolean;
procedure QAPubDataOpen(const SqlText:string);
procedure QAPubDataExec(const SqlText:string);
procedure QAPubDataClose;
function GetDateTime:string;
function GetFileDateTime(const FileName: TFileName): TDateTime;
function CopyDirectory(const Source, Dest: string): boolean;
procedure DataInsert(DataSet:TDataSet);
function SelectData(const SqlText:string;AMenuName:string='';aCurrValue:string='';Visible:Boolean=True;Size_Type:String=''):boolean;
function TreeSelectData(const AKeyField,SqlText:string;AMenuName:string=''):boolean;
function TreeSelectsData(const AMKeyField,ADKeyField,TreeSql,SqlText:string;AMenuName:string=''):boolean;
function GetStartEndDate(AIndex:integer):boolean;
function GetMonthChar(TempData:TDateTime):String;
function GetSqlTxt(const  Item_No:Integer):string;
var
   UserParentNo,ErrorTempStr,FileName,SysId,UserId,LoginId,UserName,DefaultPaths:string;  //�O�����t�Ϊ�Id,�Τ᪺Id,Login��Ʈw��Id,�Τ�m�W,�����ɸ��|
   TempString,SaveFileName,ExcelFilePath,PCName,UsersName:string; //TempString:Slelect�y�y���{�ɦr�� ,SaveFileName:Grid�O�s�����ɪ����W
   StartDate,EndDate:array[1..3] of string; //�O�s���o������ɶ��q(YYYY;MM;DD)
   IsColor,EditIsColor,TempBool,IsCopy,IsUpdate,MyIsDate,SetSelected:boolean;//IsColor,EditIsColor:�m�⪬�A;TempBool:�@�Ϊ��{�ɥ����ܶq
   TempInt,RolesId,Special,FileItem:integer;//TempInt:�@�Ϊ��{�ɾ㫬�ܶq ;RolesId �v��

const
    PassKey=2003;
    C1=1;
    C2=2048;

implementation

uses AData, APubSelectList, APubSelect, APubTreeSelect, APubTreeSelects , APubSetDate,
  MSAccess, DateUtils;

function GetSqlTxt(const  Item_No:Integer):string;
begin
if ADMSystem.QSqlTxt.Active then
ADMSystem.QSqlTxt.Close;
ADMSystem.QSqlTxt.ParamByName('Item_No').Value:=Item_No;
ADMSystem.QSqlTxt.Open;
Result:=ADMSystem.QSqlTxtSqlTxt.Value;
ADMSystem.QSqlTxt.Close;
end;

//��o�q���W
function GetPCName: AnsiString;
var
   CNameBuffer : PChar;
  fl_loaded : Boolean;
  CLen : ^DWord;
  begin
    GetMem(CNameBuffer,255);
    New(CLen);
    CLen^:= 255;
    fl_loaded := GetComputerName(CNameBuffer,CLen^);
    if fl_loaded then
      Result:= StrPas(CNameBuffer)
    else
      Result:= 'Unkown';
    FreeMem(CNameBuffer,255);
    Dispose(CLen);
end;
//��o�Τ�W
function GUserName: String;
var
  pcUser   : PChar;
  dwUSize : DWORD;
begin
  dwUSize := 21;
  result:='';
  GetMem( pcUser, dwUSize );
  try
    if Windows.GetUserName( pcUser, dwUSize ) then
      Result := pcUser
  finally
     FreeMem( pcUser );
  end;
end;
//�إߧֱ�
procedure CreateShellLink;
var
tmpObject : IUnknown;
tmpSLink : IShellLink;
tmpPFile : IPersistFile;
PIDL : PItemIDList;
StartupDirectory : array[0..MAX_PATH] of Char;
StartupFilename,FileNames : String;
LinkFilename : WideString;
begin
StartupFilename := DefaultPaths+FileName;
FileNames :='/'+copy(FileName,1,pos('.',FileName)-1);
tmpObject := CreateComObject(CLSID_ShellLink);//�Ыثإߧֱ��覡���~���X�i
tmpSLink := tmpObject as IShellLink;//���o����
tmpPFile := tmpObject as IPersistFile;//�Ψ��x�s*.lnk��󪺤���
tmpSLink.SetPath(pChar(StartupFilename));//�]�wnotepad.exe�Ҧb���|
tmpSLink.SetWorkingDirectory(pChar(ExtractFilePath(StartupFilename)));//�]�w�u�@�ؿ�
SHGetSpecialFolderLocation(0,CSIDL_DESKTOPDIRECTORY,PIDL);//��o�ୱ��Itemidlist
SHGetPathFromIDList(PIDL,StartupDirectory);//��o�ୱ���|
LinkFilename := StartupDirectory+FileNames+'.lnk';
//if not FileExists(LinkFilename) then
tmpPFile.Save(pWChar(LinkFilename),FALSE);//�O�s*.lnk���
end;

function GetIniDirectory(const IniFile:string):string;
var
    Directory:string;
begin
//SetLength(Directory,144);
//if GetWindowsDirectory(PChar(Directory),144)<>0 then
//   SetLength(Directory,StrLen(PChar(Directory)));
Directory:=DefaultPaths;
Directory:=Directory+'DSErpIni';
if not DirectoryExists(Directory) then
   CreateDir(Directory);
Result:=Directory+'\'+IniFile+'.ini';
end;

function GetTempDirectory(const FileName:string):string;
var
    Directory:string;
begin
SetLength(Directory,144);
if GetTempPath(144,PChar(Directory))<>0 then
   SetLength(Directory,StrLen(PChar(Directory)));
Result:=Directory+FileName+'.RAF';
end;

function Decrypt(const S: string; Key: Word): string;
var i:Byte;
begin
SetLength(Result,Length(S));
for i:=1 to Length(S) do
  begin
    Result[i]:=Char(Byte(S[i]) xor (Key shr 8));
    Key:=(Byte(Result[i])+Key)*C1+C2;
  end;
end;

function EnCrypt(const S: string; Key: Word): string;
var i:Byte;
begin
SetLength(Result,Length(S));
for i:=1 to Length(S) do
  begin
    Result[i]:=Char(Byte(S[i]) xor (Key shr 8));
    Key:=(Byte(S[i])+Key)*C1+C2;
  end;
end;

procedure ShowWarning(Msg:string);
begin
Application.MessageBox(PChar(Msg),Pchar(Application.Title),MB_OK+MB_ICONWARNING);
end;

function ShowQuestion(Msg:string):boolean;
begin
  Result:=Application.MessageBox(PChar(Msg),Pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)=mrYes;
end;

procedure QAPubDataOpen(const SqlText:string);
begin
with ADMSystem.QAPubData do
  begin
    if ADMSystem.QAPubData.Active then
       ADMSystem.QAPubData.Close;
    SQL.Clear;
    FilterSQL:='';
    SQL.Add(SqlText);
    Open;
  end;
end;

procedure QAPubDataExec(const SqlText:string);
begin
with ADMSystem.QAPubData do
  begin
    if ADMSystem.QAPubData.Active then
       ADMSystem.QAPubData.Close;
    SQL.Clear;
    FilterSQL:='';
    SQL.Add(SqlText);
    ExecSQL;
  end;
end;

procedure QAPubDataClose;
begin
ADMSystem.QAPubData.Close;
ADMSystem.QAPubData.FilterSQL:='';
end;

function GetDateTime:string;
begin
Result:=FormatDateTime('yyyy/mm/dd',Date)+' '+FormatDateTime('hh:mm:ss AM/PM',Time);
end;

function GetFileDateTime(const FileName: TFileName): TDateTime;
var
  FStruct: TOFSTRUCT;
  wndFile: Integer;
begin
  try
  wndFile := OpenFile(PChar(FileName), FStruct, OF_SHARE_DENY_NONE);
  Result  := FileDateToDateTime(FileGetDate(wndFile));
  CloseHandle(wndFile);
  except
    on EconvertError do
    Application.MessageBox('�S���s��(M)�L!�{�Ǥ����s,�лP�q�����p�t!!!!',
    '�t�δ���!!!', MB_OK + MB_ICONSTOP);
  end;

end;

function CopyDirectory(const Source, Dest: string): boolean;
var
 fo: TSHFILEOPSTRUCT;
begin
 FillChar(fo, SizeOf(fo), 0);
 with fo do
 begin
   Wnd := 0;
   wFunc := FO_COPY;
   pFrom := PChar(source+#0);
   pTo := PChar(Dest+#0);
   fFlags := FOF_NOCONFIRMATION+FOF_NOCONFIRMMKDIR    ;
 end;
 Result := (SHFileOperation(fo) = 0);
end;

procedure DataInsert(DataSet:TDataSet);
var A:array[0..100] of string;
    i:integer;
begin
if (DataSet.RecNo>0) then
   begin
     for i:=0 to DataSet.FieldCount-1 do
         A[i]:=DataSet.Fields[i].AsString;
     DataSet.Append;
     for i:=0 to DataSet.FieldCount-1 do
         if (DataSet.Fields[i].Tag and 16)>0 then
            DataSet.Fields[i].AsString:=A[i]
   end
else
   DataSet.Insert;
end;

function SelectData(const SqlText:string;AMenuName:string='';aCurrValue:string='';Visible:Boolean=True;Size_Type:String=''):Boolean;
begin
Screen.Cursor:=crHourGlass;
Application.CreateForm(TAPubSelectForm, APubSelectForm);
APubSelectForm.MenuName:=AMenuName;
APubSelectForm.CurrValue:=aCurrValue;
APubSelectForm.Size_Type:=Size_Type;
QAPubDataOpen(SqlText);
if (ADMSystem.QAPubData.RecordCount=0) and (Visible=False) then
 APubSelectForm.ModalResult:=mrCancel
  else
   Result:=APubSelectForm.ShowModal=mrOk;
Screen.Cursor:=crDefault;
end;

function TreeSelectData(const AKeyField,SqlText:string;AMenuName:string=''):boolean;
begin
Application.CreateForm(TAPubTreeSelectForm, APubTreeSelectForm);
APubTreeSelectForm.MenuName:=AMenuName;
APubTreeSelectForm.cxDBTreeList1.DataController.KeyField:=AKeyField;
QAPubDataOpen(SqlText);
Result:=APubTreeSelectForm.ShowModal=mrOk;
end;

function TreeSelectsData(const AMKeyField,ADKeyField,TreeSql,SqlText:string;AMenuName:string=''):boolean;
begin
Application.CreateForm(TAPubTreeSelectsForm, APubTreeSelectsForm);
with  APubTreeSelectsForm do
  begin
     MenuName:=AMenuName;
     QAPubTree.SQL.Clear;
     QAPubTree.SQL.Add(TreeSql);
     MKeyField:=AMKeyField;
     DKeyField:=ADKeyField;
     cxDBTreeList1.DataController.KeyField:=AMKeyField;
     QAPubTree.Open;
     ADMSystem.QAPubData.FilterSQL:=ADKeyField+'=''''';
     QAPubDataOpen(SqlText);
     Result:=ShowModal=mrOk;
  end;
end;

function GetStartEndDate(AIndex:integer):boolean;
begin
//1.�]�t��;2.�]�t�I���� ;4.��T�w��1;
if not Assigned(APubSetDateForm) then
   Application.CreateForm(TAPubSetDateForm, APubSetDateForm);
APubSetDateForm.DateIndex:=AIndex;
Result:=APubSetDateForm.ShowModal=mrOk;
end;

function GetMonthChar(TempData:TDateTime):String;
var AIndex:integer;
begin
AIndex:=MonthOf(TempData);
case AIndex of
1: Result:='�@';
2: Result:='�G';
3: Result:='�T';
4: Result:='�|';
5: Result:='��';
6: Result:='��';
7: Result:='�C';
8: Result:='�K';
9: Result:='�E';
10: Result:='�Q';
11: Result:='�Q�@';
12: Result:='�Q�G';
else
  Result:='';
end;
end;
end.
