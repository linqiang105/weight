object TareChartForm: TTareChartForm
  Left = 254
  Top = 117
  Width = 870
  Height = 500
  Caption = #30382#37325#36208#21183#22270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 174
      Top = 13
      Width = 28
      Height = 13
      Caption = #20174#12288
    end
    object Label2: TLabel
      Left = 304
      Top = 13
      Width = 28
      Height = 13
      Caption = #21040#12288
    end
    object CBCar: TComboBox
      Left = 14
      Top = 10
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object BtnQuery: TButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = BtnQueryClick
    end
    object BtnExport: TButton
      Left = 512
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BtnExportClick
    end
    object DTPStart: TDateTimePicker
      Left = 200
      Top = 10
      Width = 97
      Height = 21
      Date = 41067.000000000000000000
      Time = 41067.000000000000000000
      DateFormat = dfLong
      TabOrder = 3
    end
    object DTPEnd: TDateTimePicker
      Left = 330
      Top = 10
      Width = 95
      Height = 21
      Date = 41067.999988425920000000
      Time = 41067.999988425920000000
      DateFormat = dfLong
      TabOrder = 4
    end
  end
  object DBChartTare: TDBChart
    Left = 0
    Top = 41
    Width = 862
    Height = 432
    Title.Text.Strings = (
      'TDBChart')
    View3D = False
    Align = alClient
    TabOrder = 1
    object SeriesTare: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = clRed
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
