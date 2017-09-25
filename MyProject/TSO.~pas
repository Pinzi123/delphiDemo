unit TSO;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid, Unit4;

type
  TSOFrame = class(TForm4)
    QTeAList_No: TStringField;
    QTeAItem_No: TIntegerField;
    QTeAPart_No: TStringField;
    QTeAMat_No: TStringField;
    QTeAVendor: TStringField;
    QTeAUse_Cust: TStringField;
    QTeAReq_Qty: TFloatField;
    QTeAList_Qty: TFloatField;
    QTeAOut_Qty: TFloatField;
    QTeARemark: TStringField;
    QTeACreate_Name: TStringField;
    QTeACreate_Date: TDateTimeField;
    QTeAUpd_Name: TStringField;
    QTeAUpd_Date: TDateTimeField;
    QTeMasterList_No: TStringField;
    QTeMasterDepart_No: TStringField;
    QTeMasterDepart_Name: TStringField;
    QTeMasterUse_Group: TStringField;
    QTeMasterList_Date: TDateTimeField;
    QTeMasterRemark: TStringField;
    QTeMasterFCheck: TBooleanField;
    QTeMasterFCheck_Name: TStringField;
    QTeMasterCreate_Name: TStringField;
    QTeMasterCreate_Date: TDateTimeField;
    QTeMasterUpd_Name: TStringField;
    QTeMasterUpd_Date: TDateTimeField;
    QTeAMat_Desc: TStringField;
    QTeAMat_Name: TStringField;
    QTeMasterList_Type: TStringField;
    QTeMasterMove_Type: TStringField;
    QTeMasterIsOrder: TBooleanField;
    QTeMasterUse_Status: TBooleanField;
    QTeMasterPrint_Status: TBooleanField;
    QTeMasterFCheck_Date: TDateTimeField;
    QTeMasterRCheck_Name: TStringField;
    QTeMasterRCheck_Date: TDateTimeField;
    QTeMasterRCheck: TBooleanField;
    QTeMasterTemp_Status: TBooleanField;
    QTeAUnit: TStringField;
    QTeAPrice: TFloatField;
    QTeMasterLA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SOFrame: TSOFrame;

implementation

uses AData;

{$R *.dfm}
Initialization
  RegisterClass(TSOFrame);
finalization
  UnRegisterClass(TSOFrame);
end.
