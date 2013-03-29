unit DataQuery;

interface

uses
  Classes, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, DB, Graphics,
  ComCtrls, SysUtils, Windows, GridsEh, DBGridEh, DateUtils,
  Menus, ADODB, RzButton, PrnDbgeh, Math, StrUtils;

type

  TQueryDBGrid = class(TDBGridEh);

  TDataQueryForm = class(TForm)
    PQuery: TPanel;
    CBName1: TComboBox;
    CBOper1: TComboBox;
    CBName2: TComboBox;
    CBOper2: TComboBox;
    CBName3: TComboBox;
    CBOper3: TComboBox;
    CBName5: TComboBox;
    CBOper5: TComboBox;
    DTPStartDate1: TDateTimePicker;
    DTPStartTime1: TDateTimePicker;
    CBName6: TComboBox;
    CBOper6: TComboBox;
    DTPStartDate2: TDateTimePicker;
    DTPStartTime2: TDateTimePicker;
    EdtValue1: TComboBox;
    EdtValue2: TComboBox;
    EdtValue3: TComboBox;
    EdtValue4: TComboBox;
    DTPEndDate1: TDateTimePicker;
    DTPEndTime1: TDateTimePicker;
    DTPEndDate2: TDateTimePicker;
    DTPEndTime2: TDateTimePicker;
    CBReport: TComboBox;
    lblReportType: TLabel;
    Label1: TLabel;
    EdtOrderField: TEdit;
    Label2: TLabel;
    CBOrderType: TComboBox;
    PMDBGridEh: TPopupMenu;
    SPMPrint: TMenuItem;
    N4: TMenuItem;
    SPMSaveAs: TMenuItem;
    N1: TMenuItem;
    SPMDelete: TMenuItem;
    GBFinishType: TGroupBox;
    RBFinish: TRadioButton;
    RBNotFinish: TRadioButton;
    RBAll: TRadioButton;
    DBGridEhWeight: TDBGridEh;
    EdtValue5: TComboBox;
    EdtValue6: TComboBox;
    CBName4: TComboBox;
    CBOper4: TComboBox;
    EdtValue7: TComboBox;
    EdtValue8: TComboBox;
    Bevel1: TBevel;
    GBOption: TGroupBox;
    CBFirst: TComboBox;
    CBSecond: TComboBox;
    CBThird: TComboBox;
    CBFourth: TComboBox;
    LEReportTitle: TLabeledEdit;
    BBtnPrint: TRzMenuButton;
    GBStatField: TGroupBox;
    CBCount: TCheckBox;
    CBGross: TCheckBox;
    CBTare: TCheckBox;
    CBNet: TCheckBox;
    CBBundle: TCheckBox;
    CBReal: TCheckBox;
    CBSum: TCheckBox;
    CBCost: TCheckBox;
    CBBackup6: TCheckBox;
    CBBackup7: TCheckBox;
    CBBackup8: TCheckBox;
    CBBackup9: TCheckBox;
    BitBtnModify: TRzBitBtn;
    BitBtnQuery: TRzBitBtn;
    BtnDel: TRzBitBtn;
    OutputBtn: TRzBitBtn;
    DeleteBtn: TRzBitBtn;
    AppendBtn: TRzBitBtn;
    BitBtnPrint: TRzBitBtn;
    BBtnQuery: TRzBitBtn;
    BBtnExport: TRzBitBtn;
    BBtnFont: TRzBitBtn;
    PMStatReport: TPopupMenu;
    Excel1: TMenuItem;
    MenuItem1: TMenuItem;
    N3: TMenuItem;
    MenuItem2: TMenuItem;
    N6: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    FDDBGrid: TFontDialog;
    PrintDBGridEh1: TPrintDBGridEh;
    PData: TPanel;
    DBGridEhStat: TDBGridEh;
    BtnImport: TRzBitBtn;
    PWaiting: TPanel;
    ProgressBar1: TProgressBar;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure BitBtnModifyClick(Sender: TObject);
    procedure EdtOrderFieldDblClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AppendBtnClick(Sender: TObject);
    procedure DBGridEhWeightTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEhWeightDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SPMPrintClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SPMSaveAsClick(Sender: TObject);
    procedure SPMDeleteClick(Sender: TObject);
    procedure EdtValue1Enter(Sender: TObject);
    procedure EdtValue3Enter(Sender: TObject);
    procedure EdtValue5Enter(Sender: TObject);
    procedure EdtValue7Enter(Sender: TObject);
    procedure DBGridEhWeightDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BBtnFontClick(Sender: TObject);
    procedure BBtnQueryClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BBtnExportClick(Sender: TObject);
    procedure BtnImportClick(Sender: TObject);
  private
    { Private declarations }
    strShowName, strFieldName: TStrings; //查询字段及其显示
    dateShowName, dateFieldName: TStrings; //日期及其显示
    operShowName, operName: TStrings; //操作符及其显示
    statShowName, statFieldName: TStrings; //可统计字段及其显示
  public
    QueryFlag: boolean;
    QueryStr: string;
    orderField: string;
    { Public declarations }
    procedure loadReport(); //读取报表格式文件
    procedure loadDBGrid(); //读取表格显示和标题
    procedure loadField(); //显示中文操作符,以及显示的字段名
    procedure ReadFont();
    procedure loadStatField; //读取可以统计的字段
    procedure loadSumField; //读取要合计的字段
    procedure getCondition(adoq: TADOQuery); //获取查询条件
  end;

var
  DataQueryForm: TDataQueryForm;

implementation

uses QueryDM, Main, CommonUtil, SelectOrder, ManualInput,
  PrepareUtil;

{$R *.dfm}

procedure TDataQueryForm.BitBtnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TDataQueryForm.BitBtnQueryClick(Sender: TObject);
begin
  DBGridEhStat.Align := alNone;
  DBGridEhStat.Width := 0;
  DBGridEhWeight.Align := alClient;
  DBGridEhWeight.DataSource := QueryDataModule.WeightMaintainDS;

  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 称重信息 where ');
    getCondition(QueryDataModule.WeightMaintainQuery);
    SQL.Add(' order by ' + orderField);
    if CBOrderType.ItemIndex = 0 then
      SQL.Add(' Asc')
    else
      SQL.Add(' Desc');
    //ShowMessage(SQL.Text);
    Open;
  end;

  Self.QueryFlag := true;
  MainForm.Repaint;
  //Close
end;

procedure TDataQueryForm.FormShow(Sender: TObject);
begin
  //截入主界面的DBGird配置
  loadDBGrid();
  LEReportTitle.Text := '统计报表';
  loadReport; //读取报表格式文件
end;

procedure TDataQueryForm.BtnDelClick(Sender: TObject);
var i: integer;
begin
  if TDBCommonUtil.HasAuthority('数据维护') then
  begin
    if QueryFlag then
    begin
      if MessageDlg('你确定要删除这些记录吗?', mtConfirmation, [mbYes, mbNo],
        0) = mrYes then
      begin
        for i := 0 to DBGridEhWeight.DataSource.DataSet.RecordCount - 1 do
        begin 
          DBGridEhWeight.DataSource.DataSet.Delete;
        end;
      end;
    end
  end;
end;

procedure TDataQueryForm.loadReport;
var
  sr: TSearchRec;
begin
  CBReport.Items.Clear;
  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Report\*.fr3', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Attr and faDirectory) = 0 then
        CBReport.Items.Add(Copy(sr.Name, 1, Length(sr.Name) - 4));
    until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
  end;
  CBReport.ItemIndex := 0;
end;

procedure TDataQueryForm.BitBtnPrintClick(Sender: TObject);
begin
  if not TDBCommonUtil.HasAuthority('打印报表') then
    Exit;
  BitBtnQuery.Click;
  if CBReport.ItemIndex = -1 then
    Exit;
  QueryDataModule.frxReportReport.LoadFromFile(ExtractFilePath(ParamStr(0))
    + 'Report\' + CBReport.Items[CBReport.ItemIndex] + '.fr3');

  QueryDataModule.frxReportReport.Variables['startDate1'] := DTPStartDate1.Date;
  QueryDataModule.frxReportReport.Variables['startTime1'] := DTPStartTime1.Time;
  QueryDataModule.frxReportReport.Variables['endDate1'] := DTPEndDate1.Date;
  QueryDataModule.frxReportReport.Variables['endTime1'] := DTPEndTime1.Time;

  QueryDataModule.frxReportReport.Variables['startDate2'] := DTPStartDate1.Date;
  QueryDataModule.frxReportReport.Variables['startTime2'] := DTPStartTime1.Time;
  QueryDataModule.frxReportReport.Variables['endDate2'] := DTPEndDate1.Date;
  QueryDataModule.frxReportReport.Variables['endDate2'] := DTPEndTime1.Time;

  QueryDataModule.frxReportReport.ShowReport();
end;

procedure TDataQueryForm.BitBtnModifyClick(Sender: TObject);
begin
  if not TDBCommonUtil.HasAuthority('打印报表') then
    Exit;
  if CBReport.ItemIndex = -1 then
    Exit;
  TReportUtil.designReport(ExtractFilePath(ParamStr(0))
    + 'Report\' + CBReport.Items[CBReport.ItemIndex] + '.fr3');
end;

procedure TDataQueryForm.EdtOrderFieldDblClick(Sender: TObject);
begin
  Application.CreateForm(TSelectOrderForm, SelectOrderForm);
  try
    SelectOrderForm.ShowModal;
    orderField := SelectOrderForm.selCol.field;
    EdtOrderField.Text := SelectOrderForm.selCol.showField;
    if EdtOrderField.Text = '' then
    begin
      EdtOrderField.Text := '流水号';
      orderField := '流水号';
    end;
  finally
    SelectOrderForm.Free;
  end;
end;

procedure TDataQueryForm.loadDBGrid;
var i: Integer;
  fn: string;
begin
  for i := 0 to MainForm.DBGridEh1.FieldCount - 1 do
  begin
    fn := MainForm.DBGridEh1.Fields[i].FieldName;
    DBGridEhWeight.FieldColumns[fn].Title.Caption := MainForm.DBGridEh1.FieldColumns[fn].Title.Caption;
    DBGridEhWeight.FieldColumns[fn].Visible := MainForm.DBGridEh1.FieldColumns[fn].Visible;
  end;
  for i := 0 to DBGridEhWeight.Columns.Count - 1 do
  begin
    DBGridEhWeight.Columns[i].Width := MainForm.DBGridEh1.Columns[i].Width;
  end;
end;

procedure TDataQueryForm.OutputBtnClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEhWeight)
end;

procedure TDataQueryForm.DeleteBtnClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('数据维护') then
  begin
    if MessageDlg('确实要删除这条记录吗?', mtConfirmation, [mbOK, mbCancel], 0) =
      mrOk then
    begin
      try
        DBGridEhWeight.DataSource.DataSet.Delete;
      except
      end;
    end;
  end;
end;

procedure TDataQueryForm.AppendBtnClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('手工重量') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.insertOrUpdate := True;
      ManualInputForm.ShowModal();
    finally
      ManualInputForm.Free;
    end;
  end;
end;

procedure TDataQueryForm.DBGridEhWeightTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if QueryDataModule.WeightMaintainQuery.Sort <> (Column.FieldName + ' ASC') then
    //判断原排序方式
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' ASC'
  else
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' DESC'
end;

procedure TDataQueryForm.DBGridEhWeightDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with TQueryDBGrid(Sender) do
  begin
    if DataLink.ActiveRecord = Row - 1 then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Brush.Color := clSkyBlue
    end
    else
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color
    end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State)
  end;
  if gdSelected in State then
    Exit;
end;

procedure TDataQueryForm.SPMPrintClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString, True);
  end
end;

procedure TDataQueryForm.N4Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString);
  end
end;

procedure TDataQueryForm.SPMSaveAsClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEhWeight);
end;

procedure TDataQueryForm.SPMDeleteClick(Sender: TObject);
var i: string;
begin
  if TDBCommonUtil.HasAuthority('数据维护') then
  begin
    if MessageDlg('确实要删除这条记录吗?', mtConfirmation, [mbOK, mbCancel], 0) =
      mrOk then
    begin
      try
        DBGridEhWeight.DataSource.DataSet.Delete;
      except
      end;
    end;
  end;
end;

procedure TDataQueryForm.loadField;
begin
  if strShowName = nil then strShowName := TStringList.Create;
  if strFieldName = nil then strFieldName := TStringList.Create;
  if dateShowName = nil then dateShowName := TStringList.Create;
  if dateFieldName = nil then dateFieldName := TStringList.Create;
  if operShowName = nil then operShowName := TStringList.Create;
  if operName = nil then operName := TStringList.Create;

  operShowName.Add('等于');
  operShowName.Add('大于');
  operShowName.Add('大等于');
  operShowName.Add('小于');
  operShowName.Add('小等于');
  operShowName.Add('不等于');
  operShowName.Add('包含');
  operShowName.Add('不包含');
  operShowName.Add('两者之间');

  operName.Add('=');
  operName.Add('>');
  operName.Add('>=');
  operName.Add('<');
  operName.Add('<=');
  operName.Add('<>');
  operName.Add('like');
  operName.Add('not like');
  operName.Add('between');

  strShowName.Add('流水号');
  strShowName.Add(MainForm.systemConfig.carCaption);
  strShowName.Add('操作员');
  strShowName.Add(MainForm.systemConfig.faHuoCaption);
  strShowName.Add(MainForm.systemConfig.shouHuoCaption);
  strShowName.Add(MainForm.systemConfig.goodsCaption);
  strShowName.Add(MainForm.systemConfig.specCaption);
  strShowName.Add(MainForm.systemConfig.backup1Caption);
  strShowName.Add(MainForm.systemConfig.backup2Caption);
  strShowName.Add(MainForm.systemConfig.backup3Caption);
  strShowName.Add(MainForm.systemConfig.backup4Caption);
  strShowName.Add(MainForm.systemConfig.backup5Caption);
  strShowName.Add(MainForm.systemConfig.grossCaption);
  strShowName.Add(MainForm.systemConfig.tareCaption);
  strShowName.Add(MainForm.systemConfig.netCaption);
  strShowName.Add(MainForm.systemConfig.bundleCaption);
  strShowName.Add(MainForm.systemConfig.realCaption);
  strShowName.Add(MainForm.systemConfig.priceCaption);
  strShowName.Add(MainForm.systemConfig.sumCaption);
  strShowName.Add(MainForm.systemConfig.backup6Caption);
  strShowName.Add(MainForm.systemConfig.backup7Caption);
  strShowName.Add(MainForm.systemConfig.backup8Caption);
  strShowName.Add(MainForm.systemConfig.backup9Caption);

  strFieldName.Add('流水号');
  strFieldName.Add('车号');
  strFieldName.Add('操作员');
  strFieldName.Add('发货单位');
  strFieldName.Add('收货单位');
  strFieldName.Add('货名');
  strFieldName.Add('规格');
  strFieldName.Add('备用1');
  strFieldName.Add('备用2');
  strFieldName.Add('备用3');
  strFieldName.Add('备用4');
  strFieldName.Add('备用5');
  strFieldName.Add('毛重');
  strFieldName.Add('空重');
  strFieldName.Add('扣重');
  strFieldName.Add('净重');
  strFieldName.Add('实重');
  strFieldName.Add('单价');
  strFieldName.Add('金额');
  strFieldName.Add('备用6');
  strFieldName.Add('备用7');
  strFieldName.Add('备用8');
  strFieldName.Add('备用9');

  dateShowName.Add('');
  dateShowName.Add(MainForm.systemConfig.grossTimeCaption);
  dateShowName.Add(MainForm.systemConfig.tareTimeCaption);

  dateFieldName.Add('');
  dateFieldName.Add('毛重时间');
  dateFieldName.Add('空重时间');

  CBName1.Items := strShowName;
  CBName2.Items := strShowName;
  CBName3.Items := strShowName;
  CBName4.Items := strShowName;
  CBName5.Items := dateShowName;
  CBName6.Items := dateShowName;

  CBName1.ItemIndex := 1;
  CBName2.ItemIndex := 3;
  CBName3.ItemIndex := 4;
  CBName4.ItemIndex := 5;
  CBName5.ItemIndex := 1;
  CBName6.ItemIndex := 0;

  CBOper1.Items := operShowName;
  CBOper2.Items := operShowName;
  CBOper3.Items := operShowName;
  CBOper4.Items := operShowName;
  CBOper5.Items := operShowName;
  CBOper6.Items := operShowName;

  CBOper1.ItemIndex := 0;
  CBOper2.ItemIndex := 0;
  CBOper3.ItemIndex := 0;
  CBOper4.ItemIndex := 0;
  CBOper5.ItemIndex := 8;
  CBOper6.ItemIndex := 8;
end;

procedure TDataQueryForm.EdtValue1Enter(Sender: TObject);
begin
  case CBName1.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    6: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    7: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    8: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    9: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    10: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.EdtValue3Enter(Sender: TObject);
begin
  case CBName2.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    6: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    7: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    8: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    9: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    10: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.EdtValue5Enter(Sender: TObject);
begin
  case CBName3.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    6: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    7: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    8: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    9: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    10: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.EdtValue7Enter(Sender: TObject);
begin
  case CBName4.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    6: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    7: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    8: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    9: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    10: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.DBGridEhWeightDblClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('手工重量') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.Caption := '修改磅单';
      ManualInputForm.insertOrUpdate := False;
      ManualInputForm.ShowModal();
    finally
      ManualInputForm.Free;
    end;
  end;
end;

procedure TDataQueryForm.FormCreate(Sender: TObject);
begin
  DBGridEhStat.Align := alNone;
  DBGridEhStat.Width := 0;
  DBGridEhWeight.Align := alClient;

  orderField := '流水号';
  DTPStartDate1.Date := StartOfTheDay(Now);
  DTPStartTime1.Time := StartOfTheDay(Now);
  DTPEndDate1.Date := EndOfTheDay(Now);
  DTPEndTime1.Time := EndOfTheDay(Now);

  DTPStartDate2.Date := StartOfTheDay(Now);
  DTPStartTime2.Time := StartOfTheDay(Now);
  DTPEndDate2.Date := EndOfTheDay(Now);
  DTPEndTime2.Time := EndOfTheDay(Now);

  DBGridEhWeight.PopupMenu := PMDBGridEh;
  DBGridEhWeight.ReadOnly := not TDBCommonUtil.HasAuthority('数据维护');
  /////////////////////////////////////////////////////////////////////////////
  DBGridEhStat.DataSource := QueryDataModule.StatisticsDs;
  BBtnPrint.DropDownMenu := PMStatReport;

  loadField; //读取要查询的字段名
  loadStatField; //读取可以统计的字段
  loadSumField; //读取要合计的字段
end;

procedure TDataQueryForm.FormPaint(Sender: TObject);
var i: integer;
begin
  for i := 0 to DBGridEhStat.Columns.count - 1 do
  begin
    DBGridEhStat.Columns[i].Title.Alignment := taCenter; //字段标题内容居中显示
    if not DBGridEhStat.Columns[i].Visible then
      Continue;
    if Assigned(DBGridEhStat.Columns[i].Field) then
      DBGridEhStat.Columns[i].Width := Max(DBGridEhStat.Columns[i].Field.Tag, DBGridEhStat.Canvas.TextWidth(DBGridEhStat.Columns[i].Title.Caption)) + 40
    else
      DBGridEhStat.Columns[i].Width := DBGridEhStat.Canvas.TextWidth(DBGridEhStat.Columns[i].Title.Caption) + 40;
  end;

  for i := 0 to DBGridEhStat.Columns.count - 1 do
  begin
    if (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.grossCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.tareCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.netCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.bundleCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.realCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.sumCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.costCaption)
      or (DBGridEhStat.Columns[i].FieldName = '车次')
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup6Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup7Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup8Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup9Caption) then
      DBGridEhStat.Columns[i].Footer.ValueType := fvtSum
    else if i = 0 then
    begin
      DBGridEhStat.Columns[i].Footer.ValueType := fvtStaticText;
      DBGridEhStat.Columns[i].Footer.Value := '合计'
    end
    else if (i = 1) and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.grossCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.tareCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.netCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.bundleCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.realCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.sumCaption)
      and (DBGridEhStat.Columns[0].FieldName <> '车次') then
      DBGridEhStat.Columns[i].Footer.ValueType := fvtCount
  end;
end;

procedure TDataQueryForm.N6Click(Sender: TObject);
begin
  TReportUtil.printStatReport(ExtractFilePath(ParamStr(0)) + '\StatReport\3.统计报表-----货名,收货单位.fr3');
end;

procedure TDataQueryForm.MenuItem2Click(Sender: TObject);
begin
  TReportUtil.printStatReport(ExtractFilePath(ParamStr(0)) + '\StatReport\1.统计报表-----货名,发货单位.fr3');
end;

procedure TDataQueryForm.Excel1Click(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEhStat;

    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(LEReportTitle.Text);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('操作员：' + MainForm.CurrentUser);
    BeforeGridText.Add('打印时间: ' + DateTimeToStr(Now));
    {BeforeGridText.Add('起止时间: '
      + FormatDateTime('yyyy-MM-dd HH:mm:ss', StartDate.DateTime)
      + ' --- ' + FormatDateTime('yyyy-MM-dd HH:mm:ss', EndDate.DateTime));
    }
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('第&[Page]页/共&[Pages]页');
    Preview
  end
end;

procedure TDataQueryForm.N3Click(Sender: TObject);
begin
  TReportUtil.printStatReport(ExtractFilePath(ParamStr(0)) + '\StatReport\2.统计报表-----货名,车号.fr3');
end;

procedure TDataQueryForm.BBtnFontClick(Sender: TObject);
begin
  FDDBGrid.Font := DBGridEhStat.Font;
  if FDDBGrid.Execute then
  begin
    DBGridEhStat.Font := FDDBGrid.Font;
    DBGridEhStat.TitleFont := FDDBGrid.Font;
    DBGridEhStat.FooterFont := FDDBGrid.Font;
  end
end;

procedure TDataQueryForm.ReadFont;
//var myini: TIniFile;
begin
  {myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    DBGridEh1.Font.Name := myini.ReadString('字体设置', '字体', 'MS Sans Serif');
    DBGridEh1.Font.Size := myini.ReadInteger('字体设置', '字体大小', 10);
    DBGridEh1.Font.Color := myini.ReadInteger('字体设置', '字体颜色', clWindowText);
    DBGridEh1.TitleFont.Name := myini.ReadString('字体设置', '字体', 'MS Sans Serif');
    DBGridEh1.TitleFont.Size := myini.ReadInteger('字体设置', '字体大小', 10);
    DBGridEh1.TitleFont.Color := myini.ReadInteger('字体设置', '字体颜色', clWindowText);
    DBGridEh1.FooterFont.Name := myini.ReadString('字体设置', '字体', 'MS Sans Serif');
    DBGridEh1.FooterFont.Size := myini.ReadInteger('字体设置', '字体大小', 10);
    DBGridEh1.FooterFont.Color := myini.ReadInteger('字体设置', '字体颜色', clWindowText);
    //读取报表设置
    if Myini.ReadBool('系统设置', 'FitGridToPageWidth', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghFitGridToPageWidth]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghFitGridToPageWidth];
    if Myini.ReadBool('系统设置', 'Colored', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghColored]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghColored];
    if Myini.ReadBool('系统设置', 'RowAutoStretch', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghRowAutoStretch]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghRowAutoStretch];
    if Myini.ReadBool('系统设置', 'FitingByColWidth', false) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghFitingByColWidths]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghFitingByColWidths];
    if Myini.ReadBool('系统设置', 'OptimalColWidth', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghOptimalColWidths]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghOptimalColWidths];
  finally
    myini.Free;
  end; }
end;

procedure TDataQueryForm.BBtnQueryClick(Sender: TObject);
var sqlstr: string;
begin
  DBGridEhWeight.Width := 0;
  DBGridEhWeight.Align := alNone;
  DBGridEhStat.Align := alClient;
  DBGridEhStat.DataSource := QueryDataModule.StatisticsDS;

  sqlstr := 'select ';

  if CBFirst.ItemIndex > 0 then
    sqlstr := sqlstr + statFieldName[CBFirst.ItemIndex] + ' as [' + statShowName[CBFirst.ItemIndex] + '],';
  if CBSecond.ItemIndex > 0 then
    sqlstr := sqlstr + statFieldName[CBSecond.ItemIndex] + ' as [' + statShowName[CBSecond.ItemIndex] + '],';
  if CBThird.ItemIndex > 0 then
    sqlstr := sqlstr + statFieldName[CBThird.ItemIndex] + ' as [' + statShowName[CBThird.ItemIndex] + '],';
  if CBFourth.ItemIndex > 0 then
    sqlstr := sqlstr + statFieldName[CBFourth.ItemIndex] + ' as [' + statShowName[CBFourth.ItemIndex] + '],';

  if CBCount.Checked then
    sqlstr := sqlstr + 'Count(流水号) As [' + CBCount.Caption + '],';
  if CBGross.Checked then
    sqlstr := sqlstr + 'Sum(毛重) As [' + MainForm.systemConfig.grossCaption + '],';
  if CBTare.Checked then
    sqlstr := sqlstr + 'Sum(空重) As [' + MainForm.systemConfig.tareCaption + '],';
  if CBNet.Checked then
    sqlstr := sqlstr + 'Sum(净重) As [' + MainForm.systemConfig.netCaption + '],';
  if CBBundle.Checked then
    sqlstr := sqlstr + 'Sum(扣重) As [' + MainForm.systemConfig.bundleCaption + '],';
  if CBReal.Checked then
    sqlstr := sqlstr + 'Sum(实重) As [' + MainForm.systemConfig.realCaption + '],';
  if CBSum.Checked then
    sqlstr := sqlstr + 'Sum(金额) As [' + MainForm.systemConfig.sumCaption + '],';
  if CBCost.Checked then
    sqlstr := sqlstr + 'Sum(过磅费) As [' + MainForm.systemConfig.costCaption + '],';
  if CBBackup6.Checked then
    sqlstr := sqlstr + 'Sum(备用6) As [' + MainForm.systemConfig.backup6Caption + '],';
  if CBBackup7.Checked then
    sqlstr := sqlstr + 'Sum(备用7) As [' + MainForm.systemConfig.backup7Caption + '],';
  if CBBackup8.Checked then
    sqlstr := sqlstr + 'Sum(备用8) As [' + MainForm.systemConfig.backup8Caption + '],';
  if CBBackup9.Checked then
    sqlstr := sqlstr + 'Sum(备用9) As [' + MainForm.systemConfig.backup9Caption + '],';

  if RightStr(sqlstr, 1) = ',' then
    sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);

  sqlstr := sqlstr + ' from 称重信息 where ';

  with QueryDataModule.StatisticsQuery do
  begin
    Close;
    SQL.Text := sqlstr;
    getCondition(QueryDataModule.StatisticsQuery);

    SQL.Add(' group by ');
    if CBFirst.ItemIndex > 0 then
      SQL.Add(statFieldName[CBFirst.ItemIndex] + ',');
    if CBSecond.ItemIndex > 0 then
      SQL.Add(statFieldName[CBSecond.ItemIndex] + ',');
    if CBThird.ItemIndex > 0 then
      SQL.Add(statFieldName[CBThird.ItemIndex] + ',');
    if CBFourth.ItemIndex > 0 then
      SQL.Add(statFieldName[CBFourth.ItemIndex] + ',');
    sqlstr := Trim(SQL.Text);
    if RightStr(sqlstr, 1) = ',' then
      sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);
    SQL.Text := sqlstr;

    SQL.Add(' order by ');
    if CBFirst.ItemIndex > 0 then
      SQL.Add(statFieldName[CBFirst.ItemIndex] + ',');
    if CBSecond.ItemIndex > 0 then
      SQL.Add(statFieldName[CBSecond.ItemIndex] + ',');
    if CBThird.ItemIndex > 0 then
      SQL.Add(statFieldName[CBThird.ItemIndex] + ',');
    if CBFourth.ItemIndex > 0 then
      SQL.Add(statFieldName[CBFourth.ItemIndex] + ',');
    sqlstr := Trim(SQL.Text);
    if RightStr(sqlstr, 1) = ',' then
      sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);
    SQL.Text := sqlstr;

    //ShowMessage(sqlstr);
    Open;
  end;
  Repaint;
end;

procedure TDataQueryForm.N5Click(Sender: TObject);
begin
  TReportUtil.designReport(ExtractFilePath(ParamStr(0)) + '\StatReport\1.统计报表-----货名,发货单位.fr3');
end;

procedure TDataQueryForm.BBtnExportClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEhStat)
end;

procedure TDataQueryForm.loadStatField;
begin
  if statShowName = nil then statShowName := TStringList.Create;
  if statFieldName = nil then statFieldName := TStringList.Create;

  statShowName.Add('');
  statShowName.Add(MainForm.systemConfig.carCaption);
  statShowName.Add('操作员');
  statShowName.Add(MainForm.systemConfig.faHuoCaption);
  statShowName.Add(MainForm.systemConfig.shouHuoCaption);
  statShowName.Add(MainForm.systemConfig.goodsCaption);
  statShowName.Add(MainForm.systemConfig.specCaption);
  statShowName.Add(MainForm.systemConfig.backup1Caption);
  statShowName.Add(MainForm.systemConfig.backup2Caption);
  statShowName.Add(MainForm.systemConfig.backup3Caption);
  statShowName.Add(MainForm.systemConfig.backup4Caption);
  statShowName.Add(MainForm.systemConfig.backup5Caption);
  statShowName.Add(MainForm.systemConfig.grossTimeCaption);
  statShowName.Add(MainForm.systemConfig.tareTimeCaption);

  statFieldName.Add('');
  statFieldName.Add('车号');
  statFieldName.Add('操作员');
  statFieldName.Add('发货单位');
  statFieldName.Add('收货单位');
  statFieldName.Add('货名');
  statFieldName.Add('规格');
  statFieldName.Add('备用1');
  statFieldName.Add('备用2');
  statFieldName.Add('备用3');
  statFieldName.Add('备用4');
  statFieldName.Add('备用5');
  statFieldName.Add('毛重时间');
  statFieldName.Add('空重时间');

  CBFirst.Items := statShowName;
  CBSecond.Items := statShowName;
  CBThird.Items := statShowName;
  CBFourth.Items := statShowName;

  CBFirst.ItemIndex := 1;
  CBSecond.ItemIndex := 0;
  CBThird.ItemIndex := 0;
  CBFourth.ItemIndex := 0;
end;

procedure TDataQueryForm.loadSumField;
begin
  CBCount.Caption := '车次';
  CBGross.Caption := MainForm.systemConfig.grossCaption;
  CBTare.Caption := MainForm.systemConfig.tareCaption;
  CBNet.Caption := MainForm.systemConfig.netCaption;
  CBBundle.Caption := MainForm.systemConfig.bundleCaption;
  CBReal.Caption := MainForm.systemConfig.realCaption;
  CBSum.Caption := MainForm.systemConfig.sumCaption;
  CBCost.Caption := MainForm.systemConfig.costCaption;
  CBBackup6.Caption := MainForm.systemConfig.backup6Caption;
  CBBackup7.Caption := MainForm.systemConfig.backup7Caption;
  CBBackup8.Caption := MainForm.systemConfig.backup8Caption;
  CBBackup9.Caption := MainForm.systemConfig.backup9Caption;
end;

procedure TDataQueryForm.getCondition(adoq: TADOQuery);
begin
  with adoq do
  begin
    SQL.Add(' (序号<>0)');

    if (CBName1.Text <> '') and (EdtValue1.Text <> '') then
    begin
      case CBOper1.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1)');
            Parameters.ParamByName('v1').Value := EdtValue1.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1)');
            Parameters.ParamByName('v1').Value := '%' + EdtValue1.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1 and :v2)');
            Parameters.ParamByName('v1').Value := EdtValue1.Text;
            Parameters.ParamByName('v2').Value := EdtValue2.Text;
          end;
      end;
    end;

    if (CBName2.Text <> '') and (EdtValue3.Text <> '') then
    begin
      case CBOper2.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and ( ' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3)');
            Parameters.ParamByName('v3').Value := EdtValue3.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3)');
            Parameters.ParamByName('v3').Value := '%' + EdtValue3.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3 and :v4)');
            Parameters.ParamByName('v3').Value := EdtValue3.Text;
            Parameters.ParamByName('v4').Value := EdtValue4.Text;
          end;
      end;
    end;

    if (CBName3.Text <> '') and (EdtValue5.Text <> '') then
    begin
      case CBOper3.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5)');
            Parameters.ParamByName('v5').Value := EdtValue5.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5)');
            Parameters.ParamByName('v5').Value := '%' + EdtValue5.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5 and :v6)');
            Parameters.ParamByName('v5').Value := EdtValue5.Text;
            Parameters.ParamByName('v6').Value := EdtValue6.Text;
          end;
      end;
    end;

    if (CBName4.Text <> '') and (EdtValue7.Text <> '') then
    begin
      case CBOper4.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7)');
            Parameters.ParamByName('v7').Value := EdtValue7.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7)');
            Parameters.ParamByName('v7').Value := '%' + EdtValue7.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7 and :v8)');
            Parameters.ParamByName('v7').Value := EdtValue7.Text;
            Parameters.ParamByName('v8').Value := EdtValue8.Text;
          end;
      end;
    end;

    if (CBName5.Text <> '') then
    begin
      case CBOper5.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9)');
            Parameters.ParamByName('v9').Value :=
              FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
          end;
        6, 7: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9)');
            Parameters.ParamByName('v9').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
          end;
        8: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9 and :v10)');
            Parameters.ParamByName('v9').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
            Parameters.ParamByName('v10').Value := FormatDateTime('yyyy-MM-dd', DTPEndDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPEndTime1.Time);
          end;
      end;
    end;

    if (CBName6.Text <> '') then
    begin
      case CBOper6.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11)');
            Parameters.ParamByName('v11').Value :=
              FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
          end;
        6, 7: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11)');
            Parameters.ParamByName('v11').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
          end;
        8: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11 and :v12)');
            Parameters.ParamByName('v11').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
            Parameters.ParamByName('v12').Value := FormatDateTime('yyyy-MM-dd', DTPEndDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPEndTime2.Time);
          end;
      end;
    end;

    if RBFinish.Checked then
    begin
      SQL.Add(' and (净重<>0)');
    end
    else if RBNotFinish.Checked then
    begin
      SQL.Add(' and (净重=0)');
    end;
  end;
end;

procedure TDataQueryForm.BtnImportClick(Sender: TObject);
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.Filter := 'Excel文件(*.xls)|*.xls';
    od.DefaultExt := 'xls';
    if od.Execute then
    begin
      PWaiting.Visible := True;
      TDBCommonUtil.importExcel(od.FileName);
      Application.MessageBox('数据导入成功!', '提示', MB_OK + MB_ICONINFORMATION
        + MB_TOPMOST);
      PWaiting.Visible := False;
    end;
  finally
    od.Free;
  end;
end;

end.

