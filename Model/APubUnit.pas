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
   UserParentNo,ErrorTempStr,FileName,SysId,UserId,LoginId,UserName,DefaultPaths:string;  //記錄本系統的Id,用戶的Id,Login資料庫的Id,用戶姓名,執行檔路徑
   TempString,SaveFileName,ExcelFilePath,PCName,UsersName:string; //TempString:Slelect語句的臨時字串 ,SaveFileName:Grid保存為文件時的文件名
   StartDate,EndDate:array[1..3] of string; //保存取得的日期時間段(YYYY;MM;DD)
   IsColor,EditIsColor,TempBool,IsCopy,IsUpdate,MyIsDate,SetSelected:boolean;//IsColor,EditIsColor:彩色狀態;TempBool:共用的臨時布爾變量
   TempInt,RolesId,Special,FileItem:integer;//TempInt:共用的臨時整型變量 ;RolesId 權集

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

//獲得電腦名
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
//獲得用戶名
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
//建立快捷
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
tmpObject := CreateComObject(CLSID_ShellLink);//創建建立快捷方式的外殼擴展
tmpSLink := tmpObject as IShellLink;//取得介面
tmpPFile := tmpObject as IPersistFile;//用來儲存*.lnk文件的介面
tmpSLink.SetPath(pChar(StartupFilename));//設定notepad.exe所在路徑
tmpSLink.SetWorkingDirectory(pChar(ExtractFilePath(StartupFilename)));//設定工作目錄
SHGetSpecialFolderLocation(0,CSIDL_DESKTOPDIRECTORY,PIDL);//獲得桌面的Itemidlist
SHGetPathFromIDList(PIDL,StartupDirectory);//獲得桌面路徑
LinkFilename := StartupDirectory+FileNames+'.lnk';
//if not FileExists(LinkFilename) then
tmpPFile.Save(pWChar(LinkFilename),FALSE);//保存*.lnk文件
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
    Application.MessageBox('沒有連接(M)盤!程序不能更新,請與電腦室聯系!!!!',
    '系統提示!!!', MB_OK + MB_ICONSTOP);
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
//1.包含日;2.包含截止日期 ;4.日固定為1;
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
1: Result:='一';
2: Result:='二';
3: Result:='三';
4: Result:='四';
5: Result:='五';
6: Result:='六';
7: Result:='七';
8: Result:='八';
9: Result:='九';
10: Result:='十';
11: Result:='十一';
12: Result:='十二';
else
  Result:='';
end;
end;
end.
