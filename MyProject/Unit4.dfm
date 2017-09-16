inherited Form4: TForm4
  Width = 870
  Height = 640
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  inherited CoolBar1: TCoolBar
    Width = 870
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 35
        Width = 866
      end>
    inherited ToolBar1: TToolBar
      Width = 853
    end
  end
  object wwDBGrid1: TwwDBGrid [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 870
    Height = 401
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
    DataSource = DTeMaster
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
  end
  object wwDBGrid2: TwwDBGrid [2]
    Tag = 2
    Left = 0
    Top = 440
    Width = 870
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
    DataSource = DTeA
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
  end
  object QTeMaster: TMSQuery
    Connection = ADMSystem.ADMConnection
    AfterPost = QTeMasterAfterPost
    Left = 56
    Top = 72
    object QTeMasterSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
  end
  object QTeA: TMSQuery
    Connection = ADMSystem.ADMConnection
    AfterPost = QTeAAfterPost
    MasterSource = DTeMaster
    DetailFields = 'Pur_No;Vendor'
    Left = 56
    Top = 112
    object QTeASelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
  end
  object DTeMaster: TDataSource
    DataSet = QTeMaster
    Left = 104
    Top = 72
  end
  object RTeMaster: TppDBPipeline
    DataSource = DTeMaster
    UserName = 'RTeMaster'
    Left = 160
    Top = 72
  end
  object DTeA: TDataSource
    DataSet = QTeA
    Left = 104
    Top = 112
  end
  object RTeA: TppDBPipeline
    DataSource = DTeA
    UserName = 'RTeA'
    Left = 160
    Top = 112
  end
  object QUser: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT UserName='#39#35069#34920#20154#39)
    BeforeOpen = QUserBeforeOpen
    Left = 56
    Top = 152
    object QUserUserName: TStringField
      FieldName = 'UserName'
      ReadOnly = True
      Size = 6
    end
  end
  object DUser: TDataSource
    DataSet = QUser
    Left = 104
    Top = 152
  end
  object RUser: TppDBPipeline
    DataSource = DUser
    UserName = 'RUser'
    Left = 160
    Top = 152
  end
end
