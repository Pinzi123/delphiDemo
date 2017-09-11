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
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    cxDBButtonEdit3: TcxDBButtonEdit;
    cxDBButtonEdit4: TcxDBButtonEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBTextEdit6: TcxDBTextEdit;
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

Initialization
  RegisterClass(TTePurchaseaEditorForm);
finalization
  UnRegisterClass(TTePurchaseaEditorForm);
end.
