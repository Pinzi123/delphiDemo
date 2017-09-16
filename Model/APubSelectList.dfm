object APubSelectListForm: TAPubSelectListForm
  Left = 225
  Top = 159
  Width = 653
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 645
    Height = 44
    Align = alTop
    Alignment = alTopLeft
    Caption = '  '#26597#25214#27396#20301'                           '#26597#25214#20839#23481
    TabOrder = 0
    TabStop = False
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
      Left = 504
      Top = 16
      Width = 64
      Height = 22
      Caption = #30906#23450'&R'
      Default = True
      TabOrder = 4
      TabStop = False
    end
    object cxButton4: TcxButton
      Left = 571
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
      Width = 161
      Height = 21
      Properties.OnChange = cxTextEdit1PropertiesChange
      TabOrder = 1
    end
    object cxComboBox2: TcxComboBox
      Left = 12
      Top = 17
      Width = 129
      Height = 21
      TabStop = False
      Properties.OnChange = cxComboBox2PropertiesChange
      Style.Color = clBtnFace
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 0
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
    Width = 645
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object wwDBGrid1: TwwDBGrid
    Tag = 1
    Left = 0
    Top = 44
    Width = 645
    Height = 367
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
    DataSource = DPubSelect
    KeyOptions = []
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgTrailingEllipsis, dgShowCellHint]
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #26032#32048#26126#39636
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    OnTitleButtonClick = wwDBGrid1TitleButtonClick
    OnDblClick = wwDBGrid1DblClick
    OnMouseUp = wwDBGrid1MouseUp
    OnCalcTitleImage = wwDBGrid1CalcTitleImage
    TitleImageList = ADMSystem.ImageList1
  end
  object DPubSelect: TDataSource
    AutoEdit = False
    Left = 496
    Top = 100
  end
  object PopupMenu1: TPopupMenu
    Left = 532
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
      OnClick = cxRadioButton1Click
    end
    object cxRadioButton2: TMenuItem
      Caption = #38283#38957#37096#20998#21305#37197'&S'
      Checked = True
      RadioItem = True
      OnClick = cxRadioButton1Click
    end
    object cxRadioButton3: TMenuItem
      Caption = #20219#24847#37096#20998#21305#37197'&A'
      RadioItem = True
      OnClick = cxRadioButton1Click
    end
  end
  object EditData: TDataSource
    AutoEdit = False
    Left = 90
    Top = 100
  end
end
