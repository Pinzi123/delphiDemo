unit TSOutput;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid, Unit4;

type
  TSOutputFrame = class(TForm4)
    QTeMasterStr_Auto: TGuidField;
    QTeMasterGive_Date: TDateTimeField;
    QTeMasterMove_Date: TDateTimeField;
    QTeMasterList_No: TStringField;
    QTeMasterPur_No: TStringField;
    QTeMasterRemark: TStringField;
    QTeMasterAply_Status: TBooleanField;
    QTeMasterTemp_Date: TStringField;
    QTeMasterFCheck: TBooleanField;
    QTeMasterFCheck_Name: TStringField;
    QTeMasterRCheck: TBooleanField;
    QTeMasterRCheck_Name: TStringField;
    QTeMasterCreate_Name: TStringField;
    QTeMasterCreate_Date: TDateTimeField;
    QTeMasterUpd_Name: TStringField;
    QTeMasterUpd_Date: TDateTimeField;
    QTeAStr_Auto: TStringField;
    QTeAList_No: TStringField;
    QTeAPur_No: TStringField;
    QTeAItem_No: TIntegerField;
    QTeAMat_No: TStringField;
    QTeAVendor: TStringField;
    QTeAVnd_Qty: TFloatField;
    QTeAPay_Qty: TFloatField;
    QTeAQua_Qty: TFloatField;
    QTeAUnQua_Qty: TFloatField;
    QTeARefuse_Qty: TFloatField;
    QTeARemark: TStringField;
    QTeACreate_Name: TStringField;
    QTeACreate_Date: TDateTimeField;
    QTeAUpd_Name: TStringField;
    QTeAUpd_Date: TDateTimeField;
    QTeAMat_Desc: TStringField;
    QTeAMat_Name: TStringField;
    QTeAAcc_Qty: TFloatField;
    QTeMasterDepart_Name: TStringField;
    QTeMasterPA: TStringField;
    QTeAUnit: TStringField;
    QTeAPrice: TFloatField;
    QTeMasterLA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SOutputFrame: TSOutputFrame;

implementation

uses AData;

{$R *.dfm}
Initialization
  RegisterClass(TSOutputFrame);
finalization
  UnRegisterClass(TSOutputFrame);
end. 
