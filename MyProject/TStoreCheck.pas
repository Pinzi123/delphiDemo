unit TStoreCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, ppDB, ppDBPipe, DB, MemDS,
  DBAccess, MSAccess, Grids, Wwdbigrd, Wwdbgrid;

type
  TStoreCheckFrame = class(TAModelBrowserFrame)
    wwDBGrid1: TwwDBGrid;
    QTeStoreC: TMSQuery;
    DTeStoreC: TDataSource;
    RTeStoreC: TppDBPipeline;
    QTeStoreCSelected: TBooleanField;
    QTeStoreCMat_No: TStringField;
    QTeStoreCCheck_Date: TDateTimeField;
    QTeStoreCMat_Name: TStringField;
    QTeStoreCVendor: TStringField;
    QTeStoreCStore_Sqty: TFloatField;
    QTeStoreCStore_SAccount: TFloatField;
    QTeStoreCStore_IQty: TFloatField;
    QTeStoreCStore_OQty: TFloatField;
    QTeStoreCStore_Eqty: TFloatField;
    QTeStoreCStore_EAccount: TFloatField;
    QTeStoreCFCheck: TBooleanField;
    QTeStoreCFCheck_Name: TStringField;
    QTeStoreCRemark: TStringField;
    QTeStoreCCreate_Name: TStringField;
    QTeStoreCCreate_Date: TDateTimeField;
    QTeStoreCUpd_Name: TStringField;
    QTeStoreCUpd_Date: TDateTimeField;
    QVendor: TMSQuery;
    DVendor: TDataSource;
    RVendor: TppDBPipeline;
    QVendorVendor: TStringField;
    QVendorVnd_Sim: TStringField;
    QVendorVnd_Type: TStringField;
    QVendorChn_Name: TStringField;
    QVendorChn_Address: TStringField;
    QVendorEng_Name: TStringField;
    QVendorEng_Address: TStringField;
    QUser: TMSQuery;
    QUserUserName: TStringField;
    DUser: TDataSource;
    RUser: TppDBPipeline;
    QTeStoreCFCheck_Date: TDateTimeField;
    QTeStoreCRCheck: TBooleanField;
    QTeStoreCRCheck_Name: TStringField;
    QTeStoreCRCheck_Date: TDateTimeField;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid3: TwwDBGrid;
    QPur: TMSQuery;
    DPur: TDataSource;
    RPur: TppDBPipeline;
    QList: TMSQuery;
    DList: TDataSource;
    RList: TppDBPipeline;
    QListStr_Auto: TGuidField;
    QListList_No: TStringField;
    QListItem_No: TIntegerField;
    QListMat_No: TStringField;
    QListMat_Name: TStringField;
    QListAcc_Qty: TFloatField;
    QListRemark: TStringField;
    QListCreate_Name: TStringField;
    QListCreate_Date: TDateTimeField;
    QListUpd_Name: TStringField;
    QListUpd_Date: TDateTimeField;
    QPurStr_Auto: TGuidField;
    QPurPur_No: TStringField;
    QPurItem_No: TIntegerField;
    QPurMat_No: TStringField;
    QPurMat_Name: TStringField;
    QPurPrice: TFloatField;
    QPurAcc_Qty: TFloatField;
    QPurRemark: TStringField;
    QPurCreate_Name: TStringField;
    QPurCreate_Date: TDateTimeField;
    QPurUpd_Name: TStringField;
    QPurUpd_Date: TDateTimeField;
    procedure ActionSetupExecute(Sender: TObject);
    procedure ActionPrivewExecute(Sender: TObject);
    procedure ActionFCheckExecute(Sender: TObject);
    procedure ActionRCheckExecute(Sender: TObject);
  private
     TempSql:string;
    { Private declarations }
  public
    { Public declarations }
    procedure GetSelectWhere; override;
  end;

var
  StoreCheckFrame: TStoreCheckFrame;

implementation


uses AData, APubUnit;
{$R *.dfm}

procedure TStoreCheckFrame.GetSelectWhere;
begin
TempSql:=QTeStoreC.SQL.Text;
TempEditBool:=True;
ActionSetup.Execute;
TempEditBool:=False;
end;

procedure TStoreCheckFrame.ActionSetupExecute(Sender: TObject);
begin
  inherited;
if GetStartEndDate(5) then
   begin
    if QTeStoreC.Active then
       QTeStoreC.Close;
     SelectWhere:=StartDate[1]+'/'+StartDate[2]+'/'+StartDate[3];
     if Pos('/',DateTimeToStr(Date))>0 then
     begin
      if StrToDate(StartDate[1]+'/'+StartDate[2]+'/'+StartDate[3])>= StrToDate('2005/9/1') then
       QTeStoreC.SQL.Text:=QTeStoreC.SQL.Text
        else QTeStoreC.SQL.Text:=TempSql;
     end
      else
       begin
        if StrToDate(StartDate[1]+'-'+StartDate[2]+'-'+StartDate[3])>= StrToDate('2005-9-1') then
         QTeStoreC.SQL.Text:=QTeStoreC.SQL.Text
          else QTeStoreC.SQL.Text:=TempSql;
       end;
     QTeStoreC.ParamByName('Check_Date').Value:=SelectWhere;
     if not TempEditBool then
        QTeStoreC.Open;
     MyStatusBar.Panels[6].Text:='®w¦s½LÂIªí:'+SelectWhere;
   end;
  SetMyDate;
end;

procedure TStoreCheckFrame.ActionPrivewExecute(Sender: TObject);
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

procedure TStoreCheckFrame.ActionFCheckExecute(Sender: TObject);
var i:integer;
begin
wwDBGrid1.SelectAll;
inherited;
end;

procedure TStoreCheckFrame.ActionRCheckExecute(Sender: TObject);
begin
  wwDBGrid1.SelectAll;
  inherited;
end;

Initialization
  RegisterClass(TStoreCheckFrame);
finalization
  UnRegisterClass(TStoreCheckFrame);
end.
