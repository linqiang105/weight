object DBBackupForm: TDBBackupForm
  Left = 309
  Top = 303
  Width = 361
  Height = 172
  BorderIcons = []
  Caption = #25968#25454#24211#33258#21160#22791#20221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 134
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object Label2: TLabel
      Left = 11
      Top = 40
      Width = 318
      Height = 25
      AutoSize = False
      Caption = '3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 18
      Top = 10
      Width = 127
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #25968#25454#24211#22791#20221#25991#20214#20026
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 62
      Top = 70
      Width = 209
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #25968#25454#24211#33258#21160#22791#20221#20013#65292#35831#31245#20505'......'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Gauge1: TGauge
      Left = 32
      Top = 96
      Width = 273
      Height = 17
      BorderStyle = bsNone
      Color = clSilver
      ForeColor = clAqua
      ParentColor = False
      Progress = 0
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 20
    OnTimer = Timer1Timer
    Left = 272
    Top = 16
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer2Timer
    Left = 304
    Top = 16
  end
end
