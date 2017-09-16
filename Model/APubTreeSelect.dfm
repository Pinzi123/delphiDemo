object APubTreeSelectForm: TAPubTreeSelectForm
  Left = 251
  Top = 177
  Width = 645
  Height = 442
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  '#26597#25214#27396#20301'                         '#26597#25214#20839#23481
    TabOrder = 0
    Height = 44
    Width = 637
    object cxButton1: TcxButton
      Left = 361
      Top = 16
      Width = 64
      Height = 22
      Caption = #25214#31532#19968#20491'&F'
      TabOrder = 2
      TabStop = False
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 428
      Top = 16
      Width = 64
      Height = 22
      Caption = #25214#19979#19968#20491'&N'
      TabOrder = 3
      TabStop = False
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 494
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
      Left = 561
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
      Left = 136
      Top = 16
      Properties.OnChange = cxTextEdit1PropertiesChange
      TabOrder = 1
      Width = 157
    end
    object cxComboBox2: TcxComboBox
      Left = 13
      Top = 16
      TabStop = False
      Properties.OnChange = cxComboBox2PropertiesChange
      Style.Color = clBtnFace
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 0
      Width = 121
    end
    object cxButton5: TcxButton
      Left = 295
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
    Top = 396
    Width = 637
    Height = 19
    Panels = <>
  end
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 44
    Width = 637
    Height = 352
    Align = alClient
    Bands = <>
    BufferedPaint = False
    DataController.DataSource = DPubSelect
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
    OptionsView.Indicator = True
    PopupMenu = PopupMenu2
    RootValue = -1
    TabOrder = 1
    OnColumnHeaderClick = cxDBTreeList1ColumnHeaderClick
    OnDblClick = cxDBTreeList1DblClick
  end
  object DPubSelect: TDataSource
    AutoEdit = False
    DataSet = ADMSystem.QAPubData
    Left = 478
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    Left = 404
    Top = 56
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
  object PopupMenu2: TPopupMenu
    Images = ADMSystem.ImageList1
    Left = 438
    Top = 56
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
    object MenuNew: TMenuItem
      Caption = '-'
    end
    object MenuEdit: TMenuItem
      Caption = #26032#22686#36039#26009
    end
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
    Left = 514
    Top = 56
  end
end
