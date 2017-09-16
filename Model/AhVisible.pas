unit AhVisible;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelBrowser, Menus, cxGridCustomPopupMenu, cxGridPopupMenu,
  ppRelatv, ppProd, ppClass, ppReport, ppComm, ppEndUsr, ActnList,
  ComCtrls, ToolWin, DB, MemDS, DBAccess, MSAccess, ppDB, ppDBPipe,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, cxCheckBox;

type
  TAhVisibleFrame = class(TAModelBrowserFrame)
    QAhVisible: TMSQuery;
    DAhVisible: TDataSource;
    QAhVisibleUser_Id: TStringField;
    QAhVisibleMenu_Name: TStringField;
    QAhVisibleMenu_Desc: TStringField;
    QAhVisibleMenu_Visible: TBooleanField;
    RAhVisible: TppDBPipeline;
    cxDBTreeList1: TcxDBTreeList;
    QAhVisibleParent_Name: TStringField;
    cxDBTreeList1Menu_Name: TcxDBTreeListColumn;
    cxDBTreeList1Menu_Desc: TcxDBTreeListColumn;
    cxDBTreeList1Menu_Visible: TcxDBTreeListColumn;
    cxDBTreeList1Parent_Name: TcxDBTreeListColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenDataSet;override;
    destructor Destroy;override;
  end;

var
  AhVisibleFrame: TAhVisibleFrame;

implementation

uses AData, APubUnit;

{$R *.dfm}

{ TAhVisibleFrame }

{ TAhVisibleFrame }

destructor TAhVisibleFrame.Destroy;
begin
if QAhVisible.State=dsEdit then
   QAhVisible.Post;
  inherited;
end;

procedure TAhVisibleFrame.OpenDataSet;
begin
QAhVisible.SQL.Clear;
QAhVisible.SQL.Add('SELECT * FROM (SELECT  dbo.Ah_Visible.User_Id, dbo.Ah_Visible.Menu_Name, VA.Menu_Desc, VA.Parent_Name, dbo.Ah_Visible.Menu_Visible  FROM    dbo.Ah_Visible INNER JOIN ');
QAhVisible.SQL.Add('(SELECT    dbo.Ac_Menu.Menu_Name, dbo.Ac_Menu.Menu_Desc,  dbo.Ac_Menu.Parent_Name,  dbo.Aa_GetMenuRight(dbo.Af_User.User_Id,  dbo.Ac_Menu.Menu_Name) ');
QAhVisible.SQL.Add(Format('AS Action_Right  FROM  dbo.Af_User CROSS JOIN  dbo.Ac_Menu  WHERE   dbo.Aa_GetMenuRight(''%S'', dbo.Ac_Menu.Menu_Name)<>0 AND (LEFT(dbo.Ac_Menu.Menu_Name, 1) IN (''%S'', ''X'')) AND ',[UserId,SysId]));
QAhVisible.SQL.Add(Format('(dbo.Af_User.User_Id = ''%S''))  VA ON dbo.Ah_Visible.Menu_Name = VA.Menu_Name   WHERE   (dbo.Ah_Visible.User_Id = ''%S'')) A',[UserId,UserId]));
  inherited;

end;

Initialization
  RegisterClass(TAhVisibleFrame);
finalization
  UnRegisterClass(TAhVisibleFrame);

end.
