unit MatClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, ppDB, ppDBPipe, DB, MemDS,
  DBAccess, MSAccess, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxCheckBox, cxCalendar;

type
  TMatClassFrame = class(TAModelBrowserFrame)
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1Mata_No: TcxDBTreeListColumn;
    cxDBTreeList1Mata_Name: TcxDBTreeListColumn;
    cxDBTreeList1Parent_No: TcxDBTreeListColumn;
    cxDBTreeList1Mat_Class: TcxDBTreeListColumn;
    cxDBTreeList1FCheck: TcxDBTreeListColumn;
    cxDBTreeList1FCheck_Name: TcxDBTreeListColumn;
    cxDBTreeList1Create_Name: TcxDBTreeListColumn;
    cxDBTreeList1Create_Date: TcxDBTreeListColumn;
    cxDBTreeList1Upd_Name: TcxDBTreeListColumn;
    cxDBTreeList1Upd_Date: TcxDBTreeListColumn;
    cxDBTreeList1Mata_No1: TcxDBTreeListColumn;
    cxDBTreeList1Mata_Name1: TcxDBTreeListColumn;
    cxDBTreeList1Parent_No1: TcxDBTreeListColumn;
    cxDBTreeList1Mat_Class1: TcxDBTreeListColumn;
    cxDBTreeList1FCheck1: TcxDBTreeListColumn;
    cxDBTreeList1FCheck_Name1: TcxDBTreeListColumn;
    cxDBTreeList1Create_Name1: TcxDBTreeListColumn;
    cxDBTreeList1Create_Date1: TcxDBTreeListColumn;
    cxDBTreeList1Upd_Name1: TcxDBTreeListColumn;
    cxDBTreeList1Upd_Date1: TcxDBTreeListColumn;
    QMatClass: TMSQuery;
    QMatClassMata_No: TStringField;
    QMatClassMata_Name: TStringField;
    QMatClassParent_No: TStringField;
    QMatClassMat_Class: TStringField;
    QMatClassFCheck: TBooleanField;
    QMatClassFCheck_Name: TStringField;
    QMatClassCreate_Name: TStringField;
    QMatClassCreate_Date: TDateTimeField;
    QMatClassUpd_Name: TStringField;
    QMatClassUpd_Date: TDateTimeField;
    DQMatClass: TDataSource;
    RQMatClass: TppDBPipeline;
    RQDbMatClassppField1: TppField;
    RQDbMatClassppField2: TppField;
    RQDbMatClassppField3: TppField;
    RQDbMatClassppField4: TppField;
    RQDbMatClassppField5: TppField;
    RQDbMatClassppField6: TppField;
    RQDbMatClassppField7: TppField;
    RQDbMatClassppField8: TppField;
    RQDbMatClassppField9: TppField;
    RQDbMatClassppField10: TppField;
    procedure QMatClassAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MatClassFrame: TMatClassFrame;

implementation

uses AData;
{$R *.dfm}

procedure TMatClassFrame.QMatClassAfterInsert(DataSet: TDataSet);
begin
QMatClassMat_Class.Value:=WhereStr;
end;

Initialization
  RegisterClass(TMatClassFrame);
finalization
  UnRegisterClass(TMatClassFrame);

end.
