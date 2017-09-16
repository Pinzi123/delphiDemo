unit APubRichMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, StdCtrls, ComCtrls, DBCtrls, DB, Menus,
  cxSpinEdit, cxSpinButton, cxMaskEdit, cxFontNameComboBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxColorComboBox,
  ToolWin, ExtCtrls, fcStatusBar,  RxRichEd, DBRichEd;

type
  TAPubRichMemoForm = class(TForm)
    fcStatusBar1: TfcStatusBar;
    ControlBar: TControlBar;
    SetUpToolBar: TToolBar;
    cxColorComboBox: TcxColorComboBox;
    ToolButton2: TToolButton;
    fcbFontName: TcxFontNameComboBox;
    ToolButton1: TToolButton;
    meFontSize: TcxMaskEdit;
    cxSpinButton: TcxSpinButton;
    StandardToolBar: TToolBar;
    OpenButton: TToolButton;
    ToolButton4: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    OpenDialog: TOpenDialog;
    ActionList: TActionList;
    actEditCut: TAction;
    actEditCopy: TAction;
    actEditPaste: TAction;
    actEditFont: TAction;
    actOpen: TAction;
    actPrint: TAction;
    actSaveFile: TAction;
    actBold: TAction;
    actItalic: TAction;
    actUnderline: TAction;
    actAlignLeft: TAction;
    actAlignRight: TAction;
    actAlignCenter: TAction;
    actBullets: TAction;
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miFileOpen: TMenuItem;
    miFileSaveAs: TMenuItem;
    N1: TMenuItem;
    miFilePrint: TMenuItem;
    N4: TMenuItem;
    miFileExit: TMenuItem;
    miEdit: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    N5: TMenuItem;
    miEditFont: TMenuItem;
    actExit: TAction;
    FontDialog: TFontDialog;
    DRichMemo: TDataSource;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    C2: TMenuItem;
    P1: TMenuItem;
    N2: TMenuItem;
    F1: TMenuItem;
    cxRichMemo: TRxDBRichEdit;
    procedure FormShow(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveFileExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actEditCutExecute(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure actEditPasteExecute(Sender: TObject);
    procedure actEditFontExecute(Sender: TObject);
    procedure actBoldExecute(Sender: TObject);
    procedure actItalicExecute(Sender: TObject);
    procedure actUnderlineExecute(Sender: TObject);
    procedure actAlignLeftExecute(Sender: TObject);
    procedure actAlignRightExecute(Sender: TObject);
    procedure actAlignCenterExecute(Sender: TObject);
    procedure actBulletsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxColorComboBoxPropertiesChange(Sender: TObject);
    procedure fcbFontNamePropertiesChange(Sender: TObject);
    procedure fcbFontNamePropertiesInitPopup(Sender: TObject);
    procedure meFontSizePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FFileName: string;
    FUpdating: Boolean;
    function CurrText:TTextAttributes;
    procedure SelectionChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  APubRichMemoForm: TAPubRichMemoForm;

implementation

resourcestring
  sOverWrite = 'ÂÐ»\¤å¥ó %s';

{$R *.dfm}


procedure TAPubRichMemoForm.SelectionChange(Sender: TObject);
begin
  with cxRichMemo.Paragraph do
  try
    FUpdating := True;
    BoldButton.Down := fsBold in CurrText.Style;
    ItalicButton.Down := fsItalic in CurrText.Style;
    UnderlineButton.Down := fsUnderline in CurrText.Style;
    BulletsButton.Down := Boolean(Numbering);
//    meFontSize.Text := IntToStr(CurrText.Size);
//    fcbFontName.EditValue := CurrText.Name;
//    cxColorComboBox.EditValue := CurrText.Color;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
  finally
    FUpdating := False;
  end;
end;


function TAPubRichMemoForm.CurrText:TTextAttributes;
begin
  if cxRichMemo <> nil then
//    Result := cxRichMemo.SelAttributes
  else
    Result := nil;
end;

procedure TAPubRichMemoForm.FormCreate(Sender: TObject);
begin
cxRichMemo.OnSelectionChange:=SelectionChange;
end;

procedure TAPubRichMemoForm.FormShow(Sender: TObject);
begin
//
end;

procedure TAPubRichMemoForm.actOpenExecute(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    cxRichMemo.Lines.LoadFromFile(OpenDialog.FileName);
    cxRichMemo.SetFocus;
  end;
end;

procedure TAPubRichMemoForm.actPrintExecute(Sender: TObject);
begin
  if PrintDialog.Execute then
    cxRichMemo.Print(FFileName);
end;

procedure TAPubRichMemoForm.actSaveFileExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]),mtConfirmation, mbYesNoCancel, 0) <> idYes then
         Exit;
    cxRichMemo.Lines.SaveToFile(SaveDialog.FileName);
  end;
end;

procedure TAPubRichMemoForm.actExitExecute(Sender: TObject);
begin
Close;
end;

procedure TAPubRichMemoForm.actEditCutExecute(Sender: TObject);
begin
cxRichMemo.CutToClipboard;
end;

procedure TAPubRichMemoForm.actEditCopyExecute(Sender: TObject);
begin
cxRichMemo.CopyToClipboard;
end;

procedure TAPubRichMemoForm.actEditPasteExecute(Sender: TObject);
begin
cxRichMemo.PasteFromClipboard;
end;

procedure TAPubRichMemoForm.actEditFontExecute(Sender: TObject);
begin
  FontDialog.Font.Assign(cxRichMemo.SelAttributes);
  if FontDialog.Execute then
    CurrText.Assign(FontDialog.Font);
  SelectionChange(Self);
  cxRichMemo.SetFocus;
end;

procedure TAPubRichMemoForm.actBoldExecute(Sender: TObject);
begin
  if FUpdating or (CurrText = nil) then Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TAPubRichMemoForm.actItalicExecute(Sender: TObject);
begin
  if FUpdating or (CurrText = nil) then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TAPubRichMemoForm.actUnderlineExecute(Sender: TObject);
begin
  if FUpdating or (CurrText = nil) then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TAPubRichMemoForm.actAlignLeftExecute(Sender: TObject);
begin
  if FUpdating or (cxRichMemo = nil) then Exit;
  cxRichMemo.Paragraph.Alignment := TParaAlignment(TControl(Sender).Tag);
end;

procedure TAPubRichMemoForm.actAlignRightExecute(Sender: TObject);
begin
  if FUpdating or (cxRichMemo = nil) then Exit;
  cxRichMemo.Paragraph.Alignment := TParaAlignment(TControl(Sender).Tag);
end;

procedure TAPubRichMemoForm.actAlignCenterExecute(Sender: TObject);
begin
  if FUpdating or (cxRichMemo = nil) then Exit;
  cxRichMemo.Paragraph.Alignment := TParaAlignment(TControl(Sender).Tag);
end;

procedure TAPubRichMemoForm.actBulletsExecute(Sender: TObject);
begin
  if FUpdating or (cxRichMemo = nil) then Exit;
  cxRichMemo.Paragraph.Numbering := TRxNumbering(BulletsButton.Down);
end;

procedure TAPubRichMemoForm.cxColorComboBoxPropertiesChange(
  Sender: TObject);
begin
  if FUpdating then Exit;
  if cxColorComboBox.ItemIndex <> -1 then
    CurrText.Color := cxColorComboBox.EditValue;
end;

procedure TAPubRichMemoForm.fcbFontNamePropertiesChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := TcxFontNameComboBox(Sender).Text;
end;

procedure TAPubRichMemoForm.fcbFontNamePropertiesInitPopup(
  Sender: TObject);
begin
  fcbFontName.Properties.FontPreview.FontStyle := CurrText.Style;
end;

procedure TAPubRichMemoForm.meFontSizePropertiesChange(Sender: TObject);
begin
  if FUpdating then Exit;
  if meFontSize.EditText <> '' then
    CurrText.Size := StrToInt(meFontSize.EditText)
  else
    CurrText.Size := 0;
end;

procedure TAPubRichMemoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
meFontSize.SetFocus;
end;

end.
