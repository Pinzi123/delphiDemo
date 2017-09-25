object AModelBrowserFrame: TAModelBrowserFrame
  Left = 0
  Top = 0
  Width = 854
  Height = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #26032#32048#26126#39636
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 854
    Height = 39
    Anchors = [akLeft, akRight]
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 35
        Width = 850
      end>
    Visible = False
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 837
      Height = 35
      AutoSize = True
      ButtonHeight = 35
      ButtonWidth = 31
      Caption = 'ToolBar1'
      DisabledImages = ADMSystem.ImageList2
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      Images = ADMSystem.ImageList1
      ParentFont = False
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object BtnNew: TToolButton
        Left = 0
        Top = 0
        Action = ActionNew
        AutoSize = True
      end
      object BtnEdit: TToolButton
        Left = 35
        Top = 0
        Action = ActionEdit
        AutoSize = True
      end
      object BtnDelete: TToolButton
        Left = 70
        Top = 0
        Action = ActionDelete
        AutoSize = True
      end
      object BtnCopy: TToolButton
        Left = 105
        Top = 0
        Action = ActionCopy
      end
      object BtnPaste: TToolButton
        Left = 136
        Top = 0
        Action = ActionPaste
      end
      object SptRefresh: TToolButton
        Left = 167
        Top = 0
        Width = 8
        Caption = 'SptRefresh'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object BtnRecord: TToolButton
        Left = 175
        Top = 0
        Action = ActionBrowse
        AutoSize = True
      end
      object BtnRefresh: TToolButton
        Left = 210
        Top = 0
        Action = ActionRefresh
        AutoSize = True
      end
      object BtnFilter: TToolButton
        Left = 245
        Top = 0
        Action = ActionFilter
        AutoSize = True
      end
      object ToolButton2: TToolButton
        Left = 280
        Top = 0
        Action = ActionFilterSql
      end
      object BtnSort: TToolButton
        Left = 311
        Top = 0
        Action = ActionSort
        AutoSize = True
      end
      object BtnSearch: TToolButton
        Left = 346
        Top = 0
        Action = ActionSearch
        AutoSize = True
      end
      object SptSelect: TToolButton
        Left = 381
        Top = 0
        Width = 8
        Caption = 'SptSelect'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object BtnSelect: TToolButton
        Left = 389
        Top = 0
        Action = ActionSelect
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object BtnCalculate: TToolButton
        Left = 424
        Top = 0
        Action = ActionCalculate
        AutoSize = True
      end
      object ToolButton1: TToolButton
        Left = 459
        Top = 0
        Action = ActionOther
      end
      object BtnSetup: TToolButton
        Left = 490
        Top = 0
        Action = ActionSetup
        AutoSize = True
      end
      object SptToFile: TToolButton
        Left = 525
        Top = 0
        Width = 8
        Caption = 'SptToFile'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object BtnToFile: TToolButton
        Left = 533
        Top = 0
        Action = ActionToFile
        AutoSize = True
      end
      object BtnPrivew: TToolButton
        Left = 568
        Top = 0
        Action = ActionPrivew
        AutoSize = True
      end
      object BtnDesigner: TToolButton
        Left = 603
        Top = 0
        Action = ActionDesigner
        AutoSize = True
      end
      object BtnPropert: TToolButton
        Left = 638
        Top = 0
        Action = ActionPropert
        AutoSize = True
      end
      object SptFCheck: TToolButton
        Left = 673
        Top = 0
        Width = 8
        Caption = 'SptFCheck'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object BtnFCheck: TToolButton
        Left = 681
        Top = 0
        Action = ActionFCheck
        AutoSize = True
      end
      object BtnRCheck: TToolButton
        Left = 716
        Top = 0
        Action = ActionRCheck
        AutoSize = True
      end
      object BtnECheck: TToolButton
        Left = 751
        Top = 0
        Action = ActionECheck
        AutoSize = True
      end
      object ToolButton3: TToolButton
        Left = 786
        Top = 0
        Action = ActioncClose
      end
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 618
    Top = 60
    object ActionNew: TAction
      Tag = 2
      Caption = #26032#22686
      Hint = #26032#22686#36039#26009
      ImageIndex = 0
      ShortCut = 113
      OnExecute = ActionNewExecute
    end
    object ActionEdit: TAction
      Tag = 4
      Caption = #20462#25913
      Hint = #20462#25913#36039#26009
      ImageIndex = 1
      ShortCut = 114
      OnExecute = ActionEditExecute
    end
    object ActionDelete: TAction
      Tag = 8
      Caption = #21034#38500
      Hint = #21034#38500#36039#26009
      ImageIndex = 2
      ShortCut = 115
      OnExecute = ActionDeleteExecute
    end
    object ActionCopy: TAction
      Caption = #22797#21046
      Hint = #22797#21046
      ImageIndex = 3
      ShortCut = 16451
      Visible = False
    end
    object ActionPaste: TAction
      Caption = #31896#36028
      Hint = #31896#36028
      ImageIndex = 4
      ShortCut = 16470
      Visible = False
    end
    object ActionBrowse: TAction
      Caption = #28687#35261
      Hint = #28687#35261#36039#26009
      ImageIndex = 6
      ShortCut = 116
      OnExecute = ActionBrowseExecute
    end
    object ActionRefresh: TAction
      Caption = #21047#26032
      Hint = #21047#26032#20840#37096#35352#37636
      ImageIndex = 5
      ShortCut = 117
      OnExecute = ActionRefreshExecute
    end
    object ActionFilter: TAction
      Caption = #36942#28670
      Hint = #36942#28670#36039#26009
      ImageIndex = 8
      ShortCut = 118
      OnExecute = ActionFilterExecute
    end
    object ActionFilterSql: TAction
      Caption = #25130#21462
      Hint = #25130#21462#36039#26009
      ImageIndex = 8
      OnExecute = ActionFilterSqlExecute
    end
    object ActionSort: TAction
      Caption = #25490#24207
      Hint = #25490#24207
      ImageIndex = 30
      ShortCut = 119
      OnExecute = ActionSortExecute
    end
    object ActionSearch: TAction
      Caption = #26597#25214
      Hint = #26597#25214
      ImageIndex = 7
      ShortCut = 120
      OnExecute = ActionSearchExecute
    end
    object ActionSelect: TAction
      Caption = #26597#35426
      Hint = #26597#35426
      ImageIndex = 36
      ShortCut = 16453
      Visible = False
      OnExecute = ActionSelectExecute
    end
    object ActionCalculate: TAction
      Caption = #32113#35336
      Hint = #32113#35336
      ImageIndex = 10
      ShortCut = 16461
      Visible = False
      OnExecute = ActionCalculateExecute
    end
    object ActionOther: TAction
      Caption = #20854#23427
      Hint = #20854' '#23427
      ImageIndex = 11
      ShortCut = 16462
      Visible = False
      OnExecute = ActionOtherExecute
    end
    object ActionSetup: TAction
      Caption = #35373#23450
      Hint = #35373#23450
      ImageIndex = 23
      ShortCut = 16452
      Visible = False
      OnExecute = ActionSetupExecute
    end
    object ActionToFile: TAction
      Tag = 16
      Caption = #23566#20986
      Hint = #23566#20986#36039#26009
      ImageIndex = 13
      ShortCut = 16454
      OnExecute = ActionToFileExecute
    end
    object ActionPrivew: TAction
      Tag = 32
      Caption = #38928#35261
      Hint = #22577#34920#38928#35261
      ImageIndex = 9
      ShortCut = 16464
      OnExecute = ActionPrivewExecute
    end
    object ActionDesigner: TAction
      Tag = 64
      Caption = #35373#35336
      Hint = #22577#34920#35373#35336
      ImageIndex = 15
      ShortCut = 16467
      OnExecute = ActionDesignerExecute
    end
    object ActionPropert: TAction
      Caption = #23660#24615
      Hint = #39023#31034#23660#24615
      ImageIndex = 19
      ShortCut = 16463
      OnExecute = ActionPropertExecute
    end
    object ActionFCheck: TAction
      Tag = 128
      Caption = #23529#26680
      Hint = #23529#26680
      ImageIndex = 16
      ShortCut = 16449
      Visible = False
      OnExecute = ActionFCheckExecute
    end
    object ActionRCheck: TAction
      Tag = 256
      Caption = #24489#26680
      Hint = #24489#26680
      ImageIndex = 17
      ShortCut = 16450
      Visible = False
      OnExecute = ActionRCheckExecute
    end
    object ActionECheck: TAction
      Tag = 512
      Caption = #26680#28310
      Hint = #26680#28310
      ImageIndex = 18
      ShortCut = 16451
      Visible = False
      OnExecute = ActionECheckExecute
    end
    object ActionSelectAll: TAction
      Caption = #20840#36984
      Hint = #20840#36984
      ImageIndex = 20
      ShortCut = 16460
      OnExecute = ActionSelectAllExecute
    end
    object ActionUnSelectAll: TAction
      Caption = #20840#19981#36984
      Hint = #20840#19981#36984
      ImageIndex = 21
      ShortCut = 16469
      OnExecute = ActionUnSelectAllExecute
    end
    object ActionCollapse: TAction
      Caption = #20840#37096#25910#21512
      Hint = #20840#37096#25910#21512
      ImageIndex = 26
      OnExecute = ActionCollapseExecute
    end
    object ActionExpand: TAction
      Caption = #20840#37096#23637#38283
      Hint = #20840#37096#23637#38283
      ImageIndex = 27
      OnExecute = ActionExpandExecute
    end
    object ActionShowAll: TAction
      Caption = #39023#31034#20840#37096
      Hint = #20840#37096#39023#31034
      ImageIndex = 12
      OnExecute = ActionShowAllExecute
    end
    object ActioncClose: TAction
      Caption = #38364#38281
      Hint = #38364#38281#31383#39636
      ImageIndex = 22
    end
  end
  object PubDesigner: TppDesigner
    AllowDataSettingsChange = True
    Caption = 'ReportBuilder'
    DataSettings.DatabaseName = 'DBDEMOS'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = PubReport
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 552
    Top = 61
  end
  object PubReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.DatabaseSettings.NameField = 'Report_Id'
    Template.DatabaseSettings.TemplateField = 'Report_File'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    ArchiveFileName = 'Report1'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 584
    Top = 60
    Version = '10.02'
    mmColumnWidth = 0
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 62
    object N1: TMenuItem
      Action = ActionNew
    end
    object N2: TMenuItem
      Action = ActionEdit
    end
    object N3: TMenuItem
      Action = ActionDelete
    end
    object N17: TMenuItem
      Action = ActionCopy
    end
    object N18: TMenuItem
      Action = ActionPaste
    end
    object MenuRefresh: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = ActionBrowse
    end
    object N5: TMenuItem
      Action = ActionRefresh
    end
    object N8: TMenuItem
      Action = ActionFilter
    end
    object N6: TMenuItem
      Action = ActionSort
    end
    object N7: TMenuItem
      Action = ActionSearch
    end
    object MenuSelect: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = ActionSelect
    end
    object N11: TMenuItem
      Action = ActionCalculate
    end
    object N12: TMenuItem
      Action = ActionOther
    end
    object N4: TMenuItem
      Action = ActionSetup
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Action = ActionSelectAll
    end
    object N21: TMenuItem
      Action = ActionUnSelectAll
    end
    object N22: TMenuItem
      Action = ActionCollapse
    end
    object N23: TMenuItem
      Action = ActionExpand
    end
    object N24: TMenuItem
      Action = ActionShowAll
      Visible = False
    end
  end
end
