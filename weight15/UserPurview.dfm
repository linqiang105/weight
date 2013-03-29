object UserPurviewForm: TUserPurviewForm
  Left = 457
  Top = 278
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #29992#25143#26435#38480#35774#32622
  ClientHeight = 275
  ClientWidth = 353
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
  object PTop: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 236
    Align = alClient
    Caption = 'PTop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object PUser: TPanel
      Left = 1
      Top = 1
      Width = 113
      Height = 234
      Align = alClient
      BevelInner = bvLowered
      Caption = 'PUser'
      TabOrder = 0
      object DBGridEhUser: TDBGridEh
        Left = 2
        Top = 2
        Width = 109
        Height = 230
        Align = alClient
        AutoFitColWidths = True
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGridEhUserCellClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #29992#25143#21517
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object PAttrib: TPanel
      Left = 114
      Top = 1
      Width = 238
      Height = 234
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 36
        Width = 54
        Height = 13
        Caption = #29992#25143#23494#30721'  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 12
        Width = 42
        Height = 13
        Caption = #29992#25143#21517'  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EdtPass: TEdit
        Left = 82
        Top = 32
        Width = 121
        Height = 21
        Enabled = False
        PasswordChar = '#'
        TabOrder = 1
        OnChange = EdtPassChange
      end
      object GBLegal: TGroupBox
        Left = 24
        Top = 64
        Width = 193
        Height = 161
        Caption = #29992#25143#26435#38480
        Enabled = False
        TabOrder = 2
        object CBUser: TCheckBox
          Left = 16
          Top = 16
          Width = 73
          Height = 17
          Caption = #29992#25143#31649#29702
          TabOrder = 0
        end
        object CBDataMaintain: TCheckBox
          Left = 112
          Top = 16
          Width = 73
          Height = 17
          Caption = #25968#25454#32500#25252
          TabOrder = 1
        end
        object CBDBSet: TCheckBox
          Left = 16
          Top = 40
          Width = 73
          Height = 17
          Caption = #25968#24211#35774#32622
          TabOrder = 2
        end
        object CBDataExport: TCheckBox
          Left = 112
          Top = 40
          Width = 73
          Height = 17
          Caption = #25968#25454#23548#20986
          TabOrder = 3
        end
        object CBDataBack: TCheckBox
          Left = 16
          Top = 64
          Width = 73
          Height = 17
          Caption = #25968#25454#22791#20221
          TabOrder = 4
        end
        object CBPremain: TCheckBox
          Left = 112
          Top = 64
          Width = 73
          Height = 17
          Caption = #39044#32622#32500#25252
          TabOrder = 5
        end
        object CBManual: TCheckBox
          Left = 16
          Top = 88
          Width = 73
          Height = 17
          Caption = #25163#24037#37325#37327
          TabOrder = 6
        end
        object CBMeterSet: TCheckBox
          Left = 112
          Top = 88
          Width = 73
          Height = 17
          Caption = #20202#34920#35774#32622
          TabOrder = 7
        end
        object CBSysSet: TCheckBox
          Left = 16
          Top = 112
          Width = 73
          Height = 17
          Caption = #31995#32479#35774#32622
          TabOrder = 8
        end
        object CBPrintTicket: TCheckBox
          Left = 112
          Top = 112
          Width = 73
          Height = 17
          Caption = #25171#21360#30917#21333
          TabOrder = 9
        end
        object CBPrintReport: TCheckBox
          Left = 16
          Top = 136
          Width = 73
          Height = 17
          Caption = #25171#21360#25253#34920
          TabOrder = 10
        end
        object CBModifyTicket: TCheckBox
          Left = 112
          Top = 136
          Width = 73
          Height = 17
          Caption = #20462#25913#30917#21333
          TabOrder = 11
        end
      end
      object EdtUser: TEdit
        Left = 82
        Top = 8
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
  end
  object PFunc: TPanel
    Left = 0
    Top = 236
    Width = 353
    Height = 39
    Align = alBottom
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object BtnMod: TButton
      Left = 63
      Top = 8
      Width = 55
      Height = 25
      Caption = #20462' '#25913
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnModClick
    end
    object BtnAdd: TButton
      Left = 8
      Top = 8
      Width = 55
      Height = 25
      Caption = #25554' '#20837
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAddClick
    end
    object BtnCancel: TButton
      Left = 178
      Top = 8
      Width = 55
      Height = 25
      Caption = #25764' '#28040
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnCancelClick
    end
    object BtnDel: TButton
      Left = 234
      Top = 8
      Width = 55
      Height = 25
      Caption = #21024' '#38500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnDelClick
    end
    object BtnRefresh: TButton
      Left = 290
      Top = 8
      Width = 55
      Height = 25
      Caption = #21047' '#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtnRefreshClick
    end
    object BtnSave: TButton
      Left = 118
      Top = 8
      Width = 55
      Height = 25
      Caption = #20445' '#23384
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BtnSaveClick
    end
  end
end
