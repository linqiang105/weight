object WaitingForm: TWaitingForm
  Left = 354
  Top = 172
  Width = 345
  Height = 181
  BorderIcons = []
  Caption = #25968#25454#24211#23548#20986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 143
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 10
      Width = 127
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #25968#25454#24211#23548#20986#25991#20214#20026
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 30
      Top = 40
      Width = 273
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 62
      Top = 70
      Width = 209
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #25968#25454#24211#23548#20986#20013#65292#35831#31245#20505'......'
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
end
