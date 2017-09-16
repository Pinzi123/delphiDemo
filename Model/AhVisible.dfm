inherited AhVisibleFrame: TAhVisibleFrame
  object cxDBTreeList1: TcxDBTreeList [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 845
    Height = 546
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 20
      end>
    BufferedPaint = False
    DataController.DataSource = DAhVisible
    DataController.ParentField = 'Parent_Name'
    DataController.KeyField = 'Menu_Name'
    LookAndFeel.Kind = lfStandard
    OptionsData.CancelOnExit = False
    OptionsData.Deleting = False
    OptionsSelection.HideFocusRect = False
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    RootValue = -1
    TabOrder = 1
    object cxDBTreeList1Menu_Name: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'Menu_Name'
      Options.Editing = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Menu_Desc: TcxDBTreeListColumn
      DataBinding.FieldName = 'Menu_Desc'
      Options.Editing = False
      Width = 612
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
    end
    object cxDBTreeList1Menu_Visible: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      DataBinding.FieldName = 'Menu_Visible'
      Width = 566
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Parent_Name: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'Parent_Name'
      Options.Editing = False
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  inherited PubReport: TppReport
    AutoStop = False
    DataPipeline = RAhVisible
    DataPipelineName = 'RAhVisible'
  end
  object QAhVisible: TMSQuery
    SQLUpdate.Strings = (
      'UPDATE Ah_Visible'
      'SET'
      
        '  User_Id = :User_Id, Menu_Name = :Menu_Name, Menu_Visible = :Me' +
        'nu_Visible'
      'WHERE'
      '  User_Id = :Old_User_Id AND Menu_Name = :Old_Menu_Name')
    SQLRefresh.Strings = (
      
        'SELECT Ah_Visible.User_Id, Ah_Visible.Menu_Name, Ah_Visible.Menu' +
        '_Visible FROM Ah_Visible'
      'WHERE'
      
        '  Ah_Visible.User_Id = :Old_User_Id AND Ah_Visible.Menu_Name = :' +
        'Old_Menu_Name')
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      
        'SELECT * FROM (SELECT         dbo.Ah_Visible.User_Id, dbo.Ah_Vis' +
        'ible.Menu_Name, '
      
        '                          dbo.Ac_Menu.Menu_Desc, dbo.Ah_Visible.' +
        'Menu_Visible, '
      '                          dbo.Ac_Menu.Parent_Name'
      'FROM             dbo.Ac_Menu INNER JOIN'
      
        '                          dbo.Ah_Visible ON dbo.Ac_Menu.Menu_Nam' +
        'e = dbo.Ah_Visible.Menu_Name'
      'WHERE  LEFT(dbo.Ah_Visible.Menu_Name,1)<>'#39'A'#39
      ') A')
    AutoCalcFields = False
    Left = 120
    Top = 60
    object QAhVisibleUser_Id: TStringField
      FieldName = 'User_Id'
      Size = 12
    end
    object QAhVisibleMenu_Name: TStringField
      DisplayWidth = 2
      FieldName = 'Menu_Name'
      Size = 7
    end
    object QAhVisibleMenu_Desc: TStringField
      DisplayWidth = 20
      FieldName = 'Menu_Desc'
      Size = 40
    end
    object QAhVisibleParent_Name: TStringField
      DisplayWidth = 2
      FieldName = 'Parent_Name'
      Size = 7
    end
    object QAhVisibleMenu_Visible: TBooleanField
      DisplayWidth = 5
      FieldName = 'Menu_Visible'
    end
  end
  object DAhVisible: TDataSource
    DataSet = QAhVisible
    Left = 158
    Top = 60
  end
  object RAhVisible: TppDBPipeline
    DataSource = DAhVisible
    OpenDataSource = False
    UserName = 'RAhVisible'
    Left = 198
    Top = 60
  end
end
