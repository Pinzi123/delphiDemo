unit TTeInputaEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AModelEditor, cxLookAndFeelPainters, DB, StdCtrls, cxButtons,
  ExtCtrls, cxRadioGroup, cxDBEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxBlobEdit, Menus, cxGraphics, cxGroupBox;

type
  TTeInputaEditorForm = class(TAModelEditorForm)
    Label1: TLabel;
    Label10: TLabel;
    cxDBButtonEdit3: TcxDBButtonEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label18: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    Label17: TLabel;
    Label23: TLabel;
    cxDBTextEdit15: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label19: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label5: TLabel;
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBTextEdit10PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBButtonEdit3PropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TeInputaEditorForm: TTeInputaEditorForm;
  PurStr: string;
  ListStr: string;
  ItemNo: string;

implementation

uses  AData, APubUnit;

{$R *.dfm}

procedure TTeInputaEditorForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin

if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     if(PurStr <> '')  then
     begin
       TempString:='SELECT Item_No,Mat_No,Vendor,Price,Mat_Desc,Mat_Name,Req_Pur_Qty FROM Te_Purchasea WHERE Pur_No='''+PurStr+''''
       + 'and (Item_No not in (select Item_No from dbo.Te_Storea where Pur_No='''+PurStr+''')' + 'or Item_No='''+ItemNo+''')';
       if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Item_No').AsString:=ADMSystem.QAPubData.FieldByName('Item_No').AsString;
           EditData.DataSet.FieldByName('Item_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Mat_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Price').AsString:=ADMSystem.QAPubData.FieldByName('Price').AsString;
           EditData.DataSet.FieldByName('Price').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Name').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Name').AsString;
           EditData.DataSet.FieldByName('Mat_Name').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Desc').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Desc').AsString;
           EditData.DataSet.FieldByName('Mat_Desc').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     end
     else
     begin
       TempString:='SELECT Item_No,Mat_No,Mat_Desc,Mat_Name,Vendor,Req_Qty FROM Te_Lista WHERE List_No='''+ListStr+''''
        + 'and (Item_No not in (select Item_No from dbo.Te_Storea where List_No='''+ListStr+''')' + 'or Item_No='''+ItemNo+''')';
        if SelectData(TempString) then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Item_No').AsString:=ADMSystem.QAPubData.FieldByName('Item_No').AsString;
           EditData.DataSet.FieldByName('Item_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Mat_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Price').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Name').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Name').AsString;
           EditData.DataSet.FieldByName('Mat_Name').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Desc').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Desc').AsString;
           EditData.DataSet.FieldByName('Mat_Desc').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
           CheckValue:=True;
        end;
     end;
     QAPubDataClose;
   end;

end;


procedure TTeInputaEditorForm.cxDBTextEdit10PropertiesEditValueChanged(
  Sender: TObject);
begin
  if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
  begin
    ItemNo := EditData.DataSet.FieldByName('Item_No').AsString;
    if (ItemNo = '') then
       ShowWarning('請選擇項次')
    else if(PurStr <> '') then
     begin
       TempString:='SELECT  Pur_No, Item_No,Req_Pur_Qty FROM dbo.Te_Purchasea WHERE Pur_No=''%S'' AND Item_No=''%S'' ';
       QAPubDataOpen(Format(TempString,[PurStr,ItemNo]));
       if  (strtofloat(EditData.DataSet.FieldByName('Acc_Qty').AsString) > strtofloat(ADMSystem.QAPubData.FieldByName('Req_Pur_Qty').AsString)) then
          begin
<<<<<<< HEAD
            EditData.DataSet.FieldByName('Acc_Qty').AsString := '0';
=======
            EditData.DataSet.FieldByName('Acc_Qty').AsString = '0';
>>>>>>> 5a02f35f7a1e84a3242aa79d4630d6ffb1184a15
            EditData.DataSet.FieldByName('Acc_Qty').ConstraintErrorMessage:='';
            ShowWarning('輸入的數值過大');
            (Sender as TcxDBTextEdit).SetFocus;
         end;
       ADMSystem.QAPubData.Close;
     end
//     else if(ListStr <> '') then
//     begin
//       TempString:='SELECT  Req_Qty FROM dbo.Te_Lista WHERE List_No=''%S'' AND Item_No=''%S'' ';
//       QAPubDataOpen(Format(TempString,[ListStr,ItemNo]));
//       if  (strtofloat(EditData.DataSet.FieldByName('Acc_Qty').AsString) > strtofloat(ADMSystem.QAPubData.FieldByName('Req_Qty').AsString)) then
//          begin
//            EditData.DataSet.FieldByName('Acc_Qty').ConstraintErrorMessage:='';
//            ShowWarning('輸入的數值過大');
//            (Sender as TcxDBTextEdit).SetFocus;
//         end;
//       ADMSystem.QAPubData.Close;
//     end;
  end;
end;


procedure TTeInputaEditorForm.cxDBButtonEdit3PropertiesEditValueChanged(
  Sender: TObject);
begin

if CheckValue and (EditData.State in [dsInsert,dsEdit]) then
   begin
     if(PurStr <> '')  then
     begin
       TempString:='SELECT Item_No,Mat_No,Vendor,Price,Mat_Desc,Mat_Name,Req_Pur_Qty FROM Te_Purchasea WHERE Pur_No='''+PurStr+''''
                    + 'and Item_No = ''%S''';
       QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Item_No').AsString]));
       if  ADMSystem.QAPubData.RecordCount=1  then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Item_No').AsString:=ADMSystem.QAPubData.FieldByName('Item_No').AsString;
           EditData.DataSet.FieldByName('Item_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Mat_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Price').AsString:=ADMSystem.QAPubData.FieldByName('Price').AsString;
           EditData.DataSet.FieldByName('Price').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Name').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Name').AsString;
           EditData.DataSet.FieldByName('Mat_Name').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Desc').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Desc').AsString;
           EditData.DataSet.FieldByName('Mat_Desc').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
           CheckValue:=True;
        end
       else
       begin
          EditData.DataSet.FieldByName('Item_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Item_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
       ADMSystem.QAPubData.Close;
     end
     else
     begin
       TempString:='SELECT Item_No,Mat_No,Mat_Desc,Mat_Name,Vendor FROM Te_Lista WHERE List_No='''+ListStr+''''
                    + 'and Item_No = ''%S''';
        QAPubDataOpen(Format(TempString,[EditData.DataSet.FieldByName('Item_No').AsString]));
        if ADMSystem.QAPubData.RecordCount=1 then
        begin
           CheckValue:=False;
           EditData.DataSet.FieldByName('Item_No').AsString:=ADMSystem.QAPubData.FieldByName('Item_No').AsString;
           EditData.DataSet.FieldByName('Item_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_No').AsString:=ADMSystem.QAPubData.FieldByName('Mat_No').AsString;
           EditData.DataSet.FieldByName('Mat_No').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Price').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Name').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Name').AsString;
           EditData.DataSet.FieldByName('Mat_Name').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Mat_Desc').AsString:=ADMSystem.QAPubData.FieldByName('Mat_Desc').AsString;
           EditData.DataSet.FieldByName('Mat_Desc').ConstraintErrorMessage:='';
           EditData.DataSet.FieldByName('Vendor').AsString:=ADMSystem.QAPubData.FieldByName('Vendor').AsString;
           EditData.DataSet.FieldByName('Vendor').ConstraintErrorMessage:='';
           CheckValue:=True;
        end
       else
       begin
          EditData.DataSet.FieldByName('Item_No').ConstraintErrorMessage:=EditData.DataSet.FieldByName('Item_No').DisplayLabel+';';
          ShowWarning('輸入有誤,請重新輸入!!!');
          (Sender as TcxDBButtonEdit).SetFocus;
       end;
       ADMSystem.QAPubData.Close;
     end;
   end;
end;

procedure TTeInputaEditorForm.FormShow(Sender: TObject);
begin
  inherited;
  PurStr := EditData.DataSet.FieldByName('Pur_No').AsString;
  ListStr := EditData.DataSet.FieldByName('List_No').AsString;
  ItemNo := EditData.DataSet.FieldByName('Item_No').AsString;
end;

procedure TTeInputaEditorForm.cxButton1Click(Sender: TObject);
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
  RegisterClass(TTeInputaEditorForm);
finalization
  UnRegisterClass(TTeInputaEditorForm);
end.
