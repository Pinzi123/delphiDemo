object APubTreeSelectsForm: TAPubTreeSelectsForm
  Left = 251
  Top = 177
  Width = 663
  Height = 457
  ActiveControl = cxTextEdit1
  Caption = #26597#25214#23450#20301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #26032#32048#26126#39636
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Tag = 1
    Left = 239
    Top = 44
    Width = 416
    Height = 367
    Align = alClient
    BevelInner = bvNone
    PopupMenu = PopupMenu2
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Hint = #39318#35352#37636
      NavigatorButtons.PriorPage.Hint = #19978#19968#38913
      NavigatorButtons.Prior.Hint = #19978#19968#31558
      NavigatorButtons.Next.Hint = #19979#19968#31558
      NavigatorButtons.NextPage.Hint = #19979#19968#38913
      NavigatorButtons.Last.Hint = #23614#35352#37636
      NavigatorButtons.Insert.Enabled = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Enabled = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Enabled = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Enabled = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Hint = #21047#26032#20840#37096#35352#37636
      NavigatorButtons.SaveBookmark.Hint = #35373#23450#26360#31805
      NavigatorButtons.GotoBookmark.Hint = #31227#33267#26360#31805
      NavigatorButtons.Filter.Hint = #36039#26009#36942#28670
      DataController.DataSource = DPubSelect
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.NavigatorHints = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.Navigator = True
      OptionsView.NavigatorOffset = 0
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OnColumnHeaderClick = cxGrid1DBTableView1ColumnHeaderClick
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  '#26597#25214#27396#20301'                           '#26597#25214#20839#23481
    TabOrder = 0
    Height = 44
    Width = 655
    object cxButton1: TcxButton
      Left = 371
      Top = 16
      Width = 64
      Height = 22
      Caption = #25214#31532#19968#20491'&F'
      TabOrder = 2
      TabStop = False
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 438
      Top = 16
      Width = 64
      Height = 22
      Caption = #25214#19979#19968#20491'&N'
      TabOrder = 3
      TabStop = False
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 505
      Top = 16
      Width = 64
      Height = 22
      Caption = #30906#23450'&R'
      Default = True
      ModalResult = 1
      TabOrder = 4
      TabStop = False
    end
    object cxButton4: TcxButton
      Left = 572
      Top = 16
      Width = 64
      Height = 22
      Cancel = True
      Caption = #21462#28040'&C'
      ModalResult = 2
      TabOrder = 5
      TabStop = False
    end
    object cxTextEdit1: TcxTextEdit
      Left = 142
      Top = 17
      Properties.OnChange = cxTextEdit1PropertiesChange
      TabOrder = 1
      Width = 161
    end
    object cxComboBox2: TcxComboBox
      Left = 12
      Top = 17
      TabStop = False
      Properties.OnChange = cxComboBox2PropertiesChange
      Style.Color = clBtnFace
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 0
      Width = 129
    end
    object cxButton5: TcxButton
      Left = 305
      Top = 16
      Width = 64
      Height = 22
      Caption = #26597#25214#36984#38917
      TabOrder = 6
      TabStop = False
      DropDownMenu = PopupMenu1
      Kind = cxbkDropDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 411
    Width = 655
    Height = 19
    Panels = <>
  end
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 44
    Width = 231
    Height = 367
    Align = alLeft
    Bands = <>
    BufferedPaint = False
    DataController.DataSource = DAPubTree
    DataController.ParentField = 'Parent_No'
    DataController.KeyField = 'Key_No'
    LookAndFeel.Kind = lfFlat
    OptionsBehavior.CellHints = True
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.ConfirmDelete = False
    OptionsBehavior.MultiSort = False
    OptionsData.CancelOnExit = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.Indicator = True
    PopupMenu = PopupMenu2
    RootValue = -1
    TabOrder = 3
    OnFocusedNodeChanged = cxDBTreeList1FocusedNodeChanged
  end
  object cxSplitter1: TcxSplitter
    Left = 231
    Top = 44
    Width = 8
    Height = 367
    HotZoneClassName = 'TcxMediaPlayer8Style'
    Control = cxDBTreeList1
  end
  object DPubSelect: TDataSource
    AutoEdit = False
    DataSet = ADMSystem.QAPubData
    Left = 532
    Top = 100
  end
  object SelectStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = cxCheckBox1
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cxCheckBox2
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cxRadioButton1
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cxRadioButton2
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cxRadioButton3
        Properties.Strings = (
          'Checked')
      end>
    StorageName = 'SelectStore'
    Left = 566
    Top = 101
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 100
    object cxCheckBox1: TMenuItem
      Caption = #21363#26178#26597#25214'&I'
      OnClick = cxCheckBox1Click
    end
    object cxCheckBox2: TMenuItem
      Caption = #21312#20998#22823#23567#23531'&U'
      OnClick = cxCheckBox1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object cxRadioButton1: TMenuItem
      Caption = #23436#20840#21305#37197'&E'
      RadioItem = True
      OnClick = cxCheckBox1Click
    end
    object cxRadioButton2: TMenuItem
      Caption = #38283#38957#37096#20998#21305#37197'&S'
      Checked = True
      RadioItem = True
      OnClick = cxCheckBox1Click
    end
    object cxRadioButton3: TMenuItem
      Caption = #20219#24847#37096#20998#21305#37197'&A'
      RadioItem = True
      OnClick = cxCheckBox1Click
    end
  end
  object QAPubTree: TMSQuery
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      '')
    AutoCalcFields = False
    FetchAll = False
    Left = 424
    Top = 99
  end
  object DAPubTree: TDataSource
    AutoEdit = False
    DataSet = QAPubTree
    Left = 458
    Top = 100
  end
  object PopupMenu2: TPopupMenu
    Images = ADMSystem.ImageList1
    Left = 600
    Top = 102
    object TreeCollapse: TMenuItem
      Caption = #21512#37096#25910#21512
      ImageIndex = 26
      OnClick = TreeCollapseClick
    end
    object TreeExpand: TMenuItem
      Caption = #20840#37096#23637#38283
      ImageIndex = 27
      OnClick = TreeExpandClick
    end
    object TreeAll: TMenuItem
      Caption = #39023#31034#20840#37096#36039#26009
      ImageIndex = 12
      OnClick = TreeAllClick
    end
    object MenuNew: TMenuItem
      Caption = '-'
    end
    object MenuEdit: TMenuItem
      Caption = #26032#22686#36039#26009
    end
  end
end
