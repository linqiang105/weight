object QueryDataModule: TQueryDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 218
  Top = 107
  Height = 515
  Width = 855
  object DBConnection: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object WeightMaintainDS: TDataSource
    DataSet = WeightMaintainQuery
    Left = 40
    Top = 128
  end
  object DataSourceUserShow: TDataSource
    DataSet = ADOQueryUser
    Left = 144
    Top = 128
  end
  object ADOQueryUser: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    AfterEdit = ADOQueryUserAfterEdit
    BeforePost = ADOQueryUserBeforePost
    AfterPost = ADOQueryUserAfterPost
    BeforeDelete = ADOQueryUserBeforeDelete
    Parameters = <>
    SQL.Strings = (
      'select * from '#29992#25143#20449#24687)
    Left = 144
    Top = 72
  end
  object PrepareMaintainQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 248
    Top = 72
  end
  object PrepareMaintainDS: TDataSource
    DataSet = PrepareMaintainQuery
    Left = 248
    Top = 128
  end
  object ADOQExec: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 384
    Top = 208
  end
  object WeightMaintainQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    BeforeEdit = WeightMaintainQueryBeforeEdit
    BeforePost = WeightMaintainQueryBeforePost
    AfterPost = WeightMaintainQueryAfterPost
    BeforeDelete = WeightMaintainQueryBeforeDelete
    Parameters = <>
    SQL.Strings = (
      'select * from '#31216#37325#20449#24687)
    Left = 40
    Top = 72
  end
  object ADOQueryPrintTicket: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#31216#37325#20449#24687)
    Left = 40
    Top = 208
  end
  object ADOQueryPrintCombineTicket: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 264
    Top = 208
  end
  object StatisticsQuery: TADOQuery
    Connection = DBConnection
    Parameters = <>
    SQL.Strings = (
      'select * from temp')
    Left = 488
    Top = 72
  end
  object StatisticsDS: TDataSource
    DataSet = StatisticsQuery
    Left = 488
    Top = 128
  end
  object ADOQLog: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 344
    Top = 72
  end
  object ADOQMultiGross: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 576
    Top = 72
  end
  object DSMultiGross: TDataSource
    DataSet = ADOQMultiGross
    Left = 576
    Top = 128
  end
  object DSLog: TDataSource
    DataSet = ADOQLog
    Left = 344
    Top = 128
  end
  object ADOQBackRecord: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 672
    Top = 72
  end
  object DSBackRecord: TDataSource
    DataSet = ADOQBackRecord
    Left = 672
    Top = 128
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ADOQueryPrintTicket
    Left = 56
    Top = 272
  end
  object frxReport1: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    EngineOptions.SilentMode = True
    EngineOptions.NewSilentMode = simSilent
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbTools, pbNavigator]
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39987.674057071800000000
    ReportOptions.LastChange = 39987.689774664400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnUserFunction = frxReport1UserFunction
    Left = 56
    Top = 336
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    Left = 48
    Top = 408
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 304
    Top = 408
  end
  object frxDBDatasetReport: TfrxDBDataset
    UserName = 'frxDBDatasetReport'
    CloseDataSource = False
    DataSet = WeightMaintainQuery
    Left = 144
    Top = 272
  end
  object frxReportReport: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDatasetReport
    DataSetName = 'frxDBDatasetReport'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #40664#35748
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38789.391820358800000000
    ReportOptions.LastChange = 40967.908289328700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure frxReport1OnStopReport(Sender: TfrxComponent);'
      'begin'
      '  exit;'
      'end;'
      ''
      'procedure Page1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  exit;'
      'end;'
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  exit;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnStopReport = 'frxReport1OnStopReport'
    OnUserFunction = frxReportReportUserFunction
    Left = 144
    Top = 336
  end
  object ADOQCard: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 416
    Top = 72
  end
  object DSCard: TDataSource
    DataSet = ADOQCard
    Left = 416
    Top = 128
  end
  object DSTao: TDataSource
    DataSet = ADOQTao
    Left = 752
    Top = 128
  end
  object ADOQTao: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 752
    Top = 72
  end
  object ADODataSet1: TADODataSet
    Connection = DBConnection
    Parameters = <>
    Left = 144
    Top = 208
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = StatisticsQuery
    Left = 248
    Top = 272
  end
  object frxReport2: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDataset2
    DataSetName = 'frxDBDataset2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41094.463187986110000000
    ReportOptions.LastChange = 41094.463187986110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 336
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DSChart: TDataSource
    DataSet = ADOQChart
    Left = 472
    Top = 272
  end
  object ADOQChart: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 472
    Top = 216
  end
end
