inherited StoreFrame: TStoreFrame
  object wwDBGrid1: TwwDBGrid [1]
    Tag = 1
    Left = 0
    Top = 24
    Width = 845
    Height = 561
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
    TitleFont.Height = -13
    TitleFont.Name = #26032#32048#26126#39636
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    TitleImageList = ADMSystem.ImageList1
  end
  object QTePurchase: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      
        'select Db_MatNumber.Mat_No,Mat_Name,Mat_Desc,a.Vendor,Vnd_Sim,St' +
        'oNumber '
      ' from Db_MatNumber,Bb_Vendor,'
      ' (select Mat_No,Vendor,SUM(Sign_Int*Acc_Qty) as StoNumber '
      ' from Te_Storea'
      ' group by Mat_No,Vendor) as a'
      ' where a.Mat_No = Db_MatNumber.Mat_No'
      '  and a.Vendor = Bb_Vendor.Vendor')
    Left = 56
    Top = 72
    object QTePurchaseSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object QTePurchaseMat_No: TStringField
      FieldName = 'Mat_No'
      Size = 14
    end
    object QTePurchaseMat_Name: TStringField
      FieldName = 'Mat_Name'
      Size = 360
    end
    object QTePurchaseMat_Desc: TStringField
      FieldName = 'Mat_Desc'
      ReadOnly = True
      Size = 807
    end
    object QTePurchaseVendor: TStringField
      FieldName = 'Vendor'
      ReadOnly = True
      Size = 12
    end
    object QTePurchaseVnd_Sim: TStringField
      FieldName = 'Vnd_Sim'
      ReadOnly = True
      Size = 60
    end
    object QTePurchaseStoNumber: TFloatField
      FieldName = 'StoNumber'
      ReadOnly = True
    end
  end
  object DTePurchase: TDataSource
    DataSet = QTePurchase
    Left = 104
    Top = 72
  end
  object RTePurchase: TppDBPipeline
    DataSource = DTePurchase
    UserName = 'RTePurchase'
    Left = 160
    Top = 72
  end
end