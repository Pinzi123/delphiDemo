unit TStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid, Unit4;

type
  TStoreFrame = class(TAModelBrowserFrame)
    QTePurchase: TMSQuery;
    QTePurchaseSelected: TBooleanField;
    DTePurchase: TDataSource;
    RTePurchase: TppDBPipeline;
    wwDBGrid1: TwwDBGrid;
    QTePurchaseMat_No: TStringField;
    QTePurchaseMat_Name: TStringField;
    QTePurchaseMat_Desc: TStringField;
    QTePurchaseStoNumber: TFloatField;
    QTePurchaseVendor: TStringField;
    QTePurchaseVnd_Sim: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreFrame: TStoreFrame;

implementation

{$R *.dfm}

{ TStoreFrame }

Initialization
  RegisterClass(TStoreFrame);
finalization
  UnRegisterClass(TStoreFrame);
end.
 