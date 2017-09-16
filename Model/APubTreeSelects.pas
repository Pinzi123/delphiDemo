unit APubTreeSelects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxRadioGroup, cxCheckBox, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, ComCtrls, cxPropertiesStore, Menus, MemDS,
  DBAccess, MSAccess, cxTL, cxSplitter, cxInplaceContainer, cxTLData,
  cxDBTL;

type
  TAPubTreeSelectsForm = class(TForm)
    DPubSelect: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxComboBox2: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    SelectStore: TcxPropertiesStore;
    cxTextEdit1: TcxTextEdit;
    PopupMenu1: TPopupMenu;
    cxCheckBox1: TMenuItem;
    cxCheckBox2: TMenuItem;
    N1: TMenuItem;
    cxRadioButton1: TMenuItem;
    cxRadioButton2: TMenuItem;
    cxRadioButton3: TMenuItem;
    cxButton5: TcxButton;
    QAPubTree: TMSQuery;
    DAPubTree: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    cxSplitter1: TcxSplitter;
    PopupMenu2: TPopupMenu;
    TreeCollapse: TMenuItem;
    TreeExpand: TMenuItem;
    TreeAll: TMenuItem;
    MenuNew: TMenuItem;
    MenuEdit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1ColumnHeaderClick(
      Sender: TcxGridTableView; AColumn: TcxGridColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxDBTreeList1FocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure TreeCollapseClick(Sender: TObject);
    procedure TreeExpandClick(Sender: TObject);
    procedure TreeAllClick(Sender: TObject);
  private
    { Private declarations }
    FActiveField:string;
    FMKeyField:string;
    FDKeyField:string;
    FMenuName:string;
    Function FindMatch(FromBeginning: boolean): boolean;
    procedure SetDisplyLabel;
  public
    { Public declarations }
    property ActiveField:string read FActiveField write FActiveField;
    property MKeyField:string read FMKeyField write FMKeyField;
    property DKeyField:string read FDKeyField write FDKeyField;
    property MenuName:string read FMenuName write FMenuName;
  end;

var
  APubTreeSelectsForm: TAPubTreeSelectsForm;

implementation

uses AData, APubLocateUnit, APubUnit ;

{$R *.dfm}

procedure TAPubTreeSelectsForm.FormCreate(Sender: TObject);
begin
SelectStore.StorageName:=GetIniDirectory('SelectStore');
SelectStore.RestoreFrom;
if EditIsColor then
   begin
     cxGroupBox1.Color:=ADMSystem.cxStyleBackGround.Color;
     cxDBTreeList1.Styles.StyleSheet:=ADMSystem.TreeListStyle;
     cxGrid1DBTableView1.Styles.StyleSheet:=ADMSystem.GridTableViewStyle;
   end;
end;

procedure TAPubTreeSelectsForm.SetDisplyLabel;
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
cxGrid1DBTableView1.DataController.CreateAllItems;
cxGrid1DBTableView1.Columns[0].Visible:=False;
for i:=0 to cxGrid1DBTableView1.ColumnCount-1 do
    cxComboBox2.Properties.Items.Add(cxGrid1DBTableView1.Columns[i].Caption);
end;

procedure TAPubTreeSelectsForm.FormShow(Sender: TObject);
var i:integer;
begin
with QAPubTree do
  for i:=0 to FieldCount-1 do
     if ADMSystem.QAPubFields.Locate('Field_Name',Fields[i].FieldName,[loCaseInsensitive]) then
         begin
           Fields[i].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
           Fields[i].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
         end;
cxDBTreeList1.DataController.CreateAllItems;
for i:=0 to cxDBTreeList1.ColumnCount-1 do
    begin
      cxDBTreeList1.Columns[i].Caption.Text:=QAPubTree.FieldByName(cxDBTreeList1.Columns[i].DataBinding.FieldName).DisplayLabel;
      cxDBTreeList1.Columns[i].Width:=QAPubTree.FieldByName(cxDBTreeList1.Columns[i].DataBinding.FieldName).DisplayWidth*10;
      if cxDBTreeList1.Columns[i].DataBinding.FieldName='Parent_No' then
         cxDBTreeList1.Columns[i].Visible:=False;
    end;
    
SetDisplyLabel;
cxComboBox2.Text:=cxGrid1DBTableView1.Columns[1].Caption;
cxGrid1DBTableView1.Columns[1].SortOrder:=soAscending;
MenuNew.Visible:=MenuName<>'';
MenuEdit.Visible:=MenuName<>'';
end;

procedure TAPubTreeSelectsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
QAPubTree.Close;
Action:=caFree;
end;

procedure TAPubTreeSelectsForm.FormDestroy(Sender: TObject);
begin
SelectStore.StoreTo;
end;

function TAPubTreeSelectsForm.FindMatch(FromBeginning: boolean): boolean;
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

procedure TAPubTreeSelectsForm.cxButton1Click(Sender: TObject);
begin
if not FindMatch(True) then
   ShowWarning('�藍�_,�䤣��!');
end;

procedure TAPubTreeSelectsForm.cxButton2Click(Sender: TObject);
begin
if not FindMatch(False) then
   ShowWarning('�藍�_,�䤣��!') ;
end;

procedure TAPubTreeSelectsForm.cxComboBox2PropertiesChange(Sender: TObject);
var i:integer;
begin
for i:=0 to DPubSelect.DataSet.FieldCount-1 do
   if DPubSelect.DataSet.Fields[i].DisplayLabel=cxComboBox2.Text then
      begin
        ActiveField:=DPubSelect.DataSet.Fields[i].FieldName;
        Break;
      end;
end;

procedure TAPubTreeSelectsForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
if cxCheckBox1.Checked then
   DPubSelect.DataSet.Locate(ActiveField,cxTextEdit1.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TAPubTreeSelectsForm.cxGrid1DBTableView1ColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
cxComboBox2.Text:=AColumn.Caption;
end;

procedure TAPubTreeSelectsForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
cxButton3.Click;
end;

procedure TAPubTreeSelectsForm.cxCheckBox1Click(Sender: TObject);
begin
(Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
end;

procedure TAPubTreeSelectsForm.cxDBTreeList1FocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var  i:integer;
     MastValue:string;
begin
if (QAPubTree.Active)and(cxDBTreeList1.ColumnCount>0)  then
  begin
    MastValue:=AFocusedNode.Values[0];
    ADMSystem.QAPubData.FilterSQL:='Left('+DKeyField+','+IntToStr(Length(MastValue))+')='''+MastValue+'''';
    with ADMSystem.QAPubData do
       for i:=0 to FieldCount-1 do
          if ADMSystem.QAPubFields.Locate('Field_Name',Fields[i].FieldName,[loCaseInsensitive]) then
             begin
               Fields[i].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
               Fields[i].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
             end;
  end;
end;

procedure TAPubTreeSelectsForm.TreeCollapseClick(Sender: TObject);
begin
cxDBTreeList1.FullCollapse;
end;

procedure TAPubTreeSelectsForm.TreeExpandClick(Sender: TObject);
begin
cxDBTreeList1.FullExpand;
end;

procedure TAPubTreeSelectsForm.TreeAllClick(Sender: TObject);
var  i:integer;
begin
ADMSystem.QAPubData.FilterSQL:='';
with ADMSystem.QAPubData do
   for i:=0 to FieldCount-1 do
       if ADMSystem.QAPubFields.Locate('Field_Name',Fields[i].FieldName,[loCaseInsensitive]) then
             begin
               Fields[i].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
               Fields[i].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
             end;
end;

end.
