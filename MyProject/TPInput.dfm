inherited PInputFrame: TPInputFrame
  Height = 635
  inherited wwDBGrid1: TwwDBGrid
    Height = 411
  end
  inherited wwDBGrid2: TwwDBGrid
    Top = 435
  end
  inherited QTeMaster: TMSQuery
    SQL.Strings = (
      'select * FROM [CNData].[dbo].[Te_Store] where Pur_No <> '#39#39)
    object QTeMasterStr_Auto: TGuidField
      FieldName = 'Str_Auto'
      FixedChar = True
      Size = 38
    end
    object QTeMasterPur_No: TStringField
      FieldName = 'Pur_No'
      Size = 38
    end
    object QTeMasterList_No: TStringField
      FieldName = 'List_No'
      Visible = False
      Size = 38
    end
    object QTeMasterGive_Date: TDateTimeField
      FieldName = 'Give_Date'
    end
    object QTeMasterMove_Date: TDateTimeField
      FieldName = 'Move_Date'
    end
    object QTeMasterPA: TStringField
      FieldName = 'PA'
      Size = 12
    end
    object QTeMasterDepart_Name: TStringField
      FieldName = 'Depart_Name'
      Size = 30
    end
    object QTeMasterRemark: TStringField
      FieldName = 'Remark'
      Size = 120
    end
    object QTeMasterAply_Status: TBooleanField
      FieldName = 'Aply_Status'
    end
    object QTeMasterTemp_Date: TStringField
      FieldName = 'Temp_Date'
      Size = 10
    end
    object QTeMasterFCheck: TBooleanField
      FieldName = 'FCheck'
    end
    object QTeMasterFCheck_Name: TStringField
      FieldName = 'FCheck_Name'
      Size = 10
    end
    object QTeMasterRCheck: TBooleanField
      FieldName = 'RCheck'
    end
    object QTeMasterRCheck_Name: TStringField
      FieldName = 'RCheck_Name'
      Size = 10
    end
    object QTeMasterCreate_Name: TStringField
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTeMasterCreate_Date: TDateTimeField
      FieldName = 'Create_Date'
    end
    object QTeMasterUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTeMasterUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
    end
    object QTeMasterLA: TStringField
      FieldName = 'LA'
      Size = 12
    end
  end
  inherited QTeA: TMSQuery
    SQL.Strings = (
      
        'select Te_Storea.*,Bb_Vendor.Vnd_Sim  FROM Te_Storea left join d' +
        'bo.Bb_Vendor on Te_Storea.Vendor = Bb_Vendor.Vendor')
    MasterFields = 'Str_Auto;Pur_No'
    DetailFields = 'Str_Auto;Pur_No'
    ParamData = <
      item
        DataType = ftString
        Name = 'Str_Auto'
      end
      item
        DataType = ftString
        Name = 'Pur_No'
      end>
    object QTeAStr_Auto: TGuidField
      FieldName = 'Str_Auto'
      FixedChar = True
      Size = 38
    end
    object QTeAList_No: TStringField
      FieldName = 'List_No'
      Size = 38
    end
    object QTeAPur_No: TStringField
      FieldName = 'Pur_No'
      Size = 38
    end
    object QTeAItem_No: TIntegerField
      FieldName = 'Item_No'
    end
    object QTeAMat_No: TStringField
      FieldName = 'Mat_No'
      Size = 14
    end
    object QTeAVendor: TStringField
      FieldName = 'Vendor'
      Size = 12
    end
    object QTeAVnd_Qty: TFloatField
      FieldName = 'Vnd_Qty'
    end
    object QTeAPay_Qty: TFloatField
      FieldName = 'Pay_Qty'
    end
    object QTeAPrice: TFloatField
      FieldName = 'Price'
    end
    object QTeASign_Int: TIntegerField
      FieldName = 'Sign_Int'
    end
    object QTeAQua_Qty: TFloatField
      FieldName = 'Qua_Qty'
    end
    object QTeAUnQua_Qty: TFloatField
      FieldName = 'UnQua_Qty'
    end
    object QTeARefuse_Qty: TFloatField
      FieldName = 'Refuse_Qty'
    end
    object QTeARemark: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object QTeACreate_Name: TStringField
      FieldName = 'Create_Name'
      Size = 10
    end
    object QTeACreate_Date: TDateTimeField
      FieldName = 'Create_Date'
    end
    object QTeAUpd_Name: TStringField
      FieldName = 'Upd_Name'
      Size = 10
    end
    object QTeAUpd_Date: TDateTimeField
      FieldName = 'Upd_Date'
    end
    object QTeAMat_Desc: TStringField
      FieldName = 'Mat_Desc'
      Size = 50
    end
    object QTeAMat_Name: TStringField
      FieldName = 'Mat_Name'
      Size = 50
    end
    object QTeAAcc_Qty: TFloatField
      FieldName = 'Acc_Qty'
    end
    object QTeAUnit: TStringField
      FieldName = 'Unit'
      Size = 8
    end
    object QTeAVnd_Sim: TStringField
      FieldName = 'Vnd_Sim'
      ReadOnly = True
      Size = 60
    end
  end
  inherited RTeMaster: TppDBPipeline
    UserName = 'PInput'
  end
  object ActionList1: TActionList
    Left = 432
    Top = 112
  end
end
