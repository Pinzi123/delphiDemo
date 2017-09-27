inherited TeStoreCEditForm: TTeStoreCEditForm
  Left = 434
  Top = 593
  Caption = 'TeStoreCEditForm'
  ClientHeight = 188
  ClientWidth = 534
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 534
    Height = 188
    object Label6: TLabel
      Left = 0
      Top = 90
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Store_Eqty'
    end
    object Label1: TLabel
      Left = 0
      Top = 56
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Store_IQty'
    end
    object Label2: TLabel
      Left = 0
      Top = 26
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_No'
    end
    object Label7: TLabel
      Left = 263
      Top = 90
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Store_EAccount'
    end
    object Label8: TLabel
      Left = 263
      Top = 56
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Store_OQty'
    end
    object Label9: TLabel
      Left = 263
      Top = 26
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Name'
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 88
      Top = 54
      DataBinding.DataField = 'Store_IQty'
      DataBinding.DataSource = EditData
      TabOrder = 0
      Width = 135
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 88
      Top = 24
      DataBinding.DataField = 'Mat_No'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 1
      Width = 135
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 348
      Top = 24
      DataBinding.DataField = 'Mat_Name'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 2
      Width = 135
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 348
      Top = 54
      DataBinding.DataField = 'Store_OQty'
      DataBinding.DataSource = EditData
      TabOrder = 3
      Width = 135
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 88
      Top = 86
      DataBinding.DataField = 'Store_Eqty'
      DataBinding.DataSource = EditData
      TabOrder = 4
      Width = 135
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 348
      Top = 86
      DataBinding.DataField = 'Store_EAccount'
      DataBinding.DataSource = EditData
      TabOrder = 5
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Left = 132
    Top = 140
  end
  inherited cxButton2: TcxButton
    Left = 325
    Top = 140
  end
end
