unit ATestEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, ppDB, ppDBPipe, DB, MemDS,
  DBAccess, MSAccess, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, cxControls,
  cxSplitter;

type
  TForm2 = class(TAModelBrowserFrame)
    wwDBGrid1: TwwDBGrid;
    cxSplitter2: TcxSplitter;
    wwDBGrid3: TwwDBGrid;
    Panel3: TPanel;
    wwDBGrid2: TwwDBGrid;
    cxSplitter5: TcxSplitter;
    wwDBGrid6: TwwDBGrid;
    QBbVendor: TMSQuery;
    QBbVendorSelected: TBooleanField;
    QBbVendorVendor: TStringField;
    QBbVendorVnd_Sim: TStringField;
    QBbVendorVnd_Type: TStringField;
    QBbVendorType_Desc: TStringField;
    QBbVendorPur_Grp: TStringField;
    QBbVendorPur_Type: TStringField;
    QBbVendorPay_Type: TBooleanField;
    QBbVendorChn_Name: TStringField;
    QBbVendorChn_Address: TStringField;
    QBbVendorConn_Man: TStringField;
    QBbVendorPhone_Code: TStringField;
    QBbVendorFax_Code: TStringField;
    QBbVendorEmail_Address: TStringField;
    QBbVendorRegion: TStringField;
    QBbVendorProducts: TStringField;
    QBbVendorVendor1: TStringField;
    QBbVendorVnd_Sim1: TStringField;
    QBbVendorVendor2: TStringField;
    QBbVendorVnd_Sim2: TStringField;
    QBbVendorCust_Name: TStringField;
    QBbVendorCust_Tel: TStringField;
    QBbVendorCust_AssName: TStringField;
    QBbVendorCust_AssTel: TStringField;
    QBbVendorCust_Boss: TStringField;
    QBbVendorEmp_Status: TStringField;
    QBbVendorVnd_Date: TDateTimeField;
    QBbVendorVendor_Status: TBooleanField;
    QBbVendorDealing_Date: TDateTimeField;
    QBbVendorDealing_Status: TBooleanField;
    QBbVendorIs_Contract: TStringField;
    QBbVendorFCheck: TBooleanField;
    QBbVendorFCheck_Name: TStringField;
    QBbVendorB2b_Status: TIntegerField;
    QBbVendorCreate_Name: TStringField;
    QBbVendorCreate_Date: TDateTimeField;
    QBbVendorUpd_Name: TStringField;
    QBbVendorUpd_Date: TDateTimeField;
    QBbVendora: TMSQuery;
    QBbVendoraSelected: TBooleanField;
    QBbVendoraVendor: TStringField;
    QBbVendoraPaid_Item: TIntegerField;
    QBbVendoraPaid_Kind: TStringField;
    QBbVendoraPaid_Region: TStringField;
    QBbVendoraDef_Month: TIntegerField;
    QBbVendoraTrade_Kind: TStringField;
    QBbVendoraSpl_Loss: TFloatField;
    QBbVendoraIns_Loss: TFloatField;
    QBbVendoraCurr_Char: TStringField;
    QBbVendoraPaid_Curr: TStringField;
    QBbVendoraFCheck: TBooleanField;
    QBbVendoraFCheck_Name: TStringField;
    QBbVendoraCreate_Name: TStringField;
    QBbVendoraCreate_Date: TDateTimeField;
    QBbVendoraUpd_Name: TStringField;
    QBbVendoraUpd_Date: TDateTimeField;
    QBbVendorb: TMSQuery;
    QBbVendorbSelected: TBooleanField;
    QBbVendorbVendor: TStringField;
    QBbVendorbItem_No: TIntegerField;
    QBbVendorbLinkman: TStringField;
    QBbVendorbJob: TStringField;
    QBbVendorbMobile: TStringField;
    QBbVendorbPhone_Code: TStringField;
    QBbVendorbMail_adress: TStringField;
    QBbVendorbFCheck: TBooleanField;
    QBbVendorbFCheck_Name: TStringField;
    QBbVendorbCreate_Name: TStringField;
    QBbVendorbCreate_Date: TDateTimeField;
    QBbVendorbUpd_Name: TStringField;
    QBbVendorbUpd_Date: TDateTimeField;
    QBb_Vendorc: TMSQuery;
    BooleanField1: TBooleanField;
    QBb_VendorcVnd_Bkno: TIntegerField;
    QBb_VendorcBank_Item: TIntegerField;
    QBb_VendorcPaid_Num: TStringField;
    QBb_VendorcICard_Date: TDateTimeField;
    QBb_VendorcPaid_Name: TStringField;
    QBb_VendorcBank_Name: TStringField;
    QBb_VendorcBank_Code: TStringField;
    QBb_VendorcBank_Address: TStringField;
    QBb_VendorcPaid_Address: TStringField;
    QBb_VendorcVendor: TStringField;
    QBb_VendorcFCheck: TBooleanField;
    QBb_VendorcFCheck_Name: TStringField;
    QBb_VendorcCreate_Name: TStringField;
    QBb_VendorcCreate_Date: TDateTimeField;
    QBb_VendorcUpd_Name: TStringField;
    QBb_VendorcUpd_Date: TDateTimeField;
    DBbVendor: TDataSource;
    DBbVendora: TDataSource;
    DBbVendorb: TDataSource;
    DBb_Vendorc: TDataSource;
    RBbVendor: TppDBPipeline;
    RBbVendorppField1: TppField;
    RBbVendorppField2: TppField;
    RBbVendorppField3: TppField;
    RBbVendorppField4: TppField;
    RBbVendorppField5: TppField;
    RBbVendorppField6: TppField;
    RBbVendorppField7: TppField;
    RBbVendorppField8: TppField;
    RBbVendorppField9: TppField;
    RBbVendorppField10: TppField;
    RBbVendorppField11: TppField;
    RBbVendorppField12: TppField;
    RBbVendorppField13: TppField;
    RBbVendorppField14: TppField;
    RBbVendorppField15: TppField;
    RBbVendorppField16: TppField;
    RBbVendorppField17: TppField;
    RBbVendorppField18: TppField;
    RBbVendorppField19: TppField;
    RBbVendorppField20: TppField;
    RBbVendorppField21: TppField;
    RBbVendorppField22: TppField;
    RBbVendorppField23: TppField;
    RBbVendorppField24: TppField;
    RBbVendorppField25: TppField;
    RBbVendorppField26: TppField;
    RBbVendorppField27: TppField;
    RBbVendorppField28: TppField;
    RBbVendorppField29: TppField;
    RBbVendorppField30: TppField;
    RBbVendorppField31: TppField;
    RBbVendorppField32: TppField;
    RBbVendorppField33: TppField;
    RBbVendorppField34: TppField;
    RBbVendorppField35: TppField;
    RBbVendorppField36: TppField;
    RBbVendorppField37: TppField;
    RBbVendora: TppDBPipeline;
    RBbVendorb: TppDBPipeline;
    RBBb_Vendorc: TppDBPipeline;
    SDgAtuoplan: TMSSQL;
    cxSplitter3: TcxSplitter;
    procedure QBbVendoraAfterInsert(DataSet: TDataSet);
    procedure QBbVendorbAfterInsert(DataSet: TDataSet);
    procedure QBb_VendorcAfterInsert(DataSet: TDataSet);
    procedure ActionCalculateExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionNewExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BeforeReport; override;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses AData,APubUnit;
{$R *.dfm}


procedure TForm2.QBbVendoraAfterInsert(DataSet: TDataSet);
begin
QAPubDataOpen('SELECT  COALESCE (MAX(Paid_Item)+1, 1) AS AutoNo  FROM  dbo.Bb_Vendora  WHERE  (Vendor  = '''+QBbVendor.FieldByName('Vendor').AsString+''')');
QBbVendora.FieldByName('Paid_Item').AsString:=ADMSystem.QAPubData.FieldByName('AutoNo').AsString;
QAPubDataClose;
end;

procedure TForm2.QBbVendorbAfterInsert(DataSet: TDataSet);
begin
QAPubDataOpen('SELECT  COALESCE (MAX(Item_No)+1, 1) AS AutoNo  FROM  dbo.Bb_Vendorb WHERE  (Vendor  = '''+QBbVendor.FieldByName('Vendor').AsString+''')');
QBbVendorb.FieldByName('Item_No').AsString:=ADMSystem.QAPubData.FieldByName('AutoNo').AsString;
QAPubDataClose;
end;

procedure TForm2.QBb_VendorcAfterInsert(DataSet: TDataSet);
begin
QAPubDataOpen('SELECT  COALESCE (MAX(Bank_Item)+1, 1) AS AutoNo  FROM  dbo.Bb_Vendorc  WHERE  (Vendor  = '''+QBbVendor.FieldByName('Vendor').AsString+''')');
QBb_Vendorc.FieldByName('Bank_Item').AsString:=ADMSystem.QAPubData.FieldByName('AutoNo').AsString;
QAPubDataClose;
end;

procedure TForm2.ActionCalculateExecute(Sender: TObject);
begin
SDgAtuoplan.ParamByName('Index').Value:=1;
SDgAtuoplan.Execute;
ShowMessage(SDgAtuoplan.ParamByName('ROWCOUNT').AsString);
end;

procedure TForm2.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
ActionCalculate.Enabled:=ActionEdit.Enabled;
end;

procedure TForm2.BeforeReport;
begin
pubreport.Parameters.Clear;
pubReport.Parameters.Add('Username');
PubReport.Parameters['Username'].Value:=Username;
  inherited;
end;

procedure TForm2.ActionNewExecute(Sender: TObject);
begin
if ActiveIndex=2 then
 begin
  TempString:='SELECT    ISNULL(MAX(Paid_Item), 0) AS Paid_Item FROM    dbo.Bb_Vendora WHERE    (Vendor = ''%S'') ';
  QAPubDataOpen(Format(TempString,[QBbVendorVendor.Value]));
  if ADMSystem.QAPubData.FieldByName('Paid_Item').AsInteger>=100 then
   begin
    ADMSystem.QAPubData.Close;
    ShowMessage('總務類材料廠商,無法編輯!!!');
    Abort;
   end
    else
     ADMSystem.QAPubData.Close;
 end;
  inherited;

end;

procedure TForm2.ActionEditExecute(Sender: TObject);
begin
if (ActiveIndex=2) and (QBbVendoraPaid_Item.Value>=100) then
 begin
   ShowMessage('總務類材料廠商,無法編輯!!!');
   Abort;
 end;
   inherited;
end;

procedure TForm2.ActionDeleteExecute(Sender: TObject);
begin
if (ActiveIndex=2) and (QBbVendoraPaid_Item.Value>=100) then
 begin
   ShowMessage('總務類材料廠商,無法編輯!!!');
   Abort;
 end;
  inherited;

end;

Initialization
  RegisterClass(TForm2);
finalization
  UnRegisterClass(TForm2);
end.
 