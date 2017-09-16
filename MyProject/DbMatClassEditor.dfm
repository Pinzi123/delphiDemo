inherited DbMatClassEditorForm: TDbMatClassEditorForm
  Left = 197
  Top = 120
  Caption = 'DbMatClassEditorForm'
  ClientHeight = 184
  ClientWidth = 539
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 539
    Height = 184
    object Label1: TLabel
      Left = 10
      Top = 40
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mata_No'
    end
    object Label2: TLabel
      Left = 10
      Top = 60
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mata_Name'
    end
    object Label3: TLabel
      Left = 10
      Top = 82
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Parent_No'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 112
      Top = 36
      Width = 135
      Height = 21
      DataBinding.DataField = 'Mata_No'
      DataBinding.DataSource = EditData
      Enabled = False
      Properties.CharCase = ecUpperCase
      Properties.OnChange = cxDBTextEdit1PropertiesChange
      TabOrder = 0
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 112
      Top = 80
      Width = 135
      Height = 21
      DataBinding.DataField = 'Parent_No'
      DataBinding.DataSource = EditData
      Properties.CharCase = ecUpperCase
      Properties.OnChange = cxDBTextEdit3PropertiesChange
      TabOrder = 2
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 112
      Top = 58
      Width = 407
      Height = 21
      DataBinding.DataField = 'Mata_Name'
      DataBinding.DataSource = EditData
      TabOrder = 1
    end
  end
  inherited cxButton1: TcxButton
    Left = 134
    Top = 126
  end
  inherited cxButton2: TcxButton
    Left = 286
    Top = 126
  end
end
