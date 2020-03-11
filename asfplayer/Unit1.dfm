object Form1: TForm1
  Left = 192
  Top = 114
  Width = 783
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 88
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OpenMedia'
    TabOrder = 0
    OnClick = Button1Click
  end
  object VideoWindow1: TVideoWindow
    Left = 360
    Top = 24
    Width = 392
    Height = 296
    FilterGraph = FilterGraph2
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object CheckBox1: TCheckBox
    Left = 504
    Top = 344
    Width = 97
    Height = 17
    Caption = 'Preview'
    TabOrder = 2
  end
  object FilterGraph1: TFilterGraph
    GraphEdit = False
    Left = 88
    Top = 72
  end
  object ASFWriter1: TASFWriter
    FilterGraph = FilterGraph1
    Profile = wmp_V80_700PALVideo
    FileName = 'C:\temp.asf'
    Port = 3333
    MaxUsers = 2
    Left = 136
    Top = 72
  end
  object OpenDialog1: TOpenDialog
    Left = 40
    Top = 72
  end
  object FilterGraph2: TFilterGraph
    GraphEdit = False
    Left = 600
    Top = 280
  end
end
