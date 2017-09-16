unit APubSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxRadioGroup, cxCheckBox, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, ComCtrls, cxPropertiesStore, Menus,cxGridExportLink,SHellApi,
  Grids, MemDS, DBAccess, MSAccess;

type
  TAPubSelectForm = class(TForm)
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
    pm1: TPopupMenu;
    w1: TMenuItem;
    QSizeType: TMSQuery;
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
    procedure w1Click(Sender: TObject);
    procedure DPubSelectDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FActiveField:string;
    FMenuName:string;
    FCurrValue:string;
    FSize_Type:string;
    Function FindMatch(FromBeginning: boolean): boolean;
    procedure SetDisplyLabel;
  public
    { Public declarations }
    property ActiveField:string read FActiveField write FActiveField;
    property MenuName:string read FMenuName write FMenuName;
    property CurrValue:string read FCurrValue write FCurrValue;
    property Size_Type:string read FSize_Type write FSize_Type;
  end;

var
  APubSelectForm: TAPubSelectForm;

implementation

uses AData, APubLocateUnit, APubUnit , Contnrs;

{$R *.dfm}

procedure TAPubSelectForm.FormCreate(Sender: TObject);
begin
SelectStore.StorageName:=GetIniDirectory('SelectStore');
SelectStore.RestoreFrom;
if EditIsColor then
   begin
     cxGroupBox1.Color:=ADMSystem.cxStyleBackGround.Color;
     cxGrid1DBTableView1.Styles.StyleSheet:=ADMSystem.GridTableViewStyle;
   end;
end;

procedure TAPubSelectForm.SetDisplyLabel;
var i:integer;
begin
if Size_Type<>'' then
 begin
  QSizeType.ParamByName('Size_Type').Value:=Size_Type;
  QSizeType.Open;
 end;
if not ADMSystem.QAPubFields.Active then
   ADMSystem.QAPubFields.Open;
with ADMSystem.QAPubData do
  for i:=0 to FieldCount-1 do
     if ADMSystem.QAPubFields.Locate('Field_Name',Fields[i].FieldName,[loCaseInsensitive]) then
         begin
           Fields[i].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
           Fields[i].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
         end;
if QSizeType.Active then
 For i:=1 to 30 do
     Begin
      Admsystem.QAPubData.FieldByName('Size'+inttostr(i)).DisplayLabel:=QSizeType.fieldbyname('Size'+inttostr(i)).AsString;
      if QSizeType.fieldbyname('Size'+inttostr(i)).AsString='' then
       Admsystem.QAPubData.FieldByName('Size'+inttostr(i)).Visible:=False;
     End;

cxGrid1DBTableView1.DataController.CreateAllItems;

for i:=0 to cxGrid1DBTableView1.ColumnCount-1 do
    begin
      cxGrid1DBTableView1.Columns[i].Caption:=ADMSystem.QAPubData.FieldByName(cxGrid1DBTableView1.Columns[i].DataBinding.FieldName).DisplayLabel;
      cxComboBox2.Properties.Items.Add(cxGrid1DBTableView1.Columns[i].Caption);
    end;
end;

procedure TAPubSelectForm.FormShow(Sender: TObject);
begin
//cxGrid1DBTableView1.DataController.DataModeController.GridMode:=True;

SetDisplyLabel;
cxComboBox2.Text:=cxGrid1DBTableView1.Columns[0].Caption;
cxGrid1DBTableView1.Columns[0].SortOrder:=soAscending;
if Trim(CurrValue)<>'' then
  begin
   cxTextEdit1.Text:=CurrValue;
   DPubSelect.DataSet.Locate(ActiveField,cxTextEdit1.Text,[loCaseInsensitive,loPartialKey]);
  end;
cxTextEdit1.Text:=cxTextEdit1.Hint;
end;

procedure TAPubSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TAPubSelectForm.FormDestroy(Sender: TObject);
begin
cxTextEdit1.Hint:=cxTextEdit1.Text;
SelectStore.StoreTo;
end;

function TAPubSelectForm.FindMatch(FromBeginning: boolean): boolean;
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

procedure TAPubSelectForm.cxButton1Click(Sender: TObject);
begin
if not FindMatch(True) then
   ShowWarning('對不起,找不到!');
end;

procedure TAPubSelectForm.cxButton2Click(Sender: TObject);
begin
if not FindMatch(False) then
   ShowWarning('對不起,找不到!') ;
end;

procedure TAPubSelectForm.cxComboBox2PropertiesChange(Sender: TObject);
var i:integer;
begin
for i:=0 to DPubSelect.DataSet.FieldCount-1 do
   if DPubSelect.DataSet.Fields[i].DisplayLabel=cxComboBox2.Text then
      begin
        ActiveField:=DPubSelect.DataSet.Fields[i].FieldName;
        Break;
      end;
end;

procedure TAPubSelectForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
if (cxCheckBox1.Checked) and (TMSQuery(DPubSelect.DataSet).Active) then
   DPubSelect.DataSet.Locate(ActiveField,cxTextEdit1.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TAPubSelectForm.cxGrid1DBTableView1ColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
cxComboBox2.Text:=AColumn.Caption;
end;

procedure TAPubSelectForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
cxButton3.Click;
end;

procedure TAPubSelectForm.cxCheckBox1Click(Sender: TObject);
begin
(Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
end;

procedure TAPubSelectForm.w1Click(Sender: TObject);
begin
with ADMSystem.SaveDialog1 do
if Execute then
  begin       //-----------------with-----------------------------------------------------
    ExportGridToExcel(SaveFileName,cxGrid1,false,true);
      try               
        ShellExecute(0, nil, PChar(SaveFileName), nil, nil, SW_SHOWNORMAL );
      except
        ShowWarning('打開文件失敗,沒有安裝打開此文件的應用程式!');
     end;
  end;
end;
procedure TAPubSelectForm.DPubSelectDataChange(Sender: TObject;
  Field: TField);
begin
StatusBar1.Panels[0].Text:= IntToStr(DPubSelect.DataSet.RecNo)+'/'+IntToStr(DPubSelect.DataSet.RecordCount);
end;

end.
