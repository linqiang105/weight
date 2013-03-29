object TaoForm: TTaoForm
  Left = 239
  Top = 247
  Width = 800
  Height = 423
  Caption = #22871#34920
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
  object DBGridEhTao: TDBGridEh
    Left = 0
    Top = 0
    Width = 792
    Height = 396
    Align = alClient
    AutoFitColWidths = True
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ParentFont = False
    RowDetailPanel.Color = clBtnFace
    RowSizingAllowed = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEhTaoDblClick
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 232
    Top = 48
    object N3: TMenuItem
      Action = DataSetInsert1
      Caption = #28155#21152
    end
    object N2: TMenuItem
      Action = DataSetPost1
      Caption = #20445#23384
    end
    object N1: TMenuItem
      Action = DataSetDelete1
      Caption = #21024#38500
    end
    object N4: TMenuItem
      Action = DataSetCancel1
      Caption = #21462#28040
    end
  end
  object ActionList1: TActionList
    Left = 152
    Top = 48
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = 'DataSetInsert1'
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = 'DataSetDelete1'
    end
    object DataSetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = 'DataSetEdit1'
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'DataSetPost1'
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = 'DataSetCancel1'
    end
    object DataSetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = 'DataSetRefresh1'
    end
  end
end
