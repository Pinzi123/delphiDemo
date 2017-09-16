unit DbMatClassEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit;

type
  TDbMatClassEditorForm = class(TAModelEditorForm)
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    procedure cxDBTextEdit3PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxDBTextEdit1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DbMatClassEditorForm: TDbMatClassEditorForm;

implementation

uses AData,APubUnit;

{$R *.dfm}

procedure TDbMatClassEditorForm.cxDBTextEdit3PropertiesChange(
  Sender: TObject);
begin
cxDBTextEdit1.Enabled:=(EditData.State in [dsInsert]) and (Trim(cxDBTextEdit3.Text)='') ;
end;

procedure TDbMatClassEditorForm.FormShow(Sender: TObject);
begin
  inherited;
cxDBTextEdit1.Enabled:=(EditData.State in [dsInsert]) and (Trim(cxDBTextEdit3.Text)='') ;
end;

procedure TDbMatClassEditorForm.cxButton1Click(Sender: TObject);
begin
if (EditData.State in [dsInsert]) and (Trim(cxDBTextEdit3.Text)<>'') then
begin
     QAPubDataOpen('SELECT COALESCE (MAX(RIGHT(Mata_No, 3)) + 1, 1) AS AutoNo FROM  Db_MatClass WHERE  (Parent_No = '''+Trim(cxDBTextEdit3.Text)+''')');
     EditData.DataSet.FieldByName('Mata_No').AsString:=EditData.DataSet.FieldByName('Parent_No').AsString+FormatFloat('000',ADMSystem.QAPubData.FieldByName('AutoNo').AsInteger);
     QAPubDataClose;
end;
  inherited;

end;

procedure TDbMatClassEditorForm.cxDBTextEdit1PropertiesChange(
  Sender: TObject);
begin
  inherited;
cxDBTextEdit3.Enabled:=(Trim(cxDBTextEdit1.Text)='');
end;

initialization
  RegisterClass(TDbMatClassEditorForm);
finalization
  UnRegisterClass(TDbMatClassEditorForm);

end.
