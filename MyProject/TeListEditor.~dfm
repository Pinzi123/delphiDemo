inherited DhListEditorForm: TDhListEditorForm
  Caption = 'DhListEditorForm'
  ClientHeight = 163
  ClientWidth = 533
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [0]
    Left = 20
    Top = 74
    Width = 90
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LA'
  end
  inherited Panel1: TPanel
    Width = 533
    Height = 163
    object Label1: TLabel
      Left = 20
      Top = 29
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'List_No'
    end
    object Label4: TLabel
      Left = 252
      Top = 30
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'List_Date'
    end
    object Label6: TLabel
      Left = 20
      Top = 100
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remark'
    end
    object Label2: TLabel
      Left = 20
      Top = 52
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Depart_No'
    end
    object Label3: TLabel
      Left = 252
      Top = 51
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Depart_Name'
    end
    object Label5: TLabel
      Left = 20
      Top = 75
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LA'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 112
      Top = 26
      DataBinding.DataField = 'List_No'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 0
      Width = 135
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 344
      Top = 26
      DataBinding.DataField = 'List_Date'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 1
      Width = 135
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 112
      Top = 96
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = EditData
      TabOrder = 4
      Width = 367
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 112
      Top = 48
      DataBinding.DataField = 'Depart_No'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = cxDBButtonEdit1PropertiesEditValueChanged
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 2
      Width = 135
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 344
      Top = 48
      DataBinding.DataField = 'Depart_Name'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 3
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Left = 150
    Top = 124
  end
  inherited cxButton2: TcxButton
    Left = 310
    Top = 124
  end
  object cxDBButtonEdit2: TcxDBButtonEdit [5]
    Left = 112
    Top = 71
    DataBinding.DataField = 'LA'
    DataBinding.DataSource = EditData
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
    Style.ButtonTransparency = ebtHideUnselected
    TabOrder = 4
    Width = 135
  end
  inherited EditData: TDataSource
    Top = 10
  end
end
