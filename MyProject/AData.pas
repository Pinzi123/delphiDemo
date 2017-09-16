unit AData;

interface

uses
  Windows, Forms, SysUtils, Classes, ImgList, Controls, Dialogs,DB,DASQLMonitor,
  ShellApi, MSSQLMonitor, MemDS, DBAccess, MSAccess, cxPropertiesStore,
  cxTL, cxClasses, cxStyles, cxGridTableView, wwDialog, wwfltdlg,ShlObj, ActiveX,
  ExtCtrls;

type
  TADMSystem = class(TDataModule)
    ADMConnection: TMSConnection;
    QAPubData: TMSQuery;
    MSSQLMonitor: TMSSQLMonitor;
    QAPubFields: TMSQuery;
    QAPubFieldsField_Name: TStringField;
    QAPubFieldsField_Desc: TStringField;
    QAPubFieldsDisplay_Format: TStringField;
    QAPubFieldsEdit_Format: TStringField;
    QAPubFieldsField_Tag: TIntegerField;
    QAPubFieldsField_Length: TIntegerField;
    QAPubFieldsDefault_Value: TStringField;
    QAPubFrame: TMSQuery;
    QAcMenu: TMSQuery;
    QAcMenuMenu_Name: TStringField;
    QAcMenuMenu_Desc: TStringField;
    QAcMenuParent_Name: TStringField;
    QAPubTag: TMSQuery;
    SaveDialog1: TSaveDialog;
    ImageList1: TImageList;
    ImageList2: TImageList;
    QAfUser: TMSQuery;
    QAfUserUser_Id: TStringField;
    QAfUserUser_Name: TStringField;
    QAfUserDepart_No: TStringField;
    QAfUserLogin_Id: TStringField;
    ConnectionStore: TcxPropertiesStore;
    cxStyleTable: TcxStyleRepository;
    cxStyleBackGround: TcxStyle;
    cxStyleContent: TcxStyle;
    cxStyleContentEven: TcxStyle;
    cxStyleContentOdd: TcxStyle;
    cxStyleFilterBox: TcxStyle;
    cxStyleFooter: TcxStyle;
    cxStyleGroup: TcxStyle;
    cxStyleGroupByBox: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyleIncSearch: TcxStyle;
    cxStyleIndicator: TcxStyle;
    cxStylePrview: TcxStyle;
    cxStyleSelection: TcxStyle;
    cxStyleBtnFace: TcxStyle;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    TreeListStyle: TcxTreeListStyleSheet;
    cxTreeListStyle: TcxTreeListStyleSheet;
    wwFilterDialog1: TwwFilterDialog;
    QAfUserRoles: TIntegerField;
    QAfUserExe_update: TDateTimeField;
    Qdel_log: TMSQuery;
    Qdel_logStr_Auto: TIntegerField;
    Qdel_logRemark: TStringField;
    Qdel_logCreate_Date: TDateTimeField;
    QAup_log: TMSQuery;
    QAup_logStr_Auto: TIntegerField;
    QAup_logRemark: TStringField;
    QAup_logCreate_Date: TDateTimeField;
    QAfUserSpecial: TIntegerField;
    QAfUserUser_Pass: TMemoField;
    QSqlTxt: TMSQuery;
    QSqlTxtItem_No: TIntegerField;
    QSqlTxtRemark: TStringField;
    QSqlTxtSqlTxt: TStringField;
    Timer1: TTimer;
    QAup_logPc_Name: TStringField;
    QAup_logPc_User: TStringField;
    QAup_logUser_Id: TStringField;
    QAup_logMenu_Name: TStringField;
    QAup_logDataSet_Name: TStringField;
    Qdel_logPc_Name: TStringField;
    Qdel_logPc_User: TStringField;
    Qdel_logUser_Id: TStringField;
    Qdel_logMenu_Name: TStringField;
    Qdel_logDataSet_Name: TStringField;
    Qdel_logItem_No: TIntegerField;
    QAup_logItem_No: TIntegerField;
    QAfUserParentNo: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ADMConnectionError(Sender: TObject; E: EDAError;
      var Fail: Boolean);
    procedure QAcMenuBeforeOpen(DataSet: TDataSet);
    procedure SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure QAPubFieldsBeforeOpen(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ADMSystem: TADMSystem;

implementation

uses APubUnit;

{$R *.dfm}
function GetSystemPath: string;
var Path:array[0..255] of char;
begin
GetTempPath(255,Path);
Result:=COPy(Path,1,Pos('LOCALS~1',Path)-2)
end;

procedure TADMSystem.DataModuleCreate(Sender: TObject);
var  FilePath,DefaultPath,FilePaths,ExecFiles:string;
     TempPath,BatchFile:TStringList;
begin
if ADMConnection.Connected then
   ADMConnection.Disconnect;
ConnectionStore.StorageName:=ChangeFileExt(Application.GetNamePath,'AData.ini');
ConnectionStore.RestoreFrom;
ADMConnection.Username:='sa';
ADMConnection.Password:='123456';
PCName:=GetPCName;
UsersName:=GUserName;


FileName:=Application.ExeName;
ExecFiles:=Copy(SaveDialog1.DefaultExt,3,15);
while Pos('\',FileName)>0 do
   Delete(FileName,1,Pos('\',FileName));
if UpperCase(copy(GetPCName,1,4))='DSTM' then
 DefaultPath:=GetSystemPath+ExecFiles
   else
    DefaultPath:=SaveDialog1.DefaultExt;
//選擇更新網絡
TempPath := TStringList.Create;
TempPath.Delimiter := ';';
TempPath.DelimitedText := SaveDialog1.InitialDir;
if (FileExists(TempPath.Strings[0]+'\'+FileName)) or (TempPath.Count=1) then
 FilePath:=TempPath.Strings[0]
  else
   FilePath:=TempPath.Strings[1];
//選擇網絡或本地路徑
if FileExists(FilePath+'\'+FileName) then
ExcelFilePath:=FilePath+'\Excel\'
else
ExcelFilePath:=DefaultPath+'\Excel\';

SaveDialog1.DefaultExt:='';
SaveDialog1.InitialDir:='';
DefaultPaths:=DefaultPath+'\';
FilePaths:=FilePath+'\';

if SaveDialog1.Tag=0 then
   Exit;
if UpperCase(ExtractShortPathName(ExtractFilePath(Application.ExeName)))<>UpperCase(ExtractShortPathName(DefaultPaths)) then
   begin
     if (not DirectoryExists(DefaultPaths))  then
         CopyDirectory(FilePath,DefaultPaths);
     if not FileExists(DefaultPaths+'AData.ini')  then
         CopyDirectory(FilePaths+'AData.ini',DefaultPaths);
     if not FileExists(DefaultPaths+FileName)then
         CopyDirectory(FilePaths+FileName,DefaultPaths);
         CreateShellLink;
     Application.Terminate;
     //ShellExecute(0,'Open',PChar(DefaultPaths+FileName),'','',sw_ShowNormal);
   end
else
if FileExists(FilePaths+FileName)  then
begin
if GetFileDateTime(UpperCase(DefaultPaths+FileName))<GetFileDateTime(UpperCase(FilePaths+FileName)) then
   begin
     BatchFile := TStringList.Create;
     try
        BatchFile.Add(':Label1');
        BatchFile.Add('DEL '+DefaultPaths+FileName );
        BatchFile.Add('if Exist '+DefaultPaths+FileName+' Goto Label1');
        BatchFile.Add('COPY '+FilePaths+FileName+' '+DefaultPaths+FileName);
        BatchFile.Add(DefaultPaths+FileName);
        BatchFile.Add('Del '+DefaultPaths+'Update.bat' );
        BatchFile.SaveToFile(DefaultPaths+'Update.bat');
        WinExec(PChar(DefaultPaths+'Update.bat'), SW_HIDE);
     finally
        BatchFile.Free;
     end;
     Application.Terminate;
   end;
end
 else
  ShowWarning('無有效的網絡盤!!!');
end;

procedure TADMSystem.DataModuleDestroy(Sender: TObject);
begin
ADMSystem.ADMConnection.Disconnect;
end;

procedure TADMSystem.ADMConnectionError(Sender: TObject; E: EDAError;
  var Fail: Boolean);
var ErrorCode:integer;
begin
ErrorCode:=(E as EDAError).ErrorCode;
case ErrorCode of
  17:E.Message:=E.Message+#13+'無法連接到數據庫服務器,請與電腦室聯系!!!';
  32:E.Message:=E.Message+#13+'此筆資料已被別人修改,請刷新後再修改!!!!!!';
  170:E.Message:=E.Message+#13+'條件語法有誤!!!';
  513:E.Message:=E.Message+#13+'輸入的內容不符合要求!!!!!!';
  515:E.Message:=E.Message+#13+'不可以為空的欄位必須輸入內容!!!';
  547:E.Message:=E.Message+#13+'此筆資料所引用的資料不存在!!!';
  1010:E.Message:=E.Message+#13+'數值欄位不可為空!!!';
  2627:E.Message:=E.Message+#13+'資料輸入重复!!!';
  18456:E.Message:=E.Message+#13+'用戶已停用,請與電腦室聯系!!!';
end;
ErrorTempStr:=E.Message;
if (ErrorCode=17) or (ErrorCode=18456) then
 begin
  ShowMessage(E.Message);
  Application.Terminate;
 end;
Fail:=True;
end;

procedure TADMSystem.QAcMenuBeforeOpen(DataSet: TDataSet);
begin
QAcMenu.SQL.Clear;
TempString:='SELECT  VA.Menu_Name, VA.Menu_Desc , VA.Parent_Name  FROM    dbo.Ah_Visible INNER JOIN  (SELECT   dbo.Ac_Menu.Menu_Name, dbo.Ac_Menu.Menu_Desc, Parent_Name, '
           +'dbo.Aa_GetMenuRight(dbo.Af_User.User_Id,  dbo.Ac_Menu.Menu_Name) AS Action_Right FROM   dbo.Af_User CROSS JOIN  dbo.Ac_Menu   WHERE  (LEFT(dbo.Ac_Menu.Menu_Name, 1)=''%S'') AND '
           +'(dbo.Af_User.User_Id = ''%S'')) VA ON  dbo.Ah_Visible.Menu_Name = VA.Menu_Name WHERE  (dbo.Ah_Visible.User_Id = ''%S'') AND (dbo.Ah_Visible.Menu_Visible = 1) AND VA.Action_Right&1>0';
QAcMenu.SQL.Add(Format(TempString,[SysId,UserId,UserId]));
end;

procedure TADMSystem.SaveDialog1CanClose(Sender: TObject;
  var CanClose: Boolean);
begin
SaveFileName:=SaveDialog1.FileName;
if Pos('.',SaveFileName)>0 then
   SaveFileName:=Copy(SaveFileName,1,Length(SaveFileName)-4);
case SaveDialog1.FilterIndex of
1:SaveFileName:=SaveFileName+'.xls';
2:SaveFileName:=SaveFileName+'.html';
3:SaveFileName:=SaveFileName+'.xml';
4:SaveFileName:=SaveFileName+'.txt';
end;
if FileExists(SaveFileName) then
   CanClose:=ShowQuestion('文件已存在,要覆蓋嗎?');
end;

procedure TADMSystem.QAPubFieldsBeforeOpen(DataSet: TDataSet);
begin
QAPubFields.SQL.Clear;
TempString:='SELECT  dbo.Aa_Fields.Field_Name, dbo.Aa_Fields.Field_Desc, dbo.Aa_Fields.Display_Format, dbo.Aa_Fields.Edit_Format, dbo.Aa_Fields.Field_Tag, dbo.Aa_Fields.Field_Length, dbo.Aa_Fields.Default_Value FROM   dbo.Aa_Fields  '
           +'CROSS JOIN   dbo.Ac_Menu  WHERE  (dbo.Ac_Menu.Menu_Tag > 0) AND (dbo.Ac_Menu.Menu_Name = ''%S'') AND ((dbo.Aa_Fields.Field_Roles & dbo.Ac_Menu.Menu_Tag) > 0)  ORDER BY  dbo.Aa_Fields.Field_Name ';
QAPubFields.SQL.Add(Format(TempString,[SysId]));
end;

procedure TADMSystem.Timer1Timer(Sender: TObject);
begin
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
  SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
  Application.ProcessMessages;
end;
end;

end.
