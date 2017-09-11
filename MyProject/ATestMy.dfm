inherited Form3: TForm3
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
    Height = 197
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = DTeGodown
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
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
    Top = 244
    Width = 870
    Height = 396
    Selected.Strings = (
      'productNum'#9'38'#9#29986#21697#32232#34399#9#9
      'oddNum'#9'38'#9#21934#34399#9#9
      'providerName'#9'30'#9#29986#21697#21517#23383#9#9
      'kind'#9'30'#9#31278#39006#9#9
      'unit'#9'10'#9#35336#37327#21934#20301#9#9
      'specifications'#9'10'#9#29986#21697#35215#26684#9#9
      'price'#9'10'#9#21934#20729#9#9
      'number'#9'10'#9#25976#37327#9#9
      'remark'#9'50'#9#20633#35387#9#9
      'Upd_Name'#9'10'#9#20462#25913#20154#9#9
      'Upd_Date'#9'18'#9#20462#25913#26178#38291#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alBottom
    DataSource = DTeGodownDetail
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
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
  object cxSplitter2: TcxSplitter [3]
    Left = 0
    Top = 236
    Width = 870
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Control = wwDBGrid2
  end
  object QTeGodown: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT * FROM [CNData].[dbo].[Te_Godown]')
    Left = 96
    Top = 80
    object QTeGodownoddNum: TGuidField
      DisplayLabel = #21934#34399
      FieldName = 'oddNum'
      FixedChar = True
      Size = 38
    end
    object QTeGodownprovider: TStringField
      DisplayLabel = #20379#25033#21830
      FieldName = 'provider'
      Size = 30
    end
    object QTeGodownwarehouse: TStringField
      DisplayLabel = #20489#24235
      FieldName = 'warehouse'
      Size = 30
    end
    object QTeGodowndate: TDateTimeField
      DisplayLabel = #20837#24235#26178#38291
      FieldName = 'date'
    end
    object QTeGodownamount: TCurrencyField
      DisplayLabel = #32317#37329#38989
      FieldName = 'amount'
    end
    object QTeGodownstaff: TStringField
      DisplayLabel = #20837#24235#21729
      FieldName = 'staff'
      Size = 10
    end
    object QTeGodownCreate_Name: TStringField
      DisplayLabel = #21109#24314#20154
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTeGodownCreate_Date: TDateTimeField
      DisplayLabel = #21109#24314#26178#38291
      FieldName = 'Create_Date'
    end
    object QTeGodownUpd_Name: TStringField
      DisplayLabel = #20462#25913#20154
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTeGodownUpd_Date: TDateTimeField
      DisplayLabel = #20462#25913#26085#26399
      FieldName = 'Upd_Date'
    end
  end
  object DTeGodown: TDataSource
    AutoEdit = False
    DataSet = QTeGodown
    Left = 133
    Top = 80
  end
  object RTeGodown: TppDBPipeline
    DataSource = DTeGodown
    OpenDataSource = False
    UserName = 'RTeGodown'
    Left = 173
    Top = 80
  end
  object QTeGodownDetail: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT * FROM [CNData].[dbo].[Te_GodownDetail]')
    MasterSource = DTeGodown
    MasterFields = 'oddNum'
    DetailFields = 'oddNum'
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'oddNum'
      end>
    object QTeGodownDetailproductNum: TGuidField
      DisplayLabel = #29986#21697#32232#34399
      DisplayWidth = 38
      FieldName = 'productNum'
      FixedChar = True
      Size = 38
    end
    object QTeGodownDetailoddNum: TGuidField
      DisplayLabel = #21934#34399
      DisplayWidth = 38
      FieldName = 'oddNum'
      FixedChar = True
      Size = 38
    end
    object QTeGodownDetailproviderName: TStringField
      DisplayLabel = #29986#21697#21517#23383
      DisplayWidth = 30
      FieldName = 'providerName'
      Size = 30
    end
    object QTeGodownDetailkind: TStringField
      DisplayLabel = #36914#36008#31278#39006
      DisplayWidth = 30
      FieldName = 'kind'
      Size = 30
    end
    object QTeGodownDetailunit: TStringField
      DisplayLabel = #35336#37327#21934#20301
      DisplayWidth = 10
      FieldName = 'unit'
      FixedChar = True
      Size = 10
    end
    object QTeGodownDetailspecifications: TStringField
      DisplayLabel = #29986#21697#35215#26684
      DisplayWidth = 10
      FieldName = 'specifications'
      FixedChar = True
      Size = 10
    end
    object QTeGodownDetailprice: TCurrencyField
      DisplayLabel = #21934#20729
      DisplayWidth = 10
      FieldName = 'price'
    end
    object QTeGodownDetailnumber: TIntegerField
      DisplayLabel = #25976#37327
      DisplayWidth = 10
      FieldName = 'number'
    end
    object QTeGodownDetailremark: TStringField
      DisplayLabel = #20633#35387
      DisplayWidth = 50
      FieldName = 'remark'
      Size = 50
    end
    object QTeGodownDetailCreate_Name: TStringField
      DisplayLabel = #21109#24314#20154
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTeGodownDetailCreate_Date: TDateTimeField
      DisplayLabel = #21109#24314#26178#38291
      FieldName = 'Create_Date'
    end
    object QTeGodownDetailUpd_Name: TStringField
      DisplayLabel = #20462#25913#20154
      DisplayWidth = 10
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTeGodownDetailUpd_Date: TDateTimeField
      DisplayLabel = #20462#25913#26178#38291
      DisplayWidth = 18
      FieldName = 'Upd_Date'
    end
  end
  object DTeGodownDetail: TDataSource
    AutoEdit = False
    DataSet = QTeGodownDetail
    Left = 133
    Top = 120
  end
  object RTeGodownDetail: TppDBPipeline
    DataSource = DTeGodownDetail
    OpenDataSource = False
    UserName = 'RTeGodownDetail'
    Left = 174
    Top = 120
  end
end
