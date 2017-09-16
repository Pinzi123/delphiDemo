unit ATestMy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, ppDB, ppDBPipe, DB, MemDS,
  DBAccess, MSAccess, Grids, Wwdbigrd, Wwdbgrid, cxControls, cxSplitter;

type
  TForm3 = class(TAModelBrowserFrame)
    wwDBGrid1: TwwDBGrid;
    QTeGodown: TMSQuery;
    DTeGodown: TDataSource;
    RTeGodown: TppDBPipeline;
    QTeGodownDetail: TMSQuery;
    DTeGodownDetail: TDataSource;
    RTeGodownDetail: TppDBPipeline;
    wwDBGrid2: TwwDBGrid;
    QTeGodownoddNum: TGuidField;
    QTeGodownprovider: TStringField;
    QTeGodownwarehouse: TStringField;
    QTeGodowndate: TDateTimeField;
    QTeGodownamount: TCurrencyField;
    QTeGodownstaff: TStringField;
    QTeGodownUpd_Name: TStringField;
    QTeGodownUpd_Date: TDateTimeField;
    QTeGodownDetailproductNum: TGuidField;
    QTeGodownDetailoddNum: TGuidField;
    QTeGodownDetailproviderName: TStringField;
    QTeGodownDetailkind: TStringField;
    QTeGodownDetailunit: TStringField;
    QTeGodownDetailspecifications: TStringField;
    QTeGodownDetailprice: TCurrencyField;
    QTeGodownDetailnumber: TIntegerField;
    QTeGodownDetailremark: TStringField;
    QTeGodownDetailUpd_Name: TStringField;
    QTeGodownDetailUpd_Date: TDateTimeField;
    QTeGodownCreate_Name: TStringField;
    QTeGodownCreate_Date: TDateTimeField;
    QTeGodownDetailCreate_Name: TStringField;
    QTeGodownDetailCreate_Date: TDateTimeField;
    cxSplitter2: TcxSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses AData,APubUnit;
{$R *.dfm}

Initialization
  RegisterClass(TForm3);
finalization
  UnRegisterClass(TForm3);
end.
