unit TPRO;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid;

type
  TPROFrame = class(TAModelBrowserFrame)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PROFrame: TPROFrame;

implementation

{$R *.dfm}
Initialization
  RegisterClass(TPROFrame);
finalization
  UnRegisterClass(TPROFrame);
end.
