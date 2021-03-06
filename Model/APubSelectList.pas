unit APubSelectList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxRadioGroup, cxCheckBox, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, ComCtrls, cxPropertiesStore, Menus, Grids,
  Wwdbigrd, Wwdbgrid, MemDS, DBAccess, MSAccess;

type
  TAPubSelectListForm = class(TForm)
    DPubSelect: TDataSource;
    cxComboBox2: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxTextEdit1: TcxTextEdit;
    PopupMenu1: TPopupMenu;
    cxCheckBox1: TMenuItem;
    cxCheckBox2: TMenuItem;
    N1: TMenuItem;
    cxRadioButton1: TMenuItem;
    cxRadioButton2: TMenuItem;
    cxRadioButton3: TMenuItem;
    cxButton5: TcxButton;
    wwDBGrid1: TwwDBGrid;
    EditData: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure wwDBGrid1CalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure wwDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FActiveIndex:integer;
    FWhereStr:string;      //從主Frame傳來的初始條件值
    FActiveField:string;
    FSortString:string;
    FSelectStore:TcxPropertiesStore;
    FStore:TcxPropertiesStore;   //記錄Frame的設定狀態
    Function FindMatch(FromBeginning: boolean): boolean;
    procedure SetDisplyLabel;
    procedure MyAfterScroll(DataSet: TDataSet);
  public
    { Public declarations }
    property ActiveIndex:integer read FActiveIndex write FActiveIndex;
    property WhereStr:string read FWhereStr write FWhereStr;
    property ActiveField:string read FActiveField write FActiveField;
    property SortString:string read FSortString write FSortString;
    property SelectStore:TcxPropertiesStore read FSelectStore write FSelectStore;
    property Store:TcxPropertiesStore read FStore write FStore;
  end;

var
  APubSelectListForm: TAPubSelectListForm;

implementation

uses AData, APubLocateUnit, APubUnit ;

{$R *.dfm}

procedure TAPubSelectListForm.FormCreate(Sender: TObject);
var k:integer;
begin
Store:=TcxPropertiesStore.Create(Self);
SelectStore:=TcxPropertiesStore.Create(Self);
Store.StorageName:=GetIniDirectory(Name);
SelectStore.StorageName:=GetIniDirectory('SelectStore');

k:=SelectStore.Components.Count;
SelectStore.Components.Insert(k);
SelectStore.Components[k].Component:=cxCheckBox1;
SelectStore.Components[k].Properties.Add('Checked');

k:=SelectStore.Components.Count;
SelectStore.Components.Insert(k);
SelectStore.Components[k].Component:=cxCheckBox2;
SelectStore.Components[k].Properties.Add('Checked');

k:=SelectStore.Components.Count;
SelectStore.Components.Insert(k);
SelectStore.Components[k].Component:=cxRadioButton1;
SelectStore.Components[k].Properties.Add('Checked');

k:=SelectStore.Components.Count;
SelectStore.Components.Insert(k);
SelectStore.Components[k].Component:=cxRadioButton2;
SelectStore.Components[k].Properties.Add('Checked');

k:=SelectStore.Components.Count;
SelectStore.Components.Insert(k);
SelectStore.Components[k].Component:=cxRadioButton3;
SelectStore.Components[k].Properties.Add('Checked');

SelectStore.RestoreFrom;

end;

procedure TAPubSelectListForm.SetDisplyLabel;
var i,k:integer;
begin
if IsColor then
  with wwDBGrid1 do
    begin
      cxGroupBox1.Color:=ADMSystem.cxStyleBackGround.Color;
      TitleColor:=ADMSystem.cxStyleBackGround.Color;
      Color:=ADMSystem.cxStyleBackGround.Color;
      PaintOptions.ActiveRecordColor:=ADMSystem.cxStyleSelection.Color;
      PaintOptions.AlternatingRowColor:=ADMSystem.cxStyleContentEven.Color;
      FooterColor:=ADMSystem.cxStyleFooter.Color;
    end;
with DPubSelect.DataSet do
  for i:=1 to FieldCount-1 do
     if ADMSystem.QAPubFields.Locate('Field_Name',Fields[i].FieldName,[loCaseInsensitive]) then
         begin
           Fields[i].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
           Fields[i].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
           cxComboBox2.Properties.Items.Add(Fields[i].DisplayLabel);
           k:=Store.Components.Count;
           Store.Components.Insert(k);
           Store.Components[k].Component:=Fields[i];
           Store.Components[k].Properties.Add('Index');
           Store.Components[k].Properties.Add('DisplayWidth');
           Store.Components[k].Properties.Add('Visible');
         end;
Store.RestoreFrom;         
wwDBGrid1.SetControlType('Selected', fctCheckBox, 'True;False');
end;

procedure TAPubSelectListForm.FormShow(Sender: TObject);
begin
SetDisplyLabel;
//(DPubSelect.DataSet as TMSQuery).IndexFieldNames:=SortString;
(DPubSelect.DataSet as TMSQuery).SetOrderBy(SortString);
DPubSelect.DataSet.Open;
cxComboBox2.Text:=DPubSelect.DataSet.FieldByName(ActiveField).DisplayLabel;
DPubSelect.DataSet.AfterScroll:=MyAfterScroll;
StatusBar1.Panels[0].Text:= IntToStr(DPubSelect.DataSet.RecNo)+'/'+IntToStr(DPubSelect.DataSet.RecordCount);
end;

procedure TAPubSelectListForm.FormDestroy(Sender: TObject);
begin
Store.StoreTo;
SelectStore.StoreTo;
Store.Free;
SelectStore.Free;
end;

function TAPubSelectListForm.FindMatch(FromBeginning: boolean): boolean;
var
   MatchType: TwwLocateMatchType;
   curFieldName: string;
begin
   Result:= False;
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

procedure TAPubSelectListForm.cxButton1Click(Sender: TObject);
begin
if not FindMatch(True) then
   ShowWarning('對不起,找不到!');
end;

procedure TAPubSelectListForm.cxButton2Click(Sender: TObject);
begin
if not FindMatch(False) then
   ShowWarning('對不起,找不到!') ;
end;

procedure TAPubSelectListForm.cxComboBox2PropertiesChange(Sender: TObject);
var i:integer;
begin
for i:=0 to DPubSelect.DataSet.FieldCount-1 do
   if DPubSelect.DataSet.Fields[i].DisplayLabel=cxComboBox2.Text then
      begin
        ActiveField:=DPubSelect.DataSet.Fields[i].FieldName;
        Break;
      end;
end;

procedure TAPubSelectListForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
if cxCheckBox1.Checked then
   DPubSelect.DataSet.Locate(ActiveField,cxTextEdit1.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TAPubSelectListForm.cxCheckBox1Click(Sender: TObject);
begin
(Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
end;

procedure TAPubSelectListForm.cxRadioButton1Click(Sender: TObject);
begin
(Sender as TMenuItem).Checked:=True;
end;

procedure TAPubSelectListForm.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
ActiveField:=AFieldName;
cxComboBox2.Text:=DPubSelect.DataSet.FieldByName(ActiveField).DisplayLabel;
with DPubSelect.DataSet as TMSQuery do
  if FieldByName(AFieldName).FieldKind=fkData  then
    begin
      if SortString=AFieldName+' ASC' then
         SortString:=AFieldName+' DESC'
      else
         SortString:=AFieldName+' ASC';
     // SetOrderBy(SortString);
     //Open;
     IndexFieldNames:=SortString;
    end;
end;

procedure TAPubSelectListForm.wwDBGrid1CalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
if SortString=Field.FieldName+' ASC' then
   TitleImageAttributes.imageIndex:= 32
else
if SortString=Field.FieldName+' DESC' then
   TitleImageAttributes.imageIndex:=33;
end;

procedure TAPubSelectListForm.wwDBGrid1DblClick(Sender: TObject);
begin
cxButton3.Click;
end;

procedure TAPubSelectListForm.wwDBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
with  wwDBGrid1 do
if SelectedList.Count>0 then
  StatusBar1.Panels[1].Text:='選擇筆數: '+IntToStr(SelectedList.Count)
else
  StatusBar1.Panels[1].Text:='';
end;

procedure TAPubSelectListForm.MyAfterScroll(DataSet: TDataSet);
begin
StatusBar1.Panels[0].Text:= IntToStr(DPubSelect.DataSet.RecNo)+'/'+IntToStr(DPubSelect.DataSet.RecordCount);
end;

procedure TAPubSelectListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
