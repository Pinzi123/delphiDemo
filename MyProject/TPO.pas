unit TPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
<<<<<<< HEAD
  Dialogs, ActnList,   ExtCtrls, ComCtrls, ToolWin, DB,
  fcStatusBar, Menus, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  APubUnit,AModelBrowser, cxSplitter, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData,ImgList, cxPropertiesStore, MemDS, DBAccess,
  MSAccess, Wwintl, cxPC, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid,
  ppRelatv, ppProd, ppClass, ppReport, ppComm, ppEndUsr ;
=======
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid, TeInputEditorForm;
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15

type
  TPOFrame = class(TAModelBrowserFrame)
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    cxSplitter1: TcxSplitter;
    QTePurchase: TMSQuery;
    QTePurchasea: TMSQuery;
    DTePurchase: TDataSource;
    DTePurchasea: TDataSource;
    RTePurchase: TppDBPipeline;
    RTePurchasea: TppDBPipeline;
    QTePurchaseSelected: TBooleanField;
    QTePurchaseaSelected: TBooleanField;
    QTePurchaseMade_Factory: TStringField;
    QTePurchasePur_No: TStringField;
    QTePurchaseVendor: TStringField;
    QTePurchaseVnd_Sim: TStringField;
    QTePurchaseSum_Price: TFloatField;
    QTePurchasePA: TStringField;
    QTePurchasePur_Date: TDateTimeField;
    QTePurchaseTemp_Status: TBooleanField;
    QTePurchaseD_Count: TIntegerField;
    QTePurchaseRemark: TStringField;
    QTePurchaseRemark1: TStringField;
    QTePurchaseFCheck: TBooleanField;
    QTePurchaseFCheck_Name: TStringField;
    QTePurchaseFCheck_Date: TDateTimeField;
    QTePurchaseRCheck: TBooleanField;
    QTePurchaseRCheck_Name: TStringField;
    QTePurchaseRCheck_Date: TDateTimeField;
    QTePurchaseCreate_Name: TStringField;
    QTePurchaseCreate_Date: TDateTimeField;
    QTePurchaseUpd_Name: TStringField;
    QTePurchaseUpd_Date: TDateTimeField;
    QTePurchaseModify_Date: TDateTimeField;
    QTePurchaseFax_Date: TDateTimeField;
    QTePurchaseaPur_No: TStringField;
    QTePurchaseaItem_No: TIntegerField;
    QTePurchaseaConn_No: TStringField;
    QTePurchaseaMat_No: TStringField;
    QTePurchaseaVendor: TStringField;
    QTePurchaseaVnd_Sim: TStringField;
    QTePurchaseaPrice: TFloatField;
    QTePurchaseaPur_Qty: TFloatField;
    QTePurchaseaReq_Pur_Qty: TFloatField;
    QTePurchaseaIn_Qty: TFloatField;
    QTePurchaseaVnd_Qty: TFloatField;
    QTePurchaseaSto_Qty: TFloatField;
    QTePurchaseaGive_Date: TDateTimeField;
    QTePurchaseaRemark: TStringField;
    QTePurchaseaCreate_Name: TStringField;
    QTePurchaseaCreate_Date: TDateTimeField;
    QTePurchaseaUpd_Name: TStringField;
    QTePurchaseaUpd_Date: TDateTimeField;
    QTePurchaseaMat_Desc: TStringField;
    QTePurchaseaMat_Name: TStringField;
<<<<<<< HEAD
    QUser: TMSQuery;
    DUser: TDataSource;
    RUser: TppDBPipeline;
    QUserUserName: TStringField;
    procedure QTePurchaseaAfterPost(DataSet: TDataSet);
    procedure QTePurchaseAfterPost(DataSet: TDataSet);
    procedure ActionPrivewExecute(Sender: TObject);
=======
    procedure QTePurchaseaAfterPost(DataSet: TDataSet);
    procedure QTePurchaseAfterPost(DataSet: TDataSet);
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  POFrame: TPOFrame;

implementation

uses AData;

{$R *.dfm}

procedure TPOFrame.QTePurchaseaAfterPost(DataSet: TDataSet);
begin
  inherited;
  QTePurchase.Refresh;
  QTePurchasea.Refresh;
end;


procedure TPOFrame.QTePurchaseAfterPost(DataSet: TDataSet);
begin
  inherited;
  QTePurchase.Refresh;
end;

<<<<<<< HEAD
procedure TPOFrame.ActionPrivewExecute(Sender: TObject);
begin
  with QUser do begin
    Close;
    with SQL do begin
      Clear;
      Add('SELECT UserName=''' + UserName + '''');
    end;
    Open;
  end;

  inherited;

end;

=======
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15
Initialization
  RegisterClass(TPOFrame);
finalization
  UnRegisterClass(TPOFrame);
end.
