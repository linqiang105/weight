object ManualInputForm: TManualInputForm
  Left = 332
  Top = 192
  BorderStyle = bsDialog
  Caption = #25163#24037#34917#21333
  ClientHeight = 380
  ClientWidth = 589
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
  object lblGross: TRzLabel
    Left = 8
    Top = 240
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #27611#37325
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object lblTare: TRzLabel
    Left = 112
    Top = 240
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #31354#37325
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object lblNet: TRzLabel
    Left = 216
    Top = 240
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #20928#37325
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object RzLabel4: TRzLabel
    Left = 320
    Top = 240
    Width = 80
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #27611#37325#26102#38388
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object RzLabel5: TRzLabel
    Left = 320
    Top = 272
    Width = 80
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #31354#37325#26102#38388
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object lblReal: TRzLabel
    Left = 8
    Top = 296
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #23454#37325
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object lblSum: TRzLabel
    Left = 112
    Top = 296
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #37329#39069
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ShadowDepth = 0
    TextStyle = tsShadow
  end
  object lblGlideNo: TLabel
    Left = 227
    Top = 312
    Width = 161
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object PInput: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 234
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object PCommon: TPanel
      Left = 2
      Top = 2
      Width = 390
      Height = 230
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object PCar: TPanel
        Left = 0
        Top = 0
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PCar'
        TabOrder = 0
        object SBCar: TSpeedButton
          Left = 355
          Top = 2
          Width = 20
          Height = 20
          Caption = '...'
          OnClick = SBCarClick
        end
        object lblCar: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #36710'      '#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBCar: TRzComboBox
          Left = 80
          Top = 1
          Width = 270
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PFaHuo: TPanel
        Left = 0
        Top = 25
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PFaHuo'
        TabOrder = 1
        object lblFaHuo: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #21457#36135#21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBFaHuo: TRzComboBox
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PShouHuo: TPanel
        Left = 0
        Top = 50
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PShouHuo'
        TabOrder = 2
        object lblShouHuo: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #25910#36135#21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBShouHuo: TRzComboBox
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PGoods: TPanel
        Left = 0
        Top = 75
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PGoods'
        TabOrder = 3
        object lblGoods: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #36135'      '#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBGoods: TRzComboBox
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PSpec: TPanel
        Left = 0
        Top = 100
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PSpec'
        TabOrder = 4
        object lblSpec: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #35268'      '#26684
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBSpec: TRzComboBox
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PBundle: TPanel
        Left = 0
        Top = 125
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PBundle'
        TabOrder = 5
        object lblBundle: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #25187'      '#37325
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBundle: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          OnChange = CBBundleChange
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
      object PPrice: TPanel
        Left = 0
        Top = 150
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PPrice'
        TabOrder = 6
        object lblPrice: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #21333'      '#20215
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBPrice: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          OnChange = CBPriceChange
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
      object PCost: TPanel
        Left = 0
        Top = 175
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PCost'
        TabOrder = 7
        object lblCost: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #36807'  '#30917'  '#36153
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBCost: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
      object PRemark: TPanel
        Left = 0
        Top = 200
        Width = 390
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PRemark'
        TabOrder = 8
        object lblRemark: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791'       '#27880
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBRemark: TRzComboBox
          Left = 80
          Top = 1
          Width = 300
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
    end
    object POther: TPanel
      Left = 392
      Top = 2
      Width = 195
      Height = 230
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PBackup1: TPanel
        Left = 0
        Top = 0
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblBackup1: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup1: TRzComboBox
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PBackup2: TPanel
        Left = 0
        Top = 25
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lblBackup2: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup2: TRzComboBox
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PBackup3: TPanel
        Left = 0
        Top = 50
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object lblBackup3: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup3: TRzComboBox
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PBackup4: TPanel
        Left = 0
        Top = 75
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object lblBackup4: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup4: TRzComboBox
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PBackup5: TPanel
        Left = 0
        Top = 100
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object lblBackup5: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup5: TRzComboBox
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ItemHeight = 16
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
      object PBackup6: TPanel
        Left = 0
        Top = 125
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        object lblBackup6: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup6: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
      object PBackup7: TPanel
        Left = 0
        Top = 150
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
        object lblBackup7: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup7: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
      object PBackup8: TPanel
        Left = 0
        Top = 175
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
        object lblBackup8: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup8: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
      object PBackup9: TPanel
        Left = 0
        Top = 200
        Width = 195
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 8
        object lblBackup9: TRzLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 25
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #22791#29992'9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ShadowDepth = 0
          TextStyle = tsShadow
        end
        object CBBackup9: TRzNumericEdit
          Left = 80
          Top = 1
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = clAqua
          ParentFont = False
          TabOnEnter = True
          TabOrder = 0
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = '0.000'
        end
      end
    end
  end
  object CBGross: TRzNumericEdit
    Left = 8
    Top = 272
    Width = 100
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOnEnter = True
    TabOrder = 1
    OnChange = CBBundleChange
    CalculatorVisible = True
    IntegersOnly = False
    DisplayFormat = '0.000'
  end
  object CBTare: TRzNumericEdit
    Left = 112
    Top = 272
    Width = 100
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOnEnter = True
    TabOrder = 2
    OnChange = CBBundleChange
    CalculatorVisible = True
    IntegersOnly = False
    DisplayFormat = '0.000'
  end
  object CBNet: TRzNumericEdit
    Left = 216
    Top = 272
    Width = 100
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOnEnter = True
    TabOrder = 3
    CalculatorVisible = True
    IntegersOnly = False
    DisplayFormat = '0.000'
  end
  object DTPGrossDate: TDateTimePicker
    Left = 400
    Top = 242
    Width = 89
    Height = 21
    Date = 40866.845626331020000000
    Time = 40866.845626331020000000
    TabOrder = 6
  end
  object DTPTareDate: TDateTimePicker
    Left = 400
    Top = 276
    Width = 89
    Height = 21
    Date = 0.845626331021776400
    Time = 0.845626331021776400
    TabOrder = 8
  end
  object BitBtnOK: TBitBtn
    Left = 408
    Top = 312
    Width = 75
    Height = 33
    Caption = #20445#23384
    TabOrder = 10
    OnClick = BitBtnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtnCancel: TBitBtn
    Left = 496
    Top = 312
    Width = 75
    Height = 33
    Caption = #21462#28040
    TabOrder = 11
    Kind = bkCancel
  end
  object CBReal: TRzNumericEdit
    Left = 8
    Top = 328
    Width = 100
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOnEnter = True
    TabOrder = 4
    OnChange = CBPriceChange
    CalculatorVisible = True
    IntegersOnly = False
    DisplayFormat = '0.000'
  end
  object CBSum: TRzNumericEdit
    Left = 112
    Top = 328
    Width = 100
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOnEnter = True
    TabOrder = 5
    CalculatorVisible = True
    IntegersOnly = False
    DisplayFormat = '0.000'
  end
  object DTPGrossTime: TDateTimePicker
    Left = 488
    Top = 242
    Width = 89
    Height = 21
    Date = 40866.845626331020000000
    Time = 40866.845626331020000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 7
  end
  object DTPTareTime: TDateTimePicker
    Left = 488
    Top = 276
    Width = 89
    Height = 21
    Date = 40866.845626331020000000
    Time = 40866.845626331020000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 9
  end
end
