unit AModelEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, DB,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, Menus,
   APubSizeRun, cxDropDownEdit, cxBlobEdit, cxDBEdit,
  cxMaskEdit, cxButtonEdit, MemDS, DBAccess, MSAccess, cxCheckComboBox,
  cxDBCheckComboBox, cxCheckListBox, cxDBCheckListBox, RxRichEd, DBRichEd,Wwdbigrd,
  Grids, Wwdbgrid, cxCalc ;

type
  TAModelEditorForm = class(TForm)
    EditData: TDataSource;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    DSizeType: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FHasChildren:boolean;  //從主Frame傳來的Tree的節點狀態
    FFieldRight:integer;   //從主Frame傳來的欄位Enabled狀態
    FCheckValue:boolean;   //調用別的資料集時的一個臨時狀態
    FWhereStr:string;      //從主Frame傳來的初始條件值
    FTempOtherStr:string;    //從主Frame傳來的倉位
    FTempEditStr:string;   //從主Frame傳來的臨時變量
    FTempEditStr1:string;   //從主Frame傳來的臨時變量
    FTempEditStr2:string;   //從主Frame傳來的臨時變量
    FTempEditStr3:string;   //從主Frame傳來的臨時變量
    FTempEditBool:boolean; //從主Frame傳來的臨時變量
    FDetailRecorded:boolean; //從主Frame傳來資料集的明細記錄是存在
    FActivewwDBGrid:TwwDBGrid;     //當前活動的Grid
    procedure DBRichEditDblClick(Sender: TObject);
    function CheckFieldValues:boolean;
    procedure ClearErrorMsg;
  public
    { Public declarations }
    procedure SetSizeRunDisplay;
    procedure UpdateEditor; virtual;
    procedure KeyPress(Sender: TObject;  var Key: Char);
    property HasChildren:boolean read FHasChildren write FHasChildren;
    property FieldRight:integer read FFieldRight write FFieldRight;
    property CheckValue:boolean read FCheckValue write FCheckValue;
    property WhereStr:string read FWhereStr write FWhereStr;
    property  TempOtherStr:string read FTempOtherStr write FTempOtherStr;
    property TempEditStr:string read FTempEditStr write FTempEditStr;
    property TempEditStr1:string read FTempEditStr1 write FTempEditStr1;
    property TempEditStr2:string read FTempEditStr2 write FTempEditStr2;
    property TempEditStr3:string read FTempEditStr3 write FTempEditStr3;
    property TempEditBool:boolean read FTempEditBool write FTempEditBool;
    property DetailRecorded:boolean read FDetailRecorded write FDetailRecorded;
    property  ActivewwDBGrid:TwwDBGrid read FActivewwDBGrid write FActivewwDBGrid;
  end;

var
  AModelEditorForm: TAModelEditorForm;

implementation

uses APubUnit, AData, APubRichEdit, Contnrs;

{$R *.dfm}
// 資料欄位的Tag:1.作者1有權限;2.作者2有權限;4.作者3有權限;8.作者4有權限; 16.自動帶資料

{ TAModelEditorForm }

procedure TAModelEditorForm.DBRichEditDblClick(Sender: TObject);
var
   CanMody:boolean;
begin
CanMody:=not (EditData.State in [dsinsert,dsedit]);
With TAPubRichEditForm.createForm('',CanMody) do
   try
      cxButton1.SetFocus;
      Editor.DataSource:=EditData;
      Editor.DataField:=(Sender as TRxDBRichEdit).DataField;
      ShowModal;
   finally
    Free;
    (Sender as TRxDBRichEdit).SetFocus;
   end;
{
if EditData.State in [dsInsert,dsEdit] then
   begin
      cxButton1.SetFocus;
      try
        Application.CreateForm(TAPubRichMemoForm, APubRichMemoForm);
      with APubRichMemoForm do
         begin
           DRichMemo.DataSet:=EditData.DataSet;
           cxRichMemo.DataField:=(Sender as TcxDBRichMemo).DataBinding.DataField;
           ShowModal;
         end;
      finally
        APubRichMemoForm.Free;
      end;
      (Sender as TcxDBRichMemo).SetFocus;
  end;
  }
end;

procedure TAModelEditorForm.SetSizeRunDisplay;
begin
TAPubSizeRunFrame(FindComponent('APubSizeRunFrame1')).SetSizeRunDisplay;
if (DSizeType.DataSet.RecordCount=0)or(DSizeType.DataSet.FieldByName('Size21').AsString='') then
   begin
     Width:=Width-140;
     cxButton1.Left:=cxButton1.Left-60;
     cxButton2.Left:=cxButton2.Left-60;
   end;
end;

procedure TAModelEditorForm.UpdateEditor;
begin

end;

procedure TAModelEditorForm.FormShow(Sender: TObject);
var i:integer;
    S:string;
    UnModify:boolean;
begin
UnModify:=not (EditData.State in [dsInsert,dsEdit]);
for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TPanel then
      begin
        if EditIsColor then
           TPanel(Components[i]).Color:=ADMSystem.cxStyleBackGround.Color;
      end
    else
    if Components[i] is TLabel then
       begin
         S:=TLabel(Components[i]).Caption;
         TLabel(Components[i]).Caption:=EditData.DataSet.FindField(S).DisplayLabel+':';
       end
    else
    if Components[i] is TcxDBTextEdit then
       begin
         if UnModify then
            TcxDBTextEdit(Components[i]).Enabled:=True
         else
         if TcxDBTextEdit(Components[i]).Enabled then
            TcxDBTextEdit(Components[i]).Enabled:=((TcxDBTextEdit(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBTextEdit(Components[i]).DataBinding.Field.Tag and FieldRight>0));
         TcxDBTextEdit(Components[i]).OnKeyPress:=KeyPress;
       end
    else
    if Components[i] is TcxDBMaskEdit then
       begin
         TcxDBMaskEdit(Components[i]).ImeName:='';
         if UnModify then
            TcxDBMaskEdit(Components[i]).Enabled:=True
         else
         if TcxDBMaskEdit(Components[i]).Enabled then
            TcxDBMaskEdit(Components[i]).Enabled:=((TcxDBMaskEdit(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBMaskEdit(Components[i]).DataBinding.Field.Tag and FieldRight>0));
         TcxDBMaskEdit(Components[i]).OnKeyPress:=KeyPress;
       end
    else    
    if Components[i] is TcxDBButtonEdit then
       begin
         TcxDBButtonEdit(Components[i]).Style.ButtonTransparency:=ebtNone;
         if UnModify then
            TcxDBButtonEdit(Components[i]).Enabled:=True
         else
         if TcxDBButtonEdit(Components[i]).Enabled then
            TcxDBButtonEdit(Components[i]).Enabled:=((TcxDBButtonEdit(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBButtonEdit(Components[i]).DataBinding.Field.Tag and FieldRight>0));
        TcxDBButtonEdit(Components[i]).OnKeyPress:=KeyPress;
       end
    else
    if Components[i] is TcxDBCheckBox then
       begin
         S:=TcxDBCheckBox(Components[i]).Caption;
         TcxDBCheckBox(Components[i]).Caption:=EditData.DataSet.FindField(S).DisplayLabel;
         if UnModify then
            TcxDBCheckBox(Components[i]).Enabled:=True
         else
         if TcxDBCheckBox(Components[i]).Enabled then
            TcxDBCheckBox(Components[i]).Enabled:=((TcxDBCheckBox(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBCheckBox(Components[i]).DataBinding.Field.Tag and FieldRight>0));
         TcxDBCheckBox(Components[i]).OnKeyPress:=KeyPress;
       end
    else
    if Components[i] is TcxDBDateEdit then
       begin
         TcxDBDateEdit(Components[i]).Style.ButtonTransparency:=ebtNone;
         if UnModify then
            TcxDBDateEdit(Components[i]).Enabled:=True
         else
         if TcxDBDateEdit(Components[i]).Enabled then
            TcxDBDateEdit(Components[i]).Enabled:=((TcxDBDateEdit(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBDateEdit(Components[i]).DataBinding.Field.Tag and FieldRight>0));
         TcxDBDateEdit(Components[i]).OnKeyPress:=KeyPress;
       end
    else
    if Components[i] is TcxDBBlobEdit then
       begin
         TcxDBBlobEdit(Components[i]).Style.ButtonTransparency:=ebtNone;
         if UnModify then
            TcxDBBlobEdit(Components[i]).Enabled:=True
         else
         if TcxDBBlobEdit(Components[i]).Enabled then
            TcxDBBlobEdit(Components[i]).Enabled:=((TcxDBBlobEdit(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBBlobEdit(Components[i]).DataBinding.Field.Tag and FieldRight>0));
       end
    else
    if Components[i] is TRxDBRichEdit then
       begin
         if UnModify then
            TRxDBRichEdit(Components[i]).Enabled:=True
         else
         if TRxDBRichEdit(Components[i]).Enabled then
            TRxDBRichEdit(Components[i]).Enabled:=((TRxDBRichEdit(Components[i]).Field.Tag<>32)and(TRxDBRichEdit(Components[i]).Field.Tag and FieldRight>0));
         TRxDBRichEdit(Components[i]).OnDblClick:=DBRichEditDblClick;
       end
    else
    if Components[i] is TcxDBCheckComboBox then
       begin
         TcxDBCheckComboBox(Components[i]).Style.ButtonTransparency:=ebtNone;
         if UnModify then
            TcxDBCheckComboBox(Components[i]).Enabled:=True
         else
         if TcxDBCheckComboBox(Components[i]).Enabled then
            TcxDBCheckComboBox(Components[i]).Enabled:=((TcxDBCheckComboBox(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBCheckComboBox(Components[i]).DataBinding.Field.Tag and FieldRight>0));
        TcxDBCheckComboBox(Components[i]).OnKeyPress:=KeyPress;
       end
    else
    if Components[i] is TcxDBComboBox then
       begin
         TcxDBComboBox(Components[i]).Style.ButtonTransparency:=ebtNone;
         if TcxDBComboBox(Components[i]).Tag=0 then
         with TcxDBComboBox(Components[i]),ADMSystem.QAPubData do
           begin
             QAPubDataOpen(Format('SELECT Field_Values FROM dbo.Ab_FieldValues  WHERE  Field_Name=''%S''',[DataBinding.DataField]));
             First;
             while not Eof do
               begin
                 Properties.Items.Add(FieldByName('Field_Values').AsString);
                 Next;
               end;
             QAPubDataClose;
           end;
         if UnModify then
            TcxDBComboBox(Components[i]).Enabled:=True
         else
         if TcxDBComboBox(Components[i]).Enabled then
            TcxDBComboBox(Components[i]).Enabled:=((TcxDBComboBox(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBComboBox(Components[i]).DataBinding.Field.Tag and FieldRight>0));
         TcxDBComboBox(Components[i]).OnKeyPress:=KeyPress;
       end
    else
    if Components[i] is TcxDBCalcEdit then
       begin
         TcxDBCalcEdit(Components[i]).Style.ButtonTransparency:=ebtNone;
         if UnModify then
            TcxDBCalcEdit(Components[i]).Enabled:=True
         else
         if TcxDBCalcEdit(Components[i]).Enabled then
            TcxDBCalcEdit(Components[i]).Enabled:=((TcxDBCalcEdit(Components[i]).DataBinding.Field.Tag<>32)and(TcxDBCalcEdit(Components[i]).DataBinding.Field.Tag and FieldRight>0));
        TcxDBCalcEdit(Components[i]).OnKeyPress:=KeyPress;
       end;
  end;

cxButton1.Visible:=not UnModify;
cxButton2.Visible:=not UnModify;
cxButton3.Visible:=UnModify;
cxButton3.Top:=cxButton1.Top;
cxButton3.Left:=Trunc((Width-cxButton3.Width)/2);
UpdateEditor;
FCheckValue:=EditData.State in [dsInsert,dsEdit];
end;

procedure TAModelEditorForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FCheckValue:=False;
if  (EditData.DataSet as TMSQuery).State in [dsInsert,dsEdit] then
    cxButton1.SetFocus;
with (EditData.DataSet as TMSQuery) do
begin
if Modified then
  begin
   if Application.MessageBox('要保存嗎?',PChar(Application.Title),MB_YESNO+MB_ICONQUESTION)=mrYes then
       cxButton1.Click
      else
       cxButton2.Click;
   end
else
  if State in [dsInsert,dsEdit] then
    begin
      ClearErrorMsg;
      Cancel;
    end;
end;
Action:=caFree;
end;

procedure TAModelEditorForm.cxButton1Click(Sender: TObject);
var i,k:integer;
FieldsName,FieldsStr:array[0..30] of string; 
begin
if  (EditData.DataSet as TMSQuery).State in [dsInsert,dsEdit] then
  if CheckFieldValues then
     Exit;
if EditData.State=dsInsert then
   begin
      EditData.DataSet.Post;
      if (EditData.DataSet.Tag and 1024)>0 then
        begin
          CheckValue:=False;
          try
          DataInsert(EditData.DataSet);
          finally
          CheckValue:=True;
          end;
          SelectNext(ActiveControl,True,True);
          SelectNext(ActiveControl,True,True);
        end
      else
      ModalResult:=mrOk;
   end
else
  if EditData.State=dsEdit then
   begin///666
      if SetSelected then
        with EditData.DataSet do
         begin//777
          k:=0;
          for i:=0  to Fields.Count-1 do
           if (Fields[i].IsBlob=False) and (Fields[i].NewValue<>Fields[i].OldValue) then
            begin//444
             FieldsName[k]:=Fields[i].FieldName;
             FieldsStr[k]:=Fields[i].AsString;
             Inc(k);
            end;//444
         end;//777
      EditData.DataSet.Post;
      ModalResult:=mrOk;
      if (SetSelected) and (ActivewwDBGrid<>nil) then
        with ActivewwDBGrid.DataSource.DataSet,ActivewwDBGrid do
         begin//333
           DisableControls;
             for i:= 0 to  SelectedList.Count-1 do
               begin//222
                try//111
                 GotoBookmark(SelectedList.items[i]);
                 if ((EditData.DataSet.Tag and 8)=0) or (((EditData.DataSet.Tag and 8)>0) and (EditData.DataSet.FieldByName('FCheck').Value=false)) then
                 begin//sss
                 TMSQuery(ActivewwDBGrid.DataSource.DataSet).RefreshRecord;
                 Edit;
                 for k := 0 to 30 do
                   if FieldsName[k]<>'' then
                     FieldByName(FieldsName[k]).AsString:=FieldsStr[k];
                 Post;
                 end;//sss
                except//111
                 Cancel;
                 EnableControls;
                 Exit;
                end;//111
              end;//222
          SelectedList.Clear;
          EnableControls;
         end;//333
   end;//666
end;

procedure TAModelEditorForm.cxButton2Click(Sender: TObject);
begin
if  EditData.State in [dsInsert,dsEdit] then
  begin
    ClearErrorMsg;
    EditData.DataSet.Cancel;
  end;
end;

procedure TAModelEditorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not(EditData.State in [dsInsert,dsEdit]) then
begin
if Key=36 then
   EditData.DataSet.First
else
if Key=35 then
   EditData.DataSet.Last
else
if Key=33 then
   EditData.DataSet.Prior
else
if Key=34 then
   EditData.DataSet.Next;
UpdateEditor;
end;
end;

function TAModelEditorForm.CheckFieldValues: boolean;
var i:integer;
    ErrorMsg:string;
begin
ErrorMsg:='';
for i:=0 to EditData.DataSet.FieldCount-1 do
    ErrorMsg:=ErrorMsg+EditData.DataSet.Fields[i].ConstraintErrorMessage;
if ErrorMsg<>'' then
  begin
    Result:=true;
    ShowWarning(ErrorMsg+'不正確!');
  end
  else
    Result:=false;
end;

procedure TAModelEditorForm.ClearErrorMsg;
var i:integer;
begin
for i:=0 to EditData.DataSet.FieldCount-1 do
    EditData.DataSet.Fields[i].ConstraintErrorMessage:='';
end;

procedure TAModelEditorForm.KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
SelectNext(ActiveControl,True,True);
end;

end.
