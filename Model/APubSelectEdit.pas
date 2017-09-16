unit APubSelectEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AModelBrowser, DB, MemDS, DBAccess, MSAccess;

type
  TAPubSelectEditForm = class(TForm)
    QAPubData: TMSQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAMenuName:string;
    AFrame:TAModelBrowserFrame;
    procedure CreateFrame(MenuName:string);
  public
    { Public declarations }
    property AMenuName:string read FAMenuName write FAMenuName;
  end;

var
  APubSelectEditForm: TAPubSelectEditForm;

implementation

uses AData, APubUnit;

{$R *.dfm}

Type
  TAModelBrowserFrameClass=Class of TAModelBrowserFrame;
  
procedure TAPubSelectEditForm.CreateFrame(MenuName:string);
var
  AFrameClassName,AFrameName: string;
  AFrameClass:TAModelBrowserFrameClass;
begin
AFrame:=nil;
TempString:='SELECT  dbo.Ac_Menu.Menu_Name, dbo.Ac_Menu.Menu_Desc, dbo.Ac_Menu.DLL_Name, dbo.Ac_Menu.Select_Where,dbo.Ac_Menu.Where_Str,dbo.Ac_Menu.Action_Visible, '
           +' dbo.Aa_GetMenuRight(dbo.Af_User.User_Id, dbo.Ac_Menu.Menu_Name)  AS Action_Right, dbo.Aa_GetFieldRight(dbo.Af_User.User_Id) AS Field_Right '
           +' FROM   dbo.Ac_Menu CROSS JOIN   dbo.Af_User WHERE   (dbo.Af_User.User_Id = ''%S'') AND (dbo.Ac_Menu.Menu_Name = ''%S'')';
with QAPubData do
  begin
    SQL.Clear;
    SQL.Add(Format(TempString,[UserId,MenuName]));
    Open;
    AFrameName:=FieldByName('Menu_Name').AsString+'Frame';
    AFrameClassName:=FieldByName('DLL_Name').AsString;
    AFrameClass:=TAModelBrowserFrameClass(GetClass(AFrameClassName));
    if AFrameClass=nil then
      begin
         Close;
         Exit;
      end;
    if AFrame=nil then
       begin
         if AFrameName<>'' then
            try
              AFrame:=AFrameClass.Create(APubSelectEditForm);
              AFrame.Parent:=APubSelectEditForm;
              AFrame.Align:=alClient;
              AFrame.CoolBar1.Visible:=True;
              AFrame.Name:=FieldByName('Menu_Name').AsString+'FrameEdit';
              AFrame.WhereStr:=FieldByName('Where_Str').AsString;
              AFrame.SelectWhere:=FieldByName('Select_Where').AsString;
              AFrame.ActionVisible:=FieldByName('Action_Visible').AsInteger;
              AFrame.ActionRight:=FieldByName('Action_Right').AsInteger;
              AFrame.FieldRight:=FieldByName('Field_Right').AsInteger;
              AFrame.MenuName:=FieldByName('Menu_Name').AsString;
              AFrame.SetDataSetTag;
              AFrame.OpenDataSet;
            except
              AFrame.Free;
            end;
       end;
    Close;
  end;
end;

procedure TAPubSelectEditForm.FormShow(Sender: TObject);
begin
CreateFrame(AMenuName);
end;

procedure TAPubSelectEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
AFrame.Free;
Action:=caFree;
end;

end.
