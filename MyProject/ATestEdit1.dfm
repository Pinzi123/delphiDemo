inherited GodownEditForm: TGodownEditForm
  Left = 258
  Top = 170
  Caption = 'GoDownEdit'
  ClientHeight = 252
  ClientWidth = 408
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 408
    Height = 252
    object Label1: TLabel
      Left = 50
      Top = 25
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'oddNum'
    end
    object Label2: TLabel
      Left = 50
      Top = 51
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'provider'
    end
    object Label3: TLabel
      Left = 50
      Top = 75
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'warehouse'
    end
    object Label4: TLabel
      Left = 50
      Top = 102
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'date'
    end
    object Label5: TLabel
      Left = 50
      Top = 128
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'amount'
    end
    object Label6: TLabel
      Left = 50
      Top = 156
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'staff'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 160
      Top = 21
      DataBinding.DataField = 'oddNum'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 0
      Width = 135
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 160
      Top = 72
      DataBinding.DataField = 'warehouse'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
      Properties.OnEditValueChanged = cxDBButtonEdit2PropertiesEditValueChanged
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 1
      Width = 135
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 160
      Top = 123
      DataBinding.DataField = 'amount'
      DataBinding.DataSource = EditData
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+\.{0,1}\d+'
      Properties.MaxLength = 0
      TabOrder = 2
      Width = 135
    end
    object cxDBButtonEdit3: TcxDBButtonEdit
      Left = 160
      Top = 150
      DataBinding.DataField = 'staff'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 3
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Left = 76
    Top = 194
  end
  inherited cxButton2: TcxButton
    Left = 254
    Top = 194
  end
  object cxDBButtonEdit1: TcxDBButtonEdit [4]
    Left = 160
    Top = 47
    DataBinding.DataField = 'provider'
    DataBinding.DataSource = EditData
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
    Properties.OnEditValueChanged = cxDBButtonEdit1PropertiesEditValueChanged
    Style.ButtonTransparency = ebtHideUnselected
    TabOrder = 4
    Width = 135
  end
  object cxDBDateEdit1: TcxDBDateEdit [5]
    Left = 160
    Top = 98
    DataBinding.DataField = 'date'
    DataBinding.DataSource = EditData
    TabOrder = 5
    Width = 135
  end
end
