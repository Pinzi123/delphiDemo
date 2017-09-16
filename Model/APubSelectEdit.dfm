object APubSelectEditForm: TAPubSelectEditForm
  Left = 192
  Top = 107
  Width = 781
  Height = 564
  Caption = 'APubSelectEditForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object QAPubData: TMSQuery
    Connection = ADMSystem.ADMConnection
    Left = 24
    Top = 14
  end
end
