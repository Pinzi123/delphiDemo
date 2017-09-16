unit DbMatNumberEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, DBCtrls, cxCheckBox, cxDBEdit, cxDropDownEdit, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxTextEdit, DBAccess,
  MSAccess, cxImage, Menus, cxGraphics;

type
  TDbMatNumberEditorForm = class(TAModelEditorForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBComboBox3: TcxDBComboBox;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBComboBox4: TcxDBComboBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBComboBox6: TcxDBComboBox;
    cxDBButtonEdit4: TcxDBButtonEdit;
    Label25: TLabel;
    Label26: TLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    cxDBCheckBox5: TcxDBCheckBox;
    cxDBImage1: TcxDBImage;
    cxDBCheckBox6: TcxDBCheckBox;
    Label1: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    SQLCopy: TMSSQL;
    cxDBTextEdit12: TcxDBTextEdit;
    lbl1: TLabel;
    Label12: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    Label16: TLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    Label17: TLabel;
    cxDBTextEdit17: TcxDBTextEdit;
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit4PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBCheckBox2PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DbMatNumberEditorForm: TDbMatNumberEditorForm;

implementation

uses MatNumber, AData, APubUnit;

{$R *.dfm}

procedure TDbMatNumberEditorForm.FormShow(Sender: TObject);
begin
  inherited;
cxCheckBox1.Visible:=(EditData.State=dsInsert);
cxDBCheckBox4.Enabled:=(not DetailRecorded);
if (EditData.State in [dsInsert,dsEdit]) then
         with cxDBComboBox3,ADMSystem.QAPubData do
           begin
             TempString:='SELECT  Acc_Desc FROM   dbo.Da_AccCode  WHERE  (Parent_No = ''1130'')';
             QAPubDataOpen(TempString);
             if ADMSystem.QAPubData.RecordCount>0 then
                begin
                  First;
                  while not Eof do
                    begin
                      Properties.Items.Add(FieldByName('Acc_Desc').AsString);
                      Next;
                    end;
                end;
             QAPubDataClose;
           end;
end;

procedure TDbMatNumberEditorForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     if SelectData('SELECT   *  FROM    dbo.Da_SizeType WHERE Use_Status=1') then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Size_Type').AsString:=ADMSystem.QAPubData.FieldByName('Size_Type').AsString;
           EditData.DataSet.FieldByName('Size_Type').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TDbMatNumberEditorForm.cxDBButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT  Size_Type  FROM    dbo.Da_SizeType WHERE Use_Status=1 AND Size_Type=''%S''';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Size_Type').AsString]));
     if (ADMSystem.QAPubData.RecordCount=1) then
        begin
           EditData.DataSet.FieldByName('Size_Type').AsString:=ADMSystem.QAPubData.FieldByName('Size_Type').AsString;
           EditData.DataSet.FieldByName('Size_Type').ConstraintErrorMessage:='';
        end
     else
       begin
           EditData.DataSet.FieldByName('Size_Type').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Size_Type').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;

procedure TDbMatNumberEditorForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     if SelectData('SELECT  Unit_No, Chn_Unit, Eng_Unit  FROM  dbo.Da_Unit') then
        begin
           EditData.DataSet.FieldByName('Chn_Unit').AsString:=ADMSystem.QAPubData.FieldByName('Chn_Unit').AsString;
           EditData.DataSet.FieldByName('Eng_Unit').AsString:=ADMSystem.QAPubData.FieldByName('Eng_Unit').AsString;
           EditData.DataSet.FieldByName('Patten_No').ConstraintErrorMessage:='';
        end;
     QAPubDataClose;
   end;
end;

procedure TDbMatNumberEditorForm.cxDBButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     if SelectData('SELECT  Mat_No, Mat_Eng, Chn_Unit,Patten  FROM  dbo.Db_MatNumber WHERE Mata_No=''B017''') then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Patten_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Patten').AsString:=ADMSystem.QAPubData.FieldByName('Patten').AsString;
           EditData.DataSet.FieldByName('Patten_No').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TDbMatNumberEditorForm.cxDBButtonEdit4PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT    Mat_No, Mat_Eng, Chn_Unit,Patten  FROM  dbo.Db_MatNumber WHERE Mat_No=''%S'' AND Mata_No=''B017''';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Patten_No').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('Patten_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Patten').AsString:=ADMSystem.QAPubData.FieldByName('Patten').AsString;
           EditData.DataSet.FieldByName('Patten_No').ConstraintErrorMessage:='';
        end
     else
       begin
           EditData.DataSet.FieldByName('Patten_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Patten_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;

procedure TDbMatNumberEditorForm.cxDBCheckBox2PropertiesChange(
  Sender: TObject);
begin
cxDBButtonEdit1.Enabled:=(Sender as TcxDBCheckBox).Checked;
if   cxDBButtonEdit1.Enabled=false then
EditData.DataSet.FieldByName('Size_Type').ConstraintErrorMessage:='';
end;

procedure TDbMatNumberEditorForm.cxButton1Click(Sender: TObject);
var MyTemp:string;
begin
IsCopy:=(EditData.State=dsInsert) and cxCheckBox1.Checked;
if EditData.State=dsInsert then
   begin
     QAPubDataOpen(Format('SELECT  COALESCE (MAX(RIGHT(Mat_No,4))+1, 1) AS AutoNo  FROM  dbo.Db_MatNumber WHERE  (Mata_No = ''%S'')',[EditData.DataSet.FieldByName('Mata_No').AsString]));
     EditData.DataSet.FieldByName('Mat_No').AsString:=EditData.DataSet.FieldByName('Mata_No').AsString+FormatFloat('0000',ADMSystem.QAPubData.FieldByName('AutoNo').AsInteger);
     QAPubDataClose;
     MyTemp:=EditData.DataSet.FieldByName('Mat_No').AsString;
   end;
inherited;
if IsCopy then
   begin
     IsCopy:=False;
     SQLCopy.ParamByName('P0').AsString:=MyTemp;
     SQLCopy.ParamByName('P1').AsString:=TempEditStr;
     SQLCopy.ParamByName('P2').AsString:=MyTemp;
     SQLCopy.ParamByName('P3').AsString:=TempEditStr;
     SQLCopy.ParamByName('Create_Name').AsString:=UserName;
     SQLCopy.ParamByName('Create_Date').Value:=Date;
     SQLCopy.Execute;
   end;
end;

Initialization
  RegisterClass(TDbMatNumberEditorForm);
finalization
  UnRegisterClass(TDbMatNumberEditorForm);

end.
