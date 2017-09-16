unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
<<<<<<< HEAD
  Dialogs, ActnList,   ExtCtrls, ComCtrls, ToolWin, DB,
  fcStatusBar, Menus, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  APubUnit,AModelBrowser, cxSplitter, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData,ImgList, cxPropertiesStore, MemDS, DBAccess,
  MSAccess, Wwintl, cxPC, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid,
  ppRelatv, ppProd, ppClass, ppReport, ppComm, ppEndUsr ;
=======
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid;
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15

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
<<<<<<< HEAD
    QUser: TMSQuery;
    QUserUserName: TStringField;
    DUser: TDataSource;
    RUser: TppDBPipeline;
    procedure QTeMasterAfterPost(DataSet: TDataSet);
    procedure QTeAAfterPost(DataSet: TDataSet);
    procedure QUserBeforeOpen(DataSet: TDataSet);
=======
    procedure QTeMasterAfterPost(DataSet: TDataSet);
    procedure QTeAAfterPost(DataSet: TDataSet);
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15
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

<<<<<<< HEAD
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

=======
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15
end.
