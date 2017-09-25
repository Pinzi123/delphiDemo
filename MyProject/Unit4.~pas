unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList,   ExtCtrls, ComCtrls, ToolWin, DB,
  fcStatusBar, Menus, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  APubUnit,AModelBrowser, cxSplitter, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData,ImgList, cxPropertiesStore, MemDS, DBAccess,
  MSAccess, Wwintl, cxPC, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid,
  ppRelatv, ppProd, ppClass, ppReport, ppComm, ppEndUsr ;

type
  TForm4 = class(TAModelBrowserFrame)
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    QTeMaster: TMSQuery;
    QTeA: TMSQuery;
    DTeMaster: TDataSource;
    RTeMaster: TppDBPipeline;
    DTeA: TDataSource;
    RTeA: TppDBPipeline;
    QTeMasterSelected: TBooleanField;
    QTeASelected: TBooleanField;
    QUser: TMSQuery;
    QUserUserName: TStringField;
    DUser: TDataSource;
    RUser: TppDBPipeline;
    procedure QTeMasterAfterPost(DataSet: TDataSet);
    procedure QTeAAfterPost(DataSet: TDataSet);
    procedure QUserBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var Form4: TForm4;

implementation

uses AData;

{$R *.dfm}

procedure TForm4.QTeMasterAfterPost(DataSet: TDataSet);
begin
  inherited;
  QTeMaster.Refresh;
end;

procedure TForm4.QTeAAfterPost(DataSet: TDataSet);
begin
  inherited;
  QTeMaster.RefreshRecord;
  QTeA.RefreshRecord;
end;

procedure TForm4.QUserBeforeOpen(DataSet: TDataSet);
begin
    with QUser do begin
    with SQL do begin
      Clear;
      Add('SELECT UserName=''' + UserName + '''');
    end;
  end;
  inherited;

end;

end.
