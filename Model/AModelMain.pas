unit AModelMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList,   ExtCtrls, ComCtrls, ToolWin, DB,
  fcStatusBar, Menus, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  APubUnit,AModelBrowser, cxSplitter, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData,ImgList, cxPropertiesStore, MemDS, DBAccess,
  MSAccess, Wwintl, cxPC ;

type
  TAModelMainForm = class(TForm)
    PopupMenu2: TPopupMenu;
    TreeCollapse: TMenuItem;
    TreeExpand: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuTree: TMenuItem;
    MenuIsColor: TMenuItem;
    MenuEditIsColor: TMenuItem;
    MainMenu1: TMainMenu;
    fcStatusBar1: TfcStatusBar;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    BtnNew: TToolButton;
    BtnEdit: TToolButton;
    BtnDelete: TToolButton;
    SptRefresh: TToolButton;
    BtnRefresh: TToolButton;
    BtnBrowser: TToolButton;
    BtnSearch: TToolButton;
    BtnFilter: TToolButton;
    SptSelect: TToolButton;
    BtnPropert: TToolButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Panel6: TPanel;
    ActionList1: TActionList;
    ActionNew: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    ActionCopy: TAction;
    ActionPaste: TAction;
    ActionRefresh: TAction;
    ActionBrowser: TAction;
    ActionSearch: TAction;
    ActionFilter: TAction;
    ActionPropert: TAction;
    ActionTree: TAction;
    ActionCollapse: TAction;
    ActionExpand: TAction;
    ActioncClose: TAction;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1Menu_Name: TcxDBTreeListColumn;
    cxDBTreeList1Menu_Desc: TcxDBTreeListColumn;
    cxDBTreeList1Parent_Name: TcxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    DAcMenu: TDataSource;
    TreeStore: TcxPropertiesStore;
    wwIntl1: TwwIntl;
    ToolButton1: TToolButton;
    dxPageControl1: TcxPageControl;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActioncCloseExecute(Sender: TObject);
    procedure cxDBTreeList1GetNodeImageIndex(Sender: TObject;
      ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
      var AIndex: TImageIndex);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure MenuIsColorClick(Sender: TObject);
    procedure MenuEditIsColorClick(Sender: TObject);
    procedure ActionTreeExecute(Sender: TObject);
    procedure ActionCollapseExecute(Sender: TObject);
    procedure ActionExpandExecute(Sender: TObject);
  private
    { Private declarations }
    FramesNode:PFrameNode;
    MyObjects:TStringList;
    MenuShowFrame:Boolean;
    procedure CreateMenu;
    procedure DropMenu;
    procedure MyMenuClick(Sender:TObject);
    procedure CreateFrame(MenuName:string);
    procedure AddFrame(AFrame:TAModelBrowserFrame;ATabSheet:TcxTabSheet);
    procedure ShowFrame(AFrame:TAModelBrowserFrame);
    procedure FreeFirstFrame;
    procedure FreeAllFrame;
    procedure TabSheetShow(Sender:TObject);
    procedure FreeCurrentFrame;
  public
    { Public declarations }

  end;

var
  AModelMainForm: TAModelMainForm;

implementation

uses AData, APubLogin, APubSetupPass;

{$R *.dfm}

Type
  TAModelBrowserFrameClass=Class of TAModelBrowserFrame;

{ TAModelMainForm }

procedure TAModelMainForm.CreateFrame(MenuName: string);
var
  AFrameNode:PFrameNode;
  AFrameClassName,AFrameName: string;
  AFrame:TAModelBrowserFrame;
  AFrameClass:TAModelBrowserFrameClass;
  ATabSheet:TcxTabSheet;
begin
if dxPageControl1.PageCount>7 then
begin
ShowMessage('最多只能開八個窗口!!!');
Exit;
end;
AFrame:=nil;
ATabSheet:=nil;
TempString:='SELECT  dbo.Ac_Menu.Menu_Name, dbo.Ac_Menu.Menu_Desc, dbo.Ac_Menu.DLL_Name, dbo.Ac_Menu.Select_Where,dbo.Ac_Menu.Where_Str,dbo.Ac_Menu.Action_Visible, '
           +' dbo.Aa_GetMenuRight(dbo.Af_User.User_Id, dbo.Ac_Menu.Menu_Name)  AS Action_Right, dbo.Aa_GetFieldRight(dbo.Af_User.User_Id) AS Field_Right '
           +' FROM   dbo.Ac_Menu CROSS JOIN   dbo.Af_User WHERE   (dbo.Af_User.User_Id = ''%S'') AND (dbo.Ac_Menu.Menu_Name = ''%S'')';
with ADMSystem.QAPubData do
  begin
    QAPubDataOpen(Format(TempString,[UserId,MenuName]));
    AFrameName:=FieldByName('Menu_Name').AsString+'Frame';
    AFrameClassName:=FieldByName('DLL_Name').AsString;
    AFrameClass:=TAModelBrowserFrameClass(GetClass(AFrameClassName));
    if AFrameClass=nil then
      begin
         Close;
         Exit;
      end;
    MenuShowFrame:=True;   
    AFrameNode:=FramesNode;
    while AFrameNode<>nil do
      begin
        if (AFrameNode^.AFrame is AFrameClass)and(UpperCase(AFrameNode^.AFrame.Name)=UpperCase(AFrameName)) then
            begin
              AFrame:=TAModelBrowserFrame(AFrameNode^.AFrame);
              ShowFrame(AFrame);
              Break;
            end
        else
        AFrameNode:=AFrameNode^.NextNode;
      end;
    if AFrame=nil then
       begin
         if AFrameName<>'' then
            try
              Screen.Cursor:=crHourGlass;
              ATabSheet:=TcxTabSheet.Create(dxPageControl1);
              ATabSheet.Name:=FieldByName('Menu_Name').AsString;
              ATabSheet.Caption:=FieldByName('Menu_Desc').AsString;
              ATabSheet.Hint:=AFrameClassName;
              ATabSheet.OnShow:=TabSheetShow;
              ATabSheet.PageControl:=dxPageControl1;
              AFrame:=AFrameClass.Create(ATabSheet);
              AFrame.Align:=alClient;
              AFrame.Parent:=ATabSheet;
              AFrame.MyStatusBar:=fcStatusBar1;
              AFrame.Name:=ATabSheet.Name+'Frame';
              AFrame.WhereStr:=FieldByName('Where_Str').AsString;
              AFrame.SelectWhere:=FieldByName('Select_Where').AsString;
              AFrame.ActionVisible:=FieldByName('Action_Visible').AsInteger;
              AFrame.ActionRight:=FieldByName('Action_Right').AsInteger;
              AFrame.FieldRight:=FieldByName('Field_Right').AsInteger;
              AFrame.MenuName:=FieldByName('Menu_Name').AsString;
              AFrame.SetDataSetTag;
              AFrame.OpenDataSet;
              AFrame.ActioncClose.OnExecute:=ActioncClose.OnExecute;
              AddFrame(AFrame,ATabSheet);
              Screen.Cursor:=crDefault;
            except
              Screen.Cursor:=crDefault;
              AFrame.Free;
              ATabSheet.Free;
            end;
       end;
    QAPubDataClose;
    MenuShowFrame:=False;
  end;
end;

procedure TAModelMainForm.CreateMenu;
var TempMenu,TempMenuParent,TempMenuParentParent:TMenuItem;
    TempToolButton:TToolButton;
    SubMenued,SubSubMenued:Boolean;
begin
DropMenu;
TempMenu:=nil;
TempMenuParent:=nil;
TempMenuParentParent:=nil;
SubMenued:=False;
SubSubMenued:=False;
TempString:='SELECT  VA.Menu_Name, VA.Menu_Desc, CASE WHEN LEFT(VA.Menu_Name,1) IN (''A'',''X'') AND LEN(VA.Menu_Name)>1 THEN 1 ELSE   VA.Action_Right END AS Action_Right  '
           +'FROM    dbo.Ah_Visible INNER JOIN  (SELECT   dbo.Ac_Menu.Menu_Name, dbo.Ac_Menu.Menu_Desc,  dbo.Aa_GetMenuRight(dbo.Af_User.User_Id,  dbo.Ac_Menu.Menu_Name) AS Action_Right '
           +'FROM   dbo.Af_User CROSS JOIN  dbo.Ac_Menu   WHERE  (LEFT(dbo.Ac_Menu.Menu_Name, 1) IN (''A'', ''%S'', ''X'')) AND (dbo.Af_User.User_Id = ''%S'')) VA ON  dbo.Ah_Visible.Menu_Name = VA.Menu_Name '
           +'WHERE   (dbo.Ah_Visible.User_Id = ''%S'') AND (dbo.Ah_Visible.Menu_Visible = 1) ORDER BY VA.Menu_Name';
with ADMSystem.QAPubData do
  begin
    QAPubDataOpen(Format(TempString,[SysId,UserId,UserId]));
    while not Eof do
      begin
        if FieldByName('Action_Right').AsInteger and 1 >0 then
           begin
        case Length(ADMSystem.QAPubData.FieldByName('Menu_Name').AsString) of
        3:begin
            SubMenued:=True;
            TempMenu:=TMenuItem.Create(Self);
            TempMenu.Caption:=FieldByName('Menu_Desc').AsString;
            MainMenu1.Items.Add(TempMenu);
            TempToolButton:=TToolButton.Create(ToolBar1);
            TempToolButton.Parent:=ToolBar1;
            TempToolButton.Left:=ToolBar1.Width;
            TempToolButton.Grouped:=True;
            TempToolButton.Name:='T'+FieldByName('Menu_Name').AsString;
            TempToolButton.MenuItem:=TempMenu;
            MyObjects.AddObject(TempToolButton.Caption,TempToolButton);
          end;
        5:begin
            SubSubMenued:=True;
            if SubMenued then
              begin
                TempMenuParent:=TempMenu;
                SubMenued:=False;
              end;
            TempMenu:=TMenuItem.Create(Self);
            TempMenuParent.Add(TempMenu);
            TempMenu.OnClick:=MyMenuClick;
          end;
        7:begin
            if SubSubMenued then
              begin
                TempMenuParentParent:=TempMenu;
                SubSubMenued:=False;
              end;
            TempMenu:=TMenuItem.Create(Self);
            TempMenuParentParent.Add(TempMenu);
            TempMenu.OnClick:=MyMenuClick;
          end;
        end;
        TempMenu.Caption:=ADMSystem.QAPubData.FieldByName('Menu_Desc').AsString;
        TempMenu.Name:=ADMSystem.QAPubData.FieldByName('Menu_Name').AsString;
        MyObjects.AddObject(TempMenu.Caption,TempMenu);
          end;
        Next;
      end;
    QAPubDataClose;
  end;
fcStatusBar1.Panels[3].Text:=UserName;
end;

procedure TAModelMainForm.DropMenu;
var
  i:integer;
begin
if Assigned(MyObjects) then
  for i:=MyObjects.Count-1 downto 0 do
  begin
    TObject(MyObjects.Objects[i]).Free;
    MyObjects.Delete(i);
  end;
end;

procedure TAModelMainForm.FreeAllFrame;
begin
 try
  While FramesNode<>nil do
    FreeFirstFrame;
 except
   FramesNode:=nil;
 end;
end;

procedure TAModelMainForm.MyMenuClick(Sender: TObject);
begin
if (Sender as TMenuItem).Name='A0101' then
   CreateFrame((Sender as TMenuItem).Name)
else
if (Sender as TMenuItem).Name='A0102' then
   begin
     Application.CreateForm(TAPubSetupPassForm, APubSetupPassForm);
     APubSetupPassForm.ShowModal;
   end
else
if (Sender as TMenuItem).Name='A0103' then
   begin
     FreeAllFrame;
     DropMenu;
     Application.CreateForm(TAPubLoginForm, APubLoginForm);
     if APubLoginForm.ShowModal=mrOk then
        begin
          DropMenu;
          CreateMenu;
          ADMSystem.QAPubFields.Close;
        end;
   end
else
if (Sender as TMenuItem).Name='A0104' then
   FreeCurrentFrame
else
if (Sender as TMenuItem).Name='A0105' then
   begin
     FreeAllFrame;
     Close;
   end
else
if (Sender as TMenuItem).Name='X0101' then
    Application.MessageBox(Pchar((Sender as TMenuItem).Caption),Pchar(Application.Title),MB_OK)
else
if (Sender as TMenuItem).Name='X0102' then
    Application.MessageBox(Pchar((Sender as TMenuItem).Caption),Pchar(Application.Title),MB_OK)
else
    CreateFrame((Sender as TMenuItem).Name);
end;

procedure TAModelMainForm.AddFrame(AFrame: TAModelBrowserFrame;
  ATabSheet: TcxTabSheet);
var AFrameNode:PFrameNode;
begin
CoolBar2.AutoSize:=False;
if FramesNode<>nil then
     FramesNode^.AFrame.ToolBar1.Parent:=FramesNode^.AFrame
else
     ToolBar2.Visible:=False;
AFrameNode:=New(PFrameNode);
AFrameNode^.PriorNode:=nil;
AFrameNode^.NextNode:=FramesNode;
AFrameNode^.AFrame:=AFrame;
AFrameNode^.ATabSheet:=ATabSheet;
if FramesNode<>nil then
  FramesNode^.PriorNode:=AFrameNode;
  FramesNode:=AFrameNode;
FramesNode^.AFrame.ToolBar1.Parent:=CoolBar2;
CoolBar2.Visible:=True;
CoolBar2.AutoSize:=True;
dxPageControl1.ActivePage:=TcxTabSheet(FramesNode^.ATabSheet);
dxPageControl1.HideTabs:=dxPageControl1.PageCount<=1;
end;

procedure TAModelMainForm.ShowFrame(AFrame: TAModelBrowserFrame);
var AFrameNode:PFrameNode;
begin
if not(FramesNode^.AFrame=AFrame) then
begin
CoolBar2.AutoSize:=False;
FramesNode^.AFrame.ToolBar1.Parent:=FramesNode^.AFrame;
AFrameNode:=FramesNode;
while AFrameNode<>nil do
  begin
    if AFrameNode^.AFrame=AFrame then
        begin
          if AFrameNode^.PriorNode<>nil then
             AFrameNode^.PriorNode^.NextNode:=AFrameNode^.NextNode;
          if AFrameNode^.NextNode<>nil then
             AFrameNode^.NextNode^.PriorNode:=AFrameNode^.PriorNode;
          AFrameNode^.PriorNode:=nil;
          AFrameNode^.NextNode:=FramesNode;
          FramesNode^.PriorNode:=AFrameNode;
          FramesNode:=AFrameNode;
          FramesNode^.AFrame.ToolBar1.Parent:=CoolBar2;
          CoolBar2.AutoSize:=True;
{
          if (FramesNode^.AFrame.RefreshData1<>nil)and FramesNode^.AFrame.RefreshData1.DataSet.Active then
             (FramesNode^.AFrame.RefreshData1.DataSet as TMSQuery).Refresh;
          if (FramesNode^.AFrame.RefreshData2<>nil)and FramesNode^.AFrame.RefreshData2.DataSet.Active then
             (FramesNode^.AFrame.RefreshData2.DataSet as TMSQuery).Refresh;
          if (FramesNode^.AFrame.RefreshData3<>nil)and FramesNode^.AFrame.RefreshData3.DataSet.Active then
             (FramesNode^.AFrame.RefreshData3.DataSet as TMSQuery).Refresh;
          if (FramesNode^.AFrame.RefreshData4<>nil)and FramesNode^.AFrame.RefreshData4.DataSet.Active then
             (FramesNode^.AFrame.RefreshData4.DataSet as TMSQuery).Refresh;  }
          if  MenuShowFrame  then
          dxPageControl1.ActivePage:=TcxTabSheet(FramesNode^.ATabSheet);
          Break;
        end;
    AFrameNode:=AFrameNode^.NextNode;
  end;
end;
end;

procedure TAModelMainForm.TabSheetShow(Sender: TObject);
var
  AFrameNode:PFrameNode;
  AFrameClassName,AFrameName: string;
  AFrame:TAModelBrowserFrame;
  AFrameClass:TAModelBrowserFrameClass;
begin
if MenuShowFrame then
  begin
   Caption:=Application.Title+'--'+(Sender as TcxTabSheet).Caption;
   Exit;
  end;
AFrameClassName:=(Sender as TcxTabSheet).Hint;  
AFrameName:=(Sender as TcxTabSheet).Name+'Frame';
AFrameClass:=TAModelBrowserFrameClass(GetClass(AFrameClassName));
AFrameNode:=FramesNode;
while AFrameNode<>nil do
   begin
      if (AFrameNode^.AFrame is AFrameClass)and(UpperCase(AFrameNode^.AFrame.Name)=UpperCase(AFrameName)) then
         begin
            AFrame:=TAModelBrowserFrame(AFrameNode^.AFrame);
            ShowFrame(AFrame);
            Break;
         end
      else
        AFrameNode:=AFrameNode^.NextNode;
   end;
Caption:=Application.Title+'--'+(Sender as TcxTabSheet).Caption;
end;

procedure TAModelMainForm.FreeFirstFrame;
var AFrameNode:PFrameNode;
begin
MenuShowFrame:=True;
if FramesNode<>nil then
   begin
     CoolBar2.AutoSize:=False;
     FramesNode^.AFrame.ToolBar1.Parent:=FramesNode^.AFrame.CoolBar1;
     FramesNode^.AFrame.Free;
     FramesNode^.ATabSheet.Free;
     AFrameNode:=FramesNode^.NextNode;
     if AFrameNode<>nil then
        AFrameNode^.PriorNode:=nil;
     Dispose(FramesNode);
     FramesNode:=AFrameNode;
     if FramesNode<>nil then
        begin
          dxPageControl1.ActivePage:=FramesNode^.ATabSheet;
          FramesNode^.AFrame.ToolBar1.Parent:=CoolBar2;
          CoolBar2.AutoSize:=True;
          dxPageControl1.HideTabs:=dxPageControl1.PageCount<=1;
        end;  
   end;
if dxPageControl1.PageCount=0 then
   begin
      Caption:=Application.Title;
      ToolBar2.Visible:=True;
   end;
MenuShowFrame:=False;
end;

procedure TAModelMainForm.FormShow(Sender: TObject);
begin
CreateMenu;
ADMSystem.QAcMenu.Open;
cxDBTreeList1.FullExpand;
end;

procedure TAModelMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ADMSystem.QAcMenu.Close;
end;

procedure TAModelMainForm.FormCreate(Sender: TObject);
var i:integer;
begin
SysId:=Copy(Name,1,1);
FramesNode:=nil;
MenuShowFrame:=False;
MyObjects:=TStringList.Create;
Caption:=Application.Title;
i:=TreeStore.Components.Count;
TreeStore.Components.Insert(i);
TreeStore.Components[i].Component:=MenuTree;
TreeStore.Components[i].Properties.Add('Checked');

i:=TreeStore.Components.Count;
TreeStore.Components.Insert(i);
TreeStore.Components[i].Component:=MenuIsColor;
TreeStore.Components[i].Properties.Add('Checked');

i:=TreeStore.Components.Count;
TreeStore.Components.Insert(i);
TreeStore.Components[i].Component:=MenuEditIsColor;
TreeStore.Components[i].Properties.Add('Checked');

TreeStore.StorageName:=GetIniDirectory('TreeStore');
TreeStore.RestoreFrom;
cxSplitter1.Visible:=MenuTree.Checked;
cxDBTreeList1.Visible:=MenuTree.Checked;
IsColor:=MenuIsColor.Checked;
EditIsColor:=MenuEditIsColor.Checked;
end;

procedure TAModelMainForm.FormDestroy(Sender: TObject);
begin
TreeStore.StoreTo;
MyObjects.Free;
end;

procedure TAModelMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if FramesNode<>nil then
   begin
     FreeFirstFrame;
     CanClose:=False;
   end;
end;

procedure TAModelMainForm.ActioncCloseExecute(Sender: TObject);
begin
FreeCurrentFrame;
end;

procedure TAModelMainForm.FreeCurrentFrame;
begin
if dxPageControl1.ControlCount>0 then
 FreeFirstFrame
   else
     Close;
Abort;
end;

procedure TAModelMainForm.cxDBTreeList1GetNodeImageIndex(Sender: TObject;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);
begin
if ANode.Expanded then
  AIndex := 24
else
  if ANode.HasChildren then
     AIndex := 25
   else
     AIndex := 29;
end;

procedure TAModelMainForm.cxDBTreeList1DblClick(Sender: TObject);
begin
CreateFrame(ADMSystem.QAcMenuMenu_Name.Value);
end;

procedure TAModelMainForm.MenuIsColorClick(Sender: TObject);
begin
MenuIsColor.Checked:=not MenuIsColor.Checked;
IsColor:=MenuIsColor.Checked;
end;

procedure TAModelMainForm.MenuEditIsColorClick(Sender: TObject);
begin
MenuEditIsColor.Checked:=not MenuEditIsColor.Checked;
EditIsColor:=MenuEditIsColor.Checked;
end;

procedure TAModelMainForm.ActionTreeExecute(Sender: TObject);
begin
MenuTree.Checked:=not MenuTree.Checked;
cxSplitter1.Visible:=MenuTree.Checked;
cxDBTreeList1.Visible:=MenuTree.Checked;
end;

procedure TAModelMainForm.ActionCollapseExecute(Sender: TObject);
begin
cxDBTreeList1.FullCollapse;
end;

procedure TAModelMainForm.ActionExpandExecute(Sender: TObject);
begin
cxDBTreeList1.FullExpand;
end;

end.
