object MeterSet1Form: TMeterSet1Form
  Left = 384
  Top = 163
  BorderStyle = bsDialog
  Caption = #20202#34920#36830#25509#35774#32622
  ClientHeight = 378
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PTop: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    Caption = #20202#34920#36830#25509#35774#32622
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #21326#25991#26032#39759
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object PMeter: TPanel
    Left = 0
    Top = 49
    Width = 545
    Height = 329
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object lblCom: TLabel
      Left = 13
      Top = 37
      Width = 60
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = #31471#21475#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblMeterType: TLabel
      Left = 8
      Top = 64
      Width = 65
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = #20202#34920#22411#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblReceive: TLabel
      Left = 254
      Top = 8
      Width = 271
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = #25509' '#25910' '#21040' '#30340' '#25968' '#25454
      Color = clSkyBlue
      ParentColor = False
      Layout = tlCenter
    end
    object CBUseMeter: TCheckBox
      Left = 24
      Top = 14
      Width = 81
      Height = 17
      Caption = #21551#29992#20202#34920
      TabOrder = 0
    end
    object CBScreen: TCheckBox
      Left = 112
      Top = 14
      Width = 129
      Height = 17
      Caption = #21516#26102#36755#20986#21040#22823#23631#24149
      TabOrder = 1
      OnClick = CBScreenClick
    end
    object CBPort: TComboBox
      Left = 77
      Top = 37
      Width = 84
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = CBPortChange
    end
    object CBMeterType: TComboBox
      Left = 77
      Top = 65
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = CBPortChange
    end
    object GBDefine: TGroupBox
      Left = 16
      Top = 89
      Width = 225
      Height = 164
      Caption = #33258#23450#20041#20202#34920#36873#39033
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object LEStart: TLabeledEdit
        Left = 85
        Top = 24
        Width = 120
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = #36215#22987#20301#12288
        LabelPosition = lpLeft
        TabOrder = 0
        Text = '='
        OnChange = CBPortChange
      end
      object LEGetFirst: TLabeledEdit
        Left = 85
        Top = 48
        Width = 120
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = #24320#22987#25130#21462#20301#12288
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '1'
        OnChange = CBPortChange
      end
      object CBQueue: TComboBox
        Left = 123
        Top = 125
        Width = 80
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = #27491#24207
        OnChange = CBPortChange
        Items.Strings = (
          #27491#24207
          #21453#24207)
      end
      object LEDataLength: TLabeledEdit
        Left = 85
        Top = 72
        Width = 120
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = #25968#25454#38271#24230#12288
        LabelPosition = lpLeft
        TabOrder = 3
        Text = '7'
        OnChange = CBPortChange
      end
      object LEPoint: TLabeledEdit
        Left = 85
        Top = 96
        Width = 120
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = #23567#25968#28857#12288
        LabelPosition = lpLeft
        TabOrder = 4
        Text = '0'
        OnChange = CBPortChange
      end
      object CBType: TComboBox
        Left = 27
        Top = 125
        Width = 80
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 5
        Text = 'ASCII'#30721
        OnChange = CBPortChange
        Items.Strings = (
          'ASCII'#30721
          'BCD'#30721)
      end
    end
    object BtnClose: TBitBtn
      Left = 133
      Top = 263
      Width = 100
      Height = 45
      Cancel = True
      Caption = #20851#38381
      TabOrder = 5
      OnClick = BtnCloseClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00005B5BF5005555F100504FED004B4CEA00393ADF0000000000000000001313
        C5002827D300201FCD001B1BCB001313C50000000000FFFFFF00FFFFFF00FFFF
        FF00000000005B5BF500504FED005555F1004B4CEA001B1BCB0005059D00504F
        ED006B6BFF006B6BFF00201FCD0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000005B5BF500504FED005555F1004B4CEA001B1BCB00504F
        ED006B6BFF002D2DD60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343E5006464
        FA00393ADF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343
        E50000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005F5FF8004B4CEA00504FED004B4C
        EA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000006B6BFF003D3DE1005F5FF8004B4CEA005352
        EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000006B6BFF003434DB006B6BFF001B1BCB005F5FF8004B4C
        EA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000006B6BFF002827D3002D2DD6006B6BFF0005059D003D3DE1005F5F
        F8004B4CEA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF000000
        00006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF0000000000000000006B6B
        FF005F5FF8005B5BF500504FED004B4CEA0000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
    object BtnApply: TBitBtn
      Left = 21
      Top = 263
      Width = 100
      Height = 45
      Caption = #24212#29992
      Default = True
      TabOrder = 6
      OnClick = BtnApplyClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F29252925292529252925292529252925FF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F4A299C73DE7BDE7BDE7BDE7BDE7B2925FF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F4A299C73FF7FFF7FFF7FFF7FDE7B292529252925292529252925
        29252925FF7F4A299C73FF7FFF7FFF7FFF7FDE7B292539673967396739673967
        39672925FF7F4A299C739C739C739C739C739C7329257B6F7B6F7B6F7B6F7B6F
        39672925FF7F4A29F701F701F701F701F701F70129257B6F7B6F7B6F7B6F7B6F
        39672925FF7F4A29FF26BF12BF125B025B02F70129257B6F7B6F7B6F7B6F7B6F
        39672925FF7F4A294A294A29292529252925292529257B6F7B6F7B6F7B6F7B6F
        39672925FF7FFF7FFF7F4A29B5567B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F
        39672925FF7FFF7FFF7F4A29B5567B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F
        39672925FF7FFF7FFF7F4A29B556B556B556B556B556B556B556B556B556B556
        D65A2925FF7FFF7FFF7F4A29F701F701F701F701F701F701F701F701F701F701
        F7012925FF7FFF7FFF7F4A29FF26FF26BF12BF125B025B025B025B02F701F701
        F7012925FF7FFF7FFF7F4A294A294A294A294A294A294A294A294A294A294A29
        4A294A29FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F}
    end
    object MemoReceive: TMemo
      Left = 253
      Top = 32
      Width = 273
      Height = 209
      Hint = #22312#32477#22823#22810#25968#24773#20917#19979','#26412#31383#20307#35201#25910#21040#22823#37096#20998#30340'0~9'#30340#25968#23383#25165#26159#27491#30830#30340','#21542#21017#35831#20462#25913#27874#29305#29575
      ParentShowHint = False
      ReadOnly = True
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 7
    end
    object GBShow: TGroupBox
      Left = 253
      Top = 248
      Width = 200
      Height = 33
      TabOrder = 8
      object RBTen: TRadioButton
        Left = 16
        Top = 12
        Width = 80
        Height = 17
        Caption = #21313#36827#21046
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object RBSixteen: TRadioButton
        Left = 104
        Top = 12
        Width = 80
        Height = 17
        Caption = #21313#20845#36827#21046
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object BtnClear: TBitBtn
      Left = 461
      Top = 251
      Width = 65
      Height = 30
      Caption = #28165#31354
      TabOrder = 9
      OnClick = BtnClearClick
    end
    object EdtSend: TComboBox
      Left = 254
      Top = 288
      Width = 199
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      Items.Strings = (
        '43 44 4C 0D 0A '
        '5A'
        '3A 30 30 30 38 30 30 41 35 35 33 ')
    end
    object BtnPortSet: TButton
      Left = 168
      Top = 35
      Width = 75
      Height = 25
      Caption = #31471#21475#35774#32622
      TabOrder = 11
      OnClick = BtnPortSetClick
    end
    object BtnSend: TBitBtn
      Left = 461
      Top = 280
      Width = 65
      Height = 30
      Caption = #21457#36865
      TabOrder = 12
      OnClick = BtnSendClick
    end
  end
  object CnRS2321: TCnRS232
    CommName = 'COM1'
    CommConfig.BaudRate = 4800
    Timeouts.ReadIntervalTimeout = 50
    OnReceiveData = CnRS2321ReceiveData
    Left = 312
    Top = 104
  end
  object CnRS232Dialog1: TCnRS232Dialog
    Pages = [cpNormal, cpXonXoff, cpHardware, cpTimeouts]
    ShowHint = csHint
    Timeouts.ReadIntervalTimeout = 50
    Left = 408
    Top = 104
  end
  object TSend: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TSendTimer
    Left = 280
    Top = 168
  end
  object TUDPClient: TTimer
    Enabled = False
    Left = 436
    Top = 169
  end
  object TScreen: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TScreenTimer
    Left = 352
    Top = 168
  end
end
