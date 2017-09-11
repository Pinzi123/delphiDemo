unit DbMatVendorEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxDropDownEdit, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, Menus, cxGraphics;

type
  TDbMatVendorEditorForm = class(TAModelEditorForm)
    Label1: TLabel;
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
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBComboBox2: TcxDBComboBox;
    cxDBButtonEdit3: TcxDBButtonEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit3PropertiesEditValueChanged(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DbMatVendorEditorForm: TDbMatVendorEditorForm;

implementation

uses MatNumber, AData, APubUnit;

{$R *.dfm}

procedure TDbMatVendorEditorForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     if SelectData('SELECT  Vendor, Vnd_Sim, Chn_Name FROM   dbo.Bb_Vendor WHERE Dealing_Status=1') then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vnd_Sim').AsString:=ADMSystem.QAPubData.FieldByName('Vnd_Sim').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TDbMatVendorEditorForm.cxDBButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     TempString:='SELECT  Vendor, Vnd_Sim, Chn_Name FROM   dbo.Bb_Vendor WHERE  Dealing_Status=1 and Vendor=''%S''';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Vendor').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vnd_Sim').AsString:=ADMSystem.QAPubData.FieldByName('Vnd_Sim').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
        end
     else
       begin
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Vendor').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;

procedure TDbMatVendorEditorForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     if SelectData('SELECT  Unit_No, Chn_Unit, Eng_Unit  FROM  dbo.Da_Unit') then
        case AButtonIndex of
        0:EditData.DataSet.FieldByName('Vnd_Unit').AsString:=ADMSystem.QAPubData.FieldByName('Eng_Unit').AsString;
        1:EditData.DataSet.FieldByName('Vnd_Unit').AsString:=ADMSystem.QAPubData.FieldByName('Chn_Unit').AsString;
        end;
     QAPubDataClose;
   end;
end;

procedure TDbMatVendorEditorForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
    if Copy(EditData.DataSet.FieldByName('Mat_no').AsString,1,1)<>'T' then
     TempString:='SELECT  P_No, CP_No, CP_Name, CP_Type, CP_Unit, LP_Unit FROM  dbo.Ga_BasePart WHERE Use_Status=0 And  P_Type=''料件'''
       else
        TempString:='SELECT  P_No, CP_No, CP_Name, CP_Type, CP_Unit, LP_Unit FROM  dbo.Ga_BasePart WHERE Use_Status=0 And P_Type=''設備''';
      if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('P_No').AsString:=ADMSystem.QAPubData.FieldByName('P_No').AsString;
           EditData.DataSet.FieldByName('CP_No').AsString:=ADMSystem.QAPubData.FieldByName('CP_No').AsString;
           EditData.DataSet.FieldByName('CP_Name').AsString:=ADMSystem.QAPubData.FieldByName('CP_Name').AsString;
           EditData.DataSet.FieldByName('Wt_Unit').AsString:=ADMSystem.QAPubData.FieldByName('CP_Unit').AsString;
           EditData.DataSet.FieldByName('P_No').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TDbMatVendorEditorForm.cxDBButtonEdit3PropertiesEditValueChanged(
  Sender: TObject);
begin
if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
   if Copy(EditData.DataSet.FieldByName('Mat_no').AsString,1,1)<>'T' then
     TempString:='SELECT  P_No, CP_No, CP_Name, CP_Type, CP_Unit, LP_Unit FROM  dbo.Ga_BasePart WHERE Use_Status=0 And P_No=''%S'' AND P_Type=''料件'''
       else
         TempString:='SELECT  P_No, CP_No, CP_Name, CP_Type, CP_Unit, LP_Unit FROM  dbo.Ga_BasePart WHERE Use_Status=0 And P_No=''%S'' AND P_Type=''設備''';
     QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('P_No').AsString]));
     if ADMSystem.QAPubData.RecordCount=1 then
        begin
           EditData.DataSet.FieldByName('P_No').AsString:=ADMSystem.QAPubData.FieldByName('P_No').AsString;
           EditData.DataSet.FieldByName('CP_No').AsString:=ADMSystem.QAPubData.FieldByName('CP_No').AsString;
           EditData.DataSet.FieldByName('CP_Name').AsString:=ADMSystem.QAPubData.FieldByName('CP_Name').AsString;
           EditData.DataSet.FieldByName('Wt_Unit').AsString:=ADMSystem.QAPubData.FieldByName('CP_Unit').AsString;
           EditData.DataSet.FieldByName('P_No').ConstraintErrorMessage:='';
        end
     else
       begin
           EditData.DataSet.FieldByName('P_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('P_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
     ADMSystem.QAPubData.Close;
   end;
end;

procedure TDbMatVendorEditorForm.cxButton1Click(Sender: TObject);
begin
If EditData.State in [dsinsert,dsedit] Then
   If (EditData.DataSet.FieldByName('Vnd_Unit').AsString<>TempEditstr1)
       And (EditData.DataSet.FieldByName('Vnd_Unit').AsString<>TempEditStr2)Then
       Showmessage('提示:廠商單位與倉庫單位不一致!!');
  inherited;
end;

Initialization
  RegisterClass(TDbMatVendorEditorForm);
finalization
  UnRegisterClass(TDbMatVendorEditorForm);

end.
