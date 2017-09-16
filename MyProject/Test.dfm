inherited TestForm: TTestForm
  Left = 331
  Top = 233
  Width = 870
  Height = 640
  Caption = 'TestForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fcStatusBar1: TfcStatusBar
    Top = 582
    Width = 854
  end
  inherited CoolBar2: TCoolBar
    Width = 854
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 35
        Width = 850
      end>
    inherited ToolBar2: TToolBar
      Width = 837
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 854
    Bands = <
      item
        Break = False
        Control = Panel6
        FixedSize = True
        ImageIndex = -1
        MinHeight = 22
        Width = 850
      end
      item
        Break = False
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 20
        Width = 850
      end>
    inherited ToolBar1: TToolBar
      Width = 837
    end
    inherited Panel6: TPanel
      Width = 850
    end
  end
  inherited cxDBTreeList1: TcxDBTreeList
    Height = 495
  end
  inherited cxSplitter1: TcxSplitter
    Height = 495
  end
  inherited dxPageControl1: TcxPageControl
    Width = 639
    Height = 495
    ClientRectBottom = 495
    ClientRectRight = 639
  end
end
