unit APubPropertColumn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, RXCtrls,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, Grids, Wwdbigrd, Wwdbgrid, DB;

type
  TAPubPropertColumnForm = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    RxCheckListBox1: TRxCheckListBox;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure RxCheckListBox1ClickCheck(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    FActiveData:TDataSource;     //��e���ʪ�DataSource
    FActiveTreeList:TcxDBTreeList;
    FActivewwDBGrid:TwwDBGrid;
  public
    { Public declarations }
    property  ActiveData:TDataSource read FActiveData write FActiveData;
    property  ActiveTreeList:TcxDBTreeList read FActiveTreeList write FActiveTreeList;
    property  ActivewwDBGrid:TwwDBGrid read FActivewwDBGrid write FActivewwDBGrid;
  end;

var
  APubPropertColumnForm: TAPubPropertColumnForm;

implementation

uses ComObj;

{$R *.dfm}

procedure TAPubPropertColumnForm.FormShow(Sender: TObject);
var i,k:integer;
begin
k:=0;
if FActivewwDBGrid<>nil then
    with FActiveData.DataSet do
      for i:=0 to FieldCount-1 do
          if Fields[i].Tag<>32 then
            begin
              RxCheckListBox1.Items.Add(Fields[i].DisplayLabel);
              RxCheckListBox1.Checked[k]:=Fields[i].Visible;
              Inc(k);
            end;

if FActiveTreeList<>nil then
    with FActiveTreeList do
      for i:=0 to ColumnCount-1 do
        if (Columns[i].DataBinding.Field.FieldName<>DataController.KeyField)and(Columns[i].DataBinding.Field.FieldName<>DataController.ParentField) then
            begin
              RxCheckListBox1.Items.Add(Columns[i].Caption.Text);
              RxCheckListBox1.Checked[k]:=Columns[i].DataBinding.Field.Visible;
              Inc(k);
            end;
end;

procedure TAPubPropertColumnForm.RxCheckListBox1ClickCheck(
  Sender: TObject);
var i:integer;
begin
if FActivewwDBGrid<>nil then
  begin
    with ActiveData.DataSet do
      for i:=0 to FieldCount-1 do
        if Fields[i].DisplayLabel=RxCheckListBox1.Items[RxCheckListBox1.ItemIndex] then
           begin
             Fields[i].Visible:=RxCheckListBox1.Checked[RxCheckListBox1.ItemIndex];
             Break;
           end;
  end
else
if FActiveTreeList<>nil then
   begin
    with FActiveTreeList do
      for i:=0 to ColumnCount-1 do
        if Columns[i].Caption.Text=RxCheckListBox1.Items[RxCheckListBox1.ItemIndex] then
           begin
             Columns[i].Visible:=RxCheckListBox1.Checked[RxCheckListBox1.ItemIndex];
             Break;
           end;
   end;
end;

procedure TAPubPropertColumnForm.CheckBox1Click(Sender: TObject);
var i:integer;
begin
    with ActiveData.DataSet do
      for i:=0 to FieldCount-1 do
        if Fields[i].Tag<>32 then
             Fields[i].Visible:=CheckBox1.Checked;
    with RxCheckListBox1 do
      for i:=0 to RxCheckListBox1.Items.Count-1 do
             Checked[i]:=CheckBox1.Checked; 
end;

end.
