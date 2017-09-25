unit TPInput;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid, TPO, Unit4;

type
  TPInputFrame = class(TForm4)
    ActionList1: TActionList;
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
    QTeMasterDepart_Name: TStringField;
    QTeMasterPA: TStringField;
    QTeAStr_Auto: TGuidField;
    QTeAList_No: TStringField;
    QTeAPur_No: TStringField;
    QTeAItem_No: TIntegerField;
    QTeAMat_No: TStringField;
    QTeAVendor: TStringField;
    QTeAVnd_Qty: TFloatField;
    QTeAPay_Qty: TFloatField;
    QTeAPrice: TFloatField;
    QTeASign_Int: TIntegerField;
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
    QTeAUnit: TStringField;
    QTeMasterLA: TStringField;
    QTeAVnd_Sim: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PInputFrame: TPInputFrame;

implementation

uses AData;

{$R *.dfm}

Initialization
  RegisterClass(TPInputFrame);
finalization
  UnRegisterClass(TPInputFrame);
end.
