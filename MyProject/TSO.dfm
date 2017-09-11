inherited SOFrame: TSOFrame
  Height = 682
  inherited wwDBGrid1: TwwDBGrid
    Height = 443
  end
  inherited wwDBGrid2: TwwDBGrid
    Top = 482
  end
  inherited QTeMaster: TMSQuery
    SQL.Strings = (
      'SELECT * FROM [CNData].[dbo].[Te_List]')
    object QTeMasterList_No: TStringField
      FieldName = 'List_No'
      Size = 12
    end
    object QTeMasterDepart_No: TStringField
      FieldName = 'Depart_No'
      Size = 12
    end
    object QTeMasterDepart_Name: TStringField
      FieldName = 'Depart_Name'
      Size = 30
    end
    object QTeMasterUse_Group: TStringField
      FieldName = 'Use_Group'
      Size = 30
    end
    object QTeMasterList_Date: TDateTimeField
      FieldName = 'List_Date'
    end
    object QTeMasterRemark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
    object QTeMasterFCheck: TBooleanField
      FieldName = 'FCheck'
    end
    object QTeMasterFCheck_Name: TStringField
      FieldName = 'FCheck_Name'
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
    object QTeMasterList_Type: TStringField
      FieldName = 'List_Type'
      Size = 12
    end
    object QTeMasterMove_Type: TStringField
      FieldName = 'Move_Type'
      Size = 3
    end
    object QTeMasterIsOrder: TBooleanField
      FieldName = 'IsOrder'
    end
    object QTeMasterUse_Status: TBooleanField
      FieldName = 'Use_Status'
    end
    object QTeMasterPrint_Status: TBooleanField
      FieldName = 'Print_Status'
    end
    object QTeMasterFCheck_Date: TDateTimeField
      FieldName = 'FCheck_Date'
    end
    object QTeMasterRCheck_Name: TStringField
      FieldName = 'RCheck_Name'
      Size = 10
    end
    object QTeMasterRCheck_Date: TDateTimeField
      FieldName = 'RCheck_Date'
    end
    object QTeMasterRCheck: TBooleanField
      FieldName = 'RCheck'
    end
    object QTeMasterTemp_Status: TBooleanField
      FieldName = 'Temp_Status'
    end
  end
  inherited QTeA: TMSQuery
    SQL.Strings = (
      'SELECT * FROM [CNData].[dbo].[Te_Lista]')
    MasterFields = 'List_No'
    DetailFields = 'List_No'
    ParamData = <
      item
        DataType = ftString
        Name = 'List_No'
      end>
    object QTeAList_No: TStringField
      FieldName = 'List_No'
      Visible = False
      Size = 12
    end
    object QTeAItem_No: TIntegerField
      FieldName = 'Item_No'
    end
    object QTeAPart_No: TStringField
      FieldName = 'Part_No'
      Size = 12
    end
    object QTeAMat_No: TStringField
      FieldName = 'Mat_No'
      Size = 14
    end
    object QTeAMat_Name: TStringField
      FieldName = 'Mat_Name'
      Size = 50
    end
    object QTeAMat_Desc: TStringField
      FieldName = 'Mat_Desc'
      Size = 50
    end
    object QTeAVendor: TStringField
      FieldName = 'Vendor'
      Size = 12
    end
    object QTeAUse_Cust: TStringField
      FieldName = 'Use_Cust'
      Size = 12
    end
    object QTeAReq_Qty: TFloatField
      FieldName = 'Req_Qty'
    end
    object QTeAList_Qty: TFloatField
      FieldName = 'List_Qty'
    end
    object QTeAOut_Qty: TFloatField
      FieldName = 'Out_Qty'
    end
    object QTeARemark: TStringField
      FieldName = 'Remark'
      Size = 120
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
  end
end
