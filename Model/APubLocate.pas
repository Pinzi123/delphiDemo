unit APubLocate;

interface

uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DB, cxPropertiesStore,ComCtrls,  MemDS, DBTables,
  cxLookAndFeelPainters, cxRadioGroup, cxCheckBox, cxButtons, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxGroupBox;

type
  
  TAPubLocateForm = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxComboBox2: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cxCheckBox2: TcxCheckBox;
    Label2: TLabel;
    LocateStore: TcxPropertiesStore;
    DPubLocate: TDataSource;
    cxCheckBox1: TcxCheckBox;
    OldDataSource: TDataSource;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxTextEdit1: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FActiveField:string;
    function FindMatch(FromBeginning: boolean): boolean;
  public
    { Public declarations }
    property ActiveField:string read FActiveField write FActiveField;
  end;


var
  APubLocateForm: TAPubLocateForm;

implementation

uses AData, APubUnit, APubLocateUnit;


{$R *.dfm}

procedure TAPubLocateForm.FormCreate(Sender: TObject);
begin
LocateStore.StorageName:=GetIniDirectory('LocateStore');
LocateStore.RestoreFrom;
end;

procedure TAPubLocateForm.FormShow(Sender: TObject);
begin
if EditIsColor then
   Panel1.Color:=ADMSystem.cxStyleBackGround.Color;
cxTextEdit1.SetFocus;
end;

procedure TAPubLocateForm.FormDestroy(Sender: TObject);
begin
LocateStore.StoreTo;
end;

function TAPubLocateForm.FindMatch(FromBeginning: boolean): boolean;
var
   MatchType: TwwLocateMatchType;
   curFieldName: string;
begin
   result:= false;
   if cxRadioButton1.Checked then
      MatchType:= mtExactmatch
   else if cxRadioButton2.Checked then
      MatchType:= mtPartialMatchStart
   else MatchType:= mtPartialMatchAny;

   curFieldName:=ActiveField;
   if curFieldName='' then exit;
   result:= wwFindMatch(FromBeginning,DPubLocate.DataSet, curFieldName,
	cxTextEdit1.Text, matchType, cxCheckBox2.State<> cbsUnchecked,
        False);
end;

procedure TAPubLocateForm.cxButton1Click(Sender: TObject);
begin
if not FindMatch(True) then
   ShowWarning('�藍�_,�䤣��!');
end;

procedure TAPubLocateForm.cxButton2Click(Sender: TObject);
begin
if not FindMatch(False) then
   ShowWarning('�藍�_,�䤣��!');
end;

procedure TAPubLocateForm.cxComboBox2PropertiesChange(Sender: TObject);
var i:integer;
begin
for i:=0 to DPubLocate.DataSet.FieldCount-1 do
   if DPubLocate.DataSet.Fields[i].DisplayLabel=cxComboBox2.Text then
      begin
        ActiveField:=DPubLocate.DataSet.Fields[i].FieldName;
        Break;
      end;
end;

procedure TAPubLocateForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
if cxCheckBox1.Checked then
   DPubLocate.DataSet.Locate(ActiveField,cxTextEdit1.Text,[loCaseInsensitive,loPartialKey]);
end;

end.
