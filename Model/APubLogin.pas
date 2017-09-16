unit APubLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPropertiesStore, StdCtrls, Buttons, cxLabel, cxControls,
  cxContainer, cxEdit,  ExtCtrls, cxTextEdit;

type
  TAPubLoginForm = class(TForm)
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Image1: TImage;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LoginStore: TcxPropertiesStore;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  APubLoginForm: TAPubLoginForm;

implementation

uses AData, APubUnit,APubSetupPass;

{$R *.dfm}

procedure TAPubLoginForm.FormShow(Sender: TObject);
begin
try
QAPubDataOpen('SELECT  Item_No,Exe_update,Title FROM dbo.Aa_Exeupdate WHERE (Exe_Name = '''+FileName+''')');
FileItem:=ADMSystem.QAPubData.FieldByName('Item_No').Value;
if (ADMSystem.QAPubData.FieldByName('Exe_update').AsString='') or (GetFileDateTime(UpperCase(Application.ExeName))<ADMSystem.QAPubData.FieldByName('Exe_update').AsDateTime) then
 begin
  ShowWarning('�����ɤ����̷s,���i��S�s�uM�L����],�гs�u�����L�Z,���s�n�J!');
  Application.Terminate;
 end
  else
   Application.Title:=ADMSystem.QAPubData.FieldByName('Title').AsString;
ADMSystem.QAPubData.Close;
except
Application.Terminate;
end;
Caption:=Application.Title+'�n�J ����:'+DateTimeToStr(GetFileDateTime(UpperCase(Application.ExeName)));
LoginStore.StorageName:=GetIniDirectory('Login');
LoginStore.RestoreFrom;
ADMSystem.QAfUser.Open; 
end;

procedure TAPubLoginForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
LoginStore.StoreTo;
Action:=caFree;
end;

procedure TAPubLoginForm.cxTextEdit1Exit(Sender: TObject);
begin
UserId:='';
if ADMSystem.QAfUser.Locate('User_Id',Trim(cxTextEdit1.Text),[]) then
   UserId:=Trim(ADMSystem.QAfUserUser_Id.Value);
if Length(Trim(UserId))>0 then
   cxLabel1.Caption:=ADMSystem.QAfUserUser_Name.Value
   else
   cxLabel1.Caption:='';
end;

procedure TAPubLoginForm.BitBtn1Click(Sender: TObject);
begin
//ShowMessage('�z�K�X���Ĵ��ٳ�3��,�Фήɧ��K�X!!!');
//ShowMessage('�z�w�W�L90�ѥ��ק�K�X,���w����,�лP�޲z���p�t!!!');
try
TempString:='select datediff(mi,''%s'',getdate()) as Date_Qty ';
QAPubDataOpen(Format(TempString,[FormatDateTime('yyyy/mm/dd HH:mm:ss',Now)]));
if Abs(ADMSystem.QAPubData.FieldByName('Date_Qty').Value)>15 then
 begin
  ShowWarning('�A�Ⱦ�����M�����������,�ۮt '+ADMSystem.QAPubData.FieldByName('Date_Qty').AsString+' ����,�Ч�!!!');
  ADMSystem.QAPubData.Close;
  ModalResult:=mrNone;
  Exit;
 end;
ADMSystem.QAPubData.Close;
except
Application.Terminate;
end;

BitBtn1.SetFocus;
if Length(Trim(UserId))=0 then
  begin
     Application.MessageBox('�Τ�W���~!!!',Pchar(Application.Title),MB_OK+MB_ICONWARNING);
     cxTextEdit1.SetFocus;
     ModalResult:=mrNone;
  end
  else
  if cxTextEdit2.Text<>Decrypt(ADMSystem.QAfUserUser_Pass.AsString,PassKey) then
    begin
      Application.MessageBox('�K�X���~!!!',Pchar(Application.Title),MB_OK+MB_ICONWARNING);
      cxTextEdit2.SetFocus;
      ModalResult:=mrNone;
    end
    else
    begin
      IF Length(cxTextEdit2.Text)<6 THEN
        begin
          ShowMessage('�K�X�p�_����,���F�w��,�Цb"�t�κ޲z"[�Τ�K�X�]�w],���s�]�w�K�X!');
          APubSetupPassForm:=TAPubSetupPassForm.Create(Application);
          if APubSetupPassForm.ShowModal<>mrok then
             Application.Terminate;
        end;
       //ADMSystem.QAfUser.Edit;
       //ADMSystem.QAfUserExe_update.Value:=GetFileDateTime(UpperCase(Application.ExeName));
       //ADMSystem.QAfUser.Post;
       RolesId:=ADMSystem.QAfUserRoles.Value;
       Special:=ADMSystem.QAfUserSpecial.Value;
       LoginId:=ADMSystem.QAfUserLogin_Id.Value;
       UserName:=ADMSystem.QAfUserUser_Name.Value;
      // UserParentNo:=ADMSystem.QAfUserParentNo.Value;
       ADMSystem.QAfUser.Close;
       ADMSystem.ADMConnection.Disconnect;
       ADMSystem.ADMConnection.Username:=LoginId;
       ADMSystem.ADMConnection.Connect;
       ADMSystem.Qdel_log.Open;
       ADMSystem.QAup_log.Open;
    end;
end;

procedure TAPubLoginForm.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
SelectNext(ActiveControl,True,True);
end;

procedure TAPubLoginForm.cxTextEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
BitBtn1.Click;
end;

end.
