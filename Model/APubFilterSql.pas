unit APubFilterSql;

interface

uses

  DBCtrls,    ToolWin, ComCtrls,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxPropertiesStore, StdCtrls, ExtCtrls, MemDS, VirtualTable,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxLookAndFeelPainters, cxButtons, Menus, cxDropDownEdit,
  DBAccess, MSAccess, cxContainer, cxTextEdit, cxMemo, cxSplitter,
  cxCalendar;

type
  TAPubFilterSqlForm = class(TForm)
    OldDataSource: TDataSource;
    DPubFilterSql: TDataSource;
    FilterSqlStore: TcxPropertiesStore;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    QFilterSql: TVirtualTable;
    DFilterSql: TDataSource;
    Panel3: TPanel;
    QFilterSqlLeft_Sign: TStringField;
    QFilterSqlField_Name: TStringField;
    QFilterSqlMid_Sign: TStringField;
    QFilterSqlField_Value: TStringField;
    QFilterSqlRight_Sign: TStringField;
    QFilterSqlLogic_Sign: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Left_Sign: TcxGridDBColumn;
    cxGrid1DBTableView1Field_Name: TcxGridDBColumn;
    cxGrid1DBTableView1Mid_Sign: TcxGridDBColumn;
    cxGrid1DBTableView1Field_Value: TcxGridDBColumn;
    cxGrid1DBTableView1Right_Sign: TcxGridDBColumn;
    cxGrid1DBTableView1Logic_Sign: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    PopupMenu1: TPopupMenu;
    QFilterSqlAppend: TMenuItem;
    QFilterSqlInsert: TMenuItem;
    QFilterSqlDelete: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    QFilterSqlClear: TMenuItem;
    cxMemoSqlTxt: TcxMemo;
    cxButton3: TcxButton;
    cxSplitter1: TcxSplitter;
    cxButton2: TcxButton;
    N1: TMenuItem;
    QFilterSqlRead: TMenuItem;
    QFilterSqlWrite: TMenuItem;
    Label2: TLabel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QFilterSqlAppendClick(Sender: TObject);
    procedure QFilterSqlInsertClick(Sender: TObject);
    procedure QFilterSqlDeleteClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure QFilterSqlClearClick(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxButton3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SaveDialogCanClose(Sender: TObject; var CanClose: Boolean);
    procedure cxButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1Field_NamePropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid1DBTableView1Field_NamePropertiesChange(
      Sender: TObject);
  private
    { Private declarations }
    FSelectWhere:string;
    function GetFieldName(DisplayLabel:string):string;
    function GetFilterSqlTxt(IsField:boolean):string;
    procedure GetQFilterSqlDisplayLabel;
  public
    { Public declarations }
    property  SelectWhere:string read FSelectWhere write FSelectWhere;
  end;

var
  APubFilterSqlForm: TAPubFilterSqlForm;

implementation

uses AData, APubUnit;

{$R *.dfm}

procedure TAPubFilterSqlForm.FormCreate(Sender: TObject);
begin
QFilterSql.Open;
if EditIsColor then
   begin
      Panel2.Color:=ADMSystem.cxStyleBackGround.Color;
      Panel3.Color:=ADMSystem.cxStyleBackGround.Color;
      cxGrid1DBTableView1.Styles.StyleSheet:=ADMSystem.GridTableViewStyle;
      cxMemoSqlTxt.Style.Color:=ADMSystem.cxStyleContent.Color;
   end;
end;

procedure TAPubFilterSqlForm.FormShow(Sender: TObject);
begin
GetQFilterSqlDisplayLabel;
end;

procedure TAPubFilterSqlForm.FormDestroy(Sender: TObject);
begin
QFilterSql.Close;
end;

procedure TAPubFilterSqlForm.QFilterSqlAppendClick(Sender: TObject);
begin
QFilterSql.Append;
end;

procedure TAPubFilterSqlForm.QFilterSqlInsertClick(Sender: TObject);
begin
QFilterSql.Insert;
end;

procedure TAPubFilterSqlForm.QFilterSqlDeleteClick(Sender: TObject);
begin
QFilterSql.Delete;
end;

procedure TAPubFilterSqlForm.QFilterSqlClearClick(Sender: TObject);
begin
QFilterSql.Clear;
end;

procedure TAPubFilterSqlForm.cxButton1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
     begin
       QFilterSql.LoadFromFile(OpenDialog.FileName);
       GetQFilterSqlDisplayLabel;
     end;
end;

procedure TAPubFilterSqlForm.cxButton2Click(Sender: TObject);
begin
if SaveDialog.Execute then
   QFilterSql.SaveToFile(SaveDialog.FileName);
end;

procedure TAPubFilterSqlForm.cxButton3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
cxMemoSqlTxt.Lines.Clear;
cxMemoSqlTxt.Lines.Add(GetFilterSqlTxt(False));
cxMemoSqlTxt.Visible:=True;
cxSplitter1.Visible:=True;
end;

procedure TAPubFilterSqlForm.cxButton3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
cxSplitter1.Visible:=False;
cxMemoSqlTxt.Visible:=False;
end;


procedure TAPubFilterSqlForm.cxButton4Click(Sender: TObject);
var  FilterSqlTxt:string;
begin
FilterSqlTxt:=GetFilterSqlTxt(True);
ADMSystem.QAPubData.SQL:=(DPubFilterSql.DataSet as TMSQuery).SQL;
ADMSystem.QAPubData.FilterSQL:='';
if ((DPubFilterSql.DataSet as TMSQuery).Tag and 64)>0 then
begin
if (Trim(SelectWhere)<>'')and(Trim(FilterSqlTxt)<>'') then
   ADMSystem.QAPubData.FilterSQL:=SelectWhere+' AND '+FilterSqlTxt
else
   if Trim(SelectWhere)<>'' then
      ADMSystem.QAPubData.FilterSQL:=SelectWhere
   else
      if Trim(FilterSqlTxt)<>'' then
         ADMSystem.QAPubData.FilterSQL:=FilterSqlTxt;
end
else
ADMSystem.QAPubData.FilterSQL:=FilterSqlTxt;
//ADMSystem.QAPubData.Prepare;
(DPubFilterSql.DataSet as TMSQuery).FilterSQL:=ADMSystem.QAPubData.FilterSQL;
ADMSystem.QAPubData.FilterSQL:='';
if (DPubFilterSql.DataSet as TMSQuery).Active=False then  (DPubFilterSql.DataSet as TMSQuery).Open;
ModalResult:=mrOk;
end;

function TAPubFilterSqlForm.GetFieldName(DisplayLabel: string): string;
var i:integer;
begin
for i:=0 to DPubFilterSql.DataSet.FieldCount-1 do
    if DPubFilterSql.DataSet.Fields[i].DisplayLabel=DisplayLabel then
       begin
         Result:=DPubFilterSql.DataSet.Fields[i].FieldName;
         Break;
       end;
end;

function TAPubFilterSqlForm.GetFilterSqlTxt(IsField:boolean):string;
var  FilterSql,FStr,WStr:string;
     MyBookMark:TBookMark;
     i,j:Integer;
begin
FilterSql:='';
with QFilterSql do
  begin
    j:=0;
    WStr:='';
    DisableControls;
    MyBookMark:=GetBookmark;
    First;
    while not Eof do
      begin
        FilterSql:=FilterSql+Trim(QFilterSql.FieldByName('Left_Sign').AsString);
        if IsField then
           FilterSql:=FilterSql+GetFieldName(QFilterSql.FieldByName('Field_Name').AsString)+' '
        else
           FilterSql:=FilterSql+QFilterSql.FieldByName('Field_Name').AsString+' ';
        if QFilterSql.FieldByName('Mid_Sign').AsString='is null' then
           FilterSql:=FilterSql+QFilterSql.FieldByName('Mid_Sign').AsString +' '+QFilterSql.FieldByName('Right_Sign').AsString+' '+QFilterSql.FieldByName('Logic_Sign').AsString+' '
        else
          if (QFilterSql.FieldByName('Mid_Sign').AsString='like') or (QFilterSql.FieldByName('Mid_Sign').AsString='not like')then
            FilterSql:=FilterSql+QFilterSql.FieldByName('Mid_Sign').AsString +' ''%'+QFilterSql.FieldByName('Field_Value').AsString+'%'' '+QFilterSql.FieldByName('Right_Sign').AsString+' '+QFilterSql.FieldByName('Logic_Sign').AsString+' '
          else
            if QFilterSql.FieldByName('Mid_Sign').AsString='in' then  //(2009-06-16新增 )
              begin
                FStr:=QFilterSql.FieldByName('Field_Value').AsString;
                for i:=1 to Length(FStr) do
                  if Copy(FStr,i,1)=',' then
                    begin
                      WStr:=WStr+' '''+Copy(FStr,j+1,i-j-1)+''' '+',';
                      j:=i;
                    end;
                  WStr:='('+Wstr+' '''+Copy(FStr,j+1,Length(FStr)-j)+''' '+')';
                  FilterSql:=FilterSql+QFilterSql.FieldByName('Mid_Sign').AsString +WStr+QFilterSql.FieldByName('Right_Sign').AsString+' '+QFilterSql.FieldByName('Logic_Sign').AsString+' ';
              end
            else
              FilterSql:=FilterSql+QFilterSql.FieldByName('Mid_Sign').AsString +' '''+QFilterSql.FieldByName('Field_Value').AsString+''' '+QFilterSql.FieldByName('Right_Sign').AsString+' '+QFilterSql.FieldByName('Logic_Sign').AsString+' ';
        Next;
      end;
    GotoBookmark(MyBookMark);
    EnableControls;
  end;
Result:=FilterSql;
end;

procedure TAPubFilterSqlForm.GetQFilterSqlDisplayLabel;
begin
QFilterSql.FieldByName('Left_Sign').DisplayLabel:='左括號';
QFilterSql.FieldByName('Field_Name').DisplayLabel:='欄位名稱';
QFilterSql.FieldByName('Mid_Sign').DisplayLabel:='符號';
QFilterSql.FieldByName('Field_Value').DisplayLabel:='條件值';
QFilterSql.FieldByName('Right_Sign').DisplayLabel:='右括號';
QFilterSql.FieldByName('Logic_Sign').DisplayLabel:='邏輯';
end;

procedure TAPubFilterSqlForm.SaveDialogCanClose(Sender: TObject;
  var CanClose: Boolean);
begin
if FileExists(SaveDialog.FileName) then
   CanClose:=ShowQuestion('文件已存在,要覆蓋嗎?');
end;

procedure TAPubFilterSqlForm.cxGrid1DBTableView1Field_NamePropertiesEditValueChanged(
  Sender: TObject);
begin
{
        if ActiveTreeList<>nil then
           for i:=0 to ActiveTreeList.ColumnCount-1 do
              // if ActiveTreeList.Columns[i].Visible then
                  begin
                    (cxGrid1DBTableView1Field_Name.Properties as TcxComboBoxProperties).Items.Add(ActiveTreeList.Columns[i].Caption.Text);
                  end;     }
{
if  cxGrid1DBTableView1Field_Name.<>'' then
if (DPubFilterSql.DataSet as TMSQuery).FieldByName(GetFieldName(QFilterSql.FieldByName('Field_Name').AsString)).DataType=ftString then
    TempBool:=True; }
end;

procedure TAPubFilterSqlForm.cxGrid1DBTableView1Field_NamePropertiesChange(
  Sender: TObject);
begin
//
end;

end.
