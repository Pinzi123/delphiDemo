inherited TePurchaseEditorForm: TTePurchaseEditorForm
  Left = 395
  Top = 325
  Caption = 'TePurchaseEditorForm'
  ClientHeight = 242
  ClientWidth = 537
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 11
    Top = 75
    Width = 90
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Pur_Date'
  end
  inherited Panel1: TPanel
    Width = 537
    Height = 242
    object Label1: TLabel
      Left = 11
      Top = 30
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Made_Factory'
    end
    object Label2: TLabel
      Left = 269
      Top = 29
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pur_No'
    end
    object Label3: TLabel
      Left = 11
      Top = 51
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vendor'
    end
    object Label5: TLabel
      Left = 12
      Top = 73
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'PA'
    end
    object Label11: TLabel
      Left = 15
      Top = 118
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remark1'
    end
    object Label16: TLabel
      Left = 11
      Top = 138
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remark'
    end
    object Label6: TLabel
      Left = 259
      Top = 73
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pur_Date'
    end
    object Label7: TLabel
      Left = 259
      Top = 51
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vnd_Sim'
    end
    object Label8: TLabel
      Left = 13
      Top = 95
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sum_Price'
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 104
      Top = 26
      DataBinding.DataField = 'Made_Factory'
      DataBinding.DataSource = EditData
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 0
      Width = 135
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 352
      Top = 26
      DataBinding.DataField = 'Pur_No'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 1
      Width = 135
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 104
      Top = 48
      DataBinding.DataField = 'Vendor'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 2
      Width = 135
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 353
      Top = 70
      DataBinding.DataField = 'Pur_Date'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 3
      Width = 135
    end
    object cxDBBlobEdit1: TcxDBBlobEdit
      Left = 105
      Top = 115
      DataBinding.DataField = 'Remark1'
      DataBinding.DataSource = EditData
      Properties.BlobEditKind = bekMemo
      Properties.BlobPaintStyle = bpsText
      Properties.PopupWidth = 370
      Properties.ReadOnly = True
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 4
      Width = 383
    end
    object cxDBBlobEdit2: TcxDBBlobEdit
      Left = 105
      Top = 137
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = EditData
      Properties.BlobEditKind = bekMemo
      Properties.BlobPaintStyle = bpsText
      Properties.PopupWidth = 370
      Properties.ReadOnly = False
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 5
      Width = 383
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 352
      Top = 47
      DataBinding.DataField = 'Vnd_Sim'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 6
      Width = 135
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 104
      Top = 92
      DataBinding.DataField = 'Sum_Price'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 7
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Left = 132
    Top = 175
  end
  inherited cxButton2: TcxButton
    Top = 175
  end
  object cxDBButtonEdit3: TcxDBButtonEdit [5]
    Left = 104
    Top = 70
    DataBinding.DataField = 'PA'
    DataBinding.DataSource = EditData
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
    Style.ButtonTransparency = ebtHideUnselected
    TabOrder = 4
    Width = 135
  end
  inherited EditData: TDataSource
    DataSet = ADMSystem.QAPubData
  end
end
