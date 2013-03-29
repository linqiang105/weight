object ReadWeightForm: TReadWeightForm
  Left = 325
  Top = 399
  BorderStyle = bsDialog
  Caption = #35821#38899#25253#25968
  ClientHeight = 65
  ClientWidth = 415
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
  object GBChange: TGroupBox
    Left = 0
    Top = 0
    Width = 415
    Height = 65
    Align = alClient
    Caption = #20154#27665#24065#23383#31526#21644#35821#38899#35835#25968
    TabOrder = 0
    object EdtSource: TEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '1234.56'
      OnKeyDown = EdtSourceKeyDown
      OnKeyPress = EdtSourceKeyPress
    end
    object EdtAim: TEdit
      Left = 152
      Top = 24
      Width = 169
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = EdtAimKeyDown
    end
    object BtnRead: TButton
      Left = 328
      Top = 22
      Width = 75
      Height = 25
      Caption = #35821#38899#35835#25968
      TabOrder = 2
      OnClick = BtnReadClick
    end
    object BitBtnChange: TBitBtn
      Left = 96
      Top = 22
      Width = 49
      Height = 25
      Caption = '=>'
      TabOrder = 3
      TabStop = False
      OnClick = BitBtnChangeClick
    end
  end
end
