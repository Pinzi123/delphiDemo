inherited MatNumberFrame: TMatNumberFrame
  Width = 968
  Height = 640
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  inherited CoolBar1: TCoolBar
    Width = 968
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 35
        Width = 964
      end>
    inherited ToolBar1: TToolBar
      Width = 951
    end
  end
  object cxDBTreeList1: TcxDBTreeList [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 259
    Height = 601
    Align = alLeft
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 200
      end>
    BufferedPaint = False
    DataController.DataSource = DDbMatClass
    DataController.ParentField = 'Parent_No'
    DataController.KeyField = 'Mata_No'
    LookAndFeel.Kind = lfFlat
    OptionsBehavior.CellHints = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Indicator = True
    RootValue = -1
    TabOrder = 1
    object cxDBTreeList1Mata_No: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mata_No'
      Width = 116
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
    end
    object cxDBTreeList1Mata_Name: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mata_Name'
      Width = 126
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Parent_No: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'Parent_No'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object Panel1: TPanel [2]
    Left = 267
    Top = 39
    Width = 701
    Height = 601
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object wwDBGrid1: TwwDBGrid
      Tag = 2
      Left = 1
      Top = 1
      Width = 699
      Height = 421
      HelpType = htKeyword
      Selected.Strings = (
        'Selected'#9'5'#9'Selected'#9#9
        'Field_Name'#9'20'#9'Field_Name'#9#9
        'Field_Desc'#9'20'#9'Field_Desc'#9#9
        'Display_Format'#9'20'#9'Display_Format'#9#9
        'Edit_Format'#9'20'#9'Edit_Format'#9#9
        'Field_Tag'#9'10'#9'Field_Tag'#9#9
        'Field_Type'#9'20'#9'Field_Type'#9#9
        'Field_Length'#9'10'#9'Field_Length'#9#9
        'Default_Value'#9'30'#9'Default_Value'#9#9
        'Field_Roles'#9'10'#9'Field_Roles'#9#9)
      IniAttributes.Delimiter = ';;'
      ExportOptions.ExportType = wwgetSYLK
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = DDbMatNumber
      ImeName = 'FM-WuBi(HK)'
      KeyOptions = []
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
      TabOrder = 0
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
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 422
      Width = 699
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = wwDBGrid2
    end
    object wwDBGrid2: TwwDBGrid
      Tag = 3
      Left = 1
      Top = 430
      Width = 699
      Height = 170
      Selected.Strings = (
        'Selected'#9'5'#9'Selected'#9#9
        'Field_Values'#9'60'#9'Field_Values'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alBottom
      DataSource = DDbMatVendor
      ImeName = 'FM-WuBi(HK)'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      TitleImageList = ADMSystem.ImageList1
    end
  end
  object cxSplitter2: TcxSplitter [3]
    Left = 259
    Top = 39
    Width = 8
    Height = 601
    HotZoneClassName = 'TcxMediaPlayer8Style'
    Control = cxDBTreeList1
  end
  object Panel2: TPanel [4]
    Left = 267
    Top = 39
    Width = 701
    Height = 601
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object wwDBGrid3: TwwDBGrid
      Tag = 2
      Left = 0
      Top = 0
      Width = 701
      Height = 457
      HelpType = htKeyword
      Selected.Strings = (
        'Selected'#9'5'#9'Selected'#9#9
        'Field_Name'#9'20'#9'Field_Name'#9#9
        'Field_Desc'#9'20'#9'Field_Desc'#9#9
        'Display_Format'#9'20'#9'Display_Format'#9#9
        'Edit_Format'#9'20'#9'Edit_Format'#9#9
        'Field_Tag'#9'10'#9'Field_Tag'#9#9
        'Field_Type'#9'20'#9'Field_Type'#9#9
        'Field_Length'#9'10'#9'Field_Length'#9#9
        'Default_Value'#9'30'#9'Default_Value'#9#9
        'Field_Roles'#9'10'#9'Field_Roles'#9#9)
      IniAttributes.Delimiter = ';;'
      ExportOptions.ExportType = wwgetSYLK
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = DDbMatNumber
      ImeName = '中文 (?体) - 搜狗拼音?入法'
      KeyOptions = []
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
      TabOrder = 0
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
    object cxSplitter3: TcxSplitter
      Left = 0
      Top = 457
      Width = 701
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = wwDBGrid4
    end
    object wwDBGrid4: TwwDBGrid
      Tag = 3
      Left = 0
      Top = 465
      Width = 701
      Height = 136
      Selected.Strings = (
        'Selected'#9'5'#9'Selected'#9#9
        'Field_Values'#9'60'#9'Field_Values'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alBottom
      DataSource = DDbMatVendor
      ImeName = '中文 (?体) - 搜狗拼音?入法'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
  end
  object QDbMatClass: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      
        'SELECT * FROM ( SELECT         Mata_No, Mata_Name, Parent_No, Ma' +
        't_Class'
      'FROM             dbo.Db_MatClass ) A')
    Left = 58
    Top = 64
    object QDbMatClassMata_No: TStringField
      DisplayWidth = 20
      FieldName = 'Mata_No'
      Size = 4
    end
    object QDbMatClassMata_Name: TStringField
      DisplayWidth = 12
      FieldName = 'Mata_Name'
      Size = 30
    end
    object QDbMatClassParent_No: TStringField
      FieldName = 'Parent_No'
      Size = 4
    end
    object QDbMatClassMat_Class: TStringField
      FieldName = 'Mat_Class'
    end
  end
  object DDbMatClass: TDataSource
    AutoEdit = False
    DataSet = QDbMatClass
    Left = 96
    Top = 64
  end
  object QDbMatNumber: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO Db_MatNumber'
      
        '  (Mata_No, Mat_No, Mat_Name, Mat_Type,Mat_Grade,Mat_Soft,Mat_Wi' +
        'dth, Mat_Other, Chn_Color, Mat_Eng, Eng_Color, Eng_Unit, Chn_Uni' +
        't, Patten_No, Patten, Pur_Way, Mat_Class, Acc_Class, Over_Per, S' +
        'afe_Qty, Price_Qty, Volume, Vl_Unit, Mat_Pic, S_Position, Size_T' +
        'ype, With_Status, Size_Status, Check_Status, IsCust, IsOrder, Us' +
        'e_Status, LastUse_Date, Remark, FCheck, FCheck_Name, Create_Name' +
        ', Create_Date, Upd_Name, Upd_Date)'
      'VALUES'
      
        '  (:Mata_No, :Mat_No, :Mat_Name, :Mat_Type,:Mat_Grade,:Mat_Soft,' +
        ':Mat_Width, :Mat_Other, :Chn_Color, :Mat_Eng, :Eng_Color, :Eng_U' +
        'nit, :Chn_Unit, :Patten_No, :Patten, :Pur_Way, :Mat_Class, :Acc_' +
        'Class, :Over_Per, :Safe_Qty, :Price_Qty, :Volume, :Vl_Unit, :Mat' +
        '_Pic, :S_Position, :Size_Type, :With_Status, :Size_Status, :Chec' +
        'k_Status, :IsCust, :IsOrder, :Use_Status, :LastUse_Date, :Remark' +
        ', :FCheck, :FCheck_Name, :Create_Name, :Create_Date, :Upd_Name, ' +
        ':Upd_Date)')
    SQLDelete.Strings = (
      'DELETE FROM Db_MatNumber'
      'WHERE'
      '  Mat_No = :Old_Mat_No')
    SQLUpdate.Strings = (
      'UPDATE Db_MatNumber'
      'SET'
      
        '  Mat_Name = :Mat_Name, Mat_Type = :Mat_Type,Mat_Grade = :Mat_Gr' +
        'ade,Mat_Soft = :Mat_Soft,Mat_Width=:Mat_Width, Mat_Other = :Mat_' +
        'Other, Chn_Color = :Chn_Color, Mat_Eng = :Mat_Eng, Eng_Color = :' +
        'Eng_Color, Eng_Unit = :Eng_Unit, Chn_Unit = :Chn_Unit, Patten_No' +
        ' = :Patten_No, Patten = :Patten, Pur_Way = :Pur_Way, Mat_Class =' +
        ' :Mat_Class, Acc_Class = :Acc_Class, Over_Per = :Over_Per, Safe_' +
        'Qty = :Safe_Qty, Price_Qty = :Price_Qty, Volume = :Volume, Vl_Un' +
        'it = :Vl_Unit, Mat_Pic = :Mat_Pic, S_Position = :S_Position, Siz' +
        'e_Type = :Size_Type, With_Status = :With_Status, Size_Status = :' +
        'Size_Status, Check_Status = :Check_Status, IsCust = :IsCust, IsO' +
        'rder = :IsOrder, Use_Status = :Use_Status, LastUse_Date = :LastU' +
        'se_Date, Remark = :Remark, FCheck = :FCheck, FCheck_Name = :FChe' +
        'ck_Name, Create_Name = :Create_Name, Create_Date = :Create_Date,' +
        ' Upd_Name = :Upd_Name, Upd_Date = :Upd_Date'
      'WHERE'
      '  Mat_No = :Old_Mat_No')
    SQLRefresh.Strings = (
      
        'SELECT Db_MatNumber.Mata_No, Db_MatNumber.Mat_No, Db_MatNumber.M' +
        'at_Name, Db_MatNumber.Mat_Type,Db_MatNumber.Mat_Grade,Db_MatNumb' +
        'er.Mat_Soft,Db_MatNumber.Mat_Width, Db_MatNumber.Mat_Other, Db_M' +
        'atNumber.Chn_Color, Db_MatNumber.Mat_Eng, Db_MatNumber.Eng_Color' +
        ', Db_MatNumber.Eng_Unit, Db_MatNumber.Chn_Unit, Db_MatNumber.Pat' +
        'ten_No, Db_MatNumber.Patten, Db_MatNumber.Pur_Way, Db_MatNumber.' +
        'Mat_Class, Db_MatNumber.Acc_Class, Db_MatNumber.Over_Per, Db_Mat' +
        'Number.Safe_Qty, Db_MatNumber.Price_Qty, Db_MatNumber.Volume, Db' +
        '_MatNumber.Vl_Unit, Db_MatNumber.Mat_Pic, Db_MatNumber.S_Positio' +
        'n, Db_MatNumber.Size_Type, Db_MatNumber.With_Status, Db_MatNumbe' +
        'r.Size_Status, Db_MatNumber.Check_Status, Db_MatNumber.IsCust, D' +
        'b_MatNumber.IsOrder, Db_MatNumber.Use_Status, Db_MatNumber.LastU' +
        'se_Date, Db_MatNumber.Remark, Db_MatNumber.FCheck, Db_MatNumber.' +
        'FCheck_Name, Db_MatNumber.Create_Name, Db_MatNumber.Create_Date,' +
        ' Db_MatNumber.Upd_Name, Db_MatNumber.Upd_Date FROM Db_MatNumber'
      'WHERE'
      '  Db_MatNumber.Mat_No = :Old_Mat_No')
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT         * '
      'FROM             dbo.Db_MatNumber')
    FetchAll = False
    Left = 58
    Top = 98
    object QDbMatNumberSelected: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object QDbMatNumberMata_No: TStringField
      FieldName = 'Mata_No'
      Origin = 'Db_MatNumber.Mata_No'
      Visible = False
      Size = 4
    end
    object QDbMatNumberMat_No: TStringField
      DisplayWidth = 14
      FieldName = 'Mat_No'
      Origin = 'Db_MatNumber.Mat_No'
      Size = 12
    end
    object QDbMatNumberMat_Desc: TStringField
      DisplayWidth = 60
      FieldName = 'Mat_Desc'
      Size = 375
    end
    object QDbMatNumberMat_Name: TStringField
      DisplayWidth = 30
      FieldName = 'Mat_Name'
      Origin = 'Db_MatNumber.Mat_Name'
      Visible = False
      Size = 360
    end
    object QDbMatNumberMat_Type: TStringField
      DisplayWidth = 20
      FieldName = 'Mat_Type'
      Origin = 'Db_MatNumber.Mat_Type'
      Visible = False
      Size = 60
    end
    object QDbMatNumberMat_Grade: TStringField
      FieldName = 'Mat_Grade'
      Size = 60
    end
    object QDbMatNumberMat_Soft: TStringField
      FieldName = 'Mat_Soft'
      Size = 60
    end
    object QDbMatNumberMat_Width: TStringField
      FieldName = 'Mat_Width'
      Size = 60
    end
    object QDbMatNumberMat_Other: TStringField
      DisplayWidth = 20
      FieldName = 'Mat_Other'
      Origin = 'Db_MatNumber.Mat_Other'
      Visible = False
      Size = 60
    end
    object QDbMatNumberChn_Color: TStringField
      DisplayWidth = 20
      FieldName = 'Chn_Color'
      Origin = 'Db_MatNumber.Chn_Color'
      Visible = False
      Size = 60
    end
    object QDbMatNumberEng_Desc: TStringField
      DisplayWidth = 60
      FieldName = 'Eng_Desc'
      Size = 361
    end
    object QDbMatNumberMat_Eng: TStringField
      DisplayWidth = 30
      FieldName = 'Mat_Eng'
      Origin = 'Db_MatNumber.Mat_Eng'
      Visible = False
      Size = 360
    end
    object QDbMatNumberEng_Color: TStringField
      DisplayWidth = 20
      FieldName = 'Eng_Color'
      Origin = 'Db_MatNumber.Eng_Color'
      Visible = False
      Size = 60
    end
    object QDbMatNumberEng_Unit: TStringField
      FieldName = 'Eng_Unit'
      Origin = 'Db_MatNumber.Eng_Unit'
      Size = 8
    end
    object QDbMatNumberChn_Unit: TStringField
      FieldName = 'Chn_Unit'
      Origin = 'Db_MatNumber.Chn_Unit'
      Size = 8
    end
    object QDbMatNumberPatten_No: TStringField
      FieldName = 'Patten_No'
      Origin = 'Db_MatNumber.Patten_No'
      Size = 14
    end
    object QDbMatNumberPatten: TStringField
      FieldName = 'Patten'
      Origin = 'Db_MatNumber.Patten'
    end
    object QDbMatNumberPur_Way: TStringField
      FieldName = 'Pur_Way'
      Origin = 'Db_MatNumber.Pur_Way'
      FixedChar = True
      Size = 12
    end
    object QDbMatNumberMat_Class: TStringField
      FieldName = 'Mat_Class'
      Origin = 'Db_MatNumber.Mat_Class'
    end
    object QDbMatNumberAcc_Class: TStringField
      FieldName = 'Acc_Class'
      Origin = 'Db_MatNumber.Acc_Class'
    end
    object QDbMatNumberOver_Per: TFloatField
      FieldName = 'Over_Per'
      Origin = 'Db_MatNumber.Over_Per'
    end
    object QDbMatNumberSafe_Qty: TFloatField
      FieldName = 'Safe_Qty'
      Origin = 'Db_MatNumber.Safe_Qty'
    end
    object QDbMatNumberVolume: TFloatField
      FieldName = 'Volume'
      Origin = 'Db_MatNumber.Volume'
    end
    object QDbMatNumberVl_Unit: TStringField
      FieldName = 'Vl_Unit'
      Origin = 'Db_MatNumber.Vl_Unit'
      Size = 8
    end
    object QDbMatNumberMat_Pic: TBlobField
      FieldName = 'Mat_Pic'
      Origin = 'Db_MatNumber.Mat_Pic'
    end
    object QDbMatNumberS_Position: TStringField
      FieldName = 'S_Position'
      Origin = 'Db_MatNumber.S_Position'
    end
    object QDbMatNumberSize_Type: TStringField
      FieldName = 'Size_Type'
      Origin = 'Db_MatNumber.Size_Type'
    end
    object QDbMatNumberIsCust: TBooleanField
      FieldName = 'IsCust'
      Origin = 'Db_MatNumber.IsCust'
    end
    object QDbMatNumberIsOrder: TBooleanField
      FieldName = 'IsOrder'
      Origin = 'Db_MatNumber.IsOrder'
    end
    object QDbMatNumberUse_Status: TBooleanField
      FieldName = 'Use_Status'
      Origin = 'Db_MatNumber.Use_Status'
    end
    object QDbMatNumberWith_Status: TBooleanField
      DisplayWidth = 8
      FieldName = 'With_Status'
      Origin = 'Db_MatNumber.With_Status'
    end
    object QDbMatNumberSize_Status: TBooleanField
      DisplayWidth = 8
      FieldName = 'Size_Status'
      Origin = 'Db_MatNumber.Size_Status'
    end
    object QDbMatNumberLastUse_Date: TDateTimeField
      DisplayWidth = 10
      FieldName = 'LastUse_Date'
      Origin = 'Db_MatNumber.LastUse_Date'
    end
    object QDbMatNumberCheck_Status: TBooleanField
      DisplayWidth = 8
      FieldName = 'Check_Status'
      Origin = 'Db_MatNumber.Check_Status'
    end
    object QDbMatNumberRemark: TStringField
      DisplayWidth = 30
      FieldName = 'Remark'
      Size = 120
    end
    object QDbMatNumberFCheck: TBooleanField
      DisplayWidth = 8
      FieldName = 'FCheck'
      Origin = 'Db_MatNumber.FCheck'
    end
    object QDbMatNumberFCheck_Name: TStringField
      FieldName = 'FCheck_Name'
      Origin = 'Db_MatNumber.FCheck_Name'
      Visible = False
      Size = 10
    end
    object QDbMatNumberCreate_Name: TStringField
      FieldName = 'Create_Name'
      Origin = 'Db_MatNumber.Create_Name'
      Visible = False
      Size = 10
    end
    object QDbMatNumberCreate_Date: TDateTimeField
      FieldName = 'Create_Date'
      Origin = 'Db_MatNumber.Create_Date'
      Visible = False
    end
    object QDbMatNumberUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Origin = 'Db_MatNumber.Upd_Name'
      Visible = False
      Size = 10
    end
    object QDbMatNumberUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
      Origin = 'Db_MatNumber.Upd_Date'
      Visible = False
    end
    object QDbMatNumberPrice_Qty: TFloatField
      FieldName = 'Price_Qty'
    end
  end
  object DDbMatNumber: TDataSource
    AutoEdit = False
    DataSet = QDbMatNumber
    Left = 96
    Top = 98
  end
  object RDbMatNumber: TppDBPipeline
    DataSource = DDbMatNumber
    OpenDataSource = False
    UserName = 'RDbMatNumber'
    Left = 136
    Top = 98
  end
  object QDbMatVendor: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO Db_MatVendor'
      
        '  (Mat_No, Vendor, Vnd_Unit, Unit_Ways, Give_Days, Net_Wt, Gross' +
        '_Wt, Wt_Unit, Aply_Type, P_No, Create_Name, Create_Date, Upd_Nam' +
        'e, Upd_Date)'
      'VALUES'
      
        '  (:Mat_No, :Vendor, :Vnd_Unit, :Unit_Ways, :Give_Days, :Net_Wt,' +
        ' :Gross_Wt, :Wt_Unit, :Aply_Type, :P_No, :Create_Name, :Create_D' +
        'ate, :Upd_Name, :Upd_Date)')
    SQLDelete.Strings = (
      'DELETE FROM Db_MatVendor'
      'WHERE'
      '  Mat_No = :Old_Mat_No AND Vendor = :Old_Vendor')
    SQLUpdate.Strings = (
      'UPDATE Db_MatVendor'
      'SET'
      
        '   Vnd_Unit = :Vnd_Unit, Unit_Ways = :Unit_Ways, Give_Days = :Gi' +
        've_Days, Net_Wt = :Net_Wt, Gross_Wt = :Gross_Wt, Wt_Unit = :Wt_U' +
        'nit, Aply_Type = :Aply_Type, P_No = :P_No, Create_Name = :Create' +
        '_Name, Create_Date = :Create_Date, Upd_Name = :Upd_Name, Upd_Dat' +
        'e = :Upd_Date'
      'WHERE'
      '  Mat_No = :Old_Mat_No AND Vendor = :Old_Vendor'
      'UPDATE Db_MatVendor'
      'SET'
      '  Mat_No = :Mat_No, Vendor = :Vendor'
      'WHERE'
      '  Mat_No = :Old_Mat_No AND Vendor = :Old_Vendor')
    SQLRefresh.Strings = (
      
        'SELECT Db_MatVendor.Mat_No, Db_MatVendor.Vendor, Db_MatVendor.Vn' +
        'd_Unit, Db_MatVendor.Unit_Ways, Db_MatVendor.Give_Days, Db_MatVe' +
        'ndor.Net_Wt, Db_MatVendor.Gross_Wt, Db_MatVendor.Wt_Unit, Db_Mat' +
        'Vendor.Aply_Type, Db_MatVendor.P_No, Db_MatVendor.Create_Name, D' +
        'b_MatVendor.Create_Date, Db_MatVendor.Upd_Name, Db_MatVendor.Upd' +
        '_Date FROM Db_MatVendor'
      'WHERE'
      
        '  Db_MatVendor.Mat_No = :Old_Mat_No AND Db_MatVendor.Vendor = :O' +
        'ld_Vendor')
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT         *'
      
        'FROM             (SELECT         dbo.Db_MatVendor.Mat_No, dbo.Db' +
        '_MatVendor. Vendor, '
      
        '                                                      dbo.Bb_Ven' +
        'dor.Vnd_Sim, dbo.Db_MatVendor.Vnd_Unit, '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.Unit_Ways, dbo.Db_MatVendor.Give_Days, '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.Net_Wt, dbo.Db_MatVendor.Gross_Wt, '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.Wt_Unit, dbo.Db_MatVendor.Aply_Type, '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.P_No, dbo.Ga_BasePart.CP_No, '
      
        '                                                      dbo.Ga_Bas' +
        'ePart.CP_Name, dbo.Db_MatVendor.Create_Name, '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.Create_Date, dbo.Db_MatVendor.Upd_Name, '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.Upd_Date'
      
        '                           FROM              dbo.Db_MatVendor IN' +
        'NER JOIN'
      
        '                                                      dbo.Bb_Ven' +
        'dor ON '
      
        '                                                      dbo.Db_Mat' +
        'Vendor. Vendor = dbo.Bb_Vendor. Vendor LEFT OUTER JOIN'
      
        '                                                      dbo.Ga_Bas' +
        'ePart ON '
      
        '                                                      dbo.Db_Mat' +
        'Vendor.P_No = dbo.Ga_BasePart.P_No) A')
    MasterSource = DDbMatNumber
    MasterFields = 'Mat_No'
    DetailFields = 'Mat_No'
    Left = 58
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Mat_No'
      end>
    object QDbMatVendorSelected: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object QDbMatVendorMat_No: TStringField
      Tag = 32
      FieldName = 'Mat_No'
      Visible = False
      Size = 12
    end
    object QDbMatVendorVendor: TStringField
      FieldName = 'Vendor'
      Size = 12
    end
    object QDbMatVendorVnd_Sim: TStringField
      DisplayWidth = 20
      FieldName = 'Vnd_Sim'
      Size = 60
    end
    object QDbMatVendorVnd_Unit: TStringField
      FieldName = 'Vnd_Unit'
      Size = 8
    end
    object QDbMatVendorUnit_Ways: TFloatField
      FieldName = 'Unit_Ways'
    end
    object QDbMatVendorGive_days: TIntegerField
      FieldName = 'Give_days'
    end
    object QDbMatVendorP_No: TStringField
      FieldName = 'P_No'
      Size = 12
    end
    object QDbMatVendorCP_No: TStringField
      FieldName = 'CP_No'
      Size = 12
    end
    object QDbMatVendorCP_Name: TStringField
      DisplayWidth = 20
      FieldName = 'CP_Name'
      Size = 60
    end
    object QDbMatVendorNet_Wt: TFloatField
      FieldName = 'Net_Wt'
    end
    object QDbMatVendorGross_Wt: TFloatField
      FieldName = 'Gross_Wt'
    end
    object QDbMatVendorWt_Unit: TStringField
      FieldName = 'Wt_Unit'
      Size = 8
    end
    object QDbMatVendorAply_Type: TStringField
      FieldName = 'Aply_Type'
      Size = 4
    end
    object QDbMatVendorCreate_Name: TStringField
      FieldName = 'Create_Name'
      Visible = False
      Size = 10
    end
    object QDbMatVendorCreate_Date: TDateTimeField
      FieldName = 'Create_Date'
      Visible = False
    end
    object QDbMatVendorUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Visible = False
      Size = 10
    end
    object QDbMatVendorUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
      Visible = False
    end
  end
  object DDbMatVendor: TDataSource
    AutoEdit = False
    DataSet = QDbMatVendor
    Left = 96
    Top = 132
  end
  object RDbMatVendor: TppDBPipeline
    DataSource = DDbMatVendor
    OpenDataSource = False
    UserName = 'RDbMatVendor'
    Left = 136
    Top = 132
  end
  object SDgAtuoplan: TMSSQL
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      '{:RETURN_VALUE = CALL SBbvendor;1(:Index, :ROWCOUNT)}')
    Left = 472
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'Index'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ROWCOUNT'
        ParamType = ptInputOutput
        Size = 500
      end>
  end
  object PopupMenu2: TPopupMenu
    Left = 400
    Top = 48
    object N13: TMenuItem
      Caption = '材料引用狀況'
    end
    object N14: TMenuItem
      Caption = '材料引用加工材料'
    end
  end
end
