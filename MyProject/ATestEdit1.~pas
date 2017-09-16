unit ATestEdit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxDropDownEdit, cxDBEdit, cxMaskEdit, cxBlobEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCheckBox, cxButtonEdit, cxCalendar,
  cxCheckComboBox, cxDBCheckComboBox, Menus, cxGraphics;
type
  TGodownEditForm = class(TAModelEditorForm)
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBButtonEdit3: TcxDBButtonEdit;
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit2PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GodownEditForm: TGodownEditForm;

implementation

uses ATestMy, AData, APubUnit;

{$R *.dfm}

procedure TGodownEditForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT  name FROM dbo.providers ';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('provider').AsString:=ADMSystem.QAPubData.FieldByName('name').AsString;
           EditData.DataSet.FieldByName('provider').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TGodownEditForm.FormShow(Sender: TObject);
begin
  inherited;
  cxDBButtonEdit1.Enabled := True;
  cxDBButtonEdit2.Enabled := True;
  cxDBDateEdit1.Enabled := True;
  cxDBButtonEdit3.Enabled := True;
end;

procedure TGodownEditForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT warehouse,address FROM dbo.warehouses ';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('warehouse').AsString:=ADMSystem.QAPubData.FieldByName('warehouse').AsString;
           EditData.DataSet.FieldByName('warehouse').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TGodownEditForm.cxDBButtonEdit2PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT warehouse,address FROM dbo.warehouses WHERE warehouse=''%S'' ';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('warehouse').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('warehouse').AsString:=ADMSystem.QAPubData.FieldByName('warehouse').AsString;
           EditData.DataSet.FieldByName('warehouse').ConstraintErrorMessage:='';
           CheckValue:=True;
        end
     else
       begin
          EditData.DataSet.FieldByName('warehouse').ConstraintErrorMessage:=EditData.DataSet.FieldByName('warehouse').DisplayLabel+';';
           ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;

end;

procedure TGodownEditForm.cxDBButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT  name FROM dbo.providers WHERE name=''%S'' ';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('provider').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('provider').AsString:=ADMSystem.QAPubData.FieldByName('name').AsString;
           EditData.DataSet.FieldByName('provider').ConstraintErrorMessage:='';
        end
     else
       begin
          EditData.DataSet.FieldByName('provider').ConstraintErrorMessage:=EditData.DataSet.FieldByName('provider').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;

end;

procedure TGodownEditForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT User_Name FROM dbo.Af_User';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('staff').AsString:=ADMSystem.QAPubData.FieldByName('User_Name').AsString;
           EditData.DataSet.FieldByName('staff').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

Initialization
  RegisterClass(TGodownEditForm);
finalization
  UnRegisterClass(TGodownEditForm);
end.

