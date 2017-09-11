inherited Form1: TForm1
  Width = 870
  Height = 696
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  inherited CoolBar1: TCoolBar
    Width = 870
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 35
        Width = 866
      end>
    inherited ToolBar1: TToolBar
      Width = 853
    end
  end
  object DBGrid1: TwwDBGrid [1]
    Tag = 1
    Left = 0
    Top = 39
    Width = 870
    Height = 657
    HelpType = htKeyword
    Selected.Strings = (
      'Selected'#9'5'#9'Selected'#9#9
      'Field_Name'#9'20'#9'Field_Name'#9#9
      'Field_Desc'#9'20'#9'Field_Desc'#9#9
      'Display_Format'#9'20'#9'Display_Format'#9#9
      'Edit_Format'#9'20'#9'Edit_Format'#9#9
      'Field_Tag'#9'10'#9'Field_Tag'#9#9
      'Field_Type'#9'20'#9'Field_Type'#9#9
      'Field_Length'#9'10'#9'Field_Length'#9#9
      'Default_Value'#9'30'#9'Default_Value'#9#9
      'Field_Roles'#9'10'#9'Field_Roles'#9#9)
    IniAttributes.Delimiter = ';;'
    ExportOptions.ExportType = wwgetSYLK
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
    Align = alClient
    DataSource = dsDAfUser
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    KeyOptions = []
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    TitleImageList = ADMSystem.ImageList1
  end
  object QAfUser: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO Af_User'
      
        '  (User_Id, User_Name, Depart_No, Login_Id, Roles, User_Write, S' +
        'pecial, Exe_update, E_Mail, Create_Name, Create_Date, Upd_Name, ' +
        'Upd_Date)'
      'VALUES'
      
        '  (:User_Id, :User_Name, :Depart_No, :Login_Id, :Roles, :User_Wr' +
        'ite, :Special, :Exe_update, :E_Mail, :Create_Name, :Create_Date,' +
        ' :Upd_Name, :Upd_Date)')
    SQLDelete.Strings = (
      'DELETE FROM Af_User'
      'WHERE'
      '  User_Id = :Old_User_Id')
    SQLUpdate.Strings = (
      'UPDATE Af_User'
      'SET'
      
        '  User_Id = :User_Id, User_Name = :User_Name, Depart_No = :Depar' +
        't_No, Login_Id = :Login_Id, Roles = :Roles, User_Write = :User_W' +
        'rite, Special = :Special, Exe_update = :Exe_update, E_Mail = :E_' +
        'Mail, Create_Name = :Create_Name, Create_Date = :Create_Date, Up' +
        'd_Name = :Upd_Name, Upd_Date = :Upd_Date'
      'WHERE'
      '  User_Id = :Old_User_Id')
    SQLRefresh.Strings = (
      
        'SELECT Af_User.User_Id, Af_User.User_Name, Af_User.Depart_No, Af' +
        '_User.Login_Id, Af_User.Roles, Af_User.User_Write, Af_User.Speci' +
        'al, Af_User.Exe_update, Af_User.E_Mail, Af_User.Create_Name, Af_' +
        'User.Create_Date, Af_User.Upd_Name, Af_User.Upd_Date FROM Af_Use' +
        'r'
      'WHERE'
      '  Af_User.User_Id = :Old_User_Id')
    Connection = ADMSystem.ADMConnection
    SQL.Strings = (
      
        'SELECT * FROM (SELECT         dbo.Af_User.User_Id, dbo.Af_User.U' +
        'ser_Name, dbo.Af_User.Depart_No, '
      
        '                          dbo.Pa_Depart.Depart_Name, dbo.Af_User' +
        '.Login_Id, dbo.Af_User.Roles, '
      
        '                          dbo.Af_User.User_Write, dbo.Af_User.Sp' +
        'ecial, dbo.Af_User.Exe_update, '
      
        '                          dbo.Af_User.E_Mail, dbo.Af_User.Create' +
        '_Name, dbo.Af_User.Create_Date, '
      
        '                          dbo.Af_User.Upd_Name, dbo.Af_User.Upd_' +
        'Date'
      'FROM             dbo.Af_User LEFT OUTER JOIN'
      
        '                          dbo.Pa_Depart ON dbo.Af_User.Depart_No' +
        ' = dbo.Pa_Depart.Depart_No) A')
    AutoCalcFields = False
    OnCalcFields = QAfUserCalcFields
    Left = 60
    Top = 68
    object QAfUserSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Selected'
      Calculated = True
    end
    object strngfldQAfUserUser_Id: TStringField
      FieldName = 'User_Id'
      Visible = False
      Size = 12
    end
    object strngfldQAfUserUser_Name: TStringField
      FieldName = 'User_Name'
      Visible = False
      Size = 12
    end
    object strngfldQAfUserDepart_No: TStringField
      FieldName = 'Depart_No'
      Visible = False
      Size = 12
    end
    object strngfldQAfUserDepart_Name: TStringField
      FieldName = 'Depart_Name'
      Visible = False
      Size = 30
    end
    object strngfldQAfUserLogin_Id: TStringField
      FieldName = 'Login_Id'
      Visible = False
      Size = 12
    end
    object intgrfldQAfUserRoles: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Roles'
      Visible = False
    end
    object strngfldQAfUserGroup_Desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'Group_Desc'
      Visible = False
      Size = 100
      Calculated = True
    end
    object intgrfldQAfUserSpecial: TIntegerField
      FieldName = 'Special'
      Visible = False
    end
    object dtmfldQAfUserExe_update: TDateTimeField
      FieldName = 'Exe_update'
      Visible = False
    end
    object QAfUserUser_Write: TBlobField
      FieldName = 'User_Write'
      Visible = False
    end
    object strngfldQAfUserE_Mail: TStringField
      FieldName = 'E_Mail'
      Visible = False
      Size = 50
    end
    object strngfldQAfUserCreate_Name: TStringField
      FieldName = 'Create_Name'
      Visible = False
      Size = 10
    end
    object dtmfldQAfUserCreate_Date: TDateTimeField
      FieldName = 'Create_Date'
      Visible = False
    end
    object strngfldQAfUserUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Visible = False
      Size = 10
    end
    object dtmfldQAfUserUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
      Visible = False
    end
  end
  object dsDAfUser: TDataSource
    AutoEdit = False
    DataSet = QAfUser
    Left = 98
    Top = 68
  end
  object RAfUser: TppDBPipeline
    DataSource = dsDAfUser
    OpenDataSource = False
    UserName = 'RAfUser'
    Left = 138
    Top = 68
  end
end
