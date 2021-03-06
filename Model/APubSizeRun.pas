unit APubSizeRun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxTextEdit, cxDBEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxDBLabel, DB, MemDS, DBAccess, MSAccess;

type
  TAPubSizeRunFrame = class(TFrame)
    cxDBLabel1: TcxDBLabel;
    cxDBEdit1: TcxDBTextEdit;
    cxDBLabel2: TcxDBLabel;
    cxDBEdit2: TcxDBTextEdit;
    cxDBLabel3: TcxDBLabel;
    cxDBEdit3: TcxDBTextEdit;
    cxDBLabel4: TcxDBLabel;
    cxDBEdit4: TcxDBTextEdit;
    cxDBLabel5: TcxDBLabel;
    cxDBEdit5: TcxDBTextEdit;
    cxDBLabel6: TcxDBLabel;
    cxDBEdit6: TcxDBTextEdit;
    cxDBLabel7: TcxDBLabel;
    cxDBEdit7: TcxDBTextEdit;
    cxDBLabel8: TcxDBLabel;
    cxDBEdit8: TcxDBTextEdit;
    cxDBLabel9: TcxDBLabel;
    cxDBEdit9: TcxDBTextEdit;
    cxDBLabel10: TcxDBLabel;
    cxDBEdit10: TcxDBTextEdit;
    cxDBLabel11: TcxDBLabel;
    cxDBEdit11: TcxDBTextEdit;
    cxDBLabel12: TcxDBLabel;
    cxDBEdit12: TcxDBTextEdit;
    cxDBLabel13: TcxDBLabel;
    cxDBEdit13: TcxDBTextEdit;
    cxDBLabel14: TcxDBLabel;
    cxDBEdit14: TcxDBTextEdit;
    cxDBLabel15: TcxDBLabel;
    cxDBEdit15: TcxDBTextEdit;
    cxDBLabel16: TcxDBLabel;
    cxDBEdit16: TcxDBTextEdit;
    cxDBLabel17: TcxDBLabel;
    cxDBEdit17: TcxDBTextEdit;
    cxDBLabel18: TcxDBLabel;
    cxDBEdit18: TcxDBTextEdit;
    cxDBLabel19: TcxDBLabel;
    cxDBEdit19: TcxDBTextEdit;
    cxDBLabel20: TcxDBLabel;
    cxDBEdit20: TcxDBTextEdit;
    cxDBLabel21: TcxDBLabel;
    cxDBEdit21: TcxDBTextEdit;
    cxDBLabel22: TcxDBLabel;
    cxDBEdit22: TcxDBTextEdit;
    cxDBLabel23: TcxDBLabel;
    cxDBEdit23: TcxDBTextEdit;
    cxDBLabel24: TcxDBLabel;
    cxDBEdit24: TcxDBTextEdit;
    cxDBLabel25: TcxDBLabel;
    cxDBEdit25: TcxDBTextEdit;
    cxDBLabel26: TcxDBLabel;
    cxDBEdit26: TcxDBTextEdit;
    cxDBLabel27: TcxDBLabel;
    cxDBEdit27: TcxDBTextEdit;
    cxDBLabel28: TcxDBLabel;
    cxDBEdit28: TcxDBTextEdit;
    cxDBLabel29: TcxDBLabel;
    cxDBEdit29: TcxDBTextEdit;
    cxDBLabel30: TcxDBLabel;
    cxDBEdit30: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    procedure cxDBEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCheckValue:boolean;    
    FSumFieldName:string;
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    procedure SetSizeRunDisplay;
    property CheckValue:boolean read FCheckValue write FCheckValue;
    property SumFieldName:string read FSumFieldName write FSumFieldName;
  end;

implementation

{$R *.dfm}

{ TAPubSizeRunFrame }

procedure TAPubSizeRunFrame.SetSizeRunDisplay;
var i:integer;
    ATempBool:Boolean;
begin
for i:=1 to 30 do
  begin
    if cxDBLabel1.DataBinding.DataSource.DataSet.RecordCount=0 then
       ATempBool:=True//i>20 
    else
       ATempBool:=cxDBLabel1.DataBinding.DataSource.DataSet.FieldByName('Size'+IntToStr(i)).AsString='';
    if ATempBool then
       begin
         TcxDBLabel(FindComponent('cxDBLabel'+IntToStr(i))).Visible:=False;
         TcxDBTextEdit(FindComponent('cxDBEdit'+IntToStr(i))).Visible:=False;
         TcxLabel(FindComponent('cxLabel'+IntToStr(i))).Visible:=False;
       end;
    if (i=21) and ATempBool then
       Width:=Width-145;
  end;
cxDBEdit12.Properties.OnEditValueChanged:=cxDBEdit1.Properties.OnEditValueChanged;
end;

procedure TAPubSizeRunFrame.cxDBEdit1PropertiesEditValueChanged(
  Sender: TObject);
var i:integer;
begin
if (SumFieldName<>'')and(cxDBEdit1.DataBinding.DataSource.DataSet.State in [dsInsert,dsEdit])and CheckValue then
  with cxDBEdit1.DataBinding.DataSource do
    begin
      DataSet.FieldByName(FSumFieldName).AsFloat:=0;
      (Sender as TcxDBTextEdit).PostEditValue;
      for i:=1 to 30 do
        begin
          DataSet.FieldByName(FSumFieldName).AsFloat:=DataSet.FieldByName(FSumFieldName).AsFloat+DataSet.FieldByName('Size'+IntToStr(i)).AsFloat;
        end;
    end;
end;

constructor TAPubSizeRunFrame.Create(Aowner: TComponent);
begin
  inherited;
FSumFieldName:='';
end;

procedure TAPubSizeRunFrame.cxDBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
keybd_event(9,0,0,0);
end;

end.
