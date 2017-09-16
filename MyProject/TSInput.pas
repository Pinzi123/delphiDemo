unit TSInput;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, ppRelatv, ppProd, ppClass, ppReport,
  ppComm, ppEndUsr, ActnList, ComCtrls, ToolWin, DBAccess, MSAccess, ppDB,
  DB, ppDBPipe, MemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, ExtCtrls, cxSplitter, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, Grids, Wwdbigrd, Wwdbgrid;

type
  TSInputFrame = class(TAModelBrowserFrame)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SInputFrame: TSInputFrame;

implementation

{$R *.dfm}
Initialization
  RegisterClass(TSInputFrame);
finalization
  UnRegisterClass(TSInputFrame);
end.
