object SoftwareSetForm: TSoftwareSetForm
  Left = 353
  Top = 286
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #36719#20214#31995#32479#35774#32622
  ClientHeight = 283
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 283
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 12
      Top = 10
      Width = 469
      Height = 263
      ActivePage = TSBase
      TabOrder = 0
      object TSBase: TTabSheet
        Caption = #22522#26412#36164#26009
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 89
          Height = 13
          AutoSize = False
          Caption = #36719#20214#20351#29992#21333#20301
        end
        object Label2: TLabel
          Left = 232
          Top = 8
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #30005#35805#21495#30721
        end
        object Label4: TLabel
          Left = 16
          Top = 54
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #20202#34920#35745#37327#21333#20301
        end
        object Label9: TLabel
          Left = 232
          Top = 52
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #36719#20214#35745#37327#21333#20301
        end
        object EdtCompany: TEdit
          Left = 16
          Top = 24
          Width = 201
          Height = 21
          TabOrder = 0
        end
        object EdtTel: TEdit
          Left = 232
          Top = 24
          Width = 201
          Height = 21
          TabOrder = 1
          OnKeyPress = EdtTelKeyPress
        end
        object CBMeterUnit: TComboBox
          Left = 16
          Top = 75
          Width = 201
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            #20844'  '#26020
            'KG'
            'kg'
            #21544
            'T'
            't')
        end
        object CBSoftUnit: TComboBox
          Left = 232
          Top = 75
          Width = 209
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            #20844'  '#26020
            'KG'
            'kg'
            #21544
            'T'
            't')
        end
        object RBAttr: TRadioButton
          Left = 178
          Top = 145
          Width = 81
          Height = 17
          Caption = #23646#24615#22411
          Checked = True
          TabOrder = 4
          TabStop = True
        end
        object RBChild: TRadioButton
          Left = 242
          Top = 145
          Width = 81
          Height = 17
          Caption = #33410#28857#22411
          TabOrder = 5
        end
        object CBAutoRun: TCheckBox
          Left = 16
          Top = 112
          Width = 100
          Height = 17
          Caption = #24320#26426#33258#21160#36816#34892
          TabOrder = 6
        end
        object CBAutoShutdown: TCheckBox
          Left = 232
          Top = 113
          Width = 76
          Height = 17
          Caption = #33258#21160#20851#26426
          TabOrder = 7
          OnClick = CBAutoShutdownClick
        end
        object DTPClose: TDateTimePicker
          Left = 326
          Top = 110
          Width = 81
          Height = 21
          Date = 39157.567029074070000000
          Time = 39157.567029074070000000
          Enabled = False
          Kind = dtkTime
          TabOrder = 8
        end
        object CBXMLExport: TCheckBox
          Left = 16
          Top = 145
          Width = 153
          Height = 17
          Caption = #20851#38381#36719#20214#26102#23548#20986'XML'
          TabOrder = 9
        end
      end
      object TSWeightSet: TTabSheet
        Caption = #31216#37325#35774#32622
        ImageIndex = 2
        object CBEnterAsTab: TCheckBox
          Left = 16
          Top = 53
          Width = 140
          Height = 17
          Caption = #22238#36710#38190#20195#26367'Tab'#38190
          TabOrder = 0
        end
        object CBAutoDropDown: TCheckBox
          Left = 16
          Top = 16
          Width = 140
          Height = 17
          Caption = #33258#21160#24377#24320#21015#34920#26694
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBDelHistory: TCheckBox
          Left = 16
          Top = 89
          Width = 140
          Height = 17
          Caption = #33258#21160#21024#38500#21382#21490#35760#24405
          TabOrder = 2
        end
        object CBShowPrepare: TCheckBox
          Left = 168
          Top = 16
          Width = 140
          Height = 17
          Caption = #19979#25289#26694#21452#20987#36873#25321
          TabOrder = 3
        end
        object CBAllowSecondTare: TCheckBox
          Left = 168
          Top = 53
          Width = 140
          Height = 17
          Caption = #20801#35768#20108#27425#36807#30382
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object CBAllowSecondGross: TCheckBox
          Left = 320
          Top = 53
          Width = 140
          Height = 17
          Caption = #20801#35768#20108#27425#36807#27611
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object CBWriteTare: TCheckBox
          Left = 168
          Top = 89
          Width = 140
          Height = 17
          Caption = #33258#21160#35760#24405#36710#30382
          TabOrder = 6
        end
        object CBUseCode: TCheckBox
          Left = 320
          Top = 89
          Width = 140
          Height = 17
          Caption = #20351#29992#20195#30721#36755#20837
          TabOrder = 7
        end
        object CBAutoComplete: TCheckBox
          Left = 320
          Top = 16
          Width = 140
          Height = 17
          Caption = #33258#21160#34917#20840#19979#25289#26694
          TabOrder = 8
        end
        object CBWaitForZero: TCheckBox
          Left = 168
          Top = 126
          Width = 140
          Height = 17
          Caption = #22238#38646#21518#20877#36807#30917
          TabOrder = 9
        end
        object CBVoice: TCheckBox
          Left = 16
          Top = 126
          Width = 140
          Height = 17
          Caption = #21551#29992#35821#38899#25253#25968
          TabOrder = 10
        end
        object CBUseBundleRate: TCheckBox
          Left = 320
          Top = 126
          Width = 140
          Height = 17
          Caption = #20351#29992#25187#29575#20195#26367#25187#37325
          TabOrder = 11
        end
        object CBAllowNotSteady: TCheckBox
          Left = 16
          Top = 163
          Width = 143
          Height = 17
          Caption = #19981#31283#23450#20063#20801#35768#36807#30917
          TabOrder = 12
        end
        object CBSelectTicketBeforePrint: TCheckBox
          Left = 168
          Top = 163
          Width = 143
          Height = 17
          Caption = #25171#21360#26102#36873#25321#30917#21333#26684#24335
          TabOrder = 13
        end
        object CBTareDiff: TCheckBox
          Left = 320
          Top = 163
          Width = 145
          Height = 17
          Caption = #21551#29992#30382#37325#36229#24046#25253#35686#12288#12288
          TabOrder = 14
        end
      end
      object TSWeightSetII: TTabSheet
        Caption = #31216#37325#35774#32622'II'
        ImageIndex = 3
        object Label7: TLabel
          Left = 15
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = #36755#20837#26694#34892#25968
        end
        object Label13: TLabel
          Left = 327
          Top = 19
          Width = 60
          Height = 13
          Caption = #31283#23450#27425#25968'    '
        end
        object Label3: TLabel
          Left = 440
          Top = 51
          Width = 8
          Height = 13
          Caption = '%'
        end
        object Label10: TLabel
          Left = 172
          Top = 86
          Width = 26
          Height = 13
          Caption = 'cm'#12288
        end
        object Label16: TLabel
          Left = 264
          Top = 80
          Width = 144
          Height = 26
          Caption = #35813#21151#33021#21482#25903#25345#24182#21475#19978#30340#26494#19979'KX-P1121'#25171#21360#26426'      '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label12: TLabel
          Left = 16
          Top = 154
          Width = 49
          Height = 13
          AutoSize = False
          Caption = #25171#21360#26426'     '
        end
        object Label15: TLabel
          Left = 232
          Top = 155
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #27969#27700#21495#35268#21017#12288#12288
        end
        object LEBackRecord: TLabeledEdit
          Left = 103
          Top = 50
          Width = 66
          Height = 21
          EditLabel.Width = 87
          EditLabel.Height = 13
          EditLabel.Caption = #21518#21488#35760#24405#37325#37327'     '
          LabelPosition = lpLeft
          TabOrder = 0
          Text = '1000'
        end
        object LEReturnZero: TLabeledEdit
          Left = 253
          Top = 16
          Width = 44
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #22238#38646#37325#37327'    '
          LabelPosition = lpLeft
          TabOrder = 1
          Text = '10'
        end
        object SEDropDownCount: TSpinEdit
          Left = 104
          Top = 16
          Width = 65
          Height = 22
          DragMode = dmAutomatic
          MaxLength = 2
          MaxValue = 10
          MinValue = 1
          TabOrder = 2
          Value = 5
        end
        object LESumPoint: TLabeledEdit
          Left = 255
          Top = 50
          Width = 41
          Height = 21
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = #37329#39069#23567#25968#28857'   '
          LabelPosition = lpLeft
          TabOrder = 3
          Text = '2'
        end
        object SESteadyCount: TSpinEdit
          Left = 391
          Top = 16
          Width = 41
          Height = 22
          MaxValue = 40
          MinValue = 2
          TabOrder = 4
          Value = 4
        end
        object LETareDiff: TLabeledEdit
          Left = 403
          Top = 50
          Width = 30
          Height = 21
          EditLabel.Width = 96
          EditLabel.Height = 13
          EditLabel.Caption = #30382#37325#36229#24046#33539#22260#12288#12288
          LabelPosition = lpLeft
          TabOrder = 5
          Text = '5'
        end
        object LEPrinterBackRow: TLabeledEdit
          Left = 112
          Top = 83
          Width = 57
          Height = 21
          EditLabel.Width = 102
          EditLabel.Height = 13
          EditLabel.Caption = #25171#21360#21069#36864#32440#34892#25968#12288'  '
          LabelPosition = lpLeft
          TabOrder = 6
          Text = '1'
        end
        object LEReportTitle: TLabeledEdit
          Left = 136
          Top = 117
          Width = 297
          Height = 21
          EditLabel.Width = 117
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#25171#21360#25253#34920#25260#22836'       '
          LabelPosition = lpLeft
          TabOrder = 7
        end
        object CBPrinter: TComboBox
          Left = 64
          Top = 150
          Width = 153
          Height = 21
          ItemHeight = 13
          TabOrder = 8
        end
        object CBGlideNo: TComboBox
          Left = 304
          Top = 151
          Width = 137
          Height = 21
          Hint = #27969#27700#21495#35268#21017
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          Text = #24180'+'#26376'+'#26085'+4'#20301#27969#27700#21495
          Items.Strings = (
            '6'#20301#27969#27700#21495
            #24180'+'#26376'+'#26085'+4'#20301#27969#27700#21495)
        end
        object BtnTestPrinter: TBitBtn
          Left = 200
          Top = 80
          Width = 57
          Height = 25
          Caption = #27979#35797
          TabOrder = 10
          OnClick = BtnTestPrinterClick
        end
      end
      object TSCostSet: TTabSheet
        Caption = #36807#30917#36153#35774#32622
        ImageIndex = 4
        object CBManualInput: TCheckBox
          Left = 308
          Top = 148
          Width = 81
          Height = 17
          Caption = #25163#24037#36755#20837
          TabOrder = 0
        end
        object LEPoint: TLabeledEdit
          Left = 384
          Top = 169
          Width = 49
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #23567#25968#28857#20301#25968'    '
          LabelPosition = lpLeft
          TabOrder = 1
          Text = '0'
        end
        object CBUsePound: TCheckBox
          Left = 308
          Top = 132
          Width = 101
          Height = 17
          Caption = #26159#21542#25910#36153
          TabOrder = 2
        end
        object GBScale: TGroupBox
          Left = 13
          Top = 2
          Width = 428
          Height = 119
          Caption = #36215#22987#33539#22260
          TabOrder = 3
          object Label5: TLabel
            Left = 16
            Top = 16
            Width = 60
            Height = 13
            Caption = #36215#22987#37325#37327#12288
          end
          object Label6: TLabel
            Left = 120
            Top = 16
            Width = 60
            Height = 13
            Caption = #19978#38480#37325#37327#12288
          end
          object Label8: TLabel
            Left = 224
            Top = 40
            Width = 48
            Height = 13
            Caption = #25910#36153#20026#12288
          end
          object Label11: TLabel
            Left = 224
            Top = 64
            Width = 48
            Height = 13
            Caption = #25910#36153#20026#12288
          end
          object Label14: TLabel
            Left = 224
            Top = 88
            Width = 48
            Height = 13
            Caption = #25910#36153#20026#12288
          end
          object EdtPound1: TEdit
            Left = 8
            Top = 36
            Width = 90
            Height = 21
            TabOrder = 0
            Text = '500'
          end
          object EdtPound2: TEdit
            Left = 118
            Top = 36
            Width = 90
            Height = 21
            TabOrder = 1
            Text = '10000'
          end
          object EdtPound3: TEdit
            Left = 8
            Top = 60
            Width = 90
            Height = 21
            TabOrder = 2
            Text = '10000'
          end
          object EdtPound4: TEdit
            Left = 118
            Top = 60
            Width = 90
            Height = 21
            TabOrder = 3
            Text = '100000'
          end
          object EdtPound5: TEdit
            Left = 8
            Top = 84
            Width = 90
            Height = 21
            TabOrder = 4
            Text = '100000'
          end
          object EdtPound6: TEdit
            Left = 118
            Top = 84
            Width = 90
            Height = 21
            TabOrder = 5
            Text = '120000'
          end
          object EdtInitial: TLabeledEdit
            Left = 275
            Top = 36
            Width = 90
            Height = 21
            EditLabel.Width = 12
            EditLabel.Height = 13
            EditLabel.Caption = #20803
            LabelPosition = lpRight
            TabOrder = 8
            Text = '5'
          end
          object EdtUnit: TLabeledEdit
            Left = 275
            Top = 60
            Width = 90
            Height = 21
            EditLabel.Width = 41
            EditLabel.Height = 13
            EditLabel.Caption = #20803'/'#21544#12288
            LabelPosition = lpRight
            TabOrder = 6
            Text = '1'
          end
          object EdtUnit2: TLabeledEdit
            Left = 275
            Top = 84
            Width = 90
            Height = 21
            EditLabel.Width = 41
            EditLabel.Height = 13
            EditLabel.Caption = #20803'/'#21544#12288
            LabelPosition = lpRight
            TabOrder = 7
            Text = '1.5'
          end
        end
        object GroupBox1: TGroupBox
          Left = 12
          Top = 123
          Width = 285
          Height = 70
          Caption = #25910#36153#35745#31639#26041#24335
          TabOrder = 4
          object RBTwo: TRadioButton
            Left = 128
            Top = 18
            Width = 150
            Height = 17
            Caption = #25353'"'#27611#37325'+'#30382#37325'"'#35745#31639
            TabOrder = 0
          end
          object RBGross: TRadioButton
            Left = 16
            Top = 19
            Width = 110
            Height = 17
            Caption = #25353'"'#27611#37325'"'#35745#31639#12288#12288
            Checked = True
            TabOrder = 1
            TabStop = True
          end
          object RBNet: TRadioButton
            Left = 16
            Top = 40
            Width = 110
            Height = 17
            Caption = #25353'"'#20928#37325'"'#35745#31639
            TabOrder = 2
          end
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 96
      Top = 235
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000007DB90C0075AC0E0075AC0E000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000007AB40D007DB90C0084C50B007DB90C0075AC
        0E0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000007AB40D0071A6100084C50B0084C50B0087C90A0089CD
        090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000007AB40D0071A6100084C50B008CD207007AB40D007DB90C0080BF
        0B0089CD090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00007AB40D0071A6100092DB05008CD2070075AC0E000000000080BF0B0084C5
        0B0089CD090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00006EA1110098E6030075AC0E006EA1110000000000FFFFFF000000000084C5
        0B0089CD090089CD090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000618D130075AC0E006592120000000000FFFFFF00FFFFFF000000000087C9
        0A008CD2070084C50B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00008CD2070092DB050087C90A0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000090D7060092DB050084C50B0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000096E3040098E6030087C90A0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000096E304009AEA020084C50B0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000009AEA020092DB050084C50B0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000000092DB05007AB40D0092DB050000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
    object BitBtn2: TBitBtn
      Left = 320
      Top = 235
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
      OnClick = BitBtn2Click
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
  end
end
