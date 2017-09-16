object APubFilterSqlForm: TAPubFilterSqlForm
  Left = 274
  Top = 276
  BorderStyle = bsDialog
  Caption = #25130#21462#36039#26009
  ClientHeight = 326
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #26032#32048#26126#39636
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 326
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 635
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 6
        Width = 118
        Height = 15
        AutoSize = False
        Caption = #32232#36655#25130#21462#26781#20214':'
      end
      object Label2: TLabel
        Left = 168
        Top = 8
        Width = 105
        Height = 13
        AutoSize = False
        Caption = 'LIKE'#28858#27169#31946#26597#35426
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = #26032#32048#26126#39636
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 284
      Width = 635
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object cxButton1: TcxButton
        Left = 14
        Top = 6
        Width = 75
        Height = 25
        Caption = #35712#21462'...'
        TabOrder = 0
        OnClick = cxButton1Click
      end
      object cxButton4: TcxButton
        Left = 402
        Top = 8
        Width = 75
        Height = 25
        Caption = #30906#23450
        TabOrder = 3
        OnClick = cxButton4Click
      end
      object cxButton5: TcxButton
        Left = 502
        Top = 8
        Width = 75
        Height = 25
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 4
      end
      object cxButton3: TcxButton
        Left = 198
        Top = 6
        Width = 75
        Height = 25
        Caption = #38928#35261
        TabOrder = 2
        OnMouseDown = cxButton3MouseDown
        OnMouseUp = cxButton3MouseUp
      end
      object cxButton2: TcxButton
        Left = 106
        Top = 6
        Width = 75
        Height = 25
        Caption = #20445#23384'...'
        TabOrder = 1
        OnClick = cxButton2Click
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 27
      Width = 635
      Height = 160
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DFilterSql
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Appending = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1Left_Sign: TcxGridDBColumn
          DataBinding.FieldName = 'Left_Sign'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Items.Strings = (
            '('
            '(('
            '((('
            '((((')
          Index = 0
          Width = 62
        end
        object cxGrid1DBTableView1Field_Name: TcxGridDBColumn
          DataBinding.FieldName = 'Field_Name'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.OnChange = cxGrid1DBTableView1Field_NamePropertiesChange
          Properties.OnEditValueChanged = cxGrid1DBTableView1Field_NamePropertiesEditValueChanged
          Index = 1
        end
        object cxGrid1DBTableView1Mid_Sign: TcxGridDBColumn
          DataBinding.FieldName = 'Mid_Sign'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownRows = 10
          Properties.Items.Strings = (
            '='
            '<'
            '<='
            '>'
            '>='
            '<>'
            'in'
            'like'
            'not like'
            'is null')
          Properties.MaxLength = 10
          Index = 2
          Width = 61
        end
        object cxGrid1DBTableView1Field_Value: TcxGridDBColumn
          DataBinding.FieldName = 'Field_Value'
          Index = 3
          Width = 250
        end
        object cxGrid1DBTableView1Right_Sign: TcxGridDBColumn
          DataBinding.FieldName = 'Right_Sign'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Items.Strings = (
            ')'
            '))'
            ')))'
            '))))')
          Index = 4
          Width = 58
        end
        object cxGrid1DBTableView1Logic_Sign: TcxGridDBColumn
          DataBinding.FieldName = 'Logic_Sign'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Items.Strings = (
            'AND'
            'OR')
          Index = 5
          Width = 56
        end
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Index = 6
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxMemoSqlTxt: TcxMemo
      Left = 1
      Top = 195
      Align = alBottom
      Properties.ReadOnly = True
      TabOrder = 3
      Visible = False
      Height = 89
      Width = 635
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 187
      Width = 635
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = cxMemoSqlTxt
      Visible = False
    end
  end
  object OldDataSource: TDataSource
    Left = 548
    Top = 68
  end
  object DPubFilterSql: TDataSource
    Left = 548
    Top = 42
  end
  object QFilterSql: TVirtualTable
    FieldDefs = <
      item
        Name = 'Left_Sign'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Field_Name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Mid_Sign'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Field_Value'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Right_Sign'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Logic_Sign'
        DataType = ftString
        Size = 3
      end>
    Left = 480
    Top = 2
    Data = {
      0200060009004C6566745F5369676E010006000A004669656C645F4E616D6501
      00140008004D69645F5369676E01000A000B004669656C645F56616C75650100
      3C000A0052696768745F5369676E010006000A004C6F6769635F5369676E0100
      0300000000000000}
    object QFilterSqlLeft_Sign: TStringField
      DisplayLabel = #24038#25324#34399
      FieldName = 'Left_Sign'
      Size = 6
    end
    object QFilterSqlField_Name: TStringField
      DisplayLabel = #27396#20301#21517#31281
      FieldName = 'Field_Name'
    end
    object QFilterSqlMid_Sign: TStringField
      DisplayLabel = #31526#34399
      DisplayWidth = 10
      FieldName = 'Mid_Sign'
      Size = 10
    end
    object QFilterSqlField_Value: TStringField
      DisplayLabel = #26781#20214#20540
      FieldName = 'Field_Value'
      Size = 60
    end
    object QFilterSqlRight_Sign: TStringField
      DisplayLabel = #21491#25324#34399
      FieldName = 'Right_Sign'
      Size = 6
    end
    object QFilterSqlLogic_Sign: TStringField
      DisplayLabel = #37007#36655
      DisplayWidth = 6
      FieldName = 'Logic_Sign'
      Size = 3
    end
  end
  object DFilterSql: TDataSource
    DataSet = QFilterSql
    Left = 516
    Top = 2
  end
  object FilterSqlStore: TcxPropertiesStore
    Components = <>
    StorageName = 'FilterSqlStore'
    Left = 548
  end
  object PopupMenu1: TPopupMenu
    Left = 26
    Top = 72
    object QFilterSqlAppend: TMenuItem
      Caption = #22686#21152
      OnClick = QFilterSqlAppendClick
    end
    object QFilterSqlInsert: TMenuItem
      Caption = #25554#20837
      OnClick = QFilterSqlInsertClick
    end
    object QFilterSqlDelete: TMenuItem
      Caption = #21034#38500
      OnClick = QFilterSqlDeleteClick
    end
    object QFilterSqlClear: TMenuItem
      Caption = #28165#38500
      OnClick = QFilterSqlClearClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object QFilterSqlRead: TMenuItem
      Caption = #35712#21462'...'
      OnClick = cxButton1Click
    end
    object QFilterSqlWrite: TMenuItem
      Caption = #20445#23384'...'
      OnClick = cxButton2Click
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'vtd'
    FileName = 'Data1.vtd'
    Filter = 'Virtual Table Data (*.vtd)|*.vtd|Any File (*.*)|*.*'
    Left = 548
    Top = 100
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'vtd'
    Filter = 'Virtual Table Data (*.vtd)|*.vtd|Any File (*.*)|*.*'
    OnCanClose = SaveDialogCanClose
    Left = 548
    Top = 130
  end
end
