inherited POFrame: TPOFrame
  Width = 905
  Height = 586
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  inherited CoolBar1: TCoolBar
    Width = 905
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 35
        Width = 901
      end>
    inherited ToolBar1: TToolBar
      Width = 888
    end
  end
  object wwDBGrid1: TwwDBGrid [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 905
    Height = 339
    HelpType = htKeyword
    Selected.Strings = (
      'Pur_No'#9'17'#9'Pur_No'
      'Pur_Date'#9'12'#9'Pur_Date'
      'Vendor'#9'15'#9'Vendor'
      'Remark'#9'720'#9'Remark'
      'Remark1'#9'720'#9'Remark1'
      'Create_Name'#9'13'#9'Create_Name'
      'Create_Date'#9'22'#9'Create_Date'
      'Upd_Name'#9'12'#9'Upd_Name'
      'Upd_Date'#9'22'#9'Upd_Date'
      'Made_Factory'#9'15'#9'Made_Factory')
    IniAttributes.Delimiter = ';;'
    ExportOptions.ExportType = wwgetSYLK
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
    Align = alClient
    DataSource = DTePurchase
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    KeyOptions = []
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    TitleImageList = ADMSystem.ImageList1
  end
  object wwDBGrid2: TwwDBGrid [2]
    Tag = 2
    Left = 0
    Top = 386
    Width = 905
    Height = 200
    HelpType = htKeyword
    Selected.Strings = (
      'Selected'#9'5'#9'Selected'#9'F'#9
      'Str_Auto'#9'12'#9'Str_Auto'#9'F'#9
      'Vnd_Qty'#9'10'#9'Vnd_Qty'#9'F'#9
      'Pay_Qty'#9'10'#9'Pay_Qty'#9'F'#9
      'Qua_Qty'#9'10'#9'Qua_Qty'#9'F'#9
      'UnQua_Qty'#9'10'#9'UnQua_Qty'#9'F'#9
      'Inout_Wt'#9'10'#9'Inout_Wt'#9'F'#9
      'Aply_Type'#9'4'#9'Aply_Type'#9'F'#9
      'Remark'#9'100'#9'Remark'#9'F'#9)
    IniAttributes.Delimiter = ';;'
    ExportOptions.ExportType = wwgetSYLK
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
    Align = alBottom
    DataSource = DTePurchasea
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    KeyOptions = []
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    TitleImageList = ADMSystem.ImageList1
  end
  object cxSplitter1: TcxSplitter [3]
    Left = 0
    Top = 378
    Width = 905
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Control = wwDBGrid2
  end
  object QTePurchase: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT * FROM [CNData].[dbo].[Te_Purchase]')
    AfterPost = QTePurchaseAfterPost
    IndexFieldNames = #39'Pur_Date'#39' DESC'
    Left = 56
    Top = 72
    object QTePurchaseSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object QTePurchaseMade_Factory: TStringField
      FieldName = 'Made_Factory'
      Size = 12
    end
    object QTePurchasePur_No: TStringField
      FieldName = 'Pur_No'
      Size = 12
    end
    object QTePurchaseVendor: TStringField
      FieldName = 'Vendor'
      Size = 12
    end
    object QTePurchaseVnd_Sim: TStringField
      FieldName = 'Vnd_Sim'
      Size = 60
    end
    object QTePurchasePA: TStringField
      FieldName = 'PA'
      Size = 12
    end
    object QTePurchaseSum_Price: TFloatField
      FieldName = 'Sum_Price'
    end
    object QTePurchasePur_Date: TDateTimeField
      FieldName = 'Pur_Date'
    end
    object QTePurchaseTemp_Status: TBooleanField
      FieldName = 'Temp_Status'
      Visible = False
    end
    object QTePurchaseD_Count: TIntegerField
      FieldName = 'D_Count'
      Visible = False
    end
    object QTePurchaseRemark: TStringField
      FieldName = 'Remark'
      Size = 1000
    end
    object QTePurchaseRemark1: TStringField
      FieldName = 'Remark1'
      Size = 1000
    end
    object QTePurchaseFCheck: TBooleanField
      FieldName = 'FCheck'
    end
    object QTePurchaseFCheck_Name: TStringField
      FieldName = 'FCheck_Name'
      Size = 10
    end
    object QTePurchaseFCheck_Date: TDateTimeField
      FieldName = 'FCheck_Date'
    end
    object QTePurchaseRCheck: TBooleanField
      FieldName = 'RCheck'
    end
    object QTePurchaseRCheck_Name: TStringField
      FieldName = 'RCheck_Name'
      Size = 10
    end
    object QTePurchaseRCheck_Date: TDateTimeField
      FieldName = 'RCheck_Date'
    end
    object QTePurchaseCreate_Name: TStringField
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTePurchaseCreate_Date: TDateTimeField
      FieldName = 'Create_Date'
    end
    object QTePurchaseUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTePurchaseUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
    end
    object QTePurchaseModify_Date: TDateTimeField
      FieldName = 'Modify_Date'
    end
    object QTePurchaseFax_Date: TDateTimeField
      FieldName = 'Fax_Date'
    end
  end
  object QTePurchasea: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT * FROM [CNData].[dbo].[Te_Purchasea]')
    AfterPost = QTePurchaseaAfterPost
    MasterSource = DTePurchase
    MasterFields = 'Pur_No;Vendor;Vnd_Sim'
    DetailFields = 'Pur_No;Vendor;Vnd_Sim'
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'Pur_No'
      end
      item
        DataType = ftString
        Name = 'Vendor'
      end
      item
        DataType = ftString
        Name = 'Vnd_Sim'
      end>
    object QTePurchaseaSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object QTePurchaseaPur_No: TStringField
      FieldName = 'Pur_No'
      Visible = False
      Size = 12
    end
    object QTePurchaseaItem_No: TIntegerField
      FieldName = 'Item_No'
    end
    object QTePurchaseaConn_No: TStringField
      FieldName = 'Conn_No'
      Size = 12
    end
    object QTePurchaseaMat_No: TStringField
      FieldName = 'Mat_No'
      Size = 14
    end
    object QTePurchaseaMat_Name: TStringField
      FieldName = 'Mat_Name'
      Size = 50
    end
    object QTePurchaseaMat_Desc: TStringField
      FieldName = 'Mat_Desc'
      Size = 50
    end
    object QTePurchaseaVendor: TStringField
      FieldName = 'Vendor'
      Size = 12
    end
    object QTePurchaseaVnd_Sim: TStringField
      FieldName = 'Vnd_Sim'
      Size = 60
    end
    object QTePurchaseaPrice: TFloatField
      FieldName = 'Price'
    end
    object QTePurchaseaPur_Qty: TFloatField
      FieldName = 'Pur_Qty'
    end
    object QTePurchaseaReq_Pur_Qty: TFloatField
      FieldName = 'Req_Pur_Qty'
    end
    object QTePurchaseaIn_Qty: TFloatField
      FieldName = 'In_Qty'
    end
    object QTePurchaseaVnd_Qty: TFloatField
      FieldName = 'Vnd_Qty'
    end
    object QTePurchaseaSto_Qty: TFloatField
      FieldName = 'Sto_Qty'
    end
    object QTePurchaseaGive_Date: TDateTimeField
      FieldName = 'Give_Date'
    end
    object QTePurchaseaRemark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
    object QTePurchaseaCreate_Name: TStringField
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTePurchaseaCreate_Date: TDateTimeField
      FieldName = 'Create_Date'
    end
    object QTePurchaseaUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTePurchaseaUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
    end
  end
  object DTePurchase: TDataSource
    DataSet = QTePurchase
    Left = 104
    Top = 72
  end
  object DTePurchasea: TDataSource
    DataSet = QTePurchasea
    Left = 104
    Top = 112
  end
  object RTePurchase: TppDBPipeline
    DataSource = DTePurchase
    UserName = 'RTePurchase'
    Left = 160
    Top = 72
  end
  object RTePurchasea: TppDBPipeline
    DataSource = DTePurchasea
    UserName = 'RTePurchasea'
    Left = 160
    Top = 112
  end
end
