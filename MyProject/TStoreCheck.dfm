inherited StoreCheckFrame: TStoreCheckFrame
  object wwDBGrid1: TwwDBGrid [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 854
    Height = 472
    HelpType = htKeyword
    Selected.Strings = (
      'Selected'#9'5'#9'Selected'
      'Check_Date'#9'18'#9'Check_Date'
      'Mat_No'#9'14'#9'Mat_No'
      'Mat_Name'#9'360'#9'Mat_Name'
      'Vendor'#9'50'#9'Vendor'
      'Store_Sqty'#9'10'#9'Store_Sqty'
      'Store_SAccount'#9'10'#9'Store_SAccount'
      'Store_IQty'#9'10'#9'Store_IQty'
      'Store_OQty'#9'10'#9'Store_OQty'
      'Store_Eqty'#9'10'#9'Store_Eqty'
      'Store_EAccount'#9'10'#9'Store_EAccount'
      'Price'#9'10'#9'Price'
      'FCheck'#9'5'#9'FCheck'
      'FCheck_Name'#9'10'#9'FCheck_Name'
      'Remark'#9'20'#9'Remark'
      'Create_Name'#9'10'#9'Create_Name'
      'Create_Date'#9'18'#9'Create_Date'
      'Upd_Name'#9'10'#9'Upd_Name'
      'Upd_Date'#9'18'#9'Upd_Date')
    IniAttributes.Delimiter = ';;'
    ExportOptions.ExportType = wwgetSYLK
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
    Align = alClient
    DataSource = DTeStoreC
    ImeName = 'FM-WuBi(HK)'
    KeyOptions = []
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #26032#32048#26126#39636
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    TitleImageList = ADMSystem.ImageList1
  end
  object QTeStoreC: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'DECLARE @Check_Date  datetime'
      'SET @Check_Date=:Check_Date'
      'SELECT * '
      'FROM [CNData].[dbo].[Te_StoreCheckTemp]'
      'where Check_Date = @Check_Date')
    FetchRows = 1
    Active = True
    Left = 102
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Check_Date'
      end>
    object QTeStoreCSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object QTeStoreCCheck_Date: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Check_Date'
    end
    object QTeStoreCMat_No: TStringField
      DisplayWidth = 14
      FieldName = 'Mat_No'
      Size = 14
    end
    object QTeStoreCMat_Name: TStringField
      DisplayWidth = 360
      FieldName = 'Mat_Name'
      Size = 360
    end
    object QTeStoreCVendor: TStringField
      DisplayWidth = 50
      FieldName = 'Vendor'
      Size = 50
    end
    object QTeStoreCStore_Sqty: TFloatField
      DisplayWidth = 10
      FieldName = 'Store_Sqty'
    end
    object QTeStoreCStore_SAccount: TFloatField
      DisplayWidth = 10
      FieldName = 'Store_SAccount'
    end
    object QTeStoreCStore_IQty: TFloatField
      DisplayWidth = 10
      FieldName = 'Store_IQty'
    end
    object QTeStoreCStore_OQty: TFloatField
      DisplayWidth = 10
      FieldName = 'Store_OQty'
    end
    object QTeStoreCStore_Eqty: TFloatField
      DisplayWidth = 10
      FieldName = 'Store_Eqty'
    end
    object QTeStoreCStore_EAccount: TFloatField
      DisplayWidth = 10
      FieldName = 'Store_EAccount'
    end
    object QTeStoreCFCheck: TBooleanField
      DisplayWidth = 5
      FieldName = 'FCheck'
    end
    object QTeStoreCFCheck_Name: TStringField
      DisplayWidth = 10
      FieldName = 'FCheck_Name'
      Size = 10
    end
    object QTeStoreCRemark: TStringField
      DisplayWidth = 20
      FieldName = 'Remark'
    end
    object QTeStoreCCreate_Name: TStringField
      DisplayWidth = 10
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTeStoreCCreate_Date: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Create_Date'
    end
    object QTeStoreCUpd_Name: TStringField
      DisplayWidth = 10
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTeStoreCUpd_Date: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Upd_Date'
    end
  end
  object DTeStoreC: TDataSource
    AutoEdit = False
    DataSet = QTeStoreC
    Left = 138
    Top = 68
  end
  object RTeStoreC: TppDBPipeline
    DataSource = DTeStoreC
    UserName = 'RTeStoreC'
    Left = 176
    Top = 70
  end
end
