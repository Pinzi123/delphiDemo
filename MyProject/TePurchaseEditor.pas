unit TePurchaseEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxRadioGroup, cxDBEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxBlobEdit, Menus, cxGraphics, cxGroupBox;

type
  TTePurchaseEditorForm = class(TAModelEditorForm)
    Label1: TLabel;
    cxDBButtonEdit1: TcxDBButtonEdit;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    Label3: TLabel;
    Label5: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label11: TLabel;
    cxDBBlobEdit1: TcxDBBlobEdit;
    Label16: TLabel;
    cxDBBlobEdit2: TcxDBBlobEdit;
    Label4: TLabel;
    Label6: TLabel;
    cxDBButtonEdit3: TcxDBButtonEdit;
    Label7: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Label8: TLabel;
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);


    { Private declarations }
  public
    { Public declarations }
  end;

var
  TePurchaseEditorForm: TTePurchaseEditorForm;

implementation

uses  AData, APubUnit;

{$R *.dfm}


procedure TTePurchaseEditorForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT  Vendor, Vnd_Sim, Vnd_Type, Chn_Name FROM [CNData].[dbo].[Bb_Vendor] ';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Vnd_Sim').AsString:=ADMSystem.QAPubData.FieldByName('Vnd_Sim').AsString;
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;


procedure TTePurchaseEditorForm.FormShow(Sender: TObject);
begin
  inherited;
  cxDBDateEdit1.Text := DateToStr(Now);
end;

procedure TTePurchaseEditorForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT  * FROM [CNData].[dbo].[Af_User] ';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('PA').AsString:=ADMSystem.QAPubData.FieldByName('User_Name').AsString;
           EditData.DataSet.FieldByName('PA').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

Initialization
  RegisterClass(TTePurchaseEditorForm);
finalization
  UnRegisterClass(TTePurchaseEditorForm);

end.
