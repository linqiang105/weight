object ThirdPartForm: TThirdPartForm
  Left = 14
  Top = 108
  Width = 1131
  Height = 538
  Caption = #31532#19977#26041#24037#20855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GBTrans: TGroupBox
    Left = 728
    Top = 6
    Width = 385
    Height = 67
    Caption = 'HoneyWell'#32534#30721#36716#25442
    TabOrder = 0
    object BtnIEEE2Num: TButton
      Left = 176
      Top = 16
      Width = 25
      Height = 17
      Hint = 'IEEE'#36716#25968#23383
      Caption = '=>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnIEEE2NumClick
    end
    object BtnNumToIEEE: TButton
      Left = 176
      Top = 40
      Width = 25
      Height = 17
      Hint = #25968#23383#36716'IEEE'
      Caption = '<='
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnNumToIEEEClick
    end
    object LEIEEE: TLabeledEdit
      Left = 16
      Top = 37
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'IEEE'
      MaxLength = 8
      TabOrder = 0
    end
    object LENum: TLabeledEdit
      Left = 216
      Top = 40
      Width = 153
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Num'
      TabOrder = 3
    end
  end
  object GBDialog: TGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 129
    Caption = #23545#35805#26694#31995#21015
    TabOrder = 1
    object BtnInfo: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Info'
      TabOrder = 0
      OnClick = BtnInfoClick
    end
    object BtnWarning: TButton
      Left = 136
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Warning'
      TabOrder = 1
      OnClick = BtnWarningClick
    end
    object BtnError: TButton
      Left = 256
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Error'
      TabOrder = 2
      OnClick = BtnErrorClick
    end
    object BtnQuery: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Query'
      TabOrder = 3
      OnClick = BtnQueryClick
    end
    object BtnConf: TButton
      Left = 136
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Confimation'
      TabOrder = 4
      OnClick = BtnConfClick
    end
    object BtnDel: TButton
      Left = 256
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Del'
      TabOrder = 5
      OnClick = BtnDelClick
    end
    object BtnSave: TButton
      Left = 16
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 6
      OnClick = BtnSaveClick
    end
    object BtnExit: TButton
      Left = 136
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Exit'
      TabOrder = 7
      OnClick = BtnExitClick
    end
    object BtnDevelop: TButton
      Left = 256
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Develop'
      TabOrder = 8
      OnClick = BtnDevelopClick
    end
  end
  object GBString: TGroupBox
    Left = 8
    Top = 144
    Width = 345
    Height = 233
    Caption = #23383#31526#31995#21015
    TabOrder = 2
    object BtnRepeatStr: TButton
      Left = 256
      Top = 12
      Width = 75
      Height = 25
      Caption = #37325#22797'n'#27425
      TabOrder = 0
      OnClick = BtnRepeatStrClick
    end
    object EdtSubstr: TEdit
      Left = 16
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 1
      Text = 'abc'
    end
    object EdtCount: TEdit
      Left = 200
      Top = 16
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '2'
    end
    object EdtFinalStr: TEdit
      Left = 16
      Top = 40
      Width = 321
      Height = 21
      TabOrder = 3
    end
    object EdtEncrypt: TEdit
      Left = 16
      Top = 64
      Width = 153
      Height = 21
      TabOrder = 4
    end
    object EdtDecrypt: TEdit
      Left = 16
      Top = 96
      Width = 313
      Height = 21
      TabOrder = 5
    end
    object BtnEncrypt: TButton
      Left = 176
      Top = 64
      Width = 75
      Height = 25
      Caption = #21152#23494
      TabOrder = 6
      OnClick = BtnEncryptClick
    end
    object BtnDecrypt: TButton
      Left = 256
      Top = 64
      Width = 75
      Height = 25
      Caption = #35299#23494
      TabOrder = 7
      OnClick = BtnDecryptClick
    end
    object EdtHanzi: TEdit
      Left = 16
      Top = 120
      Width = 153
      Height = 21
      TabOrder = 8
      Text = #20013#22269
    end
    object BtnHz: TButton
      Left = 184
      Top = 120
      Width = 145
      Height = 25
      Caption = #21462#27721#23383#25340#38899#39318#23383#27597
      TabOrder = 9
      OnClick = BtnHzClick
    end
    object EdtPinYin: TEdit
      Left = 16
      Top = 152
      Width = 313
      Height = 21
      TabOrder = 10
    end
    object BtnEAN: TButton
      Left = 144
      Top = 184
      Width = 57
      Height = 25
      Caption = #26465#24418#30721
      TabOrder = 11
      OnClick = BtnEANClick
    end
    object EdtSourceNum: TEdit
      Left = 16
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 12
    end
    object EdtDestinCode: TEdit
      Left = 208
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 13
    end
  end
  object GBOther: TGroupBox
    Left = 400
    Top = 384
    Width = 713
    Height = 113
    Caption = #26434
    TabOrder = 3
    object SBLunar: TSpeedButton
      Left = 480
      Top = 11
      Width = 105
      Height = 22
      Caption = #22825#24178#22320#25903
      OnClick = SBLunarClick
    end
    object DTP: TDateTimePicker
      Left = 384
      Top = 13
      Width = 89
      Height = 20
      Date = 39744.443099490740000000
      Time = 39744.443099490740000000
      TabOrder = 0
    end
    object BtnSmallToBig: TButton
      Left = 136
      Top = 15
      Width = 105
      Height = 25
      Hint = #20154#27665#24065#22823#20889
      Caption = #23567#20889#36716#22823#20889
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnSmallToBigClick
    end
    object BtnJtoF: TButton
      Left = 136
      Top = 48
      Width = 105
      Height = 25
      Caption = #31616#20307#36716#32321#20307
      TabOrder = 2
      OnClick = BtnJtoFClick
    end
    object EdtSmall: TEdit
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object EdtBig: TEdit
      Left = 248
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object EdtJian: TEdit
      Left = 8
      Top = 52
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EdtFang: TEdit
      Left = 248
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object EdtLunar: TEdit
      Left = 384
      Top = 44
      Width = 305
      Height = 21
      TabOrder = 7
    end
    object EdtOne: TEdit
      Left = 8
      Top = 80
      Width = 81
      Height = 21
      TabOrder = 8
      Text = '0'
    end
    object EdtTwo: TEdit
      Left = 96
      Top = 80
      Width = 81
      Height = 21
      TabOrder = 9
      Text = '0'
    end
    object BtnAed: TButton
      Left = 184
      Top = 80
      Width = 89
      Height = 25
      Caption = #26368#22823#20844#32422#25968
      TabOrder = 10
      OnClick = BtnAedClick
    end
    object EdtAed: TEdit
      Left = 280
      Top = 80
      Width = 81
      Height = 21
      TabOrder = 11
      Text = '0'
    end
  end
  object GBDatabase: TGroupBox
    Left = 728
    Top = 80
    Width = 385
    Height = 49
    Caption = #25968#25454#24211
    TabOrder = 4
    object BtnTestSQL: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #26816#27979
      TabOrder = 0
      OnClick = BtnTestSQLClick
    end
    object CBSQLInstalled: TCheckBox
      Left = 112
      Top = 16
      Width = 97
      Height = 17
      Caption = #24050#23433#35013'SQL'
      TabOrder = 1
    end
    object CBAvalidSQL: TComboBox
      Left = 216
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object GBMedia: TGroupBox
    Left = 728
    Top = 240
    Width = 385
    Height = 137
    Caption = #22810#23186#20307
    TabOrder = 5
    object SBOK: TSpeedButton
      Left = 16
      Top = 24
      Width = 33
      Height = 22
      Caption = 'OK'
      OnClick = SBOKClick
    end
    object SBInterrupt: TSpeedButton
      Left = 56
      Top = 24
      Width = 73
      Height = 22
      Caption = 'Interrupt'
      OnClick = SBInterruptClick
    end
    object SBError: TSpeedButton
      Left = 136
      Top = 24
      Width = 57
      Height = 22
      Caption = 'Error'
      OnClick = SBErrorClick
    end
    object SBOpenSource: TSpeedButton
      Left = 336
      Top = 80
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SBOpenSourceClick
    end
    object SBSaveDestin: TSpeedButton
      Left = 336
      Top = 104
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SBSaveDestinClick
    end
    object EdtSource: TEdit
      Left = 16
      Top = 80
      Width = 313
      Height = 21
      TabOrder = 0
    end
    object EdtDestin: TEdit
      Left = 16
      Top = 104
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object RBBmp2Jpg: TRadioButton
      Left = 24
      Top = 56
      Width = 113
      Height = 17
      Caption = 'Bmp'#36716'Jpg'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RBJpg2Bmp: TRadioButton
      Left = 136
      Top = 56
      Width = 113
      Height = 17
      Caption = 'Jpg'#36716'Bmp'
      TabOrder = 3
    end
    object BtnChange: TButton
      Left = 288
      Top = 48
      Width = 75
      Height = 25
      Caption = #36716#25442
      TabOrder = 4
      OnClick = BtnChangeClick
    end
  end
  object GBFileOper: TGroupBox
    Left = 728
    Top = 136
    Width = 385
    Height = 105
    Caption = #25991#20214#25805#20316
    TabOrder = 6
    object LblFileDetail: TLabel
      Left = 16
      Top = 44
      Width = 353
      Height = 29
      AutoSize = False
      WordWrap = True
    end
    object BtnOpenFile: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #25171#24320#25991#20214
      TabOrder = 0
      OnClick = BtnOpenFileClick
    end
    object CBFileUsing: TCheckBox
      Left = 104
      Top = 19
      Width = 89
      Height = 17
      Caption = #27491#22312#20351#29992
      TabOrder = 1
    end
    object BtnDelReadOnly: TButton
      Left = 8
      Top = 72
      Width = 105
      Height = 25
      Caption = #21024#38500#21482#35835#25991#20214
      TabOrder = 2
      OnClick = BtnDelReadOnlyClick
    end
    object BtnDelToRecycle: TButton
      Left = 136
      Top = 72
      Width = 129
      Height = 25
      Caption = #21024#38500#25991#20214#33267#22238#25910#31449
      TabOrder = 3
      OnClick = BtnDelToRecycleClick
    end
    object BtnDelMe: TButton
      Left = 296
      Top = 72
      Width = 75
      Height = 25
      Caption = #21024#38500#33258#24049
      TabOrder = 4
      OnClick = BtnDelMeClick
    end
  end
  object GBSysInfo: TGroupBox
    Left = 360
    Top = 0
    Width = 361
    Height = 377
    Caption = #31995#32479#20449#24687
    TabOrder = 7
    object BtnGetSysInfo: TButton
      Left = 16
      Top = 24
      Width = 105
      Height = 25
      Caption = #33719#21462#31995#32479#20449#24687
      TabOrder = 0
      OnClick = BtnGetSysInfoClick
    end
    object LEWinPath: TLabeledEdit
      Left = 120
      Top = 56
      Width = 222
      Height = 21
      EditLabel.Width = 74
      EditLabel.Height = 13
      EditLabel.Caption = 'Windows'#30446#24405'  '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 1
    end
    object LEWinSysPath: TLabeledEdit
      Left = 120
      Top = 87
      Width = 222
      Height = 21
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = #31995#32479#30446#24405'    '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object LEDesktopPath: TLabeledEdit
      Left = 120
      Top = 118
      Width = 222
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = #26700#38754'    '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 3
    end
    object LEWinTempPath: TLabeledEdit
      Left = 120
      Top = 149
      Width = 222
      Height = 21
      EditLabel.Width = 102
      EditLabel.Height = 13
      EditLabel.Caption = #20020#26102#25991#20214#22841#30446#24405'      '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 4
    end
    object LECurrentPath: TLabeledEdit
      Left = 120
      Top = 180
      Width = 222
      Height = 21
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = #24403#21069#30446#24405'    '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 5
    end
    object LEAppPath: TLabeledEdit
      Left = 120
      Top = 211
      Width = 222
      Height = 21
      EditLabel.Width = 90
      EditLabel.Height = 13
      EditLabel.Caption = #24212#29992#31243#24207#30446#24405'      '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 6
    end
    object LEProgPath: TLabeledEdit
      Left = 120
      Top = 242
      Width = 222
      Height = 21
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = #31243#24207#30446#24405'    '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 7
    end
    object BtnGetDrive: TButton
      Left = 72
      Top = 336
      Width = 89
      Height = 25
      Caption = #20998#21306#24207#21015#21495
      TabOrder = 8
      OnClick = BtnGetDriveClick
    end
    object EdtDrive: TEdit
      Left = 16
      Top = 336
      Width = 49
      Height = 21
      TabOrder = 9
      Text = 'C'
    end
    object EdtDriveSerial: TEdit
      Left = 168
      Top = 336
      Width = 185
      Height = 21
      TabOrder = 10
    end
    object EdtDiskSerial: TLabeledEdit
      Left = 120
      Top = 273
      Width = 225
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #30828#30424#24207#21015#21495'    '
      LabelPosition = lpLeft
      TabOrder = 11
    end
    object LECPU: TLabeledEdit
      Left = 120
      Top = 304
      Width = 225
      Height = 21
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'CPU'#21344#29992#29575'    '
      LabelPosition = lpLeft
      TabOrder = 12
    end
    object BtnReboot: TButton
      Left = 128
      Top = 24
      Width = 89
      Height = 25
      Caption = #37325#21551#35745#31639#26426
      TabOrder = 13
      OnClick = BtnRebootClick
    end
  end
  object GBNet: TGroupBox
    Left = 8
    Top = 384
    Width = 385
    Height = 113
    Caption = #32593#32476#30456#20851
    TabOrder = 8
    object Label1: TLabel
      Left = 192
      Top = 51
      Width = 51
      Height = 13
      Caption = 'Mac'#22320#22336'  '
    end
    object LELocalComputerName: TLabeledEdit
      Left = 64
      Top = 16
      Width = 121
      Height = 21
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = #26412#26426#21517'   '
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object LELocalUserName: TLabeledEdit
      Left = 64
      Top = 46
      Width = 121
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517'    '
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object LELocalIP: TLabeledEdit
      Left = 64
      Top = 76
      Width = 121
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #26412#22320'IP    '
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object LELocateIP: TLabeledEdit
      Left = 248
      Top = 18
      Width = 121
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #22806#32593'IP    '
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object BtnNetInfo: TButton
      Left = 288
      Top = 80
      Width = 75
      Height = 25
      Caption = #32593#32476#20449#24687
      TabOrder = 5
      OnClick = BtnNetInfoClick
    end
    object LEMac: TComboBox
      Left = 248
      Top = 48
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 576
    Top = 264
  end
  object SaveDialog1: TSaveDialog
    Left = 608
    Top = 264
  end
  object OpenDialog2: TOpenDialog
    Left = 448
    Top = 312
  end
end
