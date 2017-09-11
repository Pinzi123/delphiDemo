inherited GodownDetailEditForm: TGodownDetailEditForm
  Left = 697
  Top = 206
  Caption = 'GodownDetailEdit'
  ClientHeight = 211
  ClientWidth = 547
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 547
    Height = 211
    object Label1: TLabel
      Left = 12
      Top = 30
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'productNum'
    end
    object Label2: TLabel
      Left = 13
      Top = 52
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'kind'
    end
    object Label8: TLabel
      Left = 12
      Top = 75
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'providerName'
    end
    object Label9: TLabel
      Left = 240
      Top = 71
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'specifications'
    end
    object Label10: TLabel
      Left = 34
      Top = 96
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'number'
    end
    object Label11: TLabel
      Left = 34
      Top = 118
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'remark'
    end
    object Label12: TLabel
      Left = 258
      Top = 95
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'price'
    end
    object Label13: TLabel
      Left = 258
      Top = 52
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'unit'
    end
    object Label14: TLabel
      Left = 258
      Top = 30
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'oddNum'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 116
      Top = 26
      DataBinding.DataField = 'productNum'
      DataBinding.DataSource = EditData
      TabOrder = 0
      Width = 135
    end
    object cxDBComboBox1: TcxDBComboBox
      Left = 116
      Top = 48
      DataBinding.DataField = 'kind'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 1
      Width = 135
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 116
      Top = 114
      DataBinding.DataField = 'remark'
      DataBinding.DataSource = EditData
      TabOrder = 2
      Width = 360
    end
    object cxDBComboBox2: TcxDBComboBox
      Left = 341
      Top = 48
      DataBinding.DataField = 'unit'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 3
      Width = 135
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 116
      Top = 70
      DataBinding.DataField = 'providerName'
      DataBinding.DataSource = EditData
      TabOrder = 4
      Width = 135
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 341
      Top = 26
      DataBinding.DataField = 'oddNum'
      DataBinding.DataSource = EditData
      TabOrder = 5
      Width = 135
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 341
      Top = 92
      DataBinding.DataField = 'price'
      DataBinding.DataSource = EditData
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+\.{0,1}\d+'
      Properties.MaxLength = 0
      TabOrder = 6
      Width = 135
    end
    object cxDBMaskEdit2: TcxDBMaskEdit
      Left = 116
      Top = 92
      DataBinding.DataField = 'number'
      DataBinding.DataSource = EditData
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      TabOrder = 7
      Width = 135
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 341
      Top = 70
      DataBinding.DataField = 'specifications'
      DataBinding.DataSource = EditData
      TabOrder = 8
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Left = 100
    Top = 155
  end
  inherited cxButton2: TcxButton
    Left = 318
    Top = 155
  end
end
