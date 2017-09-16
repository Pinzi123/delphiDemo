unit ATestEdit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxCalendar, cxDBEdit, cxDropDownEdit, cxBlobEdit, cxButtonEdit,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxTextEdit, Menus,
  cxGraphics;

type
  TGodownDetailEditForm = class(TAModelEditorForm)
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBComboBox2: TcxDBComboBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GodownDetailEditForm: TGodownDetailEditForm;

implementation

uses AData, APubUnit;
{$R *.dfm}

procedure TGodownDetailEditForm.FormShow(Sender: TObject);
begin
  inherited;
    cxDBComboBox1.Enabled := True;
    cxDBComboBox2.Enabled := True;
    cxDBTextEdit7.Enabled := True;
    cxDBTextEdit3.Enabled := True;
    cxDBMaskEdit1.Enabled := True;
    cxDBMaskEdit2.Enabled := True;
end;

Initialization
  RegisterClass(TGodownDetailEditForm);
finalization
  UnRegisterClass(TGodownDetailEditForm);
end.
                            