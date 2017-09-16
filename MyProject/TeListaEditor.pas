unit TeListaEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxMaskEdit, cxButtonEdit, cxDBEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus;

type
  TDhListaEditorForm = class(TAModelEditorForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBButtonEdit3: TcxDBButtonEdit;
    Label16: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    Label3: TLabel;
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxDBTextEdit8Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DhListaEditorForm: TDhListaEditorForm;
  MaxNum: Integer;

implementation

uses TSO, AData, APubUnit;

{$R *.dfm}


procedure TDhListaEditorForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin
     TempString:='SELECT  Depart_No, Depart_Name, Remark FROM  dbo.Pa_Depart where Use_Status=0';
     if TreeSelectData('Depart_No',TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Depart_No').AsString:=ADMSystem.QAPubData.FieldByName('Depart_No').AsString;
           EditData.DataSet.FieldByName('Depart_Name').AsString:=ADMSystem.QAPubData.FieldByName('Depart_Name').AsString;
           EditData.DataSet.FieldByName('Depart_No').ConstraintErrorMessage:='';

           CheckValue:=True;
        end;
     QAPubDataClose;
   End;
end;

procedure TDhListaEditorForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin

     TempString:='select distinct a.Mat_No,Mat_Name,StoNumber,Mat_Desc,Vendor from (select Mat_No,SUM(Sign_Int*Acc_Qty) as StoNumber from Te_Storea group by Mat_No) as a,dbo.Te_Storea where a.Mat_No=Te_Storea.Mat_No';
     if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Mat_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Mat_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Desc').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Desc').AsString;
           EditData.DataSet.FieldByName('Mat_Name').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Name').AsString;
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           MaxNum := StrToInt(ADMSystem.QAPubData.FieldByName('StoNumber').AsString);
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TDhListaEditorForm.cxDBButtonEdit5PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
if EditData.State in [dsInsert,dsEdit] then
   begin

     if SelectData('SELECT   Cust_Sim, Cust_Name FROM    dbo.Db_CustClass WHERE Cust_Sim<>''X''') then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Use_Cust').AsString:=ADMSystem.QAPubData.FieldByName('Cust_Sim').AsString;
           EditData.DataSet.FieldByName('Use_Cust').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     QAPubDataClose;
   end;
end;

procedure TDhListaEditorForm.FormShow(Sender: TObject);
begin
  inherited;
  // 錯誤的方法
  if EditData.State in [dsInsert] then
  begin
    TempString:='select count(*) as num from Te_Lista where List_No= ''%S''';
    QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('List_No').AsString]));
    EditData.DataSet.FieldByName('Item_No').AsString:=IntToStr(StrToInt(ADMSystem.QAPubData.FieldByName('num').AsString)+1);
  end;
end;

procedure TDhListaEditorForm.cxButton1Click(Sender: TObject);
begin
    if (cxDBButtonEdit3.Text = '') then
    begin
    ShowWarning('項次不能為空');
    cxDBButtonEdit3.SetFocus;
    end
//    else if(MaxNum=0) then
//    begin
//       TempString:='select distinct a.Mat_No,Mat_Name,StoNumber,Mat_Desc,Vendor from (select Mat_No,SUM(Sign_Int*Acc_Qty) as StoNumber from Te_Storea group by Mat_No) as a,dbo.Te_Storea where a.Mat_No=Te_Storea.Mat_No and a.Mat_No=''%S''';
//       QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Mat_No').AsString]));
//       if ADMSystem.QAPubData.RecordCount=1 then
//          begin
//             MaxNum := StrToInt(ADMSystem.QAPubData.FieldByName('StoNumber').AsString);
//          end
//       else
//         ShowWarning('該材料倉庫數量為0');
//       ADMSystem.QAPubData.Close;
//    end
//    else if (StrToInt(cxDBTextEdit8.Text)>MaxNum) then
//    begin
//       ShowWarning('庫存只有'+IntToStr(MaxNum));
//       EditData.DataSet.FieldByName('Req_Qty').AsString := '0';
//    end
    else
     inherited;
end;

procedure TDhListaEditorForm.cxDBTextEdit8Exit(Sender: TObject);
begin
  if (cxDBButtonEdit3.Text = '') then
    begin
    ShowWarning('項次不能為空');
    cxDBButtonEdit3.SetFocus;
    end
  else
  inherited;
end;

Initialization
  RegisterClass(TDhListaEditorForm);
finalization
  UnRegisterClass(TDhListaEditorForm);
  
end.
