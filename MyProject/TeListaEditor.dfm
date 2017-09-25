inherited DhListaEditorForm: TDhListaEditorForm
  Left = 402
  Top = 292
  Caption = 'DhListaEditorForm'
  ClientHeight = 267
  ClientWidth = 560
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 560
    Height = 267
    object Label1: TLabel
      Left = 259
      Top = 49
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_No'
    end
    object Label2: TLabel
      Left = 18
      Top = 26
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Item_No'
    end
    object Label5: TLabel
      Left = 17
      Top = 71
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Desc'
    end
    object Label10: TLabel
      Left = 17
      Top = 117
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Req_Qty'
    end
    object Label11: TLabel
      Left = 259
      Top = 116
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Out_Qty'
    end
    object Label12: TLabel
      Left = 17
      Top = 139
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'List_Qty'
    end
    object Label14: TLabel
      Left = 19
      Top = 162
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remark'
    end
    object Label16: TLabel
      Left = 259
      Top = 25
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vendor'
    end
    object Label3: TLabel
      Left = 18
      Top = 49
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Name'
    end
    object Label4: TLabel
      Left = 257
      Top = 92
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Unit'
    end
    object Label6: TLabel
      Left = 15
      Top = 92
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Price'
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 110
      Top = 22
      DataBinding.DataField = 'Item_No'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 0
      Width = 135
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 110
      Top = 67
      DataBinding.DataField = 'Mat_Desc'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 2
      Width = 377
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 110
      Top = 113
      DataBinding.DataField = 'Req_Qty'
      DataBinding.DataSource = EditData
      TabOrder = 3
      Width = 135
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 352
      Top = 113
      DataBinding.DataField = 'Out_Qty'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 4
      Width = 135
    end
    object cxDBTextEdit10: TcxDBTextEdit
      Left = 110
      Top = 135
      DataBinding.DataField = 'List_Qty'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 5
      Width = 135
    end
    object cxDBTextEdit12: TcxDBTextEdit
      Left = 110
      Top = 157
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = EditData
      TabOrder = 7
      Width = 377
    end
    object cxDBButtonEdit3: TcxDBButtonEdit
      Left = 352
      Top = 45
      DataBinding.DataField = 'Mat_No'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 1
      Width = 135
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 352
      Top = 22
      DataBinding.DataField = 'Vendor'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 6
      Width = 135
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 110
      Top = 45
      DataBinding.DataField = 'Mat_Name'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 8
      Width = 135
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 352
      Top = 89
      DataBinding.DataField = 'Unit'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 9
      Width = 135
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 110
      Top = 89
      DataBinding.DataField = 'Price'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 10
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Top = 204
  end
  inherited cxButton2: TcxButton
    Left = 300
    Top = 204
  end
end
