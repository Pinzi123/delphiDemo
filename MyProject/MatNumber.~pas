unit MatNumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid;

type
  TMatNumberFrame = class(TAModelBrowserFrame)
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1Mata_No: TcxDBTreeListColumn;
    cxDBTreeList1Mata_Name: TcxDBTreeListColumn;
    cxDBTreeList1Parent_No: TcxDBTreeListColumn;
    QDbMatClass: TMSQuery;
    QDbMatClassMata_No: TStringField;
    QDbMatClassMata_Name: TStringField;
    QDbMatClassParent_No: TStringField;
    QDbMatClassMat_Class: TStringField;
    DDbMatClass: TDataSource;
    QDbMatNumber: TMSQuery;
    QDbMatNumberSelected: TBooleanField;
    QDbMatNumberMata_No: TStringField;
    QDbMatNumberMat_No: TStringField;
    QDbMatNumberMat_Desc: TStringField;
    QDbMatNumberMat_Name: TStringField;
    QDbMatNumberMat_Type: TStringField;
    QDbMatNumberMat_Grade: TStringField;
    QDbMatNumberMat_Soft: TStringField;
    QDbMatNumberMat_Width: TStringField;
    QDbMatNumberMat_Other: TStringField;
    QDbMatNumberChn_Color: TStringField;
    QDbMatNumberEng_Desc: TStringField;
    QDbMatNumberMat_Eng: TStringField;
    QDbMatNumberEng_Color: TStringField;
    QDbMatNumberEng_Unit: TStringField;
    QDbMatNumberChn_Unit: TStringField;
    QDbMatNumberPatten_No: TStringField;
    QDbMatNumberPatten: TStringField;
    QDbMatNumberPur_Way: TStringField;
    QDbMatNumberMat_Class: TStringField;
    QDbMatNumberAcc_Class: TStringField;
    QDbMatNumberOver_Per: TFloatField;
    QDbMatNumberSafe_Qty: TFloatField;
    QDbMatNumberVolume: TFloatField;
    QDbMatNumberVl_Unit: TStringField;
    QDbMatNumberMat_Pic: TBlobField;
    QDbMatNumberS_Position: TStringField;
    QDbMatNumberSize_Type: TStringField;
    QDbMatNumberIsCust: TBooleanField;
    QDbMatNumberIsOrder: TBooleanField;
    QDbMatNumberUse_Status: TBooleanField;
    QDbMatNumberWith_Status: TBooleanField;
    QDbMatNumberSize_Status: TBooleanField;
    QDbMatNumberLastUse_Date: TDateTimeField;
    QDbMatNumberCheck_Status: TBooleanField;
    QDbMatNumberRemark: TStringField;
    QDbMatNumberFCheck: TBooleanField;
    QDbMatNumberFCheck_Name: TStringField;
    QDbMatNumberCreate_Name: TStringField;
    QDbMatNumberCreate_Date: TDateTimeField;
    QDbMatNumberUpd_Name: TStringField;
    QDbMatNumberUpd_Date: TDateTimeField;
    QDbMatNumberPrice_Qty: TFloatField;
    DDbMatNumber: TDataSource;
    RDbMatNumber: TppDBPipeline;
    QDbMatVendor: TMSQuery;
    QDbMatVendorSelected: TBooleanField;
    QDbMatVendorMat_No: TStringField;
    QDbMatVendorVendor: TStringField;
    QDbMatVendorVnd_Sim: TStringField;
    QDbMatVendorVnd_Unit: TStringField;
    QDbMatVendorUnit_Ways: TFloatField;
    QDbMatVendorGive_days: TIntegerField;
    QDbMatVendorP_No: TStringField;
    QDbMatVendorCP_No: TStringField;
    QDbMatVendorCP_Name: TStringField;
    QDbMatVendorNet_Wt: TFloatField;
    QDbMatVendorGross_Wt: TFloatField;
    QDbMatVendorWt_Unit: TStringField;
    QDbMatVendorAply_Type: TStringField;
    QDbMatVendorCreate_Name: TStringField;
    QDbMatVendorCreate_Date: TDateTimeField;
    QDbMatVendorUpd_Name: TStringField;
    QDbMatVendorUpd_Date: TDateTimeField;
    DDbMatVendor: TDataSource;
    RDbMatVendor: TppDBPipeline;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    cxSplitter1: TcxSplitter;
    wwDBGrid2: TwwDBGrid;
    cxSplitter2: TcxSplitter;
    Panel2: TPanel;
    wwDBGrid3: TwwDBGrid;
    cxSplitter3: TcxSplitter;
    wwDBGrid4: TwwDBGrid;
    SDgAtuoplan: TMSSQL;
    PopupMenu2: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
  private
    { Private declarations }
  public
    procedure NodeChanged(Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode); override;
    { Public declarations }
  end;

var
  MatNumberFrame: TMatNumberFrame;

implementation

{$R *.dfm}

procedure TMatNumberFrame.NodeChanged(Sender: TObject; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
var MataNo:string;
begin
if (Sender as TcxDBTreeList).DataController.DataSource.DataSet.Active then
  begin
    HasChildren:=not AFocusedNode.HasChildren;
    MataNo:=AFocusedNode.Values[cxDBTreeList1Mata_No.Position.ColIndex];
    SelectWhere:='Left(Mata_No,'+IntToStr(Length(MataNo))+')='''+MataNo+''' and Mat_Class='''+WhereStr+''' ';
    QDbMatNumber.FilterSQL:=SelectWhere;
  end;
end;


Initialization
  RegisterClass(TMatNumberFrame);
finalization
  UnRegisterClass(TMatNumberFrame);
end.
 