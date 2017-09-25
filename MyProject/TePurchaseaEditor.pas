unit TePurchaseaEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxRadioGroup, cxDBEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxBlobEdit, Menus, cxGraphics, cxGroupBox;

type
  TTePurchaseaEditorForm = class(TAModelEditorForm)
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    cxDBButtonEdit2: TcxDBButtonEdit;
    Label5: TLabel;
    Label4: TLabel;
    cxDBMaskEdit3: TcxDBMaskEdit;
    Label7: TLabel;
    Label6: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxDBButtonEdit4: TcxDBButtonEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TePurchaseaEditorForm: TTePurchaseaEditorForm;

implementation

uses  AData, APubUnit;

{$R *.dfm}

procedure TTePurchaseaEditorForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='select Db_MatVendor.Mat_No,Mat_Desc,Mat_Name,Chn_Unit from Db_MatVendor,Db_MatNumber where Db_MatVendor.Mat_No = Db_MatNumber.Mat_No and Db_MatVendor.Vendor = ''' + cxDBButtonEdit2.Text + '''';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Mat_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Mat_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Desc').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Desc').AsString;
           EditData.DataSet.FieldByName('Mat_Desc').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Name').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Name').AsString;
           EditData.DataSet.FieldByName('Unit').AsString:=ADMSystem.QAPubData.FieldByName('Chn_Unit').AsString;
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;


procedure TTePurchaseaEditorForm.cxButton1Click(Sender: TObject);
begin
  if (cxDBButtonEdit4.Text = '') then
    begin
    ShowWarning('項次不能為空');
    cxDBButtonEdit4.SetFocus;
    end
    else
     inherited;
end;

Initialization
  RegisterClass(TTePurchaseaEditorForm);
finalization
  UnRegisterClass(TTePurchaseaEditorForm);
end.
