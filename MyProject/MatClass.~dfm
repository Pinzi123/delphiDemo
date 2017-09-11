inherited MatClassFrame: TMatClassFrame
  Width = 868
  Height = 883
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  inherited CoolBar1: TCoolBar
    Width = 868
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 35
        Width = 864
      end>
    inherited ToolBar1: TToolBar
      Width = 851
    end
  end
  object cxDBTreeList1: TcxDBTreeList [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 868
    Height = 844
    Align = alClient
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = DQMatClass
    DataController.ParentField = 'Parent_No'
    DataController.KeyField = 'Mata_No'
    LookAndFeel.Kind = lfFlat
    OptionsSelection.CellSelect = False
    OptionsView.Indicator = True
    RootValue = -1
    TabOrder = 1
    object cxDBTreeList1Mata_No: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mata_No'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Mata_Name: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mata_Name'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Parent_No: TcxDBTreeListColumn
      DataBinding.FieldName = 'Parent_No'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Mat_Class: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mat_Class'
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1FCheck: TcxDBTreeListColumn
      DataBinding.FieldName = 'FCheck'
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1FCheck_Name: TcxDBTreeListColumn
      DataBinding.FieldName = 'FCheck_Name'
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Create_Name: TcxDBTreeListColumn
      DataBinding.FieldName = 'Create_Name'
      Position.ColIndex = 10
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Create_Date: TcxDBTreeListColumn
      DataBinding.FieldName = 'Create_Date'
      Position.ColIndex = 11
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Upd_Name: TcxDBTreeListColumn
      DataBinding.FieldName = 'Upd_Name'
      Position.ColIndex = 12
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Upd_Date: TcxDBTreeListColumn
      DataBinding.FieldName = 'Upd_Date'
      Position.ColIndex = 13
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeList1Mata_No1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mata_No'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Mata_Name1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mata_Name'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Parent_No1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Parent_No'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Mat_Class1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Mat_Class'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1FCheck1: TcxDBTreeListColumn
      DataBinding.FieldName = 'FCheck'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1FCheck_Name1: TcxDBTreeListColumn
      DataBinding.FieldName = 'FCheck_Name'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Create_Name1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Create_Name'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Create_Date1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Create_Date'
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Upd_Name1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Upd_Name'
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Upd_Date1: TcxDBTreeListColumn
      DataBinding.FieldName = 'Upd_Date'
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object QMatClass: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'SELECT         * '
      'FROM             dbo.Db_MatClass')
    AfterInsert = QMatClassAfterInsert
    Left = 48
    Top = 64
    object QMatClassMata_No: TStringField
      DisplayWidth = 8
      FieldName = 'Mata_No'
      Size = 4
    end
    object QMatClassMata_Name: TStringField
      DisplayWidth = 80
      FieldName = 'Mata_Name'
      Size = 150
    end
    object QMatClassParent_No: TStringField
      FieldName = 'Parent_No'
      Size = 4
    end
    object QMatClassMat_Class: TStringField
      FieldName = 'Mat_Class'
    end
    object QMatClassFCheck: TBooleanField
      DisplayWidth = 8
      FieldName = 'FCheck'
    end
    object QMatClassFCheck_Name: TStringField
      FieldName = 'FCheck_Name'
      Size = 10
    end
    object QMatClassCreate_Name: TStringField
      DisplayWidth = 2
      FieldName = 'Create_Name'
      Size = 10
    end
    object QMatClassCreate_Date: TDateTimeField
      DisplayWidth = 2
      FieldName = 'Create_Date'
    end
    object QMatClassUpd_Name: TStringField
      DisplayWidth = 2
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QMatClassUpd_Date: TDateTimeField
      DisplayWidth = 2
      FieldName = 'Upd_Date'
    end
  end
  object DQMatClass: TDataSource
    AutoEdit = False
    DataSet = QMatClass
    Left = 84
    Top = 64
  end
  object RQMatClass: TppDBPipeline
    DataSource = DQMatClass
    OpenDataSource = False
    UserName = 'RQMatClass'
    Left = 118
    Top = 64
    object RQDbMatClassppField1: TppField
      FieldAlias = 'Mata_No'
      FieldName = 'Mata_No'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField2: TppField
      FieldAlias = 'Mata_Name'
      FieldName = 'Mata_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField3: TppField
      FieldAlias = 'Parent_No'
      FieldName = 'Parent_No'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField4: TppField
      FieldAlias = 'Mat_Class'
      FieldName = 'Mat_Class'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField5: TppField
      FieldAlias = 'FCheck'
      FieldName = 'FCheck'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField6: TppField
      FieldAlias = 'FCheck_Name'
      FieldName = 'FCheck_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField7: TppField
      FieldAlias = 'Create_Name'
      FieldName = 'Create_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField8: TppField
      FieldAlias = 'Create_Date'
      FieldName = 'Create_Date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField9: TppField
      FieldAlias = 'Upd_Name'
      FieldName = 'Upd_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object RQDbMatClassppField10: TppField
      FieldAlias = 'Upd_Date'
      FieldName = 'Upd_Date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
end
