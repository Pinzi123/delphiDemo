unit APubSort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  Grids, Wwdbigrd, Wwdbgrid, DB, MemDS, DBAccess, MSAccess;

type
  TAPubSortForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
  private
    { Private declarations }
    FActiveData:TDataSource;     //��e���ʪ�DataSource
    FActivewwDBGrid:TwwDBGrid;     //��e���ʪ�Grid
    function GetFieldName(FieldLable:string):string;
  public
    { Public declarations }
    property  ActiveData:TDataSource read FActiveData write FActiveData;
    property  ActivewwDBGrid:TwwDBGrid read FActivewwDBGrid write FActivewwDBGrid;
  end;

var
  APubSortForm: TAPubSortForm;

implementation

{$R *.dfm}

procedure TAPubSortForm.FormShow(Sender: TObject);
var i:integer;
begin

with ActivewwDBGrid do
  for i:=0 to  FieldCount-1 do
    if (Fields[i].Tag<>32) and Fields[i].Visible then
        ListBox1.Items.Add(Fields[i].DisplayLabel);
end;

procedure TAPubSortForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

function TAPubSortForm.GetFieldName(FieldLable: string): string;
var i:integer;
begin
with ActivewwDBGrid do
  for i:=0 to  FieldCount-1 do
    if Fields[i].DisplayLabel=FieldLable then
       begin
          Result:=Fields[i].FieldName;
          Exit;
       end;
end;

procedure TAPubSortForm.SpeedButton1Click(Sender: TObject);
var i:integer;
begin
for i:=0 to ListBox1.Items.Count-1 do
    ListBox2.Items.Add(ListBox1.Items[i]);
ListBox1.Clear;
end;

procedure TAPubSortForm.SpeedButton2Click(Sender: TObject);
var i:integer;
begin
i:=ListBox1.ItemIndex;
ListBox2.Items.Add(ListBox1.Items[i]);
ListBox1.Items.Delete(i);
ListBox1.ItemIndex:=i;
end;

procedure TAPubSortForm.SpeedButton3Click(Sender: TObject);
var i:integer;
begin
i:=ListBox2.ItemIndex;
ListBox1.Items.Add(ListBox2.Items[i]);
ListBox2.Items.Delete(i);
ListBox2.ItemIndex:=i;
end;

procedure TAPubSortForm.SpeedButton4Click(Sender: TObject);
var i:integer;
begin
for i:=0 to ListBox2.Items.Count-1 do
    ListBox1.Items.Add(ListBox2.Items[i]);
ListBox2.Clear;
end;

procedure TAPubSortForm.cxButton1Click(Sender: TObject);
var i:integer;
    SortStr,SortOption:string;
begin
if RadioButton1.Checked then
   SortOption:=' ASC'
else
   SortOption:=' DESC';
if ListBox2.Items.Count>0 then
   begin
      SortStr:=GetFieldName(ListBox2.Items[0])+SortOption;
      for i:=1 to ListBox2.Items.Count-1 do
          SortStr:=SortStr+','+GetFieldName(ListBox2.Items[i])+SortOption;
      ActivewwDBGrid.Hint:=SortStr;
      (ActiveData.DataSet as TMSQuery).IndexFieldNames:=SortStr;
     // (ActiveData.DataSet as TMSQuery).SetOrderBy(SortStr);
     // (ActiveData.DataSet as TMSQuery).Open;
   end;
end;

procedure TAPubSortForm.ListBox1DblClick(Sender: TObject);
var i:integer;
begin
i:=ListBox1.ItemIndex;
ListBox2.Items.Add(ListBox1.Items[i]);
ListBox1.Items.Delete(i);
ListBox1.ItemIndex:=i;
end;

procedure TAPubSortForm.ListBox2DblClick(Sender: TObject);
var i:integer;
begin
i:=ListBox2.ItemIndex;
ListBox1.Items.Add(ListBox2.Items[i]);
ListBox2.Items.Delete(i);
ListBox2.ItemIndex:=i;
end;

end.
