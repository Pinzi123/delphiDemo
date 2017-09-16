unit APubSetupPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, ExtCtrls,
  cxLookAndFeelPainters, cxButtons, DB, MemDS, DBAccess, MSAccess, Menus;

type
  TAPubSetupPassForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    QAfUser: TMSQuery;
    QAfUserUser_Id: TStringField;
    QAfUserUpd_Date: TDateTimeField;
    Bevel1: TBevel;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit1: TcxTextEdit;
    QAfUserUser_Pass: TMemoField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxTextEdit2PropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  APubSetupPassForm: TAPubSetupPassForm;

implementation

uses AData, APubUnit;

{$R *.dfm}

procedure TAPubSetupPassForm.FormShow(Sender: TObject);
begin
QAfUser.FilterSQL:='User_Id='''+UserId+'''';
QAfUser.Open;
if Length(QAfUserUser_Pass.AsString)=0 then
  begin
   cxTextEdit1.Enabled:=False;
   cxTextEdit2.SetFocus;
  end;
end;

procedure TAPubSetupPassForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
QAfUser.Close;
Action:=caFree;
end;

procedure TAPubSetupPassForm.cxTextEdit2PropertiesChange(Sender: TObject);
begin
if Length(cxTextEdit2.Text)>0 then
     cxTextEdit3.Enabled:=True
   else
     cxTextEdit3.Enabled:=False;
end;

procedure TAPubSetupPassForm.cxButton1Click(Sender: TObject);
begin
//Application.MessageBox('新密碼不能與上次密碼相同,修改密碼失敗!!!','警告',MB_OK+MB_ICONWARNING);
if cxTextEdit1.Text<>Decrypt(QAfUserUser_Pass.AsString,PassKey) then
  begin
    Application.MessageBox('舊密碼錯誤!!!','警告',MB_OK+MB_ICONWARNING);
    cxTextEdit1.SetFocus;
  end
  else
  if cxTextEdit2.Text<>cxTextEdit3.Text then
    begin
      Application.MessageBox('確認密碼與新密碼不一致!!!','警告',MB_OK+MB_ICONWARNING);
      cxTextEdit3.SetFocus;
    end
    else
  if Length(cxTextEdit2.Text)<6 then
    begin
      Application.MessageBox('密碼小于六位數!!!','警告',MB_OK+MB_ICONWARNING);
      cxTextEdit2.SetFocus;
    end
    else
    begin
      QAfUser.Edit;
      QAfUserUser_Pass.Value:=EnCrypt(cxTextEdit2.Text,PassKey);
      QAfUserUpd_Date.AsString:=GetDateTime;
      QAfUser.Post;
      ModalResult:=mrOk;
    end; 
end;

end.
