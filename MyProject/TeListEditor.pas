unit TeListEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxDropDownEdit, cxCalendar, cxDBEdit, cxMaskEdit, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxRadioGroup, cxCheckBox,
  Menus, cxGraphics;

type
  TDhListEditorForm = class(TAModelEditorForm)
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Label2: TLabel;
    cxDBButtonEdit1: TcxDBButtonEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    Label7: TLabel;
    Label5: TLabel;
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DhListEditorForm: TDhListEditorForm;

implementation

uses TSO, AData, APubUnit;

{$R *.dfm}


procedure TDhListEditorForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if EditData.State in [dsInsert,dsEdit] then
  begin
    TempString:='SELECT  Depart_No, Depart_Name, Parent_No FROM  dbo.Pa_Depart';
    if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Depart_No').AsString:=ADMSystem.QAPubData.FieldByName('Depart_No').AsString;
           EditData.DataSet.FieldByName('Depart_Name').AsString:=ADMSystem.QAPubData.FieldByName('Depart_Name').AsString;
           EditData.DataSet.FieldByName('Depart_No').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
  end;

end;

procedure TDhListEditorForm.cxDBButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT  Depart_No, Depart_Name, Parent_No FROM  dbo.Pa_Depart WHERE Depart_No=''%S'' and Use_Status=0';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Depart_No').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('Depart_No').AsString:=ADMSystem.QAPubData.FieldByName('Depart_No').AsString;
           EditData.DataSet.FieldByName('Depart_Name').AsString:=ADMSystem.QAPubData.FieldByName('Depart_Name').AsString;
           EditData.DataSet.FieldByName('Depart_No').ConstraintErrorMessage:='';
        end
     else
       begin
           EditData.DataSet.FieldByName('Depart_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Depart_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;


procedure TDhListEditorForm.FormShow(Sender: TObject);
begin
  inherited;
  cxDBDateEdit1.Text := DateToStr(Now);
  cxDBButtonEdit1.SetFocus;
end;

procedure TDhListEditorForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT  Depart_No,User_Name  FROM [CNData].[dbo].[Af_User] ';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('LA').AsString:=ADMSystem.QAPubData.FieldByName('User_Name').AsString;
           EditData.DataSet.FieldByName('LA').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

Initialization
  RegisterClass(TDhListEditorForm);
finalization
  UnRegisterClass(TDhListEditorForm);

end.
