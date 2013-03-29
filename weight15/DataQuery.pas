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
    strShowName, strFieldName: TStrings; //��ѯ�ֶμ�����ʾ
    dateShowName, dateFieldName: TStrings; //���ڼ�����ʾ
    operShowName, operName: TStrings; //������������ʾ
    statShowName, statFieldName: TStrings; //��ͳ���ֶμ�����ʾ
  public
    QueryFlag: boolean;
    QueryStr: string;
    orderField: string;
    { Public declarations }
    procedure loadReport(); //��ȡ�����ʽ�ļ�
    procedure loadDBGrid(); //��ȡ�����ʾ�ͱ���
    procedure loadField(); //��ʾ���Ĳ�����,�Լ���ʾ���ֶ���
    procedure ReadFont();
    procedure loadStatField; //��ȡ����ͳ�Ƶ��ֶ�
    procedure loadSumField; //��ȡҪ�ϼƵ��ֶ�
    procedure getCondition(adoq: TADOQuery); //��ȡ��ѯ����
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
    SQL.Add('select * from ������Ϣ where ');
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
  //�����������DBGird����
  loadDBGrid();
  LEReportTitle.Text := 'ͳ�Ʊ���';
  loadReport; //��ȡ�����ʽ�ļ�
end;

procedure TDataQueryForm.BtnDelClick(Sender: TObject);
var i: integer;
begin
  if TDBCommonUtil.HasAuthority('����ά��') then
  begin
    if QueryFlag then
    begin
      if MessageDlg('��ȷ��Ҫɾ����Щ��¼��?', mtConfirmation, [mbYes, mbNo],
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
  if not TDBCommonUtil.HasAuthority('��ӡ����') then
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
  if not TDBCommonUtil.HasAuthority('��ӡ����') then
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
      EdtOrderField.Text := '��ˮ��';
      orderField := '��ˮ��';
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
  if TDBCommonUtil.HasAuthority('����ά��') then
  begin
    if MessageDlg('ȷʵҪɾ��������¼��?', mtConfirmation, [mbOK, mbCancel], 0) =
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
  if TDBCommonUtil.HasAuthority('�ֹ�����') then
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
    //�ж�ԭ����ʽ
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
  if TDBCommonUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('��ˮ��').AsString, True);
  end
end;

procedure TDataQueryForm.N4Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('��ˮ��').AsString);
  end
end;

procedure TDataQueryForm.SPMSaveAsClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEhWeight);
end;

procedure TDataQueryForm.SPMDeleteClick(Sender: TObject);
var i: string;
begin
  if TDBCommonUtil.HasAuthority('����ά��') then
  begin
    if MessageDlg('ȷʵҪɾ��������¼��?', mtConfirmation, [mbOK, mbCancel], 0) =
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

  operShowName.Add('����');
  operShowName.Add('����');
  operShowName.Add('�����');
  operShowName.Add('С��');
  operShowName.Add('С����');
  operShowName.Add('������');
  operShowName.Add('����');
  operShowName.Add('������');
  operShowName.Add('����֮��');

  operName.Add('=');
  operName.Add('>');
  operName.Add('>=');
  operName.Add('<');
  operName.Add('<=');
  operName.Add('<>');
  operName.Add('like');
  operName.Add('not like');
  operName.Add('between');

  strShowName.Add('��ˮ��');
  strShowName.Add(MainForm.systemConfig.carCaption);
  strShowName.Add('����Ա');
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

  strFieldName.Add('��ˮ��');
  strFieldName.Add('����');
  strFieldName.Add('����Ա');
  strFieldName.Add('������λ');
  strFieldName.Add('�ջ���λ');
  strFieldName.Add('����');
  strFieldName.Add('���');
  strFieldName.Add('����1');
  strFieldName.Add('����2');
  strFieldName.Add('����3');
  strFieldName.Add('����4');
  strFieldName.Add('����5');
  strFieldName.Add('ë��');
  strFieldName.Add('����');
  strFieldName.Add('����');
  strFieldName.Add('����');
  strFieldName.Add('ʵ��');
  strFieldName.Add('����');
  strFieldName.Add('���');
  strFieldName.Add('����6');
  strFieldName.Add('����7');
  strFieldName.Add('����8');
  strFieldName.Add('����9');

  dateShowName.Add('');
  dateShowName.Add(MainForm.systemConfig.grossTimeCaption);
  dateShowName.Add(MainForm.systemConfig.tareTimeCaption);

  dateFieldName.Add('');
  dateFieldName.Add('ë��ʱ��');
  dateFieldName.Add('����ʱ��');

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
  if TDBCommonUtil.HasAuthority('�ֹ�����') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.Caption := '�޸İ���';
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

  orderField := '��ˮ��';
  DTPStartDate1.Date := StartOfTheDay(Now);
  DTPStartTime1.Time := StartOfTheDay(Now);
  DTPEndDate1.Date := EndOfTheDay(Now);
  DTPEndTime1.Time := EndOfTheDay(Now);

  DTPStartDate2.Date := StartOfTheDay(Now);
  DTPStartTime2.Time := StartOfTheDay(Now);
  DTPEndDate2.Date := EndOfTheDay(Now);
  DTPEndTime2.Time := EndOfTheDay(Now);

  DBGridEhWeight.PopupMenu := PMDBGridEh;
  DBGridEhWeight.ReadOnly := not TDBCommonUtil.HasAuthority('����ά��');
  /////////////////////////////////////////////////////////////////////////////
  DBGridEhStat.DataSource := QueryDataModule.StatisticsDs;
  BBtnPrint.DropDownMenu := PMStatReport;

  loadField; //��ȡҪ��ѯ���ֶ���
  loadStatField; //��ȡ����ͳ�Ƶ��ֶ�
  loadSumField; //��ȡҪ�ϼƵ��ֶ�
end;

procedure TDataQueryForm.FormPaint(Sender: TObject);
var i: integer;
begin
  for i := 0 to DBGridEhStat.Columns.count - 1 do
  begin
    DBGridEhStat.Columns[i].Title.Alignment := taCenter; //�ֶα������ݾ�����ʾ
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
      or (DBGridEhStat.Columns[i].FieldName = '����')
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup6Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup7Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup8Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.systemConfig.backup9Caption) then
      DBGridEhStat.Columns[i].Footer.ValueType := fvtSum
    else if i = 0 then
    begin
      DBGridEhStat.Columns[i].Footer.ValueType := fvtStaticText;
      DBGridEhStat.Columns[i].Footer.Value := '�ϼ�'
    end
    else if (i = 1) and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.grossCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.tareCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.netCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.bundleCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.realCaption)
      and (DBGridEhStat.Columns[0].FieldName <> MainForm.systemConfig.sumCaption)
      and (DBGridEhStat.Columns[0].FieldName <> '����') then
      DBGridEhStat.Columns[i].Footer.ValueType := fvtCount
  end;
end;

procedure TDataQueryForm.N6Click(Sender: TObject);
begin
  TReportUtil.printStatReport(ExtractFilePath(ParamStr(0)) + '\StatReport\3.ͳ�Ʊ���-----����,�ջ���λ.fr3');
end;

procedure TDataQueryForm.MenuItem2Click(Sender: TObject);
begin
  TReportUtil.printStatReport(ExtractFilePath(ParamStr(0)) + '\StatReport\1.ͳ�Ʊ���-----����,������λ.fr3');
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
    BeforeGridText.Add('����Ա��' + MainForm.CurrentUser);
    BeforeGridText.Add('��ӡʱ��: ' + DateTimeToStr(Now));
    {BeforeGridText.Add('��ֹʱ��: '
      + FormatDateTime('yyyy-MM-dd HH:mm:ss', StartDate.DateTime)
      + ' --- ' + FormatDateTime('yyyy-MM-dd HH:mm:ss', EndDate.DateTime));
    }
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('��&[Page]ҳ/��&[Pages]ҳ');
    Preview
  end
end;

procedure TDataQueryForm.N3Click(Sender: TObject);
begin
  TReportUtil.printStatReport(ExtractFilePath(ParamStr(0)) + '\StatReport\2.ͳ�Ʊ���-----����,����.fr3');
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
    DBGridEh1.Font.Name := myini.ReadString('��������', '����', 'MS Sans Serif');
    DBGridEh1.Font.Size := myini.ReadInteger('��������', '�����С', 10);
    DBGridEh1.Font.Color := myini.ReadInteger('��������', '������ɫ', clWindowText);
    DBGridEh1.TitleFont.Name := myini.ReadString('��������', '����', 'MS Sans Serif');
    DBGridEh1.TitleFont.Size := myini.ReadInteger('��������', '�����С', 10);
    DBGridEh1.TitleFont.Color := myini.ReadInteger('��������', '������ɫ', clWindowText);
    DBGridEh1.FooterFont.Name := myini.ReadString('��������', '����', 'MS Sans Serif');
    DBGridEh1.FooterFont.Size := myini.ReadInteger('��������', '�����С', 10);
    DBGridEh1.FooterFont.Color := myini.ReadInteger('��������', '������ɫ', clWindowText);
    //��ȡ��������
    if Myini.ReadBool('ϵͳ����', 'FitGridToPageWidth', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghFitGridToPageWidth]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghFitGridToPageWidth];
    if Myini.ReadBool('ϵͳ����', 'Colored', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghColored]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghColored];
    if Myini.ReadBool('ϵͳ����', 'RowAutoStretch', true) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghRowAutoStretch]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghRowAutoStretch];
    if Myini.ReadBool('ϵͳ����', 'FitingByColWidth', false) then
      PrintDBGridEh1.Options := PrintDBGridEh1.Options + [pghFitingByColWidths]
    else
      PrintDBGridEh1.Options := PrintDBGridEh1.Options - [pghFitingByColWidths];
    if Myini.ReadBool('ϵͳ����', 'OptimalColWidth', true) then
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
    sqlstr := sqlstr + 'Count(��ˮ��) As [' + CBCount.Caption + '],';
  if CBGross.Checked then
    sqlstr := sqlstr + 'Sum(ë��) As [' + MainForm.systemConfig.grossCaption + '],';
  if CBTare.Checked then
    sqlstr := sqlstr + 'Sum(����) As [' + MainForm.systemConfig.tareCaption + '],';
  if CBNet.Checked then
    sqlstr := sqlstr + 'Sum(����) As [' + MainForm.systemConfig.netCaption + '],';
  if CBBundle.Checked then
    sqlstr := sqlstr + 'Sum(����) As [' + MainForm.systemConfig.bundleCaption + '],';
  if CBReal.Checked then
    sqlstr := sqlstr + 'Sum(ʵ��) As [' + MainForm.systemConfig.realCaption + '],';
  if CBSum.Checked then
    sqlstr := sqlstr + 'Sum(���) As [' + MainForm.systemConfig.sumCaption + '],';
  if CBCost.Checked then
    sqlstr := sqlstr + 'Sum(������) As [' + MainForm.systemConfig.costCaption + '],';
  if CBBackup6.Checked then
    sqlstr := sqlstr + 'Sum(����6) As [' + MainForm.systemConfig.backup6Caption + '],';
  if CBBackup7.Checked then
    sqlstr := sqlstr + 'Sum(����7) As [' + MainForm.systemConfig.backup7Caption + '],';
  if CBBackup8.Checked then
    sqlstr := sqlstr + 'Sum(����8) As [' + MainForm.systemConfig.backup8Caption + '],';
  if CBBackup9.Checked then
    sqlstr := sqlstr + 'Sum(����9) As [' + MainForm.systemConfig.backup9Caption + '],';

  if RightStr(sqlstr, 1) = ',' then
    sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);

  sqlstr := sqlstr + ' from ������Ϣ where ';

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
  TReportUtil.designReport(ExtractFilePath(ParamStr(0)) + '\StatReport\1.ͳ�Ʊ���-----����,������λ.fr3');
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
  statShowName.Add('����Ա');
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
  statFieldName.Add('����');
  statFieldName.Add('����Ա');
  statFieldName.Add('������λ');
  statFieldName.Add('�ջ���λ');
  statFieldName.Add('����');
  statFieldName.Add('���');
  statFieldName.Add('����1');
  statFieldName.Add('����2');
  statFieldName.Add('����3');
  statFieldName.Add('����4');
  statFieldName.Add('����5');
  statFieldName.Add('ë��ʱ��');
  statFieldName.Add('����ʱ��');

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
  CBCount.Caption := '����';
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
    SQL.Add(' (���<>0)');

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
      SQL.Add(' and (����<>0)');
    end
    else if RBNotFinish.Checked then
    begin
      SQL.Add(' and (����=0)');
    end;
  end;
end;

procedure TDataQueryForm.BtnImportClick(Sender: TObject);
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.Filter := 'Excel�ļ�(*.xls)|*.xls';
    od.DefaultExt := 'xls';
    if od.Execute then
    begin
      PWaiting.Visible := True;
      TDBCommonUtil.importExcel(od.FileName);
      Application.MessageBox('���ݵ���ɹ�!', '��ʾ', MB_OK + MB_ICONINFORMATION
        + MB_TOPMOST);
      PWaiting.Visible := False;
    end;
  finally
    od.Free;
  end;
end;

end.

