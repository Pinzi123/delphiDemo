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
    procedure ActionSetupExecute(Sender: TObject);
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

Initialization
  RegisterClass(TStoreCheckFrame);
finalization
  UnRegisterClass(TStoreCheckFrame);
end.
