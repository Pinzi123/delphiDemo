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
    QTePurchaseVendor: TStringField;
    QTePurchaseVnd_Sim: TStringField;
    QTePurchaseStoNumber: TFloatField;
    QUser: TMSQuery;
    QUserUserName: TStringField;
    DUser: TDataSource;
    RUser: TppDBPipeline;
    QTePurchaseChn_Unit: TStringField;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionPrivewExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetSelectWhere; override;
  end;

var
  StoreFrame: TStoreFrame;

implementation

uses  AData, APubUnit;


{$R *.dfm}

procedure TStoreFrame.GetSelectWhere;
begin
QTePurchase.ParamByName('Check_Date').Value:= StrToDateTime('0');
TempString:='select top 1 Check_Date from dbo.Te_StoreCheckTemp order by Check_Date desc';
QAPubDataOpen(Format(TempString,[]));
if  ADMSystem.QAPubData.RecordCount=1  then
 QTePurchase.ParamByName('Check_Date').Value:=ADMSystem.QAPubData.FieldByName('Check_Date').AsDateTime;
end;

procedure TStoreFrame.ActionRefreshExecute(Sender: TObject);
begin
  QTePurchase.ParamByName('Check_Date').Value:= StrToDateTime('0');
  TempString:='select top 1 Check_Date from dbo.Te_StoreCheckTemp order by Check_Date desc';
  QAPubDataOpen(Format(TempString,[]));
  if  ADMSystem.QAPubData.RecordCount=1  then
  QTePurchase.ParamByName('Check_Date').Value:=ADMSystem.QAPubData.FieldByName('Check_Date').AsDateTime;
  inherited;

end;

procedure TStoreFrame.ActionPrivewExecute(Sender: TObject);
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

Initialization
  RegisterClass(TStoreFrame);
finalization
  UnRegisterClass(TStoreFrame);
end.
 