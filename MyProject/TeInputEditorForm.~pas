unit TeInputEditorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxRadioGroup, cxDBEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxBlobEdit, Menus, cxGraphics, cxGroupBox;

type
  TTeInputEditorForm = class(TAModelEditorForm)
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label16: TLabel;
    cxDBBlobEdit2: TcxDBBlobEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBButtonEdit1: TcxDBButtonEdit;
    Label5: TLabel;
    cxDBButtonEdit3: TcxDBButtonEdit;
    Label7: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxDBButtonEdit3PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TeInputEditorForm1: TTeInputEditorForm;


implementation

uses  AData, APubUnit;

{$R *.dfm}

procedure TTeInputEditorForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT [Pur_No],[Vendor],[Pur_Date],[PA] FROM [CNData].[dbo].[Te_Purchase]'
      + 'where Pur_No not in (select Pur_No from dbo.Te_Store where Pur_No is not null) and RCheck = 1';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Pur_No').AsString:=ADMSystem.QAPubData.FieldByName('Pur_No').AsString;
           EditData.DataSet.FieldByName('Pur_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('PA').AsString:=ADMSystem.QAPubData.FieldByName('PA').AsString;
           EditData.DataSet.FieldByName('PA').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TTeInputEditorForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT [List_No],[Depart_No],[Depart_Name],[List_Date] FROM [CNData].[dbo].[Te_List]'
     + 'where List_No not in (select List_No from dbo.Te_Store where List_No is not null) and RCheck = 1';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('List_No').AsString:=ADMSystem.QAPubData.FieldByName('List_No').AsString;
           EditData.DataSet.FieldByName('List_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Depart_Name').AsString:=ADMSystem.QAPubData.FieldByName('Depart_Name').AsString;
           EditData.DataSet.FieldByName('Depart_Name').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TTeInputEditorForm.FormShow(Sender: TObject);
begin
  inherited;
  cxDBDateEdit1.Text := DateToStr(Now);
  cxDBDateEdit2.SetFocus;
  if(WhereStr = 'Input') then
    cxDBButtonEdit1.Enabled:=False
  else  if(WhereStr = 'Output') then
    cxDBButtonEdit3.Enabled:=False;
end;

procedure TTeInputEditorForm.cxDBButtonEdit3PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT [Pur_Type] ,[Pur_No],[Vendor],[Pur_Date],[PA] FROM [CNData].[dbo].[Te_Purchase] WHERE [Pur_No]=''%S'' ';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Pur_No').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('Pur_No').AsString:=ADMSystem.QAPubData.FieldByName('Pur_No').AsString;
           EditData.DataSet.FieldByName('Pur_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('PA').AsString:=ADMSystem.QAPubData.FieldByName('PA').AsString;
        end
     else
       begin
          EditData.DataSet.FieldByName('Pur_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Pur_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;

procedure TTeInputEditorForm.cxDBButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT [List_No],[Depart_No],[Depart_Name],[List_Date] FROM [CNData].[dbo].[Te_List] WHERE [List_No]=''%S'' ';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('List_No').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('List_No').AsString:=ADMSystem.QAPubData.FieldByName('List_No').AsString;
           EditData.DataSet.FieldByName('List_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Depart_Name').AsString:=ADMSystem.QAPubData.FieldByName('Depart_Name').AsString;
        end
     else
       begin
          EditData.DataSet.FieldByName('List_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('List_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;

Initialization
  RegisterClass(TTeInputEditorForm);
finalization
  UnRegisterClass(TTeInputEditorForm);

end.
