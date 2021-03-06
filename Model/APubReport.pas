unit APubReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGroupBox, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, cxContainer, cxLabel, SHellApi ,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxImage, ppComm, ppEndUsr,
  MemDS, DBAccess, MSAccess, ppRelatv, ppDB, ppDBPipe, Menus;

type
  TAPubReportForm = class(TForm)
    StatusBar1: TStatusBar;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    DAiReport: TDataSource;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxImage1: TcxImage;
    PopupMenu1: TPopupMenu;
    MenuNew: TMenuItem;
    MenuEdit: TMenuItem;
    MenuDelete: TMenuItem;
    MenuExcelNew: TMenuItem;
    RAiReport: TppDBPipeline;
    QAiReport: TMSQuery;
    QAiReportMenu_Name: TStringField;
    QAiReportReport_Id: TStringField;
    QAiReportReport_Desc: TStringField;
    QAiReportReport_Type: TStringField;
    QAiReportReport_Link: TStringField;
    QAiReportReport_File: TBlobField;
    QAiReportUpd_Date: TDateTimeField;
    QAiReportUpd_Name: TStringField;
    cxGrid1DBTableView1Menu_Name: TcxGridDBColumn;
    cxGrid1DBTableView1Report_Id: TcxGridDBColumn;
    cxGrid1DBTableView1Report_Desc: TcxGridDBColumn;
    cxGrid1DBTableView1Report_Type: TcxGridDBColumn;
    cxGrid1DBTableView1Report_Link: TcxGridDBColumn;
    cxGrid1DBTableView1Report_File: TcxGridDBColumn;
    cxGrid1DBTableView1Upd_Date: TcxGridDBColumn;
    cxGrid1DBTableView1Upd_Name: TcxGridDBColumn;
    QAiReportReport_Where: TStringField;
    QAiReportReport_Elect: TBooleanField;
    cxGrid1DBTableView1Report_Elect: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuNewClick(Sender: TObject);
    procedure MenuEditClick(Sender: TObject);
    procedure MenuDeleteClick(Sender: TObject);
    procedure MenuExcelNewClick(Sender: TObject);
    procedure QAiReportBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FEdited:boolean;
    FMenuName:string;
    FReportDesc:string;
  public
    { Public declarations }
    property  Edited:boolean read FEdited write FEdited;
    property  MenuName:string read FMenuName write FMenuName;
    property  ReportDesc:string read FReportDesc write FReportDesc;
  end;

var
  APubReportForm: TAPubReportForm;

implementation

uses AData, APubUnit, APubReportEditor, AModelBrowser, AModelMain;

{$R *.dfm}

procedure TAPubReportForm.FormCreate(Sender: TObject);
begin
if EditIsColor then
   begin
     cxGroupBox1.Color:=ADMSystem.cxStyleBackGround.Color;
     cxGrid1DBTableView1.Styles.StyleSheet:=ADMSystem.GridTableViewStyle;
   end;
end;

procedure TAPubReportForm.FormShow(Sender: TObject);
begin
if Edited then
   cxGrid1.PopupMenu:=PopupMenu1
else
   cxGrid1.PopupMenu:=nil;
Edited:=False;
QAiReport.FilterSQL:='Menu_Name='''+MenuName+'''';
if not QAiReport.Active then
   QAiReport.Open;
end;

procedure TAPubReportForm.FormDestroy(Sender: TObject);
begin
QAiReport.Close;
end;

procedure TAPubReportForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TAPubReportForm.MenuNewClick(Sender: TObject);
begin
QAiReportReport_Type.Tag:=0;
Edited:=True;
ModalResult:=mrOk;
end;

procedure TAPubReportForm.MenuEditClick(Sender: TObject);
begin
if QAiReportReport_Type.Value='rtm' then
   QAiReportReport_Type.Tag:=0
else
   QAiReportReport_Type.Tag:=1;
QAiReport.Edit;
Application.CreateForm(TAPubReportEditorForm, APubReportEditorForm);
APubReportEditorForm.EditData.DataSet:=QAiReport;
APubReportEditorForm.FieldRight:=1;
APubReportEditorForm.ShowModal;
end;

procedure TAPubReportForm.MenuDeleteClick(Sender: TObject);
begin
QAiReport.Delete;
end;

procedure TAPubReportForm.MenuExcelNewClick(Sender: TObject);
begin
QAiReportReport_Type.Tag:=1;
QAiReport.Append;
Application.CreateForm(TAPubReportEditorForm, APubReportEditorForm);
APubReportEditorForm.EditData.DataSet:=QAiReport;
APubReportEditorForm.FieldRight:=1;
APubReportEditorForm.ShowModal;
end;

procedure TAPubReportForm.QAiReportBeforePost(DataSet: TDataSet);
begin
if DataSet.State=dsInsert then
   begin
     QAiReportMenu_Name.Value:=MenuName;
     QAPubDataOpen(Format('SELECT   ISNULL(MAX(Cast(Report_Id as Int)),0) AS Report_Id  FROM  dbo.Ai_Report WHERE Menu_Name=''%S''',[MenuName]));
     QAiReportReport_Id.Value:=IntToStr(ADMSystem.QAPubData.FieldByName('Report_Id').AsInteger+1);
     QAPubDataClose;
     if QAiReportReport_Type.Tag=0 then
        QAiReportReport_Type.Value:='rtm';
   end;
end;

end.
