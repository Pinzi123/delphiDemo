unit TeStoreCEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxRadioGroup, cxDBEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxBlobEdit, Menus, cxGraphics, cxGroupBox;

type
  TTeStoreCEditForm = class(TAModelEditorForm)
    cxDBTextEdit3: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TeStoreCEditForm1: TTeStoreCEditForm;

implementation

uses TSO, AData, APubUnit;

{$R *.dfm}

Initialization
  RegisterClass(TTeStoreCEditForm);
finalization
  UnRegisterClass(TTeStoreCEditForm);
end.
 