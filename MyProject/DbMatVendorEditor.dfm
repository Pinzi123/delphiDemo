inherited DbMatVendorEditorForm: TDbMatVendorEditorForm
  Caption = 'DbMatVendorEditorForm'
  ClientHeight = 237
  ClientWidth = 530
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 530
    Height = 237
    object Label1: TLabel
      Left = 22
      Top = 35
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vendor'
    end
    object Label2: TLabel
      Left = 262
      Top = 36
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vnd_Sim'
    end
    object Label3: TLabel
      Left = 262
      Top = 58
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vnd_Unit'
    end
    object Label4: TLabel
      Left = 22
      Top = 58
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Unit_Ways'
    end
    object Label5: TLabel
      Left = 22
      Top = 80
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Give_days'
    end
    object Label6: TLabel
      Left = 262
      Top = 124
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'P_No'
    end
    object Label7: TLabel
      Left = 264
      Top = 146
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CP_Name'
    end
    object Label8: TLabel
      Left = 22
      Top = 102
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Net_Wt'
    end
    object Label9: TLabel
      Left = 262
      Top = 102
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Gross_Wt'
    end
    object Label10: TLabel
      Left = 22
      Top = 124
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Wt_Unit'
    end
    object Label11: TLabel
      Left = 262
      Top = 79
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aply_Type'
    end
    object Label12: TLabel
      Left = 22
      Top = 146
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CP_No'
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 115
      Top = 32
      DataBinding.DataField = 'Vendor'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = cxDBButtonEdit1PropertiesEditValueChanged
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 0
      Width = 140
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 356
      Top = 32
      DataBinding.DataField = 'Vnd_Sim'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 1
      Width = 140
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 115
      Top = 54
      DataBinding.DataField = 'Unit_Ways'
      DataBinding.DataSource = EditData
      TabOrder = 2
      Width = 140
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 115
      Top = 76
      DataBinding.DataField = 'Give_days'
      DataBinding.DataSource = EditData
      TabOrder = 4
      Width = 140
    end
    object cxDBComboBox1: TcxDBComboBox
      Left = 356
      Top = 76
      DataBinding.DataField = 'Aply_Type'
      DataBinding.DataSource = EditData
      Properties.DropDownListStyle = lsEditFixedList
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 5
      Width = 140
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 115
      Top = 98
      DataBinding.DataField = 'Net_Wt'
      DataBinding.DataSource = EditData
      TabOrder = 6
      Width = 140
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 356
      Top = 98
      DataBinding.DataField = 'Gross_Wt'
      DataBinding.DataSource = EditData
      TabOrder = 7
      Width = 140
    end
    object cxDBComboBox2: TcxDBComboBox
      Left = 115
      Top = 120
      DataBinding.DataField = 'Wt_Unit'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 8
      Width = 140
    end
    object cxDBButtonEdit3: TcxDBButtonEdit
      Left = 356
      Top = 120
      DataBinding.DataField = 'P_No'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
      Properties.OnEditValueChanged = cxDBButtonEdit3PropertiesEditValueChanged
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 9
      Width = 140
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 357
      Top = 142
      DataBinding.DataField = 'CP_Name'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 11
      Width = 140
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 115
      Top = 142
      DataBinding.DataField = 'CP_No'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 10
      Width = 140
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 356
      Top = 54
      Hint = '1.'#33521#25991#21934#20301';'#13'2.'#20013#25991#21934#20301'.'
      DataBinding.DataField = 'Vnd_Unit'
      DataBinding.DataSource = EditData
      ParentShowHint = False
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
            FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
            FFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Kind = bkGlyph
        end
        item
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000FFFFFFFFFF00FFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFF00FFFFFFFFFFFFFFF00FFFFFFFFFFFFFFF00F
            FFFFFFFF00FFF00FFFFFFFFF000F000FFFFFFFFFF00000FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Kind = bkGlyph
        end>
      Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
      ShowHint = True
      Style.ButtonTransparency = ebtNone
      TabOrder = 3
      Width = 139
    end
  end
  inherited cxButton1: TcxButton
    Left = 156
    Top = 182
  end
  inherited cxButton2: TcxButton
    Left = 304
    Top = 182
  end
end
