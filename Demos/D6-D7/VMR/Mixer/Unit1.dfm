object FormVMRMixer: TFormVMRMixer
  Left = 198
  Top = 114
  Caption = 'VMRMixer'
  ClientHeight = 377
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 344
    Width = 27
    Height = 13
    Caption = 'Alpha'
  end
  object VideoWindow: TVideoWindow
    Left = 0
    Top = 0
    Width = 425
    Height = 313
    Mode = vmVMR
    FilterGraph = FilterGraph
    VMROptions.Mode = vmrWindowed
    VMROptions.Streams = 2
    Color = clBlack
  end
  object btRender: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Render File ...'
    TabOrder = 1
    OnClick = btRenderClick
  end
  object Alpha: TTrackBar
    Left = 128
    Top = 344
    Width = 150
    Height = 23
    Max = 100
    Position = 50
    TabOrder = 2
    OnChange = AlphaChange
  end
  object CoordX: TTrackBar
    Left = 1
    Top = 320
    Width = 424
    Height = 23
    Max = 100
    Position = 50
    TabOrder = 3
    OnChange = CoordChange
  end
  object CoordY: TTrackBar
    Left = 434
    Top = 0
    Width = 23
    Height = 313
    Max = 100
    Orientation = trVertical
    Position = 50
    TabOrder = 4
    OnChange = CoordChange
  end
  object Button1: TButton
    Left = 320
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object FilterGraph: TFilterGraph
    AutoCreate = True
    GraphEdit = True
    LinearVolume = True
    Left = 40
    Top = 24
  end
  object OpenDialog: TOpenDialog
    Left = 32
    Top = 96
  end
end
