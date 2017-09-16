unit APubSetDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, DateUtils,cxEdit, cxLabel, cxControls, cxGroupBox,
  StdCtrls, cxButtons, cxGraphics, Menus;

type
  TAPubSetDateForm = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    cxLabel2: TcxLabel;
    cxComboBox2: TcxComboBox;
    cxLabel3: TcxLabel;
    cxComboBox3: TcxComboBox;
    cxLabel4: TcxLabel;
    cxComboBox4: TcxComboBox;
    cxLabel5: TcxLabel;
    cxComboBox5: TcxComboBox;
    cxLabel6: TcxLabel;
    cxComboBox6: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxComboBox2PropertiesEditValueChanged(Sender: TObject);
    procedure cxComboBox5PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FDateIndex:integer;
  public
    { Public declarations }
    property  DateIndex:integer read FDateIndex write FDateIndex;
  end;

var
  APubSetDateForm: TAPubSetDateForm;

implementation

uses APubUnit, AData;

{$R *.dfm}

procedure TAPubSetDateForm.FormCreate(Sender: TObject);
begin
{
cxComboBox1.Text:=FormatDateTime('yyyy',Date);
cxComboBox2.Text:=FormatDateTime('m',Date);
cxComboBox3.Text:=FormatDateTime('d',Date);
cxComboBox4.Text:=FormatDateTime('yyyy',Date);
cxComboBox5.Text:=FormatDateTime('m',Date);
cxComboBox6.Text:=FormatDateTime('d',Date);
StartDate[1]:=cxComboBox1.Text;
StartDate[2]:=cxComboBox2.Text;
StartDate[3]:=cxComboBox3.Text;
EndDate[1]:=cxComboBox4.Text;
EndDate[2]:=cxComboBox5.Text;
EndDate[3]:=cxComboBox6.Text;   }

if EditIsColor then
   Panel1.Color:=ADMSystem.cxStyleBackGround.Color;
end;

procedure TAPubSetDateForm.FormShow(Sender: TObject);
 var VYear,i:Word;
begin
VYear:=YearOf(Date);
cxComboBox1.Properties.Items.Clear;
cxComboBox4.Properties.Items.Clear;
for i := VYear-5 to VYear+5 do
 begin
  cxComboBox1.Properties.Items.Add(IntToStr(i));
  cxComboBox4.Properties.Items.Add(IntToStr(i));
 end;
cxComboBox1.Text:=StartDate[1];
cxComboBox2.Text:=StartDate[2];
cxComboBox3.Text:=StartDate[3];
cxComboBox4.Text:=EndDate[1];
cxComboBox5.Text:=EndDate[2];
cxComboBox6.Text:=EndDate[3];
cxLabel3.Visible:=(DateIndex and 1)>0;
cxComboBox3.Visible:=cxLabel3.Visible;
cxLabel6.Visible:=cxLabel3.Visible;
cxComboBox6.Visible:=cxLabel3.Visible;
cxGroupBox2.Visible:=(DateIndex and 2)>0;
cxComboBox3.Enabled:=True;
cxComboBox6.Enabled:=True;
if (DateIndex and 4)>0 then
  begin
    cxComboBox3.Text:='1';
    cxComboBox6.Text:='1';
    cxComboBox3.Enabled:=False;
    cxComboBox6.Enabled:=False;
  end;
if cxGroupBox2.Visible then
  begin
    cxButton1.Top:=130;
    cxButton2.Top:=130;
    Height:=200;
  end
else
  begin
    cxButton1.Top:=80;
    cxButton2.Top:=80;
    Height:=150;
  end;
if  cxLabel3.Visible then
   begin
     Width:=350;
     cxGroupBox1.Width:=305;
     cxGroupBox2.Width:=305;
     cxButton1.Left:=80;
     cxButton2.Left:=200;
   end
else
   begin
     cxButton2.Left:=140;
     cxButton1.Left:=40;
     cxGroupBox1.Width:=220;
     cxGroupBox2.Width:=220;
     Width:=260;
   end;

end;

procedure TAPubSetDateForm.cxButton1Click(Sender: TObject);
begin
try
  if Pos('/',DateTimeToStr(Date))>0 then
    begin
      StrToDateTime(StartDate[1]+'/'+StartDate[2]+'/'+StartDate[3]);
      StrToDateTime(EndDate[1]+'/'+EndDate[2]+'/'+EndDate[3]);
    end
  else
    begin
      StrToDateTime(StartDate[1]+'-'+StartDate[2]+'-'+StartDate[3]);
      StrToDateTime(EndDate[1]+'-'+EndDate[2]+'-'+EndDate[3]);
    end;
   StartDate[1]:=cxComboBox1.Text;
   StartDate[2]:=cxComboBox2.Text;
   StartDate[3]:=cxComboBox3.Text;
   EndDate[1]:=cxComboBox4.Text;
   EndDate[2]:=cxComboBox5.Text;
   EndDate[3]:=cxComboBox6.Text;
   except
   ShowWarning('�����J���~!!!');
   ModalResult:=mrNone;
end;
end;

procedure TAPubSetDateForm.cxComboBox2PropertiesEditValueChanged(
  Sender: TObject);
begin
if  ((cxComboBox2.Text='2') or (cxComboBox2.Text='4') or (cxComboBox2.Text='6') or (cxComboBox2.Text='9') or (cxComboBox2.Text='11')) and (cxComboBox3.Visible) then
begin
if cxComboBox3.Properties.Items.Count>30 then
 cxComboBox3.Properties.Items.Delete(30);
end
 else
  begin
   if cxComboBox3.Properties.Items.Count<31 then
    cxComboBox3.Properties.Items.Append('31');
  end;
end;

procedure TAPubSetDateForm.cxComboBox5PropertiesEditValueChanged(
  Sender: TObject);
begin
if  ((cxComboBox5.Text='2') or (cxComboBox5.Text='4') or (cxComboBox5.Text='6') or (cxComboBox5.Text='9') or (cxComboBox5.Text='11')) and (cxComboBox6.Visible) then
begin
if cxComboBox6.Properties.Items.Count>30 then
 cxComboBox6.Properties.Items.Delete(30);
end
 else
  begin
   if cxComboBox6.Properties.Items.Count<31 then
    cxComboBox6.Properties.Items.Append('31');
  end;
end;

end.
