unit AModelBrowser;

interface

uses
  Windows, Messages, SysUtils, ppTypes, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,  ppProd, ppClass, ppReport, ppEndUsr, ActnList, ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, cxPropertiesStore, DB, cxCustomData, wwExport, MemDS,
  DBAccess, MSAccess,ppJpeg, cxExportTL4Link, cxDropDownEdit,  raIDE,SHellApi,cxSplitter,
  StdCtrls, fcStatusBar,ppWWRichEd, ppComm, ppRelatv, ppDB,  cxTL, cxDBTL, ppDBPipe;

type
  TAModelBrowserFrame = class(TFrame)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnEdit: TToolButton;
    BtnDelete: TToolButton;
    BtnCopy: TToolButton;
    BtnPaste: TToolButton;
    SptRefresh: TToolButton;
    BtnRefresh: TToolButton;
    BtnSort: TToolButton;
    BtnSearch: TToolButton;
    BtnFilter: TToolButton;
    SptSelect: TToolButton;
    BtnSelect: TToolButton;
    BtnCalculate: TToolButton;
    BtnSetup: TToolButton;
    BtnRecord: TToolButton;
    SptToFile: TToolButton;
    BtnToFile: TToolButton;
    BtnPrivew: TToolButton;
    BtnDesigner: TToolButton;
    BtnPropert: TToolButton;
    SptFCheck: TToolButton;
    BtnFCheck: TToolButton;
    BtnRCheck: TToolButton;
    BtnECheck: TToolButton;
    ActionList: TActionList;
    ActionNew: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    ActionCopy: TAction;
    ActionPaste: TAction;
    ActionRefresh: TAction;
    ActionSort: TAction;
    ActionSearch: TAction;
    ActionFilter: TAction;
    ActionSelect: TAction;
    ActionCalculate: TAction;
    ActionSetup: TAction;
    ActionBrowse: TAction;
    ActionToFile: TAction;
    ActionPrivew: TAction;
    ActionDesigner: TAction;
    ActionPropert: TAction;
    ActionFCheck: TAction;
    ActionRCheck: TAction;
    ActionECheck: TAction;
    ActionSelectAll: TAction;
    ActionUnSelectAll: TAction;
    PubDesigner: TppDesigner;
    PubReport: TppReport;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    MenuRefresh: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    MenuSelect: TMenuItem;
    N4: TMenuItem;
    N9: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    ActionCollapse: TAction;
    ActionExpand: TAction;
    ActionShowAll: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    ActionOther: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ToolButton1: TToolButton;
    ActionFilterSql: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActioncClose: TAction;
    procedure ActionNewExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionSortExecute(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionSelectExecute(Sender: TObject);
    procedure ActionCalculateExecute(Sender: TObject);
    procedure ActionSetupExecute(Sender: TObject);
    procedure ActionToFileExecute(Sender: TObject);
    procedure ActionPrivewExecute(Sender: TObject);
    procedure ActionDesignerExecute(Sender: TObject);
    procedure ActionPropertExecute(Sender: TObject);
    procedure ActionFCheckExecute(Sender: TObject);
    procedure ActionRCheckExecute(Sender: TObject);
    procedure ActionECheckExecute(Sender: TObject);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure ActionUnSelectAllExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionBrowseExecute(Sender: TObject);
    procedure ActionCollapseExecute(Sender: TObject);
    procedure ActionExpandExecute(Sender: TObject);
    procedure ActionShowAllExecute(Sender: TObject);
    procedure ActionOtherExecute(Sender: TObject);
    procedure ActionFilterSqlExecute(Sender: TObject);
  private
    { Private declarations }
    ComCount:integer;
    FNewed:boolean;              //特殊情況下新增狀態初始條件
    FEdited:boolean;             //特殊情況下修改狀態初始條件
    FCheckEdited:boolean;        //特殊情況下修改狀態初始條件
    FDeleted:boolean;            //特殊情況下刪除狀態初始條件
    FNewChecked:boolean;         //特殊情況下審核狀態初始條件
    FHasChildren:boolean;        //Tree的節點狀態
    FActionVisible:integer;      //按鈕的Visible狀態
    FActionRight:integer;        //按鈕的Enabled狀態
    FFieldRight:integer;         //欄位Enabled狀態
    FMenuName:string;            //調用Frame的菜單名稱
    FWhereStr:string;            //Frame中的初始條件值
    FSelectWhere:string;         //Frame中的初始條件
    FCheckUpdate:boolean;        //設定審核時不記錄修改人及時間
    FTempSortStr:string;          //排序字串的臨時孌量
    FTempOtherStr:string;         //倉位
    FTempEditStr:string;         //傳遞到EditForm中的臨時孌量
    FTempEditStr1:string;         //傳遞到EditForm中的臨時孌量
    FTempEditStr2:string;         //傳遞到EditForm中的臨時孌量
    FTempEditStr3:string;         //傳遞到EditForm中的臨時孌量
    FTempEdit:array[1..3] of string;     //傳遞到EditForm中的臨時孌量
    FReportWhere:string;         //報表條件
    FTempEditBool:boolean;         //傳遞到EditForm中的臨時孌量
    FDetailRecorded:boolean;       //資料集的明細記錄是存在
    FStore:TcxPropertiesStore;   //記錄Frame的設定狀態
    FActiveIndex:integer;        //當前Grid的索引號
    FCheckData:TDataSource;     //本窗口的主DataSource
    FActiveData:TDataSource;     //當前活動的DataSource
    FActiveSizeKey:TDataSource;     //當前活動的SizeType的主表
    FActiveSizeType:TDataSource;     //當前活動的SizeType
    FActiveSizeRun1:TDataSource;     //當前活動的SizeType
    FActiveSizeRun2:TDataSource;     //當前活動的SizeType
    FRefreshData1:TDataSource;     //窗口切換時刷新資料時用
    FRefreshData2:TDataSource;     //窗口切換時刷新資料時用
    FRefreshData3:TDataSource;     //窗口切換時刷新資料時用
    FRefreshData4:TDataSource;     //窗口切換時刷新資料時用
    FppDBGrid:TwwDBGrid;           //主報表DBGrid
    FActiveTreeList:TcxDBTreeList; //當前活動的Tree
    FActivewwDBGrid:TwwDBGrid;     //當前活動的Grid
    FMyStatusBar:TfcStatusBar;
    FMyStartDate:TDate;//保存取得的日期時間段(YYYY;MM;DD)
    FMyEndDate:TDate;//保存取得的日期時間段(YYYY;MM;DD)
    procedure SetActionRights;
    procedure SetSepsatatorVisible;
    procedure SetSCheckStatus(aIndex:integer);
    procedure SetMCheckStatus(aIndex:integer);
    procedure SetActionVisible(Value:integer);
    procedure SetActionRight(Value:integer);
    procedure SetActiveData(const Value:TDataSource);
    procedure CreateEditForm(const AFormName:string);
    function GetEditFormName:string;
    procedure GridDblClick(Sender: TObject);
    procedure SplitterBeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
    procedure SplitterAfterClose(Sender: TObject);
    procedure cxDBTreeListOnEnter(Sender:TObject);
    function GetDataSetTag(DataSetName:string):integer;
    function GetDataSetSort(DataSetName:string):string;
    procedure SizeKeyAfterScroll(DataSet: TDataSet);
    procedure SizeKeyAfterRefresh(DataSet: TDataSet);
    procedure SetSizeRunDisplayLabel;
    procedure wwDBGridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure wwDBGridCalcTitleImage(Sender: TObject; Field: TField; var TitleImageAttributes:
      TwwTitleImageAttributes);
  public
    { Public declarations }
    procedure wwDBGridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    constructor Create(Aowner:TComponent);override;
    destructor Destroy;override;
    procedure SetDataSetTag; virtual;
    procedure OpenDataSet; virtual;
    procedure BeforeReport; virtual;
    procedure AfterReport; virtual;
    procedure BeforeEditFormOnShow; virtual;
    procedure GetSelectWhere; virtual;
    procedure SetMyDate; virtual;
    procedure MsQueryBeforePost(DataSet:TDataSet); virtual;
    procedure NodeChanged(Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode); virtual;
    procedure wwDBGridEnter(Sender: TObject); virtual;
    procedure wwDBGridCalcCellColors(Sender: TObject; Field: TField; State:
      TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush); virtual;
    property  Newed:boolean read FNewed write FNewed;
    property  Edited:boolean read FEdited write FEdited;
    property  CheckEdited:boolean read FCheckEdited write FCheckEdited;
    property  Deleted:boolean read FDeleted write FDeleted;
    property  NewChecked:boolean read FNewChecked write FNewChecked;
    property  HasChildren:boolean read FHasChildren write FHasChildren;
    property  ActionVisible:integer read FActionVisible write SetActionVisible;
    property  ActionRight:integer read FActionRight write SetActionRight;
    property  FieldRight:integer read FFieldRight write FFieldRight;
    property  MenuName:string read FMenuName write FMenuName;
    property  WhereStr:string read FWhereStr write FWhereStr;
    property  SelectWhere:string read FSelectWhere write FSelectWhere;
    property  CheckUpdate:boolean read FCheckUpdate write FCheckUpdate;
    property  TempSortStr:string read FTempSortStr write FTempSortStr;
    property  TempOtherStr:string read FTempOtherStr write FTempOtherStr;
    property  TempEditStr:string read FTempEditStr write FTempEditStr;
    property  TempEditStr1:string read FTempEditStr1 write FTempEditStr1;
    property  TempEditStr2:string read FTempEditStr2 write FTempEditStr2;
    property  TempEditStr3:string read FTempEditStr3 write FTempEditStr3;
    property  ReportWhere:string read FReportWhere write FReportWhere;
    property  TempEditBool:boolean read FTempEditBool write FTempEditBool;
    property  DetailRecorded:boolean read FDetailRecorded write FDetailRecorded;
    property  Store:TcxPropertiesStore read FStore write FStore;
    property  ActiveIndex:integer read FActiveIndex write FActiveIndex;
    property  CheckData:TDataSource read FCheckData write FCheckData;
    property  ActiveData:TDataSource read FActiveData write SetActiveData;
    property  ActiveSizeKey:TDataSource read FActiveSizeKey write FActiveSizeKey;
    property  ActiveSizeType:TDataSource read FActiveSizeType write FActiveSizeType;
    property  ActiveSizeRun1:TDataSource read FActiveSizeRun1 write FActiveSizeRun1;
    property  ActiveSizeRun2:TDataSource read FActiveSizeRun2 write FActiveSizeRun2;
    property  RefreshData1:TDataSource read FRefreshData1 write FRefreshData1;
    property  RefreshData2:TDataSource read FRefreshData2 write FRefreshData2;
    property  RefreshData3:TDataSource read FRefreshData3 write FRefreshData3;
    property  RefreshData4:TDataSource read FRefreshData4 write FRefreshData4;
    property  ppDBGrid:TwwDBGrid read FppDBGrid write FppDBGrid;
    property  ActiveTreeList:TcxDBTreeList read FActiveTreeList write FActiveTreeList;
    property  ActivewwDBGrid:TwwDBGrid read FActivewwDBGrid write FActivewwDBGrid;
    property  MyStatusBar:TfcStatusBar read FMyStatusBar write FMyStatusBar;
    property  MyStartDate:TDate read FMyStartDate write FMyStartDate;
    property  MyEndDate:TDate read FMyEndDate write FMyEndDate;
    procedure GetppDBGrid;

  end;

implementation

uses AData, APubUnit, AModelEditor,APubLocate, APubFilterSql, APubReport,
     APubReportEditor, APubSort, APubPropertColumn, AModelMain, Contnrs;

{$R *.dfm}

Type
  TAModelEditorFormClass=Class of TAModelEditorForm;

{ TAModelBrowserFrame }

constructor TAModelBrowserFrame.Create(Aowner: TComponent);
begin
  inherited;
Store:=TcxPropertiesStore.Create(Self);
FNewed:=True;
FEdited:=True;
FDeleted:=True;
FNewChecked:=True;
FCheckUpdate:=False;
FActiveTreeList:=nil;
FActivewwDBGrid:=nil;
FActiveSizeRun1:=nil;
FActiveSizeRun2:=nil;
FActiveSizeType:=nil;
FActiveSizeKey:=nil;
FCheckData:=nil;
FRefreshData1:=nil;
FRefreshData2:=nil;
FRefreshData3:=nil;
FRefreshData4:=nil;
FppDBGrid:=nil;
MyStartDate:=Date;
MyEndDate:=Date;
end;

destructor TAModelBrowserFrame.Destroy;
var i:integer;
begin
for i:=0 to ComponentCount-1 do
    if Components[i] is TMSQuery then      //------------關閉打開的資料集
       if TMSQuery(Components[i]).Active then
          TMSQuery(Components[i]).Close;
Store.StoreTo;
Store.Free;
  inherited;
end;

procedure TAModelBrowserFrame.GetppDBGrid;
var i:Integer;
begin
ppDBGrid:=nil;
for i:=0 to ComCount do
if (Components[i] is TwwDBGrid) and ((PubReport.DataPipeline as TppDBPipeline)<> nil) then
            if TwwDBGrid(Components[i]).DataSource=(PubReport.DataPipeline as TppDBPipeline).DataSource then
                   ppDBGrid:=TwwDBGrid(Components[i]);
end;

procedure TAModelBrowserFrame.SetDataSetTag;
var i,j,k:integer;
begin
GetSelectWhere;  //初始化條件設定
if not ADMSystem.QAPubFields.Active then
   ADMSystem.QAPubFields.Open;
for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TDataSource then
      TDataSource(Components[i]).AutoEdit:=False
    else
    if Components[i] is TMSQuery then      //------------修改欄位屬性
      begin//AAA
        if TMSQuery(Components[i]).Tag=0 then
           TMSQuery(Components[i]).Tag:=GetDataSetTag(TMSQuery(Components[i]).Name);
        TempString:='SELECT   dbo.Ad_DataSets.Field_Name   FROM    dbo.Ad_DataSets INNER JOIN dbo.Ae_Group ON dbo.Ad_DataSets.Group_Name = dbo.Ae_Group.Group_Name where Menu_Name=''%S'' and DataSet_Name=''%S'' and  (Group_Tag&''%S'')>0 '
                   +'UNION '
                   +'SELECT Field_Name FROM    dbo.Ad_DataSetu where Menu_Name=''%S'' and DataSet_Name=''%S'' and User_Id=''%S'' ';
        QAPubDataOpen(Format(TempString,[MenuName,TMSQuery(Components[i]).Name,IntToStr(RolesId),MenuName,TMSQuery(Components[i]).Name,UserId]));
        TMSQuery(Components[i]).FetchAll:=True;
        with TMSQuery(Components[i]) do
          begin//999
            for j:=0 to FieldCount-1 do
                begin//888
                  if ADMSystem.QAPubFields.Locate('Field_Name',Fields[j].FieldName,[loCaseInsensitive]) then
                     begin//777
                       Fields[j].DisplayLabel:=ADMSystem.QAPubFieldsField_Desc.Value;
                       Fields[j].DisplayWidth:=ADMSystem.QAPubFieldsField_Length.Value;
                       if ADMSystem.QAPubData.RecordCount=0  then
                       begin//666
                        if Fields[j].Tag<>32 then
                          Fields[j].Tag:=ADMSystem.QAPubFieldsField_Tag.Value;
                       end//666
                        else
                         begin//555
                          if Fields[j].Tag<>32 then
                           if ADMSystem.QAPubData.Locate('Field_Name',Fields[j].FieldName,[loCaseInsensitive]) then
                             Fields[j].Tag:=ADMSystem.QAPubFieldsField_Tag.Value
                              else
                               Fields[j].Tag:=0;
                         end;//555
                       if ADMSystem.QAPubFieldsDefault_Value.Value<>'' then
                            Fields[j].DefaultExpression:=QuotedStr(ADMSystem.QAPubFieldsDefault_Value.Value);
                          //Fields[j].DefaultExpression:=ADMSystem.QAPubFieldsDefault_Value.Value;
                          //update luck 2012/02/22  sdac update
                       if Fields[j] is TStringField then
                          begin//444
                            TStringField(Fields[j]).EditMask:=ADMSystem.QAPubFieldsEdit_Format.Value;
                          end//444
                       else
                       if Fields[j] is TIntegerField then
                          begin//333
                            TIntegerField(Fields[j]).DisplayFormat:=ADMSystem.QAPubFieldsDisplay_Format.Value;
                            TIntegerField(Fields[j]).EditFormat:=ADMSystem.QAPubFieldsEdit_Format.Value;
                          end//333
                       else
                       if Fields[j] is TFloatField then
                          begin//222
                            TFloatField(Fields[j]).DisplayFormat:=ADMSystem.QAPubFieldsDisplay_Format.Value;
                            TFloatField(Fields[j]).EditFormat:=ADMSystem.QAPubFieldsEdit_Format.Value;
                          end//222
                       else
                       if Fields[j] is TDateTimeField then
                          begin//111
                            TDateTimeField(Fields[j]).DisplayFormat:=ADMSystem.QAPubFieldsDisplay_Format.Value;
                            TDateTimeField(Fields[j]).EditMask:=ADMSystem.QAPubFieldsEdit_Format.Value;
                          end //111
                     end;//777
                  k:=Store.Components.Count;
                  Store.Components.Insert(k);
                  Store.Components[k].Component:=Fields[j];
                  Store.Components[k].Properties.Add('Index');
                  Store.Components[k].Properties.Add('DisplayWidth');
                  Store.Components[k].Properties.Add('Visible');
                end;//888
                BeforePost:=MsQueryBeforePost;
            end;//999
             ADMSystem.QAPubData.Close;
      end//AAA
    else
    if Components[i] is TwwDBGrid then
      begin
          {if (PubReport.DataPipeline as TppDBPipeline)<> nil then
            if TwwDBGrid(Components[i]).DataSource=(PubReport.DataPipeline as TppDBPipeline).DataSource then
                   ppDBGrid:=TwwDBGrid(Components[i]);  }
            TempString:=GetDataSetSort(TwwDBGrid(Components[i]).DataSource.DataSet.Name);
            TwwDBGrid(Components[i]).Hint:=TempString;
            (TwwDBGrid(Components[i]).DataSource.DataSet as TMSQuery).SetOrderBy(TempString);
         if TwwDBGrid(Components[i]).Tag=1 then
           begin
             ActiveData:=TwwDBGrid(Components[i]).DataSource;
             ActivewwDBGrid:=TwwDBGrid(Components[i]);
           end;
        case TwwDBGrid(Components[i]).Tag of
        1:FRefreshData1:=TwwDBGrid(Components[i]).DataSource;
        2:FRefreshData2:=TwwDBGrid(Components[i]).DataSource;
        3:FRefreshData3:=TwwDBGrid(Components[i]).DataSource;
        4:FRefreshData4:=TwwDBGrid(Components[i]).DataSource;
        end;
        for j:=0 to TwwDBGrid(Components[i]).DataSource.DataSet.FieldCount-1 do
           if TwwDBGrid(Components[i]).DataSource.DataSet.Fields[j].DataType=ftBoolean then
              TwwDBGrid(Components[i]).SetControlType(TwwDBGrid(Components[i]).DataSource.DataSet.Fields[j].FieldName, fctCheckBox, 'True;False');
        with  TwwDBGrid(Components[i]) do
           begin
             if IsColor then
               begin
                 TitleColor:=ADMSystem.cxStyleBackGround.Color;
                 Color:=ADMSystem.cxStyleBackGround.Color;
                 PaintOptions.ActiveRecordColor:=ADMSystem.cxStyleSelection.Color;
                 PaintOptions.AlternatingRowColor:=ADMSystem.cxStyleContentEven.Color;
                 FooterColor:=ADMSystem.cxStyleFooter.Color;
                end;
             PopupMenu:=PopupMenu1;
             OnDblClick:=GridDblClick;
             OnEnter:=wwDBGridEnter;
             OnCalcCellColors:=wwDBGridCalcCellColors;
             OnTitleButtonClick:=wwDBGridTitleButtonClick;
             OnCalcTitleImage:=wwDBGridCalcTitleImage;
             OnMouseUp:=wwDBGridMouseUp;
           end;
      end
    else
    if Components[i] is TcxSplitter then
      with TcxSplitter(Components[i]) do
      begin
        OnBeforeOpen:=SplitterBeforeOpen;
        OnAfterClose:=SplitterAfterClose;
      end
    else
    if Components[i] is TcxDBTreeList then
      begin
      TcxDBTreeList(Components[i]).Bands[0].Width:=0;
        if TcxDBTreeList(Components[i]).Tag=1 then
          begin
            FActiveTreeList:=TcxDBTreeList(Components[i]);
            FActiveIndex:=TcxDBTreeList(Components[i]).Tag;
            ActiveData:=TcxDBTreeList(Components[i]).DataController.DataSource;
          end;
        case TcxDBTreeList(Components[i]).Tag of
        1:FRefreshData1:=TcxDBTreeList(Components[i]).DataController.DataSource;
        2:FRefreshData2:=TcxDBTreeList(Components[i]).DataController.DataSource;
        3:FRefreshData3:=TcxDBTreeList(Components[i]).DataController.DataSource;
        4:FRefreshData4:=TcxDBTreeList(Components[i]).DataController.DataSource;
        end;
        with TcxDBTreeList(Components[i]) do
          begin
            if IsColor then
               Styles.StyleSheet:=ADMSystem.TreeListStyle;
            PopupMenu:=PopupMenu1;
            OnEnter:=cxDBTreeListOnEnter;
            OnDblClick:=GridDblClick;
            OnFocusedNodeChanged:=NodeChanged;
            OptionsData.Editing:=True;
            OptionsSelection.CellSelect:=True;
            for j:=0 to ColumnCount-1 do
             begin
              k:=Store.Components.Count;
              Store.Components.Insert(k);
              Store.Components[k].Component:=Columns[j];
              Store.Components[k].Properties.Add('Width');
              Store.Components[k].Properties.Add('Position.ColIndex');
              Store.Components[k].Properties.Add('Visible');
            end;    
          end;
      end;
  end;
SetSepsatatorVisible; //設定按鈕之間的分隔符
end;

procedure TAModelBrowserFrame.OpenDataSet;
var i,j:integer;
begin
//1.新增;2.修改;4.刪除;,8.審核;16.复核;32.核準;64.有初始條件;128.記錄新增修改;
//256.資料集有SizeKey;512.資料集有SizeRun;1024.連續新增;2048多筆修改;QSizeType資料集SizeType;4096.報表專用資料集;
Store.StorageName:=GetIniDirectory(Name);
if FileExists(Store.StorageName) then
   Store.RestoreFrom;
ComCount:=ComponentCount-1;
for i:=0 to ComponentCount-1 do
    if Components[i] is TcxDBTreeList then
        with TcxDBTreeList(Components[i]) do
          begin
            for j:=0 to ColumnCount-1 do
               begin
                 Columns[j].Caption.Text:=DataController.DataSource.DataSet.FieldByName(Columns[j].DataBinding.FieldName).DisplayLabel;
                // Columns[j].Width:=DataController.DataSource.DataSet.FieldByName(Columns[j].DataBinding.FieldName).DisplayWidth+1;
               end;
          end
    else
    if Components[i] is TMSQuery then
       begin
         if (TMSQuery(Components[i]).Tag and 64)>0 then
            TMSQuery(Components[i]).FilterSQL:=SelectWhere;
         if not((TMSQuery(Components[i]).Tag and 4096)>0) then
            (TMSQuery(Components[i])).Open;
       end
    else
    if Components[i] is TDataSource then
      begin
        if (TDataSource(Components[i]).DataSet.Tag and 8)>0 then
           begin
             if TMSQuery(TDataSource(Components[i]).DataSet).MasterSource=nil then 
             FCheckData:=TDataSource(Components[i]);
           end;
        if (TDataSource(Components[i]).DataSet.Tag and 256)>0 then
           begin
             ActiveSizeKey:=TDataSource(Components[i]);
             ActiveSizeKey.DataSet.AfterScroll:=SizeKeyAfterScroll;
             ActiveSizeKey.DataSet.AfterRefresh:=SizeKeyAfterRefresh;
           end;
        if (TDataSource(Components[i]).DataSet.Tag and 512)>0 then
           begin
             if ActiveSizeRun1=nil then
                ActiveSizeRun1:=TDataSource(Components[i])
             else
                ActiveSizeRun2:=TDataSource(Components[i]);
           end;
        if TDataSource(Components[i]).DataSet.Name='QSizeType' then  //((TDataSource(Components[i]).DataSet.Tag and 2048)>0)//LUCK UP 2005/5/21 09:18
           begin
             ActiveSizeType:=TDataSource(Components[i]);
           end;
      end;
if (ActiveSizeRun1<>nil)or(ActiveSizeRun2<>nil) then
    SizeKeyAfterScroll(FActiveSizeKey.DataSet);
end;

procedure TAModelBrowserFrame.SetActionRight(Value: integer);
begin
FActionRight:=Value;
ActionNew.Enabled:=(ActionNew.Tag and FActionRight)>0;
ActionEdit.Enabled:=(ActionEdit.Tag and FActionRight)>0;
ActionDelete.Enabled:=(ActionDelete.Tag and FActionRight)>0;
ActionToFile.Enabled:=(ActionToFile.Tag and FActionRight)>0;
ActionPrivew.Enabled:=(ActionPrivew.Tag and FActionRight)>0;
ActionDesigner.Enabled:=(ActionDesigner.Tag and FActionRight)>0;
ActionFCheck.Enabled:=(ActionFCheck.Tag and FActionRight)>0;
ActionRCheck.Enabled:=(ActionRCheck.Tag and FActionRight)>0;
ActionECheck.Enabled:=(ActionECheck.Tag and FActionRight)>0;
end;

procedure TAModelBrowserFrame.SetActionVisible(Value: integer);
begin
FActionVisible:=Value;
ActionNew.Visible:=(ActionNew.Tag and FActionVisible)>0;
ActionEdit.Visible:=(ActionEdit.Tag and FActionVisible)>0;
ActionDelete.Visible:=(ActionDelete.Tag and FActionVisible)>0;
ActionToFile.Visible:=(ActionToFile.Tag and FActionVisible)>0;
ActionPrivew.Visible:=(ActionPrivew.Tag and FActionVisible)>0;
ActionDesigner.Visible:=(ActionDesigner.Tag and FActionVisible)>0;
ActionFCheck.Visible:=(ActionFCheck.Tag and FActionVisible)>0;
ActionRCheck.Visible:=(ActionRCheck.Tag and FActionVisible)>0;
ActionECheck.Visible:=(ActionECheck.Tag and FActionVisible)>0;
end;

procedure TAModelBrowserFrame.SetActiveData(const Value: TDataSource);
begin
if FActiveData<>Value then
   FActiveData:=Value;
ActionSort.Enabled:=FActivewwDBGrid<>nil;
end;

procedure TAModelBrowserFrame.ActionNewExecute(Sender: TObject);
begin
DataInsert(FActiveData.DataSet);
CreateEditForm(GetEditFormName);
end;

procedure TAModelBrowserFrame.ActionEditExecute(Sender: TObject);
begin
if ActionEdit.Enabled then
  begin
   TMSQuery(ActiveData.DataSet).RefreshRecord;
   SetSelected:=((ActiveData.DataSet.Tag and 2)>0) and ((ActiveData.DataSet.Tag and 2048)>0) and (ActivewwDBGrid.SelectedList.Count>1);
   if SetSelected then
    begin
     ShowWarning('您以選擇了'+IntToStr(ActivewwDBGrid.SelectedList.Count)+'筆資料進行修改!!!');
     ActivewwDBGrid.UnselectRecord;
    end;
   FActiveData.DataSet.Edit;
  end;
CreateEditForm(GetEditFormName);
end;

procedure TAModelBrowserFrame.ActionDeleteExecute(Sender: TObject);
var i:integer;Tempstr,Temporder:string;
begin
TMSQuery(FActiveData.DataSet).RefreshRecord;
if ShowQuestion('確定要刪除嗎?') then
   begin
     with (FActiveData.DataSet AS TMSQuery) do
     begin
       for i:=0  to Fields.Count-1 do
        Tempstr:=Tempstr+Fields[i].FieldName+'※'+Fields[i].AsString+'●';
       if not (ADMSystem.Qdel_log.Active) then ADMSystem.Qdel_log.Active:=True;
       ADMSystem.Qdel_log.Insert;
       ADMSystem.Qdel_logPc_Name.Value:=PCName;
       ADMSystem.Qdel_logPc_User.Value:=UsersName;
       ADMSystem.Qdel_logUser_Id.Value:=UserId;
       ADMSystem.Qdel_logItem_No.Value:=FileItem;
       ADMSystem.Qdel_logMenu_Name.Value:=FMenuName;
       ADMSystem.Qdel_logDataSet_Name.Value:=(FActiveData.DataSet AS TMSQuery).Name;
       ADMSystem.Qdel_logRemark.Value:=Tempstr;
       ADMSystem.Qdel_log.Post;
       FActiveData.DataSet.Delete;
     end;
   end;
end;

procedure TAModelBrowserFrame.ActionBrowseExecute(Sender: TObject);
begin
CreateEditForm(GetEditFormName);
end;

procedure TAModelBrowserFrame.ActionRefreshExecute(Sender: TObject);
begin
if (FActiveData.DataSet as TMSQuery).State in [dsInsert,dsEdit] then
 (FActiveData.DataSet as TMSQuery).Cancel;
(FActiveData.DataSet as TMSQuery).Refresh;
end;

procedure TAModelBrowserFrame.ActionSearchExecute(Sender: TObject);
var i:integer;
    SortField:string;
begin
if not Assigned(APubLocateForm) then
   Application.CreateForm(TAPubLocateForm, APubLocateForm);
with APubLocateForm do
  begin
    DPubLocate.DataSet:=FActiveData.DataSet;
    if DPubLocate.DataSet<>OldDataSource.DataSet then
      begin              //===============================================================
        cxComboBox2.Text:='';
        cxComboBox2.Properties.Items.Clear;
        OldDataSource.DataSet:=DPubLocate.DataSet;
        if ActivewwDBGrid<>nil then
          begin
           SortField:=ActivewwDBGrid.Hint;
           if Pos(',',SortField)>0 then
              SortField:=Copy(SortField,1,Pos(',',SortField)-1);
           for i:=0 to ActivewwDBGrid.FieldCount-1 do
             begin
               if ActivewwDBGrid.Fields[i].Visible and (ActivewwDBGrid.Fields[i].Tag<>32) then
                  begin
                    cxComboBox2.Properties.Items.Add(ActivewwDBGrid.Fields[i].DisplayLabel);
                    if (ActivewwDBGrid.Fields[i].FieldName+' ASC' =SortField)or(ActivewwDBGrid.Fields[i].FieldName+' DESC' =SortField) then
                        cxComboBox2.Text:=ActivewwDBGrid.Fields[i].DisplayLabel;
                  end;
             end;
           end;
        if ActiveTreeList<>nil then
           for i:=0 to ActiveTreeList.ColumnCount-1 do
             begin
               if ActiveTreeList.Columns[i].Visible then
                  begin
                    cxComboBox2.Properties.Items.Add(ActiveTreeList.Columns[i].Caption.Text);
                    if (ActiveTreeList.Columns[i].SortOrder=soAscending)or(ActiveTreeList.Columns[i].SortOrder=soDescending) then
                       cxComboBox2.Text:=ActiveTreeList.Columns[i].Caption.Text;
                  end;
             end;
      end     //===================================================================
        else
          begin
            if ActivewwDBGrid<>nil then
               begin
                 SortField:=ActivewwDBGrid.Hint;
                 if Pos(',',SortField)>0 then
                    SortField:=Copy(SortField,1,Pos(',',SortField)-1);
                 for i:=0 to ActivewwDBGrid.FieldCount-1 do
                     if (ActivewwDBGrid.Fields[i].FieldName+' ASC' =SortField)or(ActivewwDBGrid.Fields[i].FieldName+' DESC' =SortField) then
                       begin
                         cxComboBox2.Text:=ActivewwDBGrid.Fields[i].DisplayLabel;
                         Break;
                       end;
               end;
             if ActiveTreeList<>nil then
               begin
                 for i:=0 to ActiveTreeList.ColumnCount-1 do
                     if (ActiveTreeList.Columns[i].SortOrder=soAscending)or(ActiveTreeList.Columns[i].SortOrder=soDescending) then
                       begin
                         cxComboBox2.Text:=ActiveTreeList.Columns[i].Caption.Text;
                         Break;
                       end;
               end;
        end;
    ShowModal;
  end;
end;

procedure TAModelBrowserFrame.ActionFilterExecute(Sender: TObject);
var i:integer;
begin
with ADMSystem.wwFilterDialog1 do
  begin
    DataSource:=ActiveData;
    SelectedFields.Clear;
    for i:=0 to ActiveData.DataSet.FieldCount-1 do
        if (ActiveData.DataSet.Fields[i].Tag<>32) and ActiveData.DataSet.Fields[i].Visible then
            SelectedFields.Add(ActiveData.DataSet.Fields[i].FieldName);
    Execute;
  end;
end;

procedure TAModelBrowserFrame.ActionFilterSqlExecute(Sender: TObject);
var i:integer;
begin
if not Assigned(APubFilterSqlForm) then
   Application.CreateForm(TAPubFilterSqlForm, APubFilterSqlForm);
APubFilterSqlForm.SelectWhere:=SelectWhere;
with APubFilterSqlForm do
  begin
    DPubFilterSql.DataSet:=FActiveData.DataSet;
    if DPubFilterSql.DataSet<>OldDataSource.DataSet then
      begin
        QFilterSql.Clear;
        OldDataSource.DataSet:=DPubFilterSql.DataSet;
        (cxGrid1DBTableView1Field_Name.Properties as TcxComboBoxProperties).Items.Clear;
        if ActivewwDBGrid<>nil then
           for i:=0 to ActivewwDBGrid.FieldCount-1 do
              if (ActivewwDBGrid.Fields[i].Tag<>32) and ActivewwDBGrid.Fields[i].Visible then
                begin
                  (cxGrid1DBTableView1Field_Name.Properties as TcxComboBoxProperties).Items.Add(ActivewwDBGrid.Fields[i].DisplayLabel);
                end;
        if ActiveTreeList<>nil then
           for i:=0 to ActiveTreeList.ColumnCount-1 do
               if ActiveTreeList.Columns[i].Visible then
                  begin
                    (cxGrid1DBTableView1Field_Name.Properties as TcxComboBoxProperties).Items.Add(ActiveTreeList.Columns[i].Caption.Text);
                  end;

      end;
    ShowModal;
  end;
end;

procedure TAModelBrowserFrame.ActionSortExecute(Sender: TObject);
begin
Application.CreateForm(TAPubSortForm, APubSortForm);
APubSortForm.ActiveData:=ActiveData;
APubSortForm.ActivewwDBGrid:=ActivewwDBGrid;
APubSortForm.ShowModal;   
end;

procedure TAModelBrowserFrame.ActionSelectExecute(Sender: TObject);
var i:integer;
begin
//
end;

procedure TAModelBrowserFrame.ActionCalculateExecute(Sender: TObject);
begin
//
end;

procedure TAModelBrowserFrame.ActionOtherExecute(Sender: TObject);
begin
//
end;

procedure TAModelBrowserFrame.ActionSetupExecute(Sender: TObject);
begin
StartDate[1]:=FormatDateTime('yyyy',MyStartDate);
StartDate[2]:=FormatDateTime('m',MyStartDate);
StartDate[3]:=FormatDateTime('d',MyStartDate);
EndDate[1]:=FormatDateTime('yyyy',MyEndDate);
EndDate[2]:=FormatDateTime('m',MyEndDate);
EndDate[3]:=FormatDateTime('d',MyEndDate);
end;

procedure TAModelBrowserFrame.SetMyDate;
begin
if Pos('/',DateTimeToStr(Date))>0 then
   begin
     MyStartDate:=StrToDateTime(StartDate[1]+'/'+StartDate[2]+'/'+StartDate[3]);
     MyEndDate:=StrToDateTime(EndDate[1]+'/'+EndDate[2]+'/'+EndDate[3]);
   end
else
   begin
     MyStartDate:=StrToDateTime(StartDate[1]+'-'+StartDate[2]+'-'+StartDate[3]);
     MyEndDate:=StrToDateTime(EndDate[1]+'-'+EndDate[2]+'-'+EndDate[3]);
   end;
end;

procedure TAModelBrowserFrame.ActionToFileExecute(Sender: TObject);
begin
with ADMSystem.SaveDialog1 do
if Execute then
  begin       //-----------------with-----------------------------------------------------
    if ActiveTreeList<>nil then
       begin
         //FilterIndex:=4;
         //DefaultExt:='txt';
         case FilterIndex of
         1:cxExportTL4ToExcel(SaveFileName,ActiveTreeList,False,True);
         2:cxExportTL4ToHTML(SaveFileName,ActiveTreeList,False,True);
         3:cxExportTL4ToXML(SaveFileName,ActiveTreeList,False,True);
         4:cxExportTL4ToText(SaveFileName,ActiveTreeList,False,True);
         end;
       end;
      if ActivewwDBGrid<>nil then
         begin
           case FilterIndex of
           1:ActivewwDBGrid.ExportOptions.ExportType:=wwgetSYLK;
           2:ActivewwDBGrid.ExportOptions.ExportType:=wwgetHTML;
           3:ActivewwDBGrid.ExportOptions.ExportType:=wwgetXML;
           4:ActivewwDBGrid.ExportOptions.ExportType:=wwgetTxt;
           end;
           ActivewwDBGrid.ExportOptions.Options:=[esoShowHeader,esoShowTitle,esoDblQuoteFields,esoBestColFit,esoShowRecordNo,esoShowAlternating];
           ActivewwDBGrid.ExportOptions.FileName:=SaveFileName;
           ActivewwDBGrid.ExportOptions.Save;
         end;
  end;
  if SaveFileName<>'' then
      try
        ShellExecute(0,nil,Pchar(SaveFileName),nil,nil,SW_SHOWNORMAL);
      except
        ShowWarning('打開文件失敗,沒有安裝打開此文件的應用程式!');
      end;  
end;

procedure TAModelBrowserFrame.ActionPrivewExecute(Sender: TObject);
var liIndex,I: Integer;
begin
if not Assigned(APubReportForm) then
   Application.CreateForm(TAPubReportForm, APubReportForm);
APubReportForm.MenuName:=MenuName;
PubReport.Template.DatabaseSettings.DataPipeline:=APubReportForm.RAiReport;
with APubReportForm do
  begin//with
    Edited:=False;
    if ShowModal=mrOk then
      if QAiReport.RecordCount>0 then
        begin//888
          if QAiReportReport_File.BlobSize<>0 then
             begin//777
               if QAiReportReport_Type.Value='rtm' then
                  try//finally
                    PubReport.Template.DatabaseSettings.DataPipeline:=APubReportForm.RAiReport;
                    PubReport.Template.DatabaseSettings.Name:=QAiReportReport_Id.Value;
                    ReportWhere:=QAiReportReport_Where.Value;
                    PubReport.Template.LoadFromDatabase;
                    GetppDBGrid;
                  if  (PubReport.DataPipeline as TppDBPipeline)<>nil then
                  begin//sss
                   if (ppDBGrid<>nil) and (QAiReportReport_Elect.Value) then
                    begin//666
                     if (ppDBGrid.SelectedList.Count=0)  then
                       begin//111
                        //(PubReport.DataPipeline as TppDBPipeline).ClearBookmarkList;
                        (PubReport.DataPipeline as TppDBPipeline).RangeBegin:=TppRangeBeginType(rbCurrentRecord);
                        (PubReport.DataPipeline as TppDBPipeline).RangeEnd:=TppRangeEndType(rbCurrentRecord);
                        (PubReport.DataPipeline as TppDBPipeline).DataSource.DataSet.DisableControls;
                       end//111
                         else
                          if (ppDBGrid<>nil)  then
                           begin//222
                            (PubReport.DataPipeline as TppDBPipeline).ClearBookmarkList;
                             for liIndex := 0 to ppDBGrid.SelectedList.Count - 1 do
                                 (PubReport.DataPipeline as TppDBPipeline).AddBookmark(Longint(ppDBGrid.SelectedList[liIndex]));
                            (PubReport.DataPipeline as TppDBPipeline).RangeBegin:=TppRangeBeginType(rbFirstRecord);
                            (PubReport.DataPipeline as TppDBPipeline).RangeEnd:=TppRangeEndType(reLastRecord);
                           end;//222
                    end//666
                     else
                      begin//333
                        (PubReport.DataPipeline as TppDBPipeline).RangeBegin:=TppRangeBeginType(rbFirstRecord);
                        (PubReport.DataPipeline as TppDBPipeline).RangeEnd:=TppRangeEndType(reLastRecord);
                      end;//333
                    end;//sss
                    BeforeReport;
                    PubReport.Print;
                  finally//finally
                    AfterReport;
                   if  (PubReport.DataPipeline as TppDBPipeline)<>nil then
                   begin//jjj
                    if ppDBGrid<>nil then
                     if ppDBGrid.SelectedList.Count=0 then
                      (PubReport.DataPipeline as TppDBPipeline).DataSource.DataSet.EnableControls
                        else
                          begin//444
                            ppDBGrid.UnselectAll;
                            (PubReport.DataPipeline as TppDBPipeline).ClearBookmarkList;
                          end;//444
                    end;//jjj
                    PubReport.CloseDataPipelines;
                  end//finally
             end//777
          else
            try//except
              ShellExecute(0,nil,Pchar(QAiReportReport_Link.Value),nil,nil,SW_SHOWNORMAL);
            except//except
              ShowWarning('打開文件失敗,沒有安裝打開此文件的應用程式!');
            end;//except
        end;//888
  end;//with
for i:=0 to ComCount do
 if Components[i] is TMSQuery then
   begin//4096
    if ((TMSQuery(Components[i]).Tag and 4096)>0) and ((TMSQuery(Components[i])).Active) then
     (TMSQuery(Components[i])).Close;
   end;//4096
end;

procedure TAModelBrowserFrame.ActionDesignerExecute(Sender: TObject);
var liIndex: Integer;
begin
if not Assigned(APubReportForm) then
   Application.CreateForm(TAPubReportForm, APubReportForm);
APubReportForm.MenuName:=MenuName;
PubReport.Template.DatabaseSettings.DataPipeline:=APubReportForm.RAiReport;
with APubReportForm do
  begin          //-------------------- with begin ---------------------
    Edited:=True;
    if ShowModal=mrOk then
       if Edited then
          begin//111
            try//finally
              if  (PubReport.DataPipeline as TppDBPipeline)<>nil then
              (PubReport.DataPipeline as TppDBPipeline).DataSource.DataSet.DisableControls;
              PubReport.ArchiveFileName:=GetTempDirectory(QAiReportReport_Link.Value);
              PubReport.Template.New;
              BeforeReport;
              //PubReport.SaveAsTemplate := True;
              PubDesigner.ShowModal;
              PubReport.Template.SaveToDatabase;
              QAiReport.Edit;
              Application.CreateForm(TAPubReportEditorForm, APubReportEditorForm);
              APubReportEditorForm.EditData.DataSet:=QAiReport;
              APubReportEditorForm.FieldRight:=1;
              QAiReportReport_Link.Value:=PubReport.DataPipeline.Name;
              APubReportEditorForm.ShowModal;
            finally//finally
              AfterReport;
              if  (PubReport.DataPipeline as TppDBPipeline)<>nil then
              (PubReport.DataPipeline as TppDBPipeline).DataSource.DataSet.EnableControls;
            end;//finally
          end//111
        else   
        if (QAiReport.RecordCount>0 )and(QAiReportReport_File.BlobSize<>0) then
             begin//444
               if QAiReportReport_Type.Value='rtm' then
                  try//222
                    PubReport.Template.DatabaseSettings.DataPipeline:=APubReportForm.RAiReport;
                    PubReport.Template.DatabaseSettings.Name:=QAiReportReport_Id.Value;
                    ReportWhere:=QAiReportReport_Where.Value;
                    PubReport.Template.LoadFromDatabase;
                    GetppDBGrid;
                  if  (PubReport.DataPipeline as TppDBPipeline)<>nil then
                  begin//jjj
                   if (ppDBGrid<>nil) and (QAiReportReport_Elect.Value) then
                    begin//666
                     if (ppDBGrid.SelectedList.Count=0)  then
                       begin//111
                        //(PubReport.DataPipeline as TppDBPipeline).ClearBookmarkList;
                        (PubReport.DataPipeline as TppDBPipeline).RangeBegin:=TppRangeBeginType(rbCurrentRecord);
                        (PubReport.DataPipeline as TppDBPipeline).RangeEnd:=TppRangeEndType(rbCurrentRecord);
                        (PubReport.DataPipeline as TppDBPipeline).DataSource.DataSet.DisableControls;
                       end//111
                         else
                          if (ppDBGrid<>nil)  then
                           begin//eee
                            (PubReport.DataPipeline as TppDBPipeline).ClearBookmarkList;
                             for liIndex := 0 to ppDBGrid.SelectedList.Count - 1 do
                                 (PubReport.DataPipeline as TppDBPipeline).AddBookmark(Longint(ppDBGrid.SelectedList[liIndex]));
                            (PubReport.DataPipeline as TppDBPipeline).RangeBegin:=TppRangeBeginType(rbFirstRecord);
                            (PubReport.DataPipeline as TppDBPipeline).RangeEnd:=TppRangeEndType(reLastRecord);
                           end;//eee
                    end//666
                     else
                      begin//333
                        (PubReport.DataPipeline as TppDBPipeline).RangeBegin:=TppRangeBeginType(rbFirstRecord);
                        (PubReport.DataPipeline as TppDBPipeline).RangeEnd:=TppRangeEndType(reLastRecord);
                      end;//333
                    end;//jjj
                    BeforeReport;
                    PubReport.SaveAsTemplate := True;    
                   PubDesigner.ShowModal;
                    //PubReport.Template.SaveToDatabase;
                  finally//222
                    AfterReport;
                   if  (PubReport.DataPipeline as TppDBPipeline)<>nil then
                   begin//sss
                    if ppDBGrid<>nil then
                     if ppDBGrid.SelectedList.Count=0 then
                      (PubReport.DataPipeline as TppDBPipeline).DataSource.DataSet.EnableControls
                        else
                          begin//444
                            ppDBGrid.UnselectAll;
                            (PubReport.DataPipeline as TppDBPipeline).ClearBookmarkList;
                          end;//444
                   end;//sss
                  end//222
               else
                 try//333
                   ShellExecute(0,nil,Pchar(QAiReportReport_Link.Value),nil,nil,SW_SHOWNORMAL);
                 except//333
                   ShowWarning('打開文件失敗,沒有安裝打開此文件的應用程式!');
                 end;//333
             end;//444
  end;       //--------------------with end ----------------
end;

procedure TAModelBrowserFrame.ActionPropertExecute(Sender: TObject);
begin
Application.CreateForm(TAPubPropertColumnForm, APubPropertColumnForm);
APubPropertColumnForm.ActiveData:=ActiveData;
APubPropertColumnForm.ActivewwDBGrid:=ActivewwDBGrid;
APubPropertColumnForm.ActiveTreeList:=ActiveTreeList;
APubPropertColumnForm.ShowModal;
end;

procedure TAModelBrowserFrame.SetSCheckStatus(aIndex:integer);
var  RCheck,ECheck:Boolean;
begin//333
if FActiveData.DataSet.FindField('RCheck')<>nil then
 RCheck:=FActiveData.DataSet.FindField('RCheck').AsBoolean
 else
  RCheck:=False;
if FActiveData.DataSet.FindField('ECheck')<>nil then
 ECheck:=FActiveData.DataSet.FindField('ECheck').AsBoolean
  else
   ECheck:=False;
try
with FActiveData.DataSet do
case aIndex of
1:if (Tag and 8)>0 then
  begin
    if (FieldByName('FCheck').AsBoolean=True) and ((RCheck=True) or (ECheck=True)) then
    begin
     ShowWarning('操作失敗!!!');
     Exit;
    end;
    FCheckUpdate:=True;
    Edit;
    FieldByName('FCheck').AsBoolean:=not FieldByName('FCheck').AsBoolean;
    if FieldByName('FCheck').AsBoolean then
      begin
       FieldByName('FCheck_Name').AsString:=UserName;
        if FindField('FCheck_Date')<>nil then
           FieldByName('FCheck_Date').Value:=Now;
      end
    else
      begin
       FieldByName('FCheck_Name').AsString:='';
       if FindField('FCheck_Date')<>nil then
         FieldByName('FCheck_Date').AsVariant:=Null;
      end;
    Post;
    FCheckUpdate:=False;
  end;
2:if (Tag and 16)>0 then
  begin
    if ((FieldByName('RCheck').AsBoolean=False) and (FieldByName('FCheck').AsBoolean=False)) or ((FieldByName('RCheck').AsBoolean=True) and (ECheck=True)) then
    begin
     ShowWarning('操作失敗!!!');
     Exit;
    end;
    FCheckUpdate:=True;
    Edit;
    FieldByName('RCheck').AsBoolean:=not FieldByName('RCheck').AsBoolean;
    if FieldByName('RCheck').AsBoolean then
      begin
       FieldByName('RCheck_Name').AsString:=UserName;
       if FindField('RCheck_Date')<>nil then
         FieldByName('RCheck_Date').Value:=Now;
      end
    else
      begin
       FieldByName('RCheck_Name').AsString:='';
       if FindField('RCheck_Date')<>nil then
         FieldByName('RCheck_Date').AsVariant:=Null;
      end;
    Post;
    FCheckUpdate:=False;
  end;
3:if (Tag and 32)>0 then
  begin//222
    if (FieldByName('ECheck').AsBoolean=False) and ((FieldByName('FCheck').AsBoolean=False) or (FieldByName('RCheck').AsBoolean=False))then
    begin//111
     ShowWarning('操作失敗!!!');
     Exit;
    end;//111
    FCheckUpdate:=True;
    Edit;
    FieldByName('ECheck').AsBoolean:=not FieldByName('ECheck').AsBoolean;
    if FieldByName('ECheck').AsBoolean then
     begin
       FieldByName('ECheck_Name').AsString:=UserName;
       if FindField('ECheck_Date')<>nil then
         FieldByName('ECheck_Date').Value:=Now;
     end
    else
     begin
       FieldByName('ECheck_Name').AsString:='';
       if FindField('ECheck_Date')<>nil then
         FieldByName('ECheck_Date').AsVariant:=Null;
     end;
    Post;
    FCheckUpdate:=False;
  end;//222
end;
except
FActiveData.DataSet.Cancel;
end;
end;//333

procedure TAModelBrowserFrame.SetMCheckStatus(aIndex:integer);
  function CheckSelectlistChecked(aIndex: integer): boolean;
    var MyFCheck,MyRCheck,MyECheck,MyResult:Boolean;
        i:integer;
  begin
    MyResult:=True;
    with ActivewwDBGrid,ActiveData.DataSet do
     begin
      DisableControls;
      for i:= 0 to  SelectedList.Count-1 do
        begin
         GotoBookmark(SelectedList.items[i]);
         TMSQuery(ActiveData.DataSet).RefreshRecord;
           if i=0 then
             begin
               if (Tag and 8)>0 then
                  MyFCheck:=ActiveData.DataSet.FieldByName('FCheck').AsBoolean;
               if (Tag and 16)>0 then
                  MyRCheck:=ActiveData.DataSet.FieldByName('RCheck').AsBoolean;
               if (Tag and 32)>0 then
                  MyECheck:=ActiveData.DataSet.FieldByName('ECheck').AsBoolean;
             end
           else
             if ((Tag and 8)>0) and (ActiveData.DataSet.FieldByName('FCheck').AsBoolean<>MyFCheck) then
                begin
                  MyResult:=False;
                  ShowWarning('選取的資料審核狀態不一致!!!');
                  Break;
                end
             else
             if ((Tag and 16)>0) and (ActiveData.DataSet.FieldByName('RCheck').AsBoolean<>MyRCheck) then
                begin
                  MyResult:=False;
                  ShowWarning('選取的資料復核狀態不一致!!!');
                  Break;
                end
             else
             if ((Tag and 32)>0) and (ActiveData.DataSet.FieldByName('ECheck').AsBoolean<>MyECheck) then
                begin
                  MyResult:=False;
                  ShowWarning('選取的資料核準狀態不一致!!!');
                  Break;
                end;
        end;
      EnableControls;
     end;
    Result:=MyResult;
  end;
var i:integer;
begin
IsCopy:=False;
IsUpdate:=False;

if (ActivewwDBGrid<>nil) and (ActivewwDBGrid.SelectedList.Count>0) then
begin
  if CheckSelectlistChecked(aIndex) then
    with ActivewwDBGrid,ActiveData.DataSet do
     begin
      DisableControls;
      for i:= 0 to  SelectedList.Count-1 do
        begin
           GotoBookmark(SelectedList.items[i]);
           TMSQuery(ActiveData.DataSet).RefreshRecord;
           SetSCheckStatus(aIndex);
           Freebookmark(SelectedList.items[i]);
        end;
      SelectedList.clear;
      EnableControls;
     end;
end
else
  begin
   TMSQuery(ActiveData.DataSet).RefreshRecord;
   SetSCheckStatus(aIndex);
  end;
end;

procedure TAModelBrowserFrame.ActionFCheckExecute(Sender: TObject);
begin
SetMCheckStatus(1);
end;

procedure TAModelBrowserFrame.ActionRCheckExecute(Sender: TObject);
begin
SetMCheckStatus(2);
end;

procedure TAModelBrowserFrame.ActionECheckExecute(Sender: TObject);
begin
SetMCheckStatus(3);
end;

procedure TAModelBrowserFrame.ActionSelectAllExecute(Sender: TObject);
begin
if ActiveTreeList<>nil then
   ActiveTreeList.SelectAll;
if ActivewwDBGrid<>nil then
  with ActivewwDBGrid do
    begin
       SelectAll;
       if SelectedList.Count>0 then
          MyStatusBar.Panels[5].Text:='選擇筆數: '+IntToStr(SelectedList.Count)
       else
          MyStatusBar.Panels[5].Text:='';
    end;
end;

procedure TAModelBrowserFrame.ActionUnSelectAllExecute(Sender: TObject);
begin
if ActiveTreeList<>nil then
   ActiveTreeList.ClearSelection;
if ActivewwDBGrid<>nil then
  with ActivewwDBGrid do
    begin
       UnselectAll;
       if SelectedList.Count>0 then
          MyStatusBar.Panels[5].Text:='選擇筆數: '+IntToStr(SelectedList.Count)
       else
          MyStatusBar.Panels[5].Text:='';
    end;
end;

procedure TAModelBrowserFrame.CreateEditForm(const AFormName: string);
var
  AForm:TAModelEditorForm;
  AFrormClass:TAModelEditorFormClass;
begin
AForm:=nil;
AFrormClass:=TAModelEditorFormClass(GetClass(AFormName));
if AFrormClass<>nil then
 try
    AForm:=AFrormClass.Create(Self);
    AForm.EditData.DataSet:=FActiveData.DataSet;
    if (FActiveData.DataSet.Tag and 512)>0 then
       begin
         AForm.DSizeType.DataSet:=FActiveSizeType.DataSet;
         AForm.SetSizeRunDisplay;
       end;
    AForm.HasChildren:=HasChildren;
    AForm.FieldRight:=FieldRight;
    BeforeEditFormOnShow;
    AForm.WhereStr:=WhereStr;
    AForm.TempOtherStr:=TempOtherStr;
    AForm.TempEditStr:=TempEditStr;
    AForm.TempEditStr1:=TempEditStr1;
    AForm.TempEditStr2:=TempEditStr2;
    AForm.TempEditStr3:=TempEditStr3;
    AForm.TempEditBool:=TempEditBool;
    AForm.DetailRecorded:=DetailRecorded;
    AForm.ActivewwDBGrid:=ActivewwDBGrid;
    if SetSelected then
      AForm.Caption:='多筆修改'
    else
    if FActiveData.State=dsInsert then
       AForm.Caption:='新增資料'
    else
    if FActiveData.State=dsEdit then
       AForm.Caption:='修改資料'
    else
       AForm.Caption:='瀏覽資料';
    AForm.ShowModal;
 finally
   AForm.Free;
 end;

end;

function TAModelBrowserFrame.GetEditFormName: string;
begin
QAPubDataOpen(Format('SELECT  DLL_Name FROM dbo.Ad_DataSet WHERE Menu_Name=''%S'' AND DataSet_Name=''%S''',[FMenuName,FActiveData.DataSet.Name]));
Result:=ADMSystem.QAPubData.FieldByName('DLL_Name').AsString;
QAPubDataClose;
end;

procedure TAModelBrowserFrame.BeforeEditFormOnShow;
begin
//
end;

procedure TAModelBrowserFrame.SetActionRights;
  function GetChecked:boolean;     //檢察此資料的上一層是否審核
  var MyDataSource:TDataSource;
      MyChecked:boolean;
  begin
    MyChecked:=False;
    MyDataSource:=ActiveData;
    if not((MyDataSource.DataSet.Tag and 8)>0) then
       while (MyDataSource.DataSet as TMSQuery).MasterSource<>nil do
         begin
           MyDataSource:=(MyDataSource.DataSet as TMSQuery).MasterSource;
           if ((MyDataSource.DataSet.Tag and 8)>0) then
             Break;
         end;
    if (MyDataSource.DataSet.Tag and 8)>0 then
       MyChecked:=MyDataSource.DataSet.FieldByName('FCheck').AsBoolean;
    Result:=MyChecked;
  end;
  function GetVChecked(Index:integer):boolean;
  var MyChecked:boolean;
  begin
    MyChecked:=False;
    case Index of
    1:if ((ActiveData.DataSet.Tag and 8)>0) then
         MyChecked:=ActiveData.DataSet.FieldByName('FCheck').AsBoolean;
    2:if ((ActiveData.DataSet.Tag and 16)>0) then
         MyChecked:=ActiveData.DataSet.FieldByName('RCheck').AsBoolean;
    3:if ((ActiveData.DataSet.Tag and 32)>0) then
         MyChecked:=ActiveData.DataSet.FieldByName('ECheck').AsBoolean;
    end;
    Result:=MyChecked;
  end;
  function GetDeleted:boolean;
  begin
    Result:=True;//(not((ActiveData.DataSet.Tag and 128)>0))or((ActiveData.DataSet.Tag and 128)>0)and(ActiveData.DataSet.FieldByName('Create_Name').AsString=UserName);
  end;
  function GetIsRecord:boolean;
  begin
    Result:=(ActiveData.DataSet as TMSQuery).MasterSource.DataSet.RecordCount>0;
  end;
var MyChecked:boolean;
begin
if ActiveData=nil then
   Exit;
if (ActiveData.DataSet as TMSQuery).MasterSource=nil then
  begin
    MyChecked:=GetVChecked(1);
    ActionNew.Enabled:=((ActionNew.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 1)>0)and Newed;
    ActionEdit.Enabled:=(((ActionEdit.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 2)>0)and((not MyChecked) or (CheckEdited))and(ActiveData.DataSet.RecordCount>0) and Edited) ;
    ActionDelete.Enabled:=((ActionDelete.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 4)>0)and GetDeleted and(not MyChecked)and(ActiveData.DataSet.RecordCount>0) and Deleted;
    ActionFCheck.Enabled:=((ActionFCheck.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 8)>0)and(not GetVChecked(2))and(ActiveData.DataSet.RecordCount>0)and NewChecked;
    ActionRCheck.Enabled:=((ActionRCheck.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 16)>0)and(not GetVChecked(3))and(GetVChecked(1))and(ActiveData.DataSet.RecordCount>0)and NewChecked;
    ActionECheck.Enabled:=((ActionECheck.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 32)>0)and(GetVChecked(2))and(ActiveData.DataSet.RecordCount>0)and NewChecked;
  end
else
  begin
    MyChecked:=GetChecked;
    if (ActiveData.DataSet.Tag and 8)>0 then
       ActionNew.Enabled:=((ActionNew.Tag and FActionRight)>0)and GetIsRecord and((ActiveData.DataSet.Tag and 1)>0) and Newed
    else
       ActionNew.Enabled:=((ActionNew.Tag and FActionRight)>0)and GetIsRecord and((ActiveData.DataSet.Tag and 1)>0)and(not MyChecked) and Newed;
    ActionEdit.Enabled:=(((ActionEdit.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 2)>0)and((not MyChecked) or (CheckEdited))and(ActiveData.DataSet.RecordCount>0) and Edited) ;
    ActionDelete.Enabled:=((ActionDelete.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 4)>0)and GetDeleted and(not MyChecked)and(ActiveData.DataSet.RecordCount>0) and Deleted;
    ActionFCheck.Enabled:=((ActionFCheck.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 8)>0)and(not GetVChecked(2))and(ActiveData.DataSet.RecordCount>0)and NewChecked;
    ActionRCheck.Enabled:=((ActionRCheck.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 16)>0)and(not GetVChecked(3))and(GetVChecked(1))and(ActiveData.DataSet.RecordCount>0)and NewChecked;
    ActionECheck.Enabled:=((ActionECheck.Tag and FActionRight)>0)and((ActiveData.DataSet.Tag and 32)>0)and(ActiveData.DataSet.RecordCount>0)and NewChecked;
  end;
ActionSelectAll.Visible:=ActivewwDBGrid<>nil;
ActionUnSelectAll.Visible:=ActivewwDBGrid<>nil;
ActionCollapse.Visible:=ActiveTreeList<>nil;
ActionExpand.Visible:=ActiveTreeList<>nil;

ActionSelectAll.Enabled:=ActiveData.DataSet.RecordCount>0;
ActionUnSelectAll.Enabled:=ActiveData.DataSet.RecordCount>0;
if GetVChecked(1) then ActionFCheck.ImageIndex:=39 else ActionFCheck.ImageIndex:=38;
if GetVChecked(2) then ActionRCheck.ImageIndex:=39 else ActionRCheck.ImageIndex:=38;
if GetVChecked(3) then ActionECheck.ImageIndex:=39 else ActionECheck.ImageIndex:=38;
MyStatusBar.Panels[4].Text:= IntToStr(ActiveData.DataSet.RecNo)+'/'+IntToStr(ActiveData.DataSet.RecordCount);
end;

procedure TAModelBrowserFrame.SetSepsatatorVisible;
begin
SptRefresh.Visible:=(ActionNew.Visible or ActionEdit.Visible or ActionDelete.Visible or ActionCopy.Visible or ActionPaste.Visible);
SptSelect.Visible:=(ActionSelect.Visible or ActionCalculate.Visible or ActionCalculate.Visible or ActionSetup.Visible);
SptToFile.Visible:=(ActionToFile.Visible or ActionPrivew.Visible or ActionDesigner.Visible or ActionPropert.Visible);
SptFCheck.Visible:=(ActionFCheck.Visible or ActionRCheck.Visible or ActionECheck.Visible);

MenuRefresh.Visible:=SptRefresh.Visible;
MenuSelect.Visible:=SptSelect.Visible;
end;

procedure TAModelBrowserFrame.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
SetActionRights;
end;

procedure TAModelBrowserFrame.AfterReport;
begin
//
end;

procedure TAModelBrowserFrame.BeforeReport;
begin
//
end;

procedure TAModelBrowserFrame.GridDblClick(Sender: TObject);
begin
if ActiveData.DataSet.RecordCount=0 then
  begin
   if ActionNew.Enabled then
      ActionNew.Execute;
  end
else
  begin
   if ActionEdit.Enabled then
      ActionEdit.Execute
   else
      ActionEditExecute(ActionEdit);
  end;
end;


procedure TAModelBrowserFrame.SplitterAfterClose(Sender: TObject);
begin
if (Sender as TcxSplitter).Control is TwwDBGrid then
   TwwDBGrid((Sender as TcxSplitter).Control).DataSource.DataSet.Close
else
if (Sender as TcxSplitter).Control is TcxDBTreeList then
   TcxDBTreeList((Sender as TcxSplitter).Control).DataController.DataSource.DataSet.Close;
end;

procedure TAModelBrowserFrame.SplitterBeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
if (Sender as TcxSplitter).Control is TwwDBGrid then
   begin
     TwwDBGrid((Sender as TcxSplitter).Control).DataSource.DataSet.Open;
     if (TwwDBGrid((Sender as TcxSplitter).Control).DataSource.DataSet.Tag and 512)>0 then
        SizeKeyAfterScroll(FActiveSizeKey.DataSet);
   end
else
if (Sender as TcxSplitter).Control is TcxDBTreeList then
   TcxDBTreeList((Sender as TcxSplitter).Control).DataController.DataSource.DataSet.Open;
end;

procedure TAModelBrowserFrame.cxDBTreeListOnEnter(Sender: TObject);
begin
FActivewwDBGrid:=nil;
FActiveTreeList:=TcxDBTreeList(Sender);
FActiveIndex:=TcxDBTreeList(Sender).Tag;
ActiveData:=TcxDBTreeList(Sender).DataController.DataSource;
end;

procedure TAModelBrowserFrame.NodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
if (Sender as TcxDBTreeList).DataController.DataSource.DataSet.Active and ((Sender as TcxDBTreeList).DataController.DataSource.DataSet.RecordCount>0) then
    FHasChildren:=not AFocusedNode.HasChildren;
end;

procedure TAModelBrowserFrame.wwDBGridEnter(Sender: TObject);
begin
FActiveTreeList:=nil;
FActivewwDBGrid:=TwwDBGrid(Sender);
FActiveIndex:=TwwDBGrid(Sender).Tag;
ActiveData:=TwwDBGrid(Sender).DataSource;
end;

procedure TAModelBrowserFrame.MsQueryBeforePost(DataSet: TDataSet);
var Tempstr:string;i:integer;Tempbool:Boolean;
begin
Tempbool:=False;
with DataSet do
  if State=dsInsert then
     begin
       if (DataSet.Tag and 128)>0 then
         begin
           FieldByName('Create_Name').AsString:=UserName;
           FieldByName('Create_Date').AsString:=GetDateTime;
         end;
       if (Tag and 8)>0  then FieldByName('FCheck').AsBoolean:=False;
       if (Tag and 16)>0 then FieldByName('RCheck').AsBoolean:=False;
       if (Tag and 32)>0 then FieldByName('ECheck').AsBoolean:=False;
     end
  else
  if  State =dsEdit then
      begin
       if (DataSet.Tag and 128)>0 then
         begin
          for i:=0  to Fields.Count-1 do
           if (Fields[i].IsBlob=False) then
            if (Fields[i].NewValue=Fields[i].OldValue) then
              Tempstr:=Tempstr+Fields[i].FieldName+'※'+Fields[i].AsString+'●'
                else
                 begin
                  Tempstr:=Tempstr+Fields[i].FieldName+'【'+VarToStr(Fields[i].OldValue)+'◎'+Fields[i].AsString+'】●';
                  Tempbool:=True;
                 end;
               if Tempbool then
                 begin
                  if not (ADMSystem.QAup_log.Active) then  ADMSystem.QAup_log.Active:=True;
                  ADMSystem.QAup_log.Insert;
                  ADMSystem.QAup_logPc_Name.Value:=PCName;
                  ADMSystem.QAup_logPc_User.Value:=UsersName;
                  ADMSystem.QAup_logUser_Id.Value:=UserId;
                  ADMSystem.QAup_logItem_No.Value:=FileItem;
                  ADMSystem.QAup_logMenu_Name.Value:=FMenuName;
                  ADMSystem.QAup_logDataSet_Name.Value:=(FActiveData.DataSet AS TMSQuery).Name;
                  ADMSystem.QAup_logRemark.Value:=Tempstr;
                  ADMSystem.QAup_log.Post;
                  FieldByName('Upd_Name').AsString:=UserName;
                  FieldByName('Upd_Date').AsString:=GetDateTime;
                 end;
         end;
      end;
if (ActiveSizeRun1<>nil) or (ActiveSizeRun1<>nil) then
    SizeKeyAfterScroll(ActiveSizeKey.DataSet);      
end;


function TAModelBrowserFrame.GetDataSetTag(DataSetName: string): integer;
begin
ADMSystem.QAPubTag.SQL.Clear;
ADMSystem.QAPubTag.SQL.Add(Format('SELECT  DataSet_Tag FROM dbo.Ad_DataSet WHERE Menu_Name=''%S'' AND DataSet_Name=''%S''',[FMenuName,DataSetName]));
ADMSystem.QAPubTag.Open;
Result:=ADMSystem.QAPubTag.FieldByName('DataSet_Tag').AsInteger;
ADMSystem.QAPubTag.Close;
end;

function TAModelBrowserFrame.GetDataSetSort(DataSetName: string): string;
begin
ADMSystem.QAPubTag.SQL.Clear;
ADMSystem.QAPubTag.SQL.Add(Format('SELECT  DataSet_Sort FROM dbo.Ad_DataSet WHERE Menu_Name=''%S'' AND DataSet_Name=''%S''',[FMenuName,DataSetName]));
ADMSystem.QAPubTag.Open;
Result:=ADMSystem.QAPubTag.FieldByName('DataSet_Sort').AsString;
ADMSystem.QAPubTag.Close;
end;

procedure TAModelBrowserFrame.GetSelectWhere;
begin
//
end;

procedure TAModelBrowserFrame.SizeKeyAfterScroll(DataSet: TDataSet);
var ATempStr:string;
begin
if ((FActiveSizeRun1<>nil) and FActiveSizeRun1.DataSet.Active)or((FActiveSizeRun2<>nil) and FActiveSizeRun2.DataSet.Active) then
  begin
   ATempStr:=(FActiveSizeType.DataSet as TMSQuery).FilterSQL;
   TempString:='Size_Type='''+FActiveSizeKey.DataSet.FieldByName('Size_Type').AsString+'''';
   (FActiveSizeType.DataSet as TMSQuery).FilterSQL:='Size_Type='''+FActiveSizeKey.DataSet.FieldByName('Size_Type').AsString+'''';
   if (FActiveSizeType.DataSet as TMSQuery).FilterSQL<>ATempStr then
      SetSizeRunDisplayLabel;
  end;
end;

procedure TAModelBrowserFrame.SizeKeyAfterRefresh(DataSet: TDataSet);
begin
SizeKeyAfterScroll(DataSet);
end;

procedure TAModelBrowserFrame.SetSizeRunDisplayLabel;
var i:integer;
    ATempStr:string;
begin
if (FActiveSizeRun1<>nil) and FActiveSizeRun1.DataSet.Active then
  for i:=0 to FActiveSizeRun1.DataSet.FieldCount-1 do
    if (Copy(FActiveSizeRun1.DataSet.Fields[i].FieldName,1,4)='Size')and(Copy(FActiveSizeRun1.DataSet.Fields[i].FieldName,5,1)<>'_') then
       begin
         if FActiveSizeType.DataSet.RecordCount>0 then
            begin
             ATempStr:=FActiveSizeType.DataSet.FieldByName(FActiveSizeRun1.DataSet.Fields[i].FieldName).AsString;
             FActiveSizeRun1.DataSet.Fields[i].DisplayLabel:=ATempStr;
             FActiveSizeRun1.DataSet.Fields[i].Visible:=ATempStr<>'';
             if ATempStr<>'' then
                FActiveSizeRun1.DataSet.Fields[i].Tag:=1
             else
                FActiveSizeRun1.DataSet.Fields[i].Tag:=32;
            end
         else
            begin
             FActiveSizeRun1.DataSet.Fields[i].DisplayLabel:=' ';
             FActiveSizeRun1.DataSet.Fields[i].Visible:=False;
             FActiveSizeRun1.DataSet.Fields[i].Tag:=32;
            end;
       end;
if (FActiveSizeRun2<>nil) and FActiveSizeRun2.DataSet.Active then
  for i:=0 to FActiveSizeRun2.DataSet.FieldCount-1 do
    if (Copy(FActiveSizeRun2.DataSet.Fields[i].FieldName,1,4)='Size')and(Copy(FActiveSizeRun2.DataSet.Fields[i].FieldName,5,1)<>'_') then
       begin
         if FActiveSizeType.DataSet.RecordCount>0 then
            begin
             ATempStr:=FActiveSizeType.DataSet.FieldByName(FActiveSizeRun2.DataSet.Fields[i].FieldName).AsString;
             FActiveSizeRun2.DataSet.Fields[i].DisplayLabel:=ATempStr;
             FActiveSizeRun2.DataSet.Fields[i].Visible:=ATempStr<>'';
             if ATempStr<>'' then
                FActiveSizeRun2.DataSet.Fields[i].Tag:=1
             else
                FActiveSizeRun2.DataSet.Fields[i].Tag:=32;
            end
         else
            begin
             FActiveSizeRun2.DataSet.Fields[i].DisplayLabel:=' ';
             FActiveSizeRun2.DataSet.Fields[i].Visible:=False;
             FActiveSizeRun2.DataSet.Fields[i].Tag:=32;
            end;
       end;
end;

procedure TAModelBrowserFrame.wwDBGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
if FCheckData<>nil then
  begin
    if FCheckData.DataSet.Tag and 32 >0 then
      begin
        if (not FCheckData.DataSet.FieldByName('ECheck').AsBoolean) and (FCheckData.DataSet.FieldByName('RCheck').AsBoolean)  then
           AFont.Color:=clMaroon
        else
        if (not FCheckData.DataSet.FieldByName('RCheck').AsBoolean) and (FCheckData.DataSet.FieldByName('FCheck').AsBoolean)  then
           AFont.Color:=clFuchsia
        else
         if not FCheckData.DataSet.FieldByName('FCheck').AsBoolean then
            AFont.Color:=clRed;
      end
    else
    if FCheckData.DataSet.Tag and 16 >0 then
       begin
        if (not FCheckData.DataSet.FieldByName('RCheck').AsBoolean) and (FCheckData.DataSet.FieldByName('FCheck').AsBoolean)  then
           AFont.Color:=clFuchsia
        else
         if not FCheckData.DataSet.FieldByName('FCheck').AsBoolean then
            AFont.Color:=clRed;
       end
    else
    if FCheckData.DataSet.Tag and 8 >0 then
       if not FCheckData.DataSet.FieldByName('FCheck').AsBoolean then
          AFont.Color:=clRed;
  end;
if (Field.FieldName='Selected') then
   ABrush.Color:= clBtnFace;
end;

procedure TAModelBrowserFrame.wwDBGridCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
var ATempStr,AField:string;
begin
ATempStr:=(Sender as TwwDBGrid).Hint;//GroupFieldName;
if ATempStr='' then Exit;
while Pos(',',ATempStr)>0 do
  begin
    AField:=Copy(ATempStr,1,Pos(',',ATempStr)-1);
    if AField=Field.FieldName+' ASC' then
      begin
        TitleImageAttributes.imageIndex:= 32;
        Exit;
      end;
    if AField=Field.FieldName+' DESC' then
      begin
       TitleImageAttributes.imageIndex:=33;
      end;
    Delete(ATempStr,1,Pos(',',ATempStr));
  end;
AField:=ATempStr;
if AField=Field.FieldName+' ASC' then
  begin
    TitleImageAttributes.imageIndex:= 32;
    Exit;
  end;
if AField=Field.FieldName+' DESC' then
  begin
    TitleImageAttributes.imageIndex:=33;
  end;

end;

procedure TAModelBrowserFrame.wwDBGridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
with (Sender as TwwDBGrid).DataSource.DataSet as TMSQuery do
  if FieldByName(AFieldName).FieldKind=fkData  then
    begin
      if (Sender as TwwDBGrid).Hint=AFieldName+' ASC' then
         (Sender as TwwDBGrid).Hint:=AFieldName+' DESC'
      else
         (Sender as TwwDBGrid).Hint:=AFieldName+' ASC';
       IndexFieldNames:=(Sender as TwwDBGrid).Hint;
      //SetOrderBy((Sender as TwwDBGrid).Hint);
      //Open;
    end;
end;

procedure TAModelBrowserFrame.wwDBGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
with  (Sender as TwwDBGrid) do
if SelectedList.Count>0 then
  MyStatusBar.Panels[5].Text:='選擇筆數: '+IntToStr(SelectedList.Count)
else
  MyStatusBar.Panels[5].Text:='';
end;

procedure TAModelBrowserFrame.ActionCollapseExecute(Sender: TObject);
begin
if (ActiveTreeList<>nil)and((Sender as TAction).ImageIndex=26) then
    FActiveTreeList.FullCollapse;
end;

procedure TAModelBrowserFrame.ActionExpandExecute(Sender: TObject);
begin
if (ActiveTreeList<>nil)and((Sender as TAction).ImageIndex=27) then
    FActiveTreeList.FullExpand;
end;

procedure TAModelBrowserFrame.ActionShowAllExecute(Sender: TObject);
begin
if (ActiveTreeList<>nil) then
    (ActiveData.DataSet as TMSQuery).FilterSQL:='';
end;

end.
