object InitializeOptionForm: TInitializeOptionForm
  Left = 424
  Top = 246
  BorderStyle = bsDialog
  Caption = #25968#25454#24211#21021#22987#21270
  ClientHeight = 235
  ClientWidth = 462
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
  object Label1: TLabel
    Left = 16
    Top = 184
    Width = 265
    Height = 41
    AutoSize = False
    Caption = #27880#24847','#34987#36873#23450#21021#22987#21270#30340#34920#25968#25454#23558#28165#31354','#19988#19981#21487#24674#22797
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 425
    Height = 161
    Caption = #36873#25321#21021#22987#21270#34920
    TabOrder = 0
    object CBWeight: TCheckBox
      Left = 24
      Top = 24
      Width = 97
      Height = 17
      Caption = #31216#37325#20449#24687
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CBUser: TCheckBox
      Left = 123
      Top = 24
      Width = 97
      Height = 17
      Caption = #29992#25143#20449#24687
      TabOrder = 1
    end
    object CBCar: TCheckBox
      Left = 221
      Top = 24
      Width = 97
      Height = 17
      Caption = #36710#21495
      TabOrder = 2
    end
    object CBGoods: TCheckBox
      Left = 320
      Top = 24
      Width = 97
      Height = 17
      Caption = #36135#21517
      TabOrder = 3
    end
    object CBSpec: TCheckBox
      Left = 24
      Top = 59
      Width = 97
      Height = 17
      Caption = #35268#26684
      TabOrder = 4
    end
    object CBFaHuo: TCheckBox
      Left = 123
      Top = 59
      Width = 97
      Height = 17
      Caption = #21457#36135#21333#20301
      TabOrder = 5
    end
    object CBShouHuo: TCheckBox
      Left = 221
      Top = 59
      Width = 97
      Height = 17
      Caption = #25910#36135#21333#20301
      TabOrder = 6
    end
    object CBBackup1: TCheckBox
      Left = 320
      Top = 58
      Width = 97
      Height = 17
      Caption = #22791#29992'1'
      TabOrder = 7
    end
    object CBBackup2: TCheckBox
      Left = 24
      Top = 93
      Width = 97
      Height = 17
      Caption = #22791#29992'2'
      TabOrder = 8
    end
    object CBBackup3: TCheckBox
      Left = 123
      Top = 93
      Width = 97
      Height = 17
      Caption = #22791#29992'3'
      TabOrder = 9
    end
    object CBBackup4: TCheckBox
      Left = 221
      Top = 93
      Width = 97
      Height = 17
      Caption = #22791#29992'4'
      TabOrder = 10
    end
    object CBBackup5: TCheckBox
      Left = 320
      Top = 93
      Width = 97
      Height = 17
      Caption = #22791#29992'5'
      TabOrder = 11
    end
    object CBBackRecord: TCheckBox
      Left = 24
      Top = 128
      Width = 97
      Height = 17
      Caption = #21518#21488#35760#24405
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
    object CBLog: TCheckBox
      Left = 123
      Top = 128
      Width = 97
      Height = 17
      Caption = #31995#32479#26085#24535
      Checked = True
      State = cbChecked
      TabOrder = 13
    end
    object CBTao: TCheckBox
      Left = 221
      Top = 128
      Width = 97
      Height = 17
      Caption = #22871#34920
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 192
    Width = 75
    Height = 25
    Caption = #21021#22987#21270
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 368
    Top = 192
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
end
