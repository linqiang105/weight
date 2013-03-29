object BackRecordForm: TBackRecordForm
  Left = 300
  Top = 140
  BorderStyle = bsDialog
  Caption = #21518#21488#35760#24405
  ClientHeight = 459
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 637
    Height = 418
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
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24207#21495
        Width = 100
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'weight'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37325#37327
        Width = 200
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'weight_time'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36807#30917#26102#38388
        Width = 250
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 418
    Width = 637
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BtnPrint: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 0
      OnClick = BtnPrintClick
    end
    object BtnExport: TButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BtnExportClick
    end
    object DTP: TDateTimePicker
      Left = 328
      Top = 8
      Width = 105
      Height = 21
      Date = 40545.423182094910000000
      Time = 40545.423182094910000000
      TabOrder = 2
      OnChange = DTPChange
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 288
    Top = 96
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 200
    Top = 96
  end
end
