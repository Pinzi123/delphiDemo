inherited DbMatNumberEditorForm: TDbMatNumberEditorForm
  Left = 326
  Top = 79
  Caption = 'DbMatNumberEditorForm'
  ClientHeight = 498
  ClientWidth = 540
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 540
    Height = 498
    object Label9: TLabel
      Left = 268
      Top = 177
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Chn_Unit'
    end
    object Label8: TLabel
      Left = 26
      Top = 176
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Eng_Unit'
    end
    object Label7: TLabel
      Left = 270
      Top = 155
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Eng_Color'
    end
    object Label6: TLabel
      Left = 26
      Top = 133
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Eng'
    end
    object Label5: TLabel
      Left = 26
      Top = 154
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Chn_Color'
    end
    object Label4: TLabel
      Left = 27
      Top = 111
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Other'
    end
    object Label3: TLabel
      Left = 268
      Top = 22
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Type'
    end
    object Label2: TLabel
      Left = 26
      Top = 88
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Name'
    end
    object Label10: TLabel
      Left = 26
      Top = 198
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Patten_No'
    end
    object Label11: TLabel
      Left = 268
      Top = 220
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pur_Way'
    end
    object Label13: TLabel
      Left = 28
      Top = 243
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Acc_Class'
    end
    object Label14: TLabel
      Left = 27
      Top = 264
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Over_Per'
    end
    object Label15: TLabel
      Left = 28
      Top = 287
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Safe_Qty'
    end
    object Label19: TLabel
      Left = 28
      Top = 309
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Volume'
    end
    object Label20: TLabel
      Left = 26
      Top = 330
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vl_Unit'
    end
    object Label23: TLabel
      Left = 28
      Top = 352
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'S_Position'
    end
    object Label24: TLabel
      Left = 268
      Top = 198
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Size_Type'
    end
    object Label25: TLabel
      Left = 27
      Top = 21
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_No'
    end
    object Label26: TLabel
      Left = 26
      Top = 220
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Patten'
    end
    object Label1: TLabel
      Left = 26
      Top = 396
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remark'
    end
    object lbl1: TLabel
      Left = 27
      Top = 375
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Price_Qty'
    end
    object Label12: TLabel
      Left = 26
      Top = 66
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Grade'
    end
    object Label16: TLabel
      Left = 268
      Top = 44
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Soft'
    end
    object Label17: TLabel
      Left = 26
      Top = 44
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mat_Width'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 120
      Top = 18
      DataBinding.DataField = 'Mat_No'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 0
      Width = 135
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 361
      Top = 194
      DataBinding.DataField = 'Size_Type'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = cxDBButtonEdit1PropertiesEditValueChanged
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 13
      Width = 135
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 120
      Top = 84
      DataBinding.DataField = 'Mat_Name'
      DataBinding.DataSource = EditData
      TabOrder = 5
      Width = 377
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 362
      Top = 18
      DataBinding.DataField = 'Mat_Type'
      DataBinding.DataSource = EditData
      TabOrder = 1
      Width = 135
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 120
      Top = 106
      DataBinding.DataField = 'Mat_Other'
      DataBinding.DataSource = EditData
      TabOrder = 6
      Width = 377
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 120
      Top = 128
      DataBinding.DataField = 'Mat_Eng'
      DataBinding.DataSource = EditData
      TabOrder = 7
      Width = 377
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 120
      Top = 150
      DataBinding.DataField = 'Chn_Color'
      DataBinding.DataSource = EditData
      TabOrder = 8
      Width = 135
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 362
      Top = 150
      DataBinding.DataField = 'Eng_Color'
      DataBinding.DataSource = EditData
      TabOrder = 9
      Width = 135
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 120
      Top = 172
      DataBinding.DataField = 'Eng_Unit'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 10
      Width = 135
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 362
      Top = 172
      DataBinding.DataField = 'Chn_Unit'
      DataBinding.DataSource = EditData
      Enabled = False
      TabOrder = 11
      Width = 135
    end
    object cxDBComboBox1: TcxDBComboBox
      Left = 361
      Top = 216
      DataBinding.DataField = 'Pur_Way'
      DataBinding.DataSource = EditData
      Properties.DropDownListStyle = lsEditFixedList
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 15
      Width = 135
    end
    object cxDBComboBox3: TcxDBComboBox
      Left = 121
      Top = 238
      DataBinding.DataField = 'Acc_Class'
      DataBinding.DataSource = EditData
      Properties.DropDownListStyle = lsEditFixedList
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 16
      Width = 135
    end
    object cxDBTextEdit10: TcxDBTextEdit
      Left = 121
      Top = 260
      DataBinding.DataField = 'Over_Per'
      DataBinding.DataSource = EditData
      TabOrder = 17
      Width = 135
    end
    object cxDBTextEdit11: TcxDBTextEdit
      Left = 121
      Top = 282
      DataBinding.DataField = 'Safe_Qty'
      DataBinding.DataSource = EditData
      TabOrder = 18
      Width = 135
    end
    object cxDBTextEdit15: TcxDBTextEdit
      Left = 121
      Top = 304
      DataBinding.DataField = 'Volume'
      DataBinding.DataSource = EditData
      TabOrder = 19
      Width = 135
    end
    object cxDBComboBox4: TcxDBComboBox
      Left = 121
      Top = 348
      DataBinding.DataField = 'S_Position'
      DataBinding.DataSource = EditData
      Properties.DropDownListStyle = lsEditFixedList
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 21
      Width = 135
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 117
      Top = 415
      Caption = 'With_Status'
      DataBinding.DataField = 'With_Status'
      DataBinding.DataSource = EditData
      TabOrder = 25
      Width = 72
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 185
      Top = 415
      Caption = 'Size_Status'
      DataBinding.DataField = 'Size_Status'
      DataBinding.DataSource = EditData
      Properties.OnChange = cxDBCheckBox2PropertiesChange
      TabOrder = 26
      Width = 69
    end
    object cxDBCheckBox3: TcxDBCheckBox
      Left = 251
      Top = 415
      Caption = 'Check_Status'
      DataBinding.DataField = 'Check_Status'
      DataBinding.DataSource = EditData
      TabOrder = 27
      Width = 70
    end
    object cxDBComboBox6: TcxDBComboBox
      Left = 121
      Top = 326
      DataBinding.DataField = 'Vl_Unit'
      DataBinding.DataSource = EditData
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 20
      Width = 135
    end
    object cxDBButtonEdit4: TcxDBButtonEdit
      Left = 120
      Top = 194
      DataBinding.DataField = 'Patten_No'
      DataBinding.DataSource = EditData
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit4PropertiesButtonClick
      Properties.OnEditValueChanged = cxDBButtonEdit4PropertiesEditValueChanged
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 12
      Width = 135
    end
    object cxDBTextEdit14: TcxDBTextEdit
      Left = 120
      Top = 216
      DataBinding.DataField = 'Patten'
      DataBinding.DataSource = EditData
      TabOrder = 14
      Width = 135
    end
    object cxCheckBox1: TcxCheckBox
      Left = 117
      Top = 434
      Caption = #33258#21205#24118#19978#19968#29289#26009#30340#24288#21830#26126#32048
      TabOrder = 31
      Width = 341
    end
    object cxDBCheckBox4: TcxDBCheckBox
      Left = 316
      Top = 415
      Caption = 'IsCust'
      DataBinding.DataField = 'IsCust'
      DataBinding.DataSource = EditData
      TabOrder = 28
      Width = 65
    end
    object cxDBCheckBox5: TcxDBCheckBox
      Left = 378
      Top = 415
      Caption = 'IsOrder'
      DataBinding.DataField = 'IsOrder'
      DataBinding.DataSource = EditData
      TabOrder = 29
      Width = 62
    end
    object cxDBImage1: TcxDBImage
      Left = 278
      Top = 238
      DataBinding.DataField = 'Mat_Pic'
      DataBinding.DataSource = EditData
      Properties.GraphicClassName = 'TJPEGImage'
      TabOrder = 24
      Height = 131
      Width = 218
    end
    object cxDBCheckBox6: TcxDBCheckBox
      Left = 440
      Top = 415
      Caption = 'Use_Status'
      DataBinding.DataField = 'Use_Status'
      DataBinding.DataSource = EditData
      TabOrder = 30
      Width = 69
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 120
      Top = 392
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = EditData
      TabOrder = 23
      Width = 377
    end
    object cxDBTextEdit12: TcxDBTextEdit
      Left = 121
      Top = 370
      DataBinding.DataField = 'Price_Qty'
      DataBinding.DataSource = EditData
      TabOrder = 22
      Width = 135
    end
    object cxDBTextEdit13: TcxDBTextEdit
      Left = 120
      Top = 62
      DataBinding.DataField = 'Mat_Grade'
      DataBinding.DataSource = EditData
      TabOrder = 4
      Width = 135
    end
    object cxDBTextEdit16: TcxDBTextEdit
      Left = 362
      Top = 40
      DataBinding.DataField = 'Mat_Soft'
      DataBinding.DataSource = EditData
      TabOrder = 3
      Width = 135
    end
    object cxDBTextEdit17: TcxDBTextEdit
      Left = 120
      Top = 40
      DataBinding.DataField = 'Mat_Width'
      DataBinding.DataSource = EditData
      TabOrder = 2
      Width = 135
    end
  end
  inherited cxButton1: TcxButton
    Left = 140
    Top = 458
  end
  inherited cxButton2: TcxButton
    Left = 316
    Top = 458
  end
  object SQLCopy: TMSSQL
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      'DECLARE  @Create_Name VARCHAR(20), @Create_Date VARCHAR(20)'
      'SET @Create_Name =:Create_Name '
      'SET @Create_Date =:Create_Date '
      
        'INSERT INTO dbo.Db_MatVendor(Mat_No, Vendor, Vnd_Unit, Unit_Ways' +
        ', Give_Days /*, P_No,  Net_Wt, Gross_Wt, Wt_Unit*/ ,Aply_Type , ' +
        'Create_Name, Create_Date)'
      
        'SELECT :P0, Vendor, Vnd_Unit, Unit_Ways, Give_Days /*, P_No, Net' +
        '_Wt, Gross_Wt, Wt_Unit*/ ,'#39#39', @Create_Name ,@Create_Date FROM db' +
        'o.Db_MatVendor'
      'WHERE Mat_No=:P1'
      ''
      
        'INSERT INTO dbo.Db_MatCust(Mat_No, Cust_Sim, C_Position, S_ManNo' +
        ', S_ManName,  Create_Name, Create_Date)'
      
        'SELECT :P2, Cust_Sim, C_Position, S_ManNo, S_ManName,  @Create_N' +
        'ame, @Create_Date FROM dbo.Db_MatCust'
      'WHERE Mat_No=:P3')
    Left = 12
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Create_Name'
      end
      item
        DataType = ftUnknown
        Name = 'Create_Date'
      end
      item
        DataType = ftUnknown
        Name = 'P0'
      end
      item
        DataType = ftUnknown
        Name = 'P1'
      end
      item
        DataType = ftUnknown
        Name = 'P2'
      end
      item
        DataType = ftUnknown
        Name = 'P3'
      end>
  end
end
