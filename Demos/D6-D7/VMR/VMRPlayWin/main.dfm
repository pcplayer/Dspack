object FormPlayWin: TFormPlayWin
  Left = 314
  Top = 136
  Caption = 'VMR Media Player'
  ClientHeight = 568
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object VideoWindow: TVideoWindow
    Left = 0
    Top = 0
    Width = 434
    Height = 294
    Mode = vmVMR
    FilterGraph = FilterGraph
    VMROptions.Mode = vmrWindowless
    VMROptions.Preferences = [vpForceMixer, vpPreferAGPMemWhenMixing]
    Color = clBlack
    Align = alClient
    OnDblClick = btFullScreenClick
    ExplicitLeft = -208
    ExplicitTop = 400
  end
  object TrackBar: TDSTrackBar
    Left = 0
    Top = 429
    Width = 434
    Height = 25
    Align = alBottom
    Frequency = 60
    TabOrder = 1
    FilterGraph = FilterGraph
    OnTimer = TrackBarTimer
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 483
    Width = 434
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 454
    Width = 434
    Height = 29
    Align = alBottom
    Caption = 'ToolBar'
    Images = ImageList
    TabOrder = 3
    object btPlay: TToolButton
      Left = 0
      Top = 0
      Caption = 'btPlay'
      ImageIndex = 3
      OnClick = btPlayClick
    end
    object btPause: TToolButton
      Left = 23
      Top = 0
      Caption = 'btPause'
      ImageIndex = 2
      OnClick = btPauseClick
    end
    object btStop: TToolButton
      Left = 46
      Top = 0
      Caption = 'btStop'
      ImageIndex = 4
      OnClick = btStopClick
    end
    object ToolButton1: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object btFullScreen: TToolButton
      Left = 77
      Top = 0
      Caption = 'btFullScreen'
      ImageIndex = 8
      OnClick = btFullScreenClick
    end
    object ToolButton2: TToolButton
      Left = 100
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 9
    end
    object SoundLevel: TTrackBar
      Left = 123
      Top = 0
      Width = 60
      Height = 22
      Max = 10000
      Frequency = 1000
      TabOrder = 0
      OnChange = SoundLevelChange
    end
  end
  object log: TMemo
    Left = 0
    Top = 502
    Width = 434
    Height = 66
    Align = alBottom
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    TabOrder = 4
  end
  object VideoControl: TPanel
    Left = 0
    Top = 294
    Width = 434
    Height = 135
    Align = alBottom
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Brightness'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 39
      Height = 13
      Caption = 'Contrast'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 20
      Height = 13
      Caption = 'Hue'
    end
    object Label4: TLabel
      Left = 8
      Top = 80
      Width = 48
      Height = 13
      Caption = 'Saturation'
    end
    object Label5: TLabel
      Left = 224
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Position X'
    end
    object Label6: TLabel
      Left = 224
      Top = 32
      Width = 47
      Height = 13
      Caption = 'Position Y'
    end
    object Label7: TLabel
      Left = 224
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Size X'
    end
    object Label8: TLabel
      Left = 224
      Top = 80
      Width = 30
      Height = 13
      Caption = 'Size Y'
    end
    object Brightness: TTrackBar
      Left = 64
      Top = 3
      Width = 150
      Height = 25
      Enabled = False
      Max = 0
      Frequency = 0
      TabOrder = 0
      TickStyle = tsNone
      OnChange = BrightnessChange
    end
    object Contrast: TTrackBar
      Left = 64
      Top = 27
      Width = 150
      Height = 25
      Enabled = False
      Max = 0
      Frequency = 0
      TabOrder = 1
      TickStyle = tsNone
      OnChange = ContrastChange
    end
    object Hue: TTrackBar
      Left = 64
      Top = 51
      Width = 150
      Height = 25
      Enabled = False
      Max = 0
      Frequency = 0
      TabOrder = 2
      TickStyle = tsNone
      OnChange = HueChange
    end
    object Saturation: TTrackBar
      Left = 64
      Top = 75
      Width = 150
      Height = 25
      Enabled = False
      Max = 0
      Frequency = 0
      TabOrder = 3
      TickStyle = tsNone
      OnChange = SaturationChange
    end
    object PositionX: TTrackBar
      Left = 280
      Top = 3
      Width = 150
      Height = 25
      Enabled = False
      Max = 100
      TabOrder = 4
      TickStyle = tsNone
      OnChange = PositionChange
    end
    object PositionY: TTrackBar
      Left = 280
      Top = 27
      Width = 150
      Height = 25
      Enabled = False
      Max = 100
      TabOrder = 5
      TickStyle = tsNone
      OnChange = PositionChange
    end
    object SizeX: TTrackBar
      Left = 280
      Top = 51
      Width = 150
      Height = 25
      Enabled = False
      Max = 100
      Position = 100
      TabOrder = 6
      TickStyle = tsNone
      OnChange = PositionChange
    end
    object SizeY: TTrackBar
      Left = 280
      Top = 75
      Width = 150
      Height = 25
      Enabled = False
      Max = 100
      Position = 100
      TabOrder = 7
      TickStyle = tsNone
      OnChange = PositionChange
    end
    object AspectRatio: TCheckBox
      Left = 7
      Top = 106
      Width = 122
      Height = 22
      Caption = 'Keep Aspect Ratio'
      Checked = True
      State = cbChecked
      TabOrder = 8
      OnClick = AspectRatioClick
    end
  end
  object FilterGraph: TFilterGraph
    GraphEdit = True
    LinearVolume = True
    OnDSEvent = FilterGraphDSEvent
    Left = 8
    Top = 8
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 40
    object FileMenu: TMenuItem
      Caption = '&File'
      object OpenMenu: TMenuItem
        Caption = '&Open'
        OnClick = OpenMenuClick
      end
      object OpenURLMenu: TMenuItem
        Caption = 'Open &URL'
        OnClick = OpenURLMenuClick
      end
      object ExitMenu: TMenuItem
        Caption = '&Exit'
        OnClick = ExitMenuClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 8
    Top = 72
  end
  object ImageList: TImageList
    Left = 8
    Top = 104
    Bitmap = {
      494C01010A000E000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      F00FFFFF00000000F81FFFFF00000000FC3FFFBE000000008001FF9E00000000
      8001FF8E000000009FF9CC86000000009FF9CC82000000009FF9CC8600000000
      9FF9FF8E000000009FF9FF9E000000009FF9FFBE000000008001FFFF00000000
      8001FFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF003
      FFFFFFFFFFFFF003E003FFFFFFFFFFFFE003EF7FDEF9F003E003E73FCE79F003
      E003E31FC639FFFFE003E10FC219F003E003E007C009F003E003E10FC219FFFF
      E003E31FC639F003E003E73FCE79F003E003EF7FDEF9FFFFE003FFFFFFFF8003
      FFFFFFFFFFFF8003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF1C7F3FF9F7BFEF7F1C7F1FF9E73FCE7F1C7F0FF
      9C63F8C7F1C7F07F9843F087F1C7F03F9003E007F1C7F01F9843F087F1C7F01F
      9C63F8C7F1C7F03F9E73FCE7F1C7F07F9F7BFEF7F1C7F0FFFFFFFFFFF1C7F1FF
      FFFFFFFFFFFFF3FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu: TPopupMenu
    Images = ImageList
    Left = 8
    Top = 136
    object Play1: TMenuItem
      Caption = '&Play'
      ImageIndex = 3
      OnClick = btPlayClick
    end
    object Pause1: TMenuItem
      Caption = 'P&ause'
      ImageIndex = 2
      OnClick = btPauseClick
    end
    object Stop1: TMenuItem
      Caption = '&Stop'
      ImageIndex = 4
      OnClick = btStopClick
    end
    object FullScreen1: TMenuItem
      Caption = '&FullScreen'
      ImageIndex = 8
      OnClick = btFullScreenClick
    end
    object OSD1: TMenuItem
      Caption = 'OSD'
      OnClick = OSD1Click
    end
  end
end