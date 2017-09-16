unit APubTreeSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxLookAndFeelPainters, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxInplaceContainer, cxTLData, cxDBTL, cxPropertiesStore, ComCtrls,
  cxTextEdit, StdCtrls, cxButtons, cxRadioGroup, cxCheckBox, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxGroupBox, Menus;

type
  TAPubTreeSelectForm = class(TForm)
    DPubSelect: TDataSource;
    cxComboBox2: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxDBTreeList1: TcxDBTreeList;
    PopupMenu1: TPopupMenu;
    cxCheckBox1: TMenuItem;
    cxCheckBox2: TMenuItem;
    N1: TMenuItem;
    cxRadioButton1: TMenuItem;
    cxRadioButton2: TMenuItem;
    cxRadioButton3: TMenuItem;
    PopupMenu2: TPopupMenu;
    TreeCollapse: TMenuItem;
    TreeExpand: TMenuItem;
    SelectStore: TcxPropertiesStore;
    cxButton5: TcxButton;
    MenuNew: TMenuItem;
    MenuEdit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDBTreeList1ColumnHeaderClick(Sender: TObject;
      AColumn: TcxTreeListColumn);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure TreeCollapseClick(Sender: TObject);
    procedure TreeExpandClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    FActiveField:string;
    FMenuName:string;
    Function FindMatch(FromBeginning: boolean): boolean;
    procedure SetDisplyLabel;
  public
    { Public declarations }
    property ActiveField:string read FActiveField write FActiveField;
    property MenuName:string read FMenuName write FMenuName;
  end;

var
  APubTreeSelectForm: TAPubTreeSelectForm;

implementation

uses AData, APubLocateUnit, APubUnit;

{$R *.dfm}

procedure TAPubTreeSelectForm.FormCreate(Sender: TObject);
begin
SelectStore.StorageName:=GetIniDirectory('SelectStore');
SelectStore.RestoreFrom;
if EditIsColor then
   begin
     cxGroupBox1.Color:=ADMSystem.cxStyleBackGround.Color;
     cxDBTreeList1.Styles.StyleSheet:=ADMSystem.TreeListStyle;
   end;
end;

procedure TAPubTreeSelectForm.SetDisplyLabel;
var i:integer;
begin
if not ADMSystem.QAPubFields.Active then
   ADMSystem.QAPubFields.Open;
with ADMSystem.QAPubData do
  for i:=0 to FieldCount-1 do
     if ADMSystem.QAPubFields.Locate('Field_Name',Fields[i].FieldName,[loCaseInsensitive]) then
         begin
           Fields[i].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
           Fields[i].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
         end;
cxDBTreeList1.DataController.CreateAllItems;

for i:=0 to cxDBTreeList1.ColumnCount-1 do
    begin
      cxDBTreeList1.Columns[i].Caption.Text:=ADMSystem.QAPubData.FieldByName(cxDBTreeList1.Columns[i].DataBinding.FieldName).DisplayLabel;
      cxDBTreeList1.Columns[i].Width:=ADMSystem.QAPubData.FieldByName(cxDBTreeList1.Columns[i].DataBinding.FieldName).DisplayWidth*10;
      if cxDBTreeList1.Columns[i].DataBinding.FieldName='Parent_No' then
         cxDBTreeList1.Columns[i].Visible:=False
      else
         cxComboBox2.Properties.Items.Add(cxDBTreeList1.Columns[i].Caption.Text);
    end;
end;

procedure TAPubTreeSelectForm.FormShow(Sender: TObject);
begin
SetDisplyLabel;
cxComboBox2.Text:=cxDBTreeList1.Columns[0].Caption.Text;
cxDBTreeList1.Columns[0].SortOrder:=soAscending;
MenuNew.Visible:=MenuName<>'';
MenuEdit.Visible:=MenuName<>'';
end;

procedure TAPubTreeSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TAPubTreeSelectForm.FormDestroy(Sender: TObject);
begin
SelectStore.StoreTo;
end;

function TAPubTreeSelectForm.FindMatch(FromBeginning: boolean): boolean;
var
   MatchType: TwwLocateMatchType;
   curFieldName: string;
begin
   result:= false;
   if cxRadioButton1.Checked then
      MatchType:= mtExactmatch
   else if cxRadioButton2.Checked then
      MatchType:= mtPartialMatchStart
   else MatchType:= mtPartialMatchAny;

   curFieldName:=ActiveField;
   if curFieldName='' then Exit;
   result:= wwFindMatch(FromBeginning,DPubSelect.DataSet, curFieldName,
	cxTextEdit1.text, matchType, cxCheckBox2.Checked,
        False);
end;

procedure TAPubTreeSelectForm.cxButton1Click(Sender: TObject);
begin
if not FindMatch(True) then
   ShowWarning('對不起,找不到!');
end;

procedure TAPubTreeSelectForm.cxButton2Click(Sender: TObject);
begin
if not FindMatch(False) then
   ShowWarning('對不起,找不到!') ;
end;

procedure TAPubTreeSelectForm.cxComboBox2PropertiesChange(Sender: TObject);
var i:integer;
begin
for i:=0 to DPubSelect.DataSet.FieldCount-1 do
   if DPubSelect.DataSet.Fields[i].DisplayLabel=cxComboBox2.Text then
      begin
        ActiveField:=DPubSelect.DataSet.Fields[i].FieldName;
        Break;
      end;
end;

procedure TAPubTreeSelectForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
if cxCheckBox1.Checked then
   DPubSelect.DataSet.Locate(ActiveField,cxTextEdit1.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TAPubTreeSelectForm.cxDBTreeList1ColumnHeaderClick(
  Sender: TObject; AColumn: TcxTreeListColumn);
begin
cxComboBox2.Text:=AColumn.Caption.Text;
end;

procedure TAPubTreeSelectForm.cxDBTreeList1DblClick(Sender: TObject);
begin
cxButton3.Click;
end;

procedure TAPubTreeSelectForm.TreeCollapseClick(Sender: TObject);
begin
cxDBTreeList1.FullCollapse;
end;

procedure TAPubTreeSelectForm.TreeExpandClick(Sender: TObject);
begin
cxDBTreeList1.FullExpand;
end;

procedure TAPubTreeSelectForm.cxCheckBox1Click(Sender: TObject);
begin
(Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
end;

end.
