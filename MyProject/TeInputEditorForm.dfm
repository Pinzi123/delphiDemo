inherited TeInputEditorForm: TTeInputEditorForm
  Left = 363
  Top = 620
  Caption = 'TeInputEditorForm'
  ClientHeight = 217
  ClientWidth = 583
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 15
    Top = 74
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Pur_No'
  end
  inherited Panel1: TPanel
    Width = 583
    Height = 217
    object Label2: TLabel
      Left = 14
      Top = 29
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Str_Auto'
    end
    object Label16: TLabel
      Left = 6
      Top = 124
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remark'
    end
    object Label1: TLabel
      Left = 285
      Top = 53
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Give_Date'
    end
    object Label3: TLabel
      Left = 285
      Top = 76
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'List_No'
    end
    object Label4: TLabel
      Left = 14
      Top = 53
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Move_Date'
    end
    object Label6: TLabel
      Left = 14
      Top = 98
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'PA'
    end
    object Label7: TLabel
      Left = 14
      Top = 75
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pur_No'
    end
    object Label8: TLabel
      Left = 285
      Top = 100
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Depart_Name'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 100
      Top = 26
      DataBinding.DataField = 'Str_Auto'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 0
      Width = 135
    end
    object cxDBBlobEdit2: TcxDBBlobEdit
      Left = 100
      Top = 120
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = EditData
      Properties.BlobEditKind = bekMemo
      Properties.BlobPaintStyle = bpsText
      Properties.PopupWidth = 370
      Properties.ReadOnly = False
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 1
      Width = 402
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 100
      Top = 50
      DataBinding.DataField = 'Move_Date'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 2
      Width = 135
    end
    object cxDBDateEdit2: TcxDBDateEdit
      Left = 368
      Top = 51
      DataBinding.DataField = 'Give_Date'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 3
      Width = 135
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 368
      Top = 74
      DataBinding.DataField = 'List_No'
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
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 368
      Top = 98
      DataBinding.DataField = 'Depart_Name'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 5
      Width = 135
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 100
      Top = 96
      DataBinding.DataField = 'PA'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 6
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Top = 170
  end
  inherited cxButton2: TcxButton
    Left = 310
    Top = 170
  end
  object cxDBButtonEdit3: TcxDBButtonEdit [5]
    Left = 100
    Top = 73
    DataBinding.DataField = 'Pur_No'
    DataBinding.DataSource = EditData
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
    Properties.OnEditValueChanged = cxDBButtonEdit3PropertiesEditValueChanged
    Style.ButtonTransparency = ebtHideUnselected
    TabOrder = 4
    Width = 135
  end
end
