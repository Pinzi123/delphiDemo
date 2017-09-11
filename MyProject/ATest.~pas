unit ATest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, ppDB, ppDBPipe, DB, MemDS,
  DBAccess, MSAccess, Grids, Wwdbigrd, Wwdbgrid;

type
  TForm1 = class(TAModelBrowserFrame)
    DBGrid1: TwwDBGrid;
    QAfUser: TMSQuery;
    QAfUserSelected: TBooleanField;
    strngfldQAfUserUser_Id: TStringField;
    strngfldQAfUserUser_Name: TStringField;
    strngfldQAfUserDepart_No: TStringField;
    strngfldQAfUserDepart_Name: TStringField;
    strngfldQAfUserLogin_Id: TStringField;
    intgrfldQAfUserRoles: TIntegerField;
    strngfldQAfUserGroup_Desc: TStringField;
    intgrfldQAfUserSpecial: TIntegerField;
    dtmfldQAfUserExe_update: TDateTimeField;
    QAfUserUser_Write: TBlobField;
    strngfldQAfUserE_Mail: TStringField;
    strngfldQAfUserCreate_Name: TStringField;
    dtmfldQAfUserCreate_Date: TDateTimeField;
    strngfldQAfUserUpd_Name: TStringField;
    dtmfldQAfUserUpd_Date: TDateTimeField;
    dsDAfUser: TDataSource;
    RAfUser: TppDBPipeline;
    procedure QAfUserCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses AData,APubUnit;
{$R *.dfm}
procedure TForm1.QAfUserCalcFields(DataSet: TDataSet);
var Str1:string;
begin
  inherited;
Str1:='';
TempString:='SELECT  Group_Desc  FROM  dbo.Ae_Group  WHERE  ((''%S'' & Group_Tag) > 0)';
QAPubDataOpen(Format(TempString,[intgrfldQAfUserRoles.AsString]));
while not(ADMSystem.QAPubData.Eof) do
 begin
  Str1:= Str1+ADMSystem.QAPubData.FieldByName('Group_Desc').Value+';';
  ADMSystem.QAPubData.Next;
 end;
 strngfldQAfUserGroup_Desc.Value:= Str1;
 ADMSystem.QAPubData.Close;
end;

Initialization
  RegisterClass(TForm1);
finalization
  UnRegisterClass(TForm1);
end.
