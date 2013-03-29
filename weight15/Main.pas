unit Main;

interface

uses
  Windows, Graphics, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, Menus, ComCtrls, DB, ADODB, ExtCtrls, StdCtrls,
  Buttons, DBCtrlsEh, DBGridEh, Math, SysConfig, WinSkinData, PropStorageEh, StdActns,
  DBActns, ActnList, PrnDbgeh, RzPanel, RzLabel,
  RzButton, GridsEh, PropFilerEh, ImgList, RzStatus, Mask;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    MSysOper: TMenuItem;
    MDataMaintain: TMenuItem;
    MSysMaintain: TMenuItem;
    MAdditionalTool: TMenuItem;
    MHelp: TMenuItem;
    TTime: TTimer;
    SMChange: TMenuItem;
    SMPassword: TMenuItem;
    SMWeight: TMenuItem;
    SMClose: TMenuItem;
    SMTerminate: TMenuItem;
    SMUser: TMenuItem;
    SMDataQuery: TMenuItem;
    SMDBBack: TMenuItem;
    SMPreMaintain: TMenuItem;
    SMInput: TMenuItem;
    SMMeter1: TMenuItem;
    SMSoftSet: TMenuItem;
    SMPrintCombine: TMenuItem;
    SMComputer: TMenuItem;
    SMModify: TMenuItem;
    SMAbout: TMenuItem;
    N38: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N44: TMenuItem;
    PInfo: TPanel;
    JM2: TPanel;
    GroupBox2: TGroupBox;
    lblGross: TLabel;
    lblTare: TLabel;
    lblNet: TLabel;
    lblReal: TLabel;
    lblSum: TLabel;
    Label14: TLabel;
    PTare: TPanel;
    PNet: TPanel;
    PReal: TPanel;
    PSum: TPanel;
    PGross: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    PanelMain: TPanel;
    SaveDialog1: TSaveDialog;
    SMDataback: TMenuItem;
    TAutoShut: TTimer;
    TAutoBackup: TTimer;
    lblAllRec: TLabel;
    lblTodayRec: TLabel;
    lblTodayNet: TLabel;
    lblTodayWeight: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    PrintDBGridEh1: TPrintDBGridEh;
    SMSimulate: TMenuItem;
    ActionListMain: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    PMDBGridEh: TPopupMenu;
    SPMPrint: TMenuItem;
    SPMDelete: TMenuItem;
    SPMSaveAs: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    TSimulate: TTimer;
    SMReadWeight: TMenuItem;
    TReadWeight: TTimer;
    N4: TMenuItem;
    PHint: TPanel;
    BitBtnCloseHint: TBitBtn;
    TShow: TTimer;
    TAutoHide: TTimer;
    THide: TTimer;
    N5: TMenuItem;
    N6: TMenuItem;
    IniPropStorageManEh1: TIniPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    N10: TMenuItem;
    TBackRecord: TTimer;
    SMTicketSet: TMenuItem;
    PData: TPanel;
    Panel8: TPanel;
    DBGridEh1: TDBGridEh;
    PTool: TPanel;
    GBDataQuery: TGroupBox;
    GBDataOper: TGroupBox;
    AppendBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    CancelBtn: TBitBtn;
    SaveBtn: TBitBtn;
    GBDataExport: TGroupBox;
    OutputBtn: TBitBtn;
    PrintBtn: TBitBtn;
    PMain: TPanel;
    PRight: TPanel;
    MBtnQuery: TRzMenuButton;
    PMQuery: TPopupMenu;
    NToMonth: TMenuItem;
    NToday: TMenuItem;
    TLine: TTimer;
    PInput: TPanel;
    CBAutoClear: TCheckBox;
    CBPreview: TCheckBox;
    PCommon: TPanel;
    PCar: TPanel;
    SBCar: TSpeedButton;
    lblCar: TRzLabel;
    CBCar: TComboBox;
    PFaHuo: TPanel;
    lblFaHuo: TRzLabel;
    CBFaHuo: TComboBox;
    PShouHuo: TPanel;
    lblShouHuo: TRzLabel;
    CBShouHuo: TComboBox;
    PGoods: TPanel;
    lblGoods: TRzLabel;
    CBGoods: TComboBox;
    PSpec: TPanel;
    lblSpec: TRzLabel;
    CBSpec: TComboBox;
    PBundle: TPanel;
    lblBundle: TRzLabel;
    CBBundle: TDBNumberEditEh;
    PPrice: TPanel;
    lblPrice: TRzLabel;
    CBPrice: TDBNumberEditEh;
    PCost: TPanel;
    lblCost: TRzLabel;
    CBCost: TDBNumberEditEh;
    PRemark: TPanel;
    lblRemark: TRzLabel;
    CBRemark: TComboBox;
    POther: TPanel;
    PBackup1: TPanel;
    PBackup2: TPanel;
    PBackup3: TPanel;
    PBackup4: TPanel;
    PBackup5: TPanel;
    PBackup6: TPanel;
    PBackup7: TPanel;
    PBackup8: TPanel;
    lblBackup1: TRzLabel;
    lblBackup2: TRzLabel;
    lblBackup3: TRzLabel;
    lblBackup4: TRzLabel;
    lblBackup5: TRzLabel;
    lblBackup6: TRzLabel;
    lblBackup7: TRzLabel;
    lblBackup8: TRzLabel;
    CBBackup6: TDBNumberEditEh;
    CBBackup7: TDBNumberEditEh;
    CBBackup8: TDBNumberEditEh;
    CBOnce: TCheckBox;
    CBBackup1: TComboBox;
    CBBackup2: TComboBox;
    CBBackup3: TComboBox;
    CBBackup4: TComboBox;
    CBBackup5: TComboBox;
    PBackup9: TPanel;
    lblBackup9: TRzLabel;
    CBBackup9: TDBNumberEditEh;
    PMWeight: TPopupMenu;
    CBSimple: TCheckBox;
    BtnWeight: TBitBtn;
    BtnSave: TBitBtn;
    BtnPrint: TBitBtn;
    BtnCancel: TBitBtn;
    PStandard: TPanel;
    BitBtnTare: TBitBtn;
    BitBtnSave: TBitBtn;
    BitBtnPrint: TBitBtn;
    BitBtnGross: TBitBtn;
    BitBtnClear: TBitBtn;
    SkinData1: TSkinData;
    N18: TMenuItem;
    CBRecordType: TComboBox;
    NToYear: TMenuItem;
    NToSeason: TMenuItem;
    NToWeek: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    TWaitForZero: TTimer;
    SBTao: TSpeedButton;
    BtnSetTare: TButton;
    N24: TMenuItem;
    RzToolbar1: TRzToolbar;
    ImageList1: TImageList;
    BtnSecurity: TRzToolButton;
    BtnExit: TRzToolButton;
    BtnJumptoLine: TRzToolButton;
    BtnNote: TRzToolButton;
    BtnNewsgroups: TRzToolButton;
    RzSpacer4: TRzSpacer;
    RzSpacer5: TRzSpacer;
    RzSpacer6: TRzSpacer;
    RzSpacer1: TRzSpacer;
    StatusBar1: TRzStatusBar;
    SpMode: TRzStatusPane;
    SpUser: TRzStatusPane;
    SpTime: TRzClockStatus;
    spInfo: TRzMarqueeStatus;
    N8: TMenuItem;
    BtnChangeOptions: TRzToolButton;
    Label18: TLabel;
    Label19: TLabel;
    lblUnit1: TLabel;
    SpSteady1: TShape;
    SpTrans1: TShape;
    PWeight1: TRzPanel;
    ImgBack: TImage;
    procedure TTimeTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure SMMeter1Click(Sender: TObject);
    procedure SMCloseClick(Sender: TObject);
    procedure SMSoftSetClick(Sender: TObject);
    procedure SMChangeClick(Sender: TObject);
    procedure SMPasswordClick(Sender: TObject);
    procedure SMWeightClick(Sender: TObject);
    procedure SMUserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SMDBBackClick(Sender: TObject);
    procedure BitBtnGrossClick(Sender: TObject);
    procedure BitBtnTareClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure SMPreMaintainClick(Sender: TObject);
    procedure CBFaHuoEnter(Sender: TObject);
    procedure CBShouHuoEnter(Sender: TObject);
    procedure CBGoodsEnter(Sender: TObject);
    procedure CBSpecEnter(Sender: TObject);
    procedure ListBtnClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure SMDatabackClick(Sender: TObject);
    procedure TAutoBackupTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SMDataQueryClick(Sender: TObject);
    procedure BitBtnClearClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure SMInputClick(Sender: TObject);
    procedure SMAboutClick(Sender: TObject);
    procedure SMComputerClick(Sender: TObject);
    procedure CBBundleChange(Sender: TObject);
    procedure CBPriceChange(Sender: TObject);
    procedure TAutoShutTimer(Sender: TObject);
    procedure SMTerminateClick(Sender: TObject);
    procedure SMSimulateClick(Sender: TObject);
    procedure SPMPrintClick(Sender: TObject);
    procedure SPMDeleteClick(Sender: TObject);
    procedure SPMSaveAsClick(Sender: TObject);
    procedure TSimulateTimer(Sender: TObject);
    procedure CBRemarkEnter(Sender: TObject);
    procedure CBBundleEnter(Sender: TObject);
    procedure CBPriceEnter(Sender: TObject);
    procedure CBFaHuoExit(Sender: TObject);
    procedure CBShouHuoExit(Sender: TObject);
    procedure CBGoodsExit(Sender: TObject);
    procedure CBSpecExit(Sender: TObject);
    procedure CBBundleExit(Sender: TObject);
    procedure CBPriceExit(Sender: TObject);
    procedure CBRemarkExit(Sender: TObject);
    procedure SMReadWeightClick(Sender: TObject);
    procedure TReadWeightTimer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure CBAutoClearClick(Sender: TObject);
    procedure CBPreviewClick(Sender: TObject);
    procedure TShowTimer(Sender: TObject);
    procedure TAutoHideTimer(Sender: TObject);
    procedure THideTimer(Sender: TObject);
    procedure BitBtnCloseHintClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure CBCarExit(Sender: TObject);
    procedure CBCarEnter(Sender: TObject);
    procedure CBCostEnter(Sender: TObject);
    procedure CBCostExit(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure TBackRecordTimer(Sender: TObject);
    procedure SMTicketSetClick(Sender: TObject);
    procedure SMModifyClick(Sender: TObject);
    procedure SBCarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CBCarDblClick(Sender: TObject);
    procedure CBFaHuoDblClick(Sender: TObject);
    procedure CBShouHuoDblClick(Sender: TObject);
    procedure CBGoodsDblClick(Sender: TObject);
    procedure PWeight1DblClick(Sender: TObject);
    procedure TLineTimer(Sender: TObject);
    procedure CBCarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBFaHuoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBShouHuoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBGoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBSpecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBundleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBCostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBRemarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup1Enter(Sender: TObject);
    procedure CBBackup1Exit(Sender: TObject);
    procedure CBBackup2Enter(Sender: TObject);
    procedure CBBackup2Exit(Sender: TObject);
    procedure CBBackup3Enter(Sender: TObject);
    procedure CBBackup3Exit(Sender: TObject);
    procedure CBBackup4Enter(Sender: TObject);
    procedure CBBackup4Exit(Sender: TObject);
    procedure CBBackup5Enter(Sender: TObject);
    procedure CBBackup5Exit(Sender: TObject);
    procedure CBBackup6Exit(Sender: TObject);
    procedure CBBackup6Enter(Sender: TObject);
    procedure CBBackup7Enter(Sender: TObject);
    procedure CBBackup7Exit(Sender: TObject);
    procedure CBBackup8Exit(Sender: TObject);
    procedure CBBackup8Enter(Sender: TObject);
    procedure CBBackup8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBBackup9Enter(Sender: TObject);
    procedure CBBackup9Exit(Sender: TObject);
    procedure CBBackup1DblClick(Sender: TObject);
    procedure CBBackup2DblClick(Sender: TObject);
    procedure CBBackup3DblClick(Sender: TObject);
    procedure CBBackup4DblClick(Sender: TObject);
    procedure CBBackup5DblClick(Sender: TObject);
    procedure PMWeightPopup(Sender: TObject);
    procedure CBSimpleClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnWeightClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure NTodayClick(Sender: TObject);
    procedure NToWeekClick(Sender: TObject);
    procedure NToMonthClick(Sender: TObject);
    procedure NToSeasonClick(Sender: TObject);
    procedure NToYearClick(Sender: TObject);
    procedure CBRecordTypeChange(Sender: TObject);
    procedure TWaitForZeroTimer(Sender: TObject);
    procedure AppendBtnClick(Sender: TObject);
    procedure SBTaoClick(Sender: TObject);
    procedure BtnSetTareClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SMPrintCombineClick(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSecurityClick(Sender: TObject);
    procedure BtnJumptoLineClick(Sender: TObject);
    procedure BtnNoteClick(Sender: TObject);
    procedure BtnNewsgroupsClick(Sender: TObject);
    procedure BtnChangeOptionsClick(Sender: TObject);
    procedure BtnVolumeClick(Sender: TObject);
  private
    { Private declarations }
    canAutoSave: boolean;
    WeightField, UpdateRecNo, MaxGlideNo, operator: string;
    //判断稳定
    arrWeight1, arrWeight2: array[0..50] of string;
    cishu1, cishu2: integer;
    FCurrentUser: string;
    //y, maxY: Integer; //走势图Y轴
    procedure SetCurrentUser(const Value: string);
  public
    { Public declarations }
    WeightType, CurrentRecord: string; //当前点中的记录
    systemConfig: TSysConfig; //系统参数
    procedure PanelDataCheck();
    procedure ShowMsg(Msg: string); //显示信息
    procedure GrossFindTare(); //点击毛重时寻找空重记录
    procedure TareFindGross(); //点击空重时寻找毛重记录
    procedure CreateGrossPoundCharge();
    procedure CreateTarePoundCharge();
    procedure UpdatePoundCharge(lastPound: Double); //计算过磅费
    procedure saveBackRecordWeight(weight: string); //保存
    procedure GetStaticInfo(); //计算称重界面右上角的统计信息
    procedure setAutoBackup(t: boolean); //设置自动备份数据库
    procedure resizeMain(); //重新缩放称重界面的大小
    procedure loadFormDesign();
    function getWeight(): string; //一机双衡时取重量
    function getSteady(): Boolean; //取稳定状态
    function showGridRecord(): string; //显示表格的记录,根据条件
    procedure checkMenu(t: TMenuItem); //选择当前查询条件
    procedure loadSysConfig(); //读取配置
    procedure CalcNet(); //计算净重，扣重，实重及金额
    property
      CurrentUser: string read FCurrentUser write SetCurrentUser; //当前用户
  end;

var
  MainForm: TMainForm;

type
  TMyDBGrid = class(TDBGridEh);

implementation

uses QueryDM, SoftwareSet, ModifyPassword, Login, UserPurview,
  DataQuery, PrepareMaintain, DataShowSetting, Autoshut, DBMaintain, DBClear, DBBackup, InputWeight,
  About, ReadWeight, MultiGross, Log,
  BackRecord, TicketSet, CommonUtil,
  Car, DrawLine1, ManualInput, Tao,
  TareChart, WeightSet, PrepareUtil, InitializeOption,
  Voice, MeterSet1;

{$R *.dfm}

//每次做完后进行用户权限的检测，如查询，

procedure TMainForm.PanelDataCheck;
begin
  GBDataOper.Enabled := TDBCommonUtil.HasAuthority('数据维护');
  DBGridEh1.ReadOnly := not TDBCommonUtil.HasAuthority('数据维护');
  DBGridEh1.ReadOnly := not TDBCommonUtil.HasAuthority('数据维护');
  DBGridEh1.FieldColumns['毛重'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['空重'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['净重'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['扣重'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['实重'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['单价'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['金额'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['过磅费'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['毛重时间'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  DBGridEh1.FieldColumns['空重时间'].ReadOnly := not TDBCommonUtil.HasAuthority('系统设置');
  PrintBtn.Enabled := TDBCommonUtil.HasAuthority('打印报表')
end;

//显示字段

procedure TMainForm.ListBtnClick(Sender: TObject);
begin
  Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
  try
    DataShowSettingForm.DBGridEh1 := DBGridEh1;
    DataShowSettingForm.TableName := '称重信息';
    DataShowSettingForm.ShowModal;
    Repaint;
  finally
    DataShowSettingForm.Free
  end
end;

//输出记录为Excel or Txt

procedure TMainForm.OutputBtnClick(Sender: TObject);
begin
  if TCommonUtil.exportExcel(DBGridEh1) then
    ShowMsg('数据导出成功！')
  else
    ShowMsg('数据导出失败！');
end;

//找印表格

procedure TMainForm.PrintBtnClick(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEh1;
    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(TCommonUtil.getIni.ReadString('system_set', 'dataReportTitle', '数据报表'));
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('操作员：' + CurrentUser + '        ' + '报表时间：' +
      DateTimeToStr(Now));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('第&[Page]页/共&[Pages]页');
    Preview
  end
end;

//显示当前时间以及判断重量是否稳定

procedure TMainForm.TTimeTimer(Sender: TObject);
var i: integer;
  flag1, flag2: boolean;
begin
  SpTrans1.Brush.Color := clWhite;
  if PanelMain.Visible then
  begin
    //一号仪表判断稳定
    arrWeight1[cishu1] := PWeight1.Caption;
    inc(CiShu1);
    if CiShu1 > systemConfig.steadyCount then
      CiShu1 := 0;
    for i := 0 to systemConfig.steadyCount - 1 do
    begin
      flag1 := True;
      if arrWeight1[i] <> arrWeight1[i + 1] then
      begin
        flag1 := False;
        break;
      end;
    end;
    if flag1 then
      SpSteady1.Brush.Color := clLime
    else
      SpSteady1.Brush.Color := clRed;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if MessageDlg('确定要关闭软件吗?',
    mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    CanClose := false
end;

procedure TMainForm.SMMeter1Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('仪表设置') then
    MeterSet1Form.ShowModal
  else
    ShowMsg('对不起您没有仪表设置权限，无法进行仪表设置！')
end;

procedure TMainForm.SMCloseClick(Sender: TObject);
begin
  Close
end;

procedure TMainForm.SMSoftSetClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('系统设置') then
  begin
    Application.CreateForm(TSoftwareSetForm, SoftwareSetForm);
    try
      SoftwareSetForm.ShowModal;
    finally
      SoftwareSetForm.Free
    end
  end
  else
    ShowMsg('对不起您没有系统设置权限，无法进行软件设置！')
end;

procedure TMainForm.SMChangeClick(Sender: TObject);
begin
  CurrentUser := '';
  Application.CreateForm(TLoginForm, LoginForm);
  try
    LoginForm.ShowModal;
    if CurrentUser = '' then
      Application.Terminate;
    TDBCommonUtil.AddLog(CurrentUser + '登陆');
    PanelDataCheck;
  finally
    LoginForm.Free
  end
end;

procedure TMainForm.SMPasswordClick(Sender: TObject);
begin
  Application.CreateForm(TModifyPasswordForm, ModifyPasswordForm);
  try
    ModifyPasswordForm.ShowModal;
  finally
    ModifyPasswordForm.Free
  end
end;

procedure TMainForm.SMWeightClick(Sender: TObject);
begin
  PanelMain.Visible := True;
  resizeMain;
  
  PHint.Height := 0;

  //PWeight1.Caption := '0';
  CBCar.Text := '';
  CBCar.Enabled := true;
  CBFaHuo.Text := '';
  CBShouHuo.Text := '';
  CBGoods.Text := '';
  CBSpec.Text := '';
  CBBundle.Text := '0';
  CBPrice.Text := '0';
  CBRemark.Text := '';
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  CBBackup1.Text := '';
  CBBackup2.Text := '';
  CBBackup3.Text := '';
  CBBackup4.Text := '';
  CBBackup5.Text := '';
  CBBackup6.Value := 0;
  CBBackup7.Value := 0;
  CBBackup8.Value := 0;
  CBBackup9.Value := 0;

  BitBtnGross.Visible := true;
  BitBtnTare.Visible := true;
  BitBtnSave.Visible := false;
  BitBtnPrint.Visible := false;

  WeightType := '';
  //计算称重界面右上角的统计信息
  GetStaticInfo();
  showGridRecord;

  CBCar.SetFocus;
end;

procedure TMainForm.SMUserClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('用户管理') then
  begin
    Application.CreateForm(TUserPurviewForm, UserPurviewForm);
    try
      UserPurviewForm.ShowModal;
    finally
      UserPurviewForm.Free
    end
  end
  else
    ShowMsg('对不起您没有用户管理权限，无法进行操作员维护！')
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if QueryDataModule.ConnectFlag then
  begin
    //resizeMain;
    TTime.Enabled := True; //开始计时
    TAutoShut.Enabled := True; //
    TBackRecord.Enabled := True;
    //SMWeight.Click;

    if FileExists(ExtractFilePath(ParamStr(0)) + 'bg.jpg') then
      ImgBack.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'bg.jpg');
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  systemConfig := TSysConfig.Create;
  //读取系统参数配置
  loadSysConfig();
  //载入称重界面配置
  loadFormDesign();

  IniPropStorageManEh1.IniFileName := ExtractFilePath(ParamStr(0)) +
    '\form.ini';
  if (CurrentUser = '') then
  begin
    CurrentUser := '';
    Application.CreateForm(TLoginForm, LoginForm);
    try
      LoginForm.ShowModal;
      if CurrentUser = '' then
        Application.Terminate;
    finally
      LoginForm.Free
    end
  end;
end;

procedure TMainForm.SMDBBackClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('数据备份') then
  begin
    Application.CreateForm(TDBMaintainForm, DBMaintainForm);
    try
      DBMaintainForm.ShowModal;
    finally
      DBMaintainForm.Free
    end
  end
  else
  begin
    Application.CreateForm(TDBBackupForm, DBBackupForm);
    try
      DBBackupForm.ShowModal;
    finally
      DBBackupForm.Free
    end
  end
end;

procedure TMainForm.GrossFindTare();
begin
  //找寻上次的空重记录
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where (车号=:car) and (毛重=0) '
      + 'and (空重<>0) and (净重=0) Order By 流水号';
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      //询问用户是否使用过住的皮重
      if MessageDlg('是否调用以往的皮重?', mtConfirmation, [mbYes, mbNo], 0)
        <> mrYes then
        Exit;
      if RecordCount = 1 then
      begin
        if FieldByName('发货单位').AsString <> '' then
          CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then
          CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then
          CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then
          CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('扣重').AsFloat <> 0 then
          CBBundle.Text := FieldByName('扣重').AsString;
        if FieldByName('单价').AsFloat <> 0 then
          CBPrice.Text := FieldByName('单价').AsString;
        if FieldByName('备注').AsString <> '' then
          CBRemark.Text := FieldByName('备注').AsString;

        if FieldByName('备用1').AsString <> '' then
          CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then
          CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then
          CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then
          CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then
          CBBackup5.Text := FieldByName('备用5').AsString;

        if FieldByName('备用6').AsFloat <> 0 then
          CBBackup6.Text := FieldByName('备用6').AsString;
        if FieldByName('备用7').AsFloat <> 0 then
          CBBackup7.Text := FieldByName('备用7').AsString;
        if FieldByName('备用8').AsFloat <> 0 then
          CBBackup8.Text := FieldByName('备用8').AsString;
        if FieldByName('备用9').AsFloat <> 0 then
          CBBackup9.Text := FieldByName('备用9').AsString;

        PTare.Caption := FieldByName('空重').AsString; //毛重-空重=净重
        CalcNet;
        //更新过磅费
        UpdatePoundCharge(FieldByName('过磅费').AsFloat);
        WeightType := '更新';
        UpdateRecNo := FieldByName('流水号').AsString;

        operator := operator + FieldByName('过磅员').AsString;
      end
      else if RecordCount > 1 then
        //有大于一条的空重记录,弹出对话框让用户选择其中一条
      begin
        with QueryDataModule.ADOQMultiGross do
        begin
          Close;
          SQL.Text := 'Select * From 称重信息 Where (车号=:car)'
            + ' And (毛重=0) and (空重<>0) and (净重=0) Order By 序号 desc';
          Parameters.ParamByName('car').Value := CBCar.Text;
          Open;
        end;
        MultiGrossForm.Width := Screen.Width - 10;
        MultiGrossForm.ShowModal;
        UpdateRecNo := MultiGrossForm.UpdateRecNo;
        with MultiGrossForm.DBGridEh1.DataSource.DataSet do
        begin
          if FieldByName('发货单位').AsString <> '' then
            CBFaHuo.Text := FieldByName('发货单位').AsString;
          if FieldByName('收货单位').AsString <> '' then
            CBShouHuo.Text := FieldByName('收货单位').AsString;
          if FieldByName('货名').AsString <> '' then
            CBGoods.Text := FieldByName('货名').AsString;
          if FieldByName('规格').AsString <> '' then
            CBSpec.Text := FieldByName('规格').AsString;
          if FieldByName('扣重').AsFloat <> 0 then
            CBBundle.Text := FieldByName('扣重').AsString;
          if FieldByName('单价').AsFloat <> 0 then
            CBPrice.Text := FieldByName('单价').AsString;
          if FieldByName('备注').AsString <> '' then
            CBRemark.Text := FieldByName('备注').AsString;

          if FieldByName('备用1').AsString <> '' then
            CBBackup1.Text := FieldByName('备用1').AsString;
          if FieldByName('备用2').AsString <> '' then
            CBBackup2.Text := FieldByName('备用2').AsString;
          if FieldByName('备用3').AsString <> '' then
            CBBackup3.Text := FieldByName('备用3').AsString;
          if FieldByName('备用4').AsString <> '' then
            CBBackup4.Text := FieldByName('备用4').AsString;
          if FieldByName('备用5').AsString <> '' then
            CBBackup5.Text := FieldByName('备用5').AsString;

          if FieldByName('备用6').AsFloat <> 0 then
            CBBackup6.Text := FieldByName('备用6').AsString;
          if FieldByName('备用7').AsFloat <> 0 then
            CBBackup7.Text := FieldByName('备用7').AsString;
          if FieldByName('备用8').AsFloat <> 0 then
            CBBackup8.Text := FieldByName('备用8').AsString;
          if FieldByName('备用9').AsFloat <> 0 then
            CBBackup9.Text := FieldByName('备用9').AsString;

          PTare.Caption := FieldByName('空重').AsString; //毛重-空重
          CalcNet;
          //更新过磅费
          UpdatePoundCharge(FieldByName('过磅费').AsFloat);
          WeightType := '更新';

          operator := FieldByName('过磅员').AsString + ' ' + operator
        end;
      end
    end
  end
end;

procedure TMainForm.BitBtnGrossClick(Sender: TObject);
var grossGlideNo: string;
  Account: Double; //扣重，金额计算变量
  Flag: boolean; //预置标志
begin
  Account := 0.00;
  //Flag := true;
  if (StrToFloatDef(getWeight, 0) = 0) or (CBCar.Text = '') then
  begin
    ShowMsg('重量或车号不能为空，否则无法进行操作！');
    Exit
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  //等待稳定后才能称重
  if not getSteady then
    Exit;

  TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text); //预置车号,单位等信息
  TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text); //预置备用项目

  PGross.Caption := getWeight; //获取当前重量
  UpdateRecNo := ''; //如果是更新的话，取上一次的号码
  WeightType := '插入'; //称重类型，一种是插入，一种是更新
  WeightField := '毛重';

  operator := '毛:' + CurrentUser;
  //设置过磅费
  CreateGrossPoundCharge();

  //如果不允许二次过毛重,那么如果有磅过毛重,就弹出对话框让用户选择是否更新上次毛重
  //如果选是就更新,否则不能过磅
  if not systemConfig.AllowSecondGross then
  begin
    if TDBCommonUtil.hasLastGross(CBCar.Text, grossGlideNo) then
    begin
      if MessageBoxW(Handle, '该车已过了重磅,是否更新上次的毛重?', '提示',
        MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        if TDBCommonUtil.HasAuthority('数据维护') then
        begin
          TDBCommonUtil.updateLastGross(grossGlideNo, PGross.Caption);
        end
        else
        begin
          MessageBox(0, '对不起,你没有权限更新此记录', '错误', MB_OK +
            MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
        Exit;
      end
      else
        Exit;
    end;
  end;

  //预置的符号,为True 则无预置皮重
  Flag := true;
  //找寻是否有预置的皮重
  QueryDataModule.PrepareMaintainDS.Enabled := false;
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 皮重 From 车号 Where 车号=:car');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      if FieldByName('皮重').AsFloat <> 0 then
      begin
        if MessageDlg('车号为【' + CBCar.Text + '】有预置皮重为【'
          + FieldByName('皮重').AsString + Char(13) + '是否使用当前的预置皮重?'
          , mtWarning, [mbOK, mbCancel], 0) = mrOk then
        begin
          Flag := false;
          Account := FieldByName('皮重').AsFloat
        end
      end
    end;
    Close;
    SQL.Clear
  end;
  QueryDataModule.PrepareMaintainDS.Enabled := true;
  if Flag then //无预置时
  begin
    GrossFindTare;
    //一次过磅
    if CBOnce.Checked then
    begin
      PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
        StrToFloatDef(PTare.Caption, 0));
      CalcNet;
    end;
  end
  else //有预置皮重时
  begin
    with QueryDataModule.WeightMaintainQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select top 1 * from 称重信息 order by 流水号');
      Open
    end;
    PTare.Caption := FloatToStr(Account);
    PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
      StrToFloatDef(PTare.Caption, 0));
    CalcNet;
    WeightType := '预置';
    operator := operator + ' 空:' + CurrentUser
  end;

  CBCar.Enabled := false;
  BitBtnGross.Visible := false;
  BitBtnTare.Visible := false;
  BitBtnSave.Visible := true;
  BitBtnPrint.Visible := true;
  BitBtnClear.Caption := '取消(&C)';

  TReadWeight.Enabled := systemConfig.UseVoice;
end;

procedure TMainForm.BitBtnTareClick(Sender: TObject);
var tareGlideNo: string;
  sysTare, nowTare: Double;
begin
  if (StrToFloatDef(getWeight, 0) = 0) or (CBCar.Text = '') then
  begin
    ShowMsg('重量或车号不能为空，否则无法进行操作！');
    Exit
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  //等待重量稳定
  if not getSteady then
    Exit;

  TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text); //预置车号,单位等信息
  TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text); //预置备用项目

  PTare.Caption := getWeight;

  //提示皮重超差
  if systemConfig.useTareDiff then
  begin
    nowTare := StrToFloatDef(PTare.Caption, 0);
    sysTare := TPrepareUtil.getCarTare(CBCar.Text);
    //超过5%的重量
    if sysTare > 0 then
    begin
      if (abs(nowTare - sysTare) / sysTare) > systemConfig.tareDiff / 100 then
      begin
        if Application.MessageBox(PChar(Format('该车皮与系统车皮存在误差,最后一次过磅为[%f],误差[%f],是否允许继续过磅?',
          [sysTare, sysTare - nowTare])), '提示', MB_YESNO + MB_ICONWARNING + MB_TOPMOST) = IDYES then
        begin
          TPrepareUtil.updateCarTare(CBCar.Text, PTare.Caption);
        end
        else
        begin
          Exit;
        end;
      end;
    end;
  end;

  UpdateRecNo := '';
  WeightType := '插入';
  WeightField := '空重';

  operator := '空:' + CurrentUser;
  //过磅费
  CreateTarePoundCharge();

  //如果不允许二次过皮重,那么如果有磅过皮重,就弹出对话框让用户选择是否更新上次皮重
  //如果选是就更新,否则不能过磅
  if not systemConfig.AllowSecondTare then
  begin
    if TDBCommonUtil.hasLastTare(CBCar.Text, tareGlideNo) then
    begin
      if MessageBoxW(Handle, '该车已过了空磅,是否更新上次的皮重?', '提示',
        MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        if TDBCommonUtil.HasAuthority('数据维护') then
        begin
          TDBCommonUtil.updateLastTare(tareGlideNo, PTare.Caption);
        end
        else
        begin
          MessageBox(0, '对不起,你没有权限更新此记录', '错误', MB_OK +
            MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
        Exit;
      end
      else
        Exit;
    end;
  end;
  //自动预置皮重
  if systemConfig.autoWriteTare then
    TPrepareUtil.updateCarTare(CBCar.Text, PTare.Caption);
  //找寻上次的毛重记录
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 Where (车号=:car) '
      + 'And (空重=0) and (毛重<>0) and (净重=0) Order By 流水号');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then //查询结果不为空
    begin
      if RecordCount = 1 then
      begin
        if FieldByName('发货单位').AsString <> '' then
          CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then
          CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then
          CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then
          CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('扣重').AsFloat <> 0 then
          CBBundle.Text := FieldByName('扣重').AsString;
        if FieldByName('单价').AsFloat <> 0 then
          CBPrice.Text := FieldByName('单价').AsString;
        if FieldByName('备注').AsString <> '' then
          CBRemark.Text := FieldByName('备注').AsString;

        if FieldByName('备用1').AsString <> '' then
          CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then
          CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then
          CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then
          CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then
          CBBackup5.Text := FieldByName('备用5').AsString;

        if FieldByName('备用6').AsFloat <> 0 then
          CBBackup6.Text := FieldByName('备用6').AsString;
        if FieldByName('备用7').AsFloat <> 0 then
          CBBackup7.Text := FieldByName('备用7').AsString;
        if FieldByName('备用8').AsFloat <> 0 then
          CBBackup8.Text := FieldByName('备用8').AsString;
        if FieldByName('备用9').AsFloat <> 0 then
          CBBackup9.Text := FieldByName('备用9').AsString;

        PGross.Caption := FieldByName('毛重').AsString; //毛重-空重
        PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
          StrToFloatDef(PTare.Caption, 0));
        CalcNet;
      //更新过磅费
        UpdatePoundCharge(FieldByName('过磅费').AsFloat);
        WeightType := '更新';
        UpdateRecNo := FieldByName('流水号').AsString;
        operator := FieldByName('过磅员').AsString + ' ' + operator;
      end
      else if RecordCount > 1 then
      //有大于一条的毛重记录,弹出对话框让用户选择其中一条
      begin
        with QueryDataModule.ADOQMultiGross do
        begin
          Close;
          SQL.Text := 'Select * From 称重信息 Where (车号=:car)'
            + ' And (空重=0) and (毛重<>0) and (净重=0) Order By 序号 desc';
          Parameters.ParamByName('car').Value := CBCar.Text;
          Open;
        end;
        MultiGrossForm.Width := Screen.Width - 10;
        MultiGrossForm.ShowModal;
        UpdateRecNo := MultiGrossForm.UpdateRecNo;
        with MultiGrossForm.DBGridEh1.DataSource.DataSet do
        begin
          if FieldByName('发货单位').AsString <> '' then
            CBFaHuo.Text := FieldByName('发货单位').AsString;
          if FieldByName('收货单位').AsString <> '' then
            CBShouHuo.Text := FieldByName('收货单位').AsString;
          if FieldByName('货名').AsString <> '' then
            CBGoods.Text := FieldByName('货名').AsString;
          if FieldByName('规格').AsString <> '' then
            CBSpec.Text := FieldByName('规格').AsString;
          if FieldByName('扣重').AsFloat <> 0 then
            CBBundle.Text := FieldByName('扣重').AsString;
          if FieldByName('单价').AsFloat <> 0 then
            CBPrice.Text := FieldByName('单价').AsString;
          if FieldByName('备注').AsString <> '' then
            CBRemark.Text := FieldByName('备注').AsString;

          if FieldByName('备用1').AsString <> '' then
            CBBackup1.Text := FieldByName('备用1').AsString;
          if FieldByName('备用2').AsString <> '' then
            CBBackup2.Text := FieldByName('备用2').AsString;
          if FieldByName('备用3').AsString <> '' then
            CBBackup3.Text := FieldByName('备用3').AsString;
          if FieldByName('备用4').AsString <> '' then
            CBBackup4.Text := FieldByName('备用4').AsString;
          if FieldByName('备用5').AsString <> '' then
            CBBackup5.Text := FieldByName('备用5').AsString;

          if FieldByName('备用6').AsFloat <> 0 then
            CBBackup6.Text := FieldByName('备用6').AsString;
          if FieldByName('备用7').AsFloat <> 0 then
            CBBackup7.Text := FieldByName('备用7').AsString;
          if FieldByName('备用8').AsFloat <> 0 then
            CBBackup8.Text := FieldByName('备用8').AsString;
          if FieldByName('备用9').AsFloat <> 0 then
            CBBackup9.Text := FieldByName('备用9').AsString;

          PGross.Caption := FieldByName('毛重').AsString; //毛重-空重
          PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
            StrToFloatDef(PTare.Caption, 0));
          CalcNet;
        //更新过磅费
          UpdatePoundCharge(FieldByName('过磅费').AsFloat);
          WeightType := '更新';
          operator := FieldByName('过磅员').AsString + ' ' + operator;
        end;
      end;
    end
  end;

  CBCar.Enabled := false;
  BitBtnGross.Visible := false;
  BitBtnTare.Visible := false;
  BitBtnSave.Visible := true;
  BitBtnPrint.Visible := true;
  BitBtnClear.Caption := '取消(&C)';

  TReadWeight.Enabled := systemConfig.UseVoice;
end;

procedure TMainForm.BitBtnSaveClick(Sender: TObject);
var
  temp, sqlStr: string;
begin
  if TDBCommonUtil.getRecordCount() > 10000 then
    Exit;

  if StrToFloatDef(PNet.Caption, 0) < 0 then
  begin
    ShowMsg('净重不合法!');
    Exit
  end;

  if ((WeightType = '插入') or (WeightType = '预置') or (WeightType = '手工'))
    then
  begin
    MaxGlideNo := TDBCommonUtil.getMaxGlideNo;
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into 称重信息(备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
      + '流水号,车号,操作员,发货单位,收货单位,'
      + '货名,规格,毛重,空重,净重,扣重,实重,单价,金额,过磅费,过磅员,';
    if (WeightType = '手工') or (WeightType = '预置') then
      sqlStr := sqlStr +
        '毛重时间,空重时间,备注)'
    else if WeightField = '毛重' then
      sqlStr := sqlStr + '毛重时间,备注)'
    else if WeightField = '空重' then
      sqlStr := sqlStr + '空重时间,备注)';

    sqlstr := sqlstr + ' values(:backup1,:backup2,:backup3,:backup4,:backup5,:backup6,'
      + ':backup7,:backup8,:backup9,:glideno,:car,:user,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:charge,:oper,';
    if (WeightType = '手工') or (WeightType = '预置') then
      sqlstr := sqlstr +
        ':grosstime,:taretime,'
    else if WeightField = '毛重' then
      sqlstr := sqlstr + ':grosstime,'
    else if WeightField = '空重' then
      sqlstr := sqlstr + ':taretime,';
    sqlstr := sqlstr + ':remark)';
  end
  else if (WeightType = '更新') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update 称重信息 set 备用1=:backup1,备用2=:backup2,'
      + '备用3=:backup3,备用4=:backup4,备用5=:backup5,备用6=:backup6,'
      + '备用7=:backup7,备用8=:backup8,备用9=:backup9,发货单位=:fahuo,收货单位=:shouhuo,'
      + '货名=:goods,规格=:spec,毛重=:gross,空重=:tare,净重=:net,扣重=:bundle,'
      + '实重=:real,单价=:price,金额=:sum,过磅费=:charge,过磅员=:oper,';
    if WeightField = '毛重' then
      sqlstr := sqlstr + '毛重时间=:grosstime,'
        + '备注=:remark'
    else if WeightField = '空重' then
      sqlstr := sqlstr + '空重时间=:taretime,'
        + '备注=:remark';
    sqlstr := sqlstr + ' where 流水号=:glideno';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = '更新' then
      Parameters.ParamByName('glideno').Value := UpdateRecNo
    else
    begin
      Parameters.ParamByName('glideno').Value := MaxGlideNo;
      Parameters.ParamByName('car').Value := CBCar.Text;
      Parameters.ParamByName('user').Value := CurrentUser;
    end;

    Parameters.ParamByName('backup1').Value := CBBackup1.Text;
    Parameters.ParamByName('backup2').Value := CBBackup2.Text;
    Parameters.ParamByName('backup3').Value := CBBackup3.Text;
    Parameters.ParamByName('backup4').Value := CBBackup4.Text;
    Parameters.ParamByName('backup5').Value := CBBackup5.Text;
    Parameters.ParamByName('backup6').Value := CBBackup6.Value;
    Parameters.ParamByName('backup7').Value := CBBackup7.Value;
    Parameters.ParamByName('backup8').Value := CBBackup8.Value;
    Parameters.ParamByName('backup9').Value := CBBackup9.Value;

    Parameters.ParamByName('fahuo').Value := CBFaHuo.Text;
    Parameters.ParamByName('shouhuo').Value := CBShouHuo.Text;
    Parameters.ParamByName('goods').Value := CBGoods.Text;
    Parameters.ParamByName('spec').Value := CBSpec.Text;
    Parameters.ParamByName('gross').Value := StrToFloatDef(PGross.Caption, 0);
    Parameters.ParamByName('tare').Value := StrToFloatDef(PTare.Caption, 0);
    Parameters.ParamByName('net').Value := StrToFloatDef(PNet.Caption, 0);
    Parameters.ParamByName('bundle').Value := StrToFloatDef(CBBundle.Text, 0);
    Parameters.ParamByName('real').Value := StrToFloatDef(PReal.Caption, 0);
    Parameters.ParamByName('price').Value := StrToFloatDef(CBPrice.Text, 0);
    Parameters.ParamByName('sum').Value := StrToFloatDef(PSum.Caption, 0);
    Parameters.ParamByName('oper').Value := operator;
    Parameters.ParamByName('charge').Value := StrToFloatDef(CBCost.Text, 0);

    if WeightType = '更新' then
    begin
      if WeightField = '毛重' then
      begin
        Parameters.ParamByName('grosstime').Value := Now;
      end
      else if WeightField = '空重' then
      begin
        Parameters.ParamByName('taretime').Value := Now;
      end
    end
    else
    begin
      if WeightField = '毛重' then
      begin
        Parameters.ParamByName('grosstime').Value := Now;
      end
      else if WeightField = '空重' then
      begin
        Parameters.ParamByName('taretime').Value := Now;
      end
      else
      begin
        Parameters.ParamByName('grosstime').Value := Now;
        Parameters.ParamByName('taretime').Value := Now;
      end;
    end;
    Parameters.ParamByName('remark').Value := CBRemark.Text;
    ExecSQL;
  end;

  GetStaticInfo;
  showGridRecord;

  if CBAutoClear.Checked then
  begin
    if systemConfig.clearCar then CBCar.Text := systemConfig.carDefault;
    if systemConfig.clearFaHuo then CBFaHuo.Text := systemConfig.faHuoDefault;
    if systemConfig.clearShouHuo then CBShouHuo.Text := systemConfig.shouHuoDefault;
    if systemConfig.clearGoods then CBGoods.Text := systemConfig.goodsDefault;
    if systemConfig.clearSpec then CBSpec.Text := systemConfig.specDefault;
    if systemConfig.clearBundle then CBBundle.Text := '0';
    if systemConfig.clearPrice then CBPrice.Text := '0';
    if systemConfig.clearCost then CBCost.Text := '0';
    if systemConfig.clearRemark then CBRemark.Text := systemConfig.remarkDefault;
    if systemConfig.clearBackup1 then CBBackup1.Text := systemConfig.backup1Default;
    if systemConfig.clearBackup2 then CBBackup2.Text := systemConfig.backup2Default;
    if systemConfig.clearBackup3 then CBBackup3.Text := systemConfig.backup3Default;
    if systemConfig.clearBackup4 then CBBackup4.Text := systemConfig.backup4Default;
    if systemConfig.clearBackup5 then CBBackup5.Text := systemConfig.backup5Default;
    if systemConfig.clearBackup6 then CBBackup6.Value := 0;
    if systemConfig.clearBackup7 then CBBackup7.Value := 0;
    if systemConfig.clearBackup8 then CBBackup8.Value := 0;
    if systemConfig.clearBackup9 then CBBackup9.Value := 0;
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  CBCost.Text := '0';
  CBCar.Enabled := true;
  BitBtnGross.Visible := true;
  BitBtnTare.Visible := true;
  BitBtnSave.Visible := false;
  BitBtnPrint.Visible := false;
  BitBtnClear.Caption := '清空(&C)';
  CBCar.SetFocus;

  if systemConfig.waitForZero then
  begin
    PRight.Visible := False;
    TWaitForZero.Enabled := True;
  end;
end;

procedure TMainForm.SMPreMaintainClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('预置维护') then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.toMainForm := False;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free
    end
  end
  else
    ShowMsg('对不起您没有预置维护权限，无法进行预置维护！')
end;

procedure TMainForm.CBFaHuoEnter(Sender: TObject);
begin
  CBFaHuo.Color := clAqua;
  TPrepareUtil.addFaHuo(CBFaHuo);
end;

procedure TMainForm.CBShouHuoEnter(Sender: TObject);
begin
  CBShouHuo.Color := clAqua;
  TPrepareUtil.addShouHuo(CBShouHuo);
end;

procedure TMainForm.CBGoodsEnter(Sender: TObject);
begin
  CBGoods.Color := clAqua;
  TPrepareUtil.addGoods(CBGoods);
end;

procedure TMainForm.CBSpecEnter(Sender: TObject);
begin
  CBSpec.Color := clAqua;
  TPrepareUtil.addSpec(CBSpec);
end;

procedure TMainForm.SMDatabackClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('数库设置') then
  begin
    Application.CreateForm(TDBClearForm, DBClearForm);
    try
      DBClearForm.ShowModal;
    finally
      DBClearForm.Free
    end
  end
  else
    ShowMsg('对不起您没有数据导出权限，无法进行数据库清理！')
end;

procedure TMainForm.TAutoBackupTimer(Sender: TObject); //每小时备份
begin
  Application.CreateForm(TDBBackupForm, DBBackupForm);
  DBBackupForm.ShowModal
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TCommonUtil.getIni.ReadBool('系统设置', '导出XML', false) then
  begin
    case TCommonUtil.getIni.ReadInteger('系统设置', 'XML导出方式', 0) of
      0: TCommonUtil.XMLExport0();
      1: TCommonUtil.XMLExport1();
    end;
  end;
  if (systemConfig.backupType = 3) then
  begin
    Application.CreateForm(TDBBackupForm, DBBackupForm);
    DBBackupForm.ShowModal
  end;
end;

procedure TMainForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with TMyDBGrid(Sender) do
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

procedure TMainForm.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if QueryDataModule.WeightMaintainQuery.Sort <> (Column.FieldName + ' ASC') then
    //判断原排序方式
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' ASC'
  else
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' DESC'
end;

procedure TMainForm.SMDataQueryClick(Sender: TObject);
begin
  DataQueryForm.ShowModal;
  PanelDataCheck
end;

procedure TMainForm.BitBtnClearClick(Sender: TObject);
begin
  if (CBAutoClear.Checked) or (BitBtnClear.Caption = '清空(&C)') then
  begin
    if systemConfig.clearCar then CBCar.Text := systemConfig.carDefault;
    if systemConfig.clearFaHuo then CBFaHuo.Text := systemConfig.faHuoDefault;
    if systemConfig.clearShouHuo then CBShouHuo.Text := systemConfig.shouHuoDefault;
    if systemConfig.clearGoods then CBGoods.Text := systemConfig.goodsDefault;
    if systemConfig.clearSpec then CBSpec.Text := systemConfig.specDefault;
    if systemConfig.clearBundle then CBBundle.Text := '0';
    if systemConfig.clearPrice then CBPrice.Text := '0';
    if systemConfig.clearCost then CBCost.Text := '0';
    if systemConfig.clearRemark then CBRemark.Text := systemConfig.remarkDefault;
    if systemConfig.clearBackup1 then CBBackup1.Text := systemConfig.backup1Default;
    if systemConfig.clearBackup2 then CBBackup2.Text := systemConfig.backup2Default;
    if systemConfig.clearBackup3 then CBBackup3.Text := systemConfig.backup3Default;
    if systemConfig.clearBackup4 then CBBackup4.Text := systemConfig.backup4Default;
    if systemConfig.clearBackup5 then CBBackup5.Text := systemConfig.backup5Default;
    if systemConfig.clearBackup6 then CBBackup6.Value := 0;
    if systemConfig.clearBackup7 then CBBackup7.Value := 0;
    if systemConfig.clearBackup8 then CBBackup8.Value := 0;
    if systemConfig.clearBackup9 then CBBackup9.Value := 0;
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  CBCost.Text := '0';
  CBCar.Enabled := true;
  BitBtnGross.Visible := true;
  BitBtnTare.Visible := true;
  BitBtnSave.Visible := false;
  BitBtnPrint.Visible := false;
  if BitBtnGross.Visible then //清空按钮与取消按钮切换
    BitBtnClear.Caption := '清空(&C)';
  if BitBtnSave.Visible then
    BitBtnClear.Caption := '取消(&C)'
end;

procedure TMainForm.BitBtnPrintClick(Sender: TObject);
var
  Num: string;
begin
  BitBtnClear.Caption := '清空(&C)';
  if StrToFloatDef(PNet.Caption, 0) < 0 then
    Exit;
  BitBtnSave.Click;
  if UpdateRecNo <> '' then
    Num := UpdateRecNo
  else
    Num := MaxGlideNo;
  TReportUtil.printTicket(Num, CBPreview.Checked);
end;

procedure TMainForm.SMInputClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('手工重量') then
  begin
    Application.CreateForm(TInputWeightForm, InputWeightForm);
    try
      InputWeightForm.ShowModal;
    finally
      InputWeightForm.Free
    end
  end
  else
    ShowMsg('对不起您没有手工重量权限，无法进行手工重量输入！')
end;

procedure TMainForm.SMAboutClick(Sender: TObject);
begin
  Application.CreateForm(TAboutForm, AboutForm);
  try
    AboutForm.ShowModal;
  finally
    AboutForm.Free
  end
end;

procedure TMainForm.SMComputerClick(Sender: TObject);
begin
  WinExec('calc.exe', SW_SHOW)
end;

procedure TMainForm.CBBundleChange(Sender: TObject);
begin
  if (BitBtnSave.Enabled) and (BitBtnSave.Visible) then
    CalcNet;
end;

procedure TMainForm.CBPriceChange(Sender: TObject);
begin
  if (CBPrice.Text <> '') and (BitBtnSave.Enabled) then
  try
    PSum.Caption := FloatToStr(RoundTo(StrToFloatDef(CBPrice.Text, 0) *
      StrToFloatDef(PReal.Caption, 0), 0 - systemConfig.sumPoint))
  except
    CBPrice.Text := '0'
  end
end;

procedure TMainForm.TAutoShutTimer(Sender: TObject);
var
  CurrentTime: string;
begin
  CurrentTime := FormatDateTime('hns', Now);
  if systemConfig.CloseTime = CurrentTime then
  begin
    Application.CreateForm(TAutoShutForm, AutoShutForm);
    AutoShutForm.ShowModal
  end
end;

procedure TMainForm.SMTerminateClick(Sender: TObject);
begin
  TCommonUtil.ExitWin32Sys(EWX_POWEROFF)
end;

procedure TMainForm.SMSimulateClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('管理员') then
  begin
    if not SMSimulate.Checked then
    begin
      SMSimulate.Checked := true;
      Randomize;
      PWeight1.Caption := FloatToStr(Random(100000));
      TSimulate.Enabled := true
    end
    else
    begin
      SMSimulate.Checked := false;
      TSimulate.Enabled := false;
    end
  end
  else
    ShowMsg('对不起您不是管理员，无法进行模拟称重！')
end;

procedure TMainForm.SPMPrintClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, True);
  end
end;

procedure TMainForm.SPMDeleteClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('数据维护') then
    DeleteBtn.Click
end;

procedure TMainForm.SPMSaveAsClick(Sender: TObject);
begin
  OutputBtn.Click
end;

procedure TMainForm.TSimulateTimer(Sender: TObject);
begin
  Randomize;
  PWeight1.Caption := FloatToStr(Random(100000));
end;

procedure TMainForm.CBRemarkEnter(Sender: TObject);
begin
  CBRemark.Color := clAqua;
end;

procedure TMainForm.CBBundleEnter(Sender: TObject);
begin
  CBBundle.Color := clAqua;
end;

procedure TMainForm.CBPriceEnter(Sender: TObject);
begin
  CBPrice.Color := clAqua;
end;

procedure TMainForm.CBFaHuoExit(Sender: TObject);
begin
  CBFaHuo.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getFaHuoByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBShouHuoExit(Sender: TObject);
begin
  CBShouHuo.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getShouHuoByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBGoodsExit(Sender: TObject);
begin
  CBGoods.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getGoodsByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBSpecExit(Sender: TObject);
begin
  CBSpec.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getSpecByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBBundleExit(Sender: TObject);
begin
  CBBundle.Color := clWindow;
end;

procedure TMainForm.CBPriceExit(Sender: TObject);
begin
  CBPrice.Color := clWindow;
end;

procedure TMainForm.CBRemarkExit(Sender: TObject);
begin
  CBRemark.Color := clWindow;
end;

procedure TMainForm.SMReadWeightClick(Sender: TObject);
begin
  ReadWeightForm.EdtSource.Text := getWeight;
  ReadWeightForm.ShowModal;
end;

procedure TMainForm.TReadWeightTimer(Sender: TObject);
begin
  //语音报重量,如果有净重得出,就报净重,否则报当前重量
  if PNet.Caption = '0' then
    ReadWeightForm.EdtSource.Text := getWeight
  else
    ReadWeightForm.EdtSource.Text := PNet.Caption;
  ReadWeightForm.BtnRead.Click;
  TReadWeight.Enabled := false;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString);
  end
end;

procedure TMainForm.CBAutoClearClick(Sender: TObject);
begin
  TCommonUtil.getIni.WriteBool('主界面', '自动清空', CBAutoClear.Checked)
end;

procedure TMainForm.CBPreviewClick(Sender: TObject);
begin
  TCommonUtil.getIni.WriteBool('主界面', '预览打印', CBPreview.Checked)
end;

procedure TMainForm.TShowTimer(Sender: TObject);
begin
  if PHint.Height >= 40 then
  begin
    TShow.Enabled := false;
    TAutoHide.Enabled := true;
    Exit;
  end;
  PHint.Height := PHint.Height + 1;
end;

procedure TMainForm.TAutoHideTimer(Sender: TObject);
begin
  TAutoHide.Enabled := false;
  THide.Enabled := true;
end;

procedure TMainForm.THideTimer(Sender: TObject);
begin
  if PHint.Height <= 0 then
  begin
    THide.Enabled := false;
    Exit;
  end;
  PHint.Height := PHint.Height - 1;
end;

procedure TMainForm.ShowMsg(Msg: string);
begin
  PanelMain.Visible := true;
  PHint.Caption := Msg;
  TShow.Enabled := true;
  TAutoHide.Enabled := false;
  THide.Enabled := false;
  PHint.SetFocus;
end;

procedure TMainForm.BitBtnCloseHintClick(Sender: TObject);
begin
  TShow.Enabled := false;
  THide.Enabled := true;
end;

procedure TMainForm.DeleteBtnClick(Sender: TObject);
var i: string;
begin
  if MessageDlg('确实要删除这条记录吗?', mtConfirmation, [mbOK, mbCancel], 0) =
    mrOk then
  begin
    DBGridEh1.DataSource.DataSet.Delete;
  end;
end;

procedure TMainForm.SetCurrentUser(const Value: string);
begin
  FCurrentUser := Value;
  SpUser.Caption := Format('当前用户: %s', [Value]);
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  Application.CreateForm(TLogForm, LogForm);
  try
    LogForm.ShowModal;
  finally
    LogForm.Free;
  end;
end;

procedure TMainForm.CBCarExit(Sender: TObject);
begin
  CBCar.Color := clWindow;
  PTare.Caption := FloatToStr(TPrepareUtil.getCarTare(CBCar.Text));
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select top 1 * from 称重信息 where (车号=:carNo) and (净重=0) order by 序号 desc';
    Parameters.ParamByName('carNo').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      CBFaHuo.Text := FieldByName('发货单位').AsString;
      CBShouHuo.Text := FieldByName('收货单位').AsString;
      CBGoods.Text := FieldByName('货名').AsString;
      CBSpec.Text := FieldByName('规格').AsString;
      CBBundle.Text := FieldByName('扣重').AsString;
      CBPrice.Text := FieldByName('单价').AsString;
      CBRemark.Text := FieldByName('备注').AsString;
      CBBackup1.Text := FieldByName('备用1').AsString;
      CBBackup2.Text := FieldByName('备用2').AsString;
      CBBackup3.Text := FieldByName('备用3').AsString;
      CBBackup4.Text := FieldByName('备用4').AsString;
      CBBackup5.Text := FieldByName('备用5').AsString;
      CBBackup6.Text := FieldByName('备用6').AsString;
      CBBackup7.Text := FieldByName('备用7').AsString;
      CBBackup8.Text := FieldByName('备用8').AsString;
      CBBackup9.Text := FieldByName('备用9').AsString;
      PGross.Caption := FieldByName('毛重').AsString;
      PTare.Caption := FieldByName('空重').AsString;
    end;
  end;
end;

procedure TMainForm.CBCarEnter(Sender: TObject);
begin
  CBCar.Color := clAqua;
  TPrepareUtil.addCar(CBCar);
end;

procedure TMainForm.CBCostEnter(Sender: TObject);
begin
  CBCost.Color := clAqua;
end;

procedure TMainForm.CBCostExit(Sender: TObject);
begin
  CBCost.Color := clWindow;
end;

procedure TMainForm.CreateGrossPoundCharge;
var w, unitPound: Double;
begin
  if not systemConfig.usePound then
  begin
    CBCost.Value := 0;
    Exit;
  end;
  if systemConfig.ManualInputPound then
  begin
    Exit;
  end;
  if (systemConfig.ChargeType = 1) or (systemConfig.ChargeType = 2) then
    w := StrToFloat(PGross.Caption)
  else if CBOnce.Checked then
    w := StrToFloat(PNet.Caption)
  else
    w := 0;
  if (w > systemConfig.poundGrade1) and (w <= systemConfig.poundGrade2) then
  begin
    CBCost.Value := systemConfig.BasicPound;
    Exit;
  end
  else if (w > systemConfig.poundGrade3) and (w <= systemConfig.poundGrade4) then
    UnitPound := systemConfig.UnitPound1
  else if (w > systemConfig.poundGrade5) and (w <= systemConfig.poundGrade6) then
    UnitPound := systemConfig.UnitPound2
  else
    UnitPound := 0;

  if (lblUnit1.Caption = '公  斤') or (lblUnit1.Caption = 'KG') or (lblUnit1.Caption
    = 'kg') then
    CBCost.Value := RoundTo(UnitPound * (w / 1000), 0 -
      systemConfig.scalePoint) //小数点位数
  else
    CBCost.Value := RoundTo(UnitPound * w, 0 - systemConfig.scalePoint);
end;

procedure TMainForm.CreateTarePoundCharge;
var w, unitPound: Double;
begin
  if not systemConfig.usePound then
  begin
    CBCost.Value := 0;
    Exit;
  end;
  if systemConfig.ManualInputPound then
  begin
    Exit;
  end;
  if systemConfig.ChargeType = 2 then
    w := StrToFloat(PTare.Caption)
  else
    w := 0;

  if (w > systemConfig.poundGrade1) and (w <= systemConfig.poundGrade2) then
  begin
    CBCost.Value := systemConfig.BasicPound;
    Exit;
  end
  else if (w > systemConfig.poundGrade3) and (w <= systemConfig.poundGrade4) then
    UnitPound := systemConfig.UnitPound1
  else if (w > systemConfig.poundGrade5) and (w <= systemConfig.poundGrade6) then
    UnitPound := systemConfig.UnitPound2
  else
    UnitPound := 0;

  if (lblUnit1.Caption = '公  斤') or (lblUnit1.Caption = 'KG') or (lblUnit1.Caption
    = 'kg') then
    CBCost.Value := RoundTo(UnitPound * (w / 1000), 0 -
      systemConfig.scalePoint) //小数点位数
  else
    CBCost.Value := RoundTo(UnitPound * w, 0 - systemConfig.scalePoint);
end;

procedure TMainForm.UpdatePoundCharge(lastPound: Double);
var w, unitPound: Double;
begin
  if not systemConfig.usePound then
  begin
    CBCost.Value := 0;
    Exit;
  end;
  if systemConfig.ManualInputPound then
  begin
    Exit;
  end;
  if systemConfig.ChargeType = 1 then
    w := StrToFloat(PGross.Caption)
  else if systemConfig.ChargeType = 2 then
    w := StrToFloat(PGross.Caption) + StrToFloat(PTare.Caption)
  else if systemConfig.ChargeType = 3 then
    w := StrToFloat(PNet.Caption)
  else
    w := 0;
  if (w > systemConfig.poundGrade1) and (w <= systemConfig.poundGrade2) then
  begin
    CBCost.Value := systemConfig.BasicPound;
    Exit;
  end
  else if (w > systemConfig.poundGrade3) and (w <= systemConfig.poundGrade4) then
    UnitPound := systemConfig.UnitPound1
  else if (w > systemConfig.poundGrade5) and (w <= systemConfig.poundGrade6) then
    UnitPound := systemConfig.UnitPound2
  else
    UnitPound := 0;

  if (lblUnit1.Caption = '公  斤') or (lblUnit1.Caption = 'KG') or (lblUnit1.Caption
    = 'kg') then
    CBCost.Value := RoundTo(UnitPound * (w / 1000), 0 -
      systemConfig.scalePoint) //小数点位数
  else
    CBCost.Value := RoundTo(UnitPound * w, 0 - systemConfig.scalePoint);
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
  Application.CreateForm(TBackRecordForm, BackRecordForm);
  try
    BackRecordForm.ShowModal;
  finally
    BackRecordForm.Free;
  end;
end;

procedure TMainForm.TBackRecordTimer(Sender: TObject);
begin
  //后台自动保存数据
  if canAutoSave then
  begin
    if (StrToFloatDef(getWeight, 1000) > systemConfig.backRecordWeight) and (getSteady) then
    begin
      saveBackRecordWeight(getWeight);
      canAutoSave := False;
    end;
  end
  else
  begin
    if StrToFloatDef(getWeight, 1000) < 10 then
      canAutoSave := True;
  end;
end;

procedure TMainForm.saveBackRecordWeight(weight: string);
begin
  with QueryDataModule.ADOQBackRecord do
  begin
    Close;
    SQL.Text := 'insert into tbl_back_record(weight,weight_time) values(:weight,:weight_time)';
    Parameters.ParamByName('weight').Value := StrToFloatDef(weight, 1000);
    Parameters.ParamByName('weight_time').Value := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    ExecSQL;
  end;
end;

procedure TMainForm.SMTicketSetClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('系统设置') then
  begin
    Application.CreateForm(TTicketSetForm, TicketSetForm);
    try
      TicketSetForm.ShowModal();
    finally
      TicketSetForm.Free;
    end;
  end
  else
    ShowMsg('对不起您没有磅单修改权限，无法进行磅单修改！')
end;

procedure TMainForm.GetStaticInfo;
var count, todayCount: integer;
  todayNet, todayReal: Double;
begin
  TDBCommonUtil.getStaticInfo(count, todayCount, todayNet, todayReal);
  lblAllRec.Caption := IntToStr(count);
  lblTodayRec.Caption := IntToStr(todayCount);
  lblTodayNet.Caption := FloatToStr(todayNet);
  lblTodayWeight.Caption := FloatToStr(todayReal);
end;

procedure TMainForm.setAutoBackup(t: boolean);
begin
  TAutoBackup.Enabled := t;
end;

procedure TMainForm.SMModifyClick(Sender: TObject);
var f: string;
begin
  if TDBCommonUtil.HasAuthority('打印磅单') then
  begin
    f := TCommonUtil.getIni.ReadString('系统设置', '磅单格式',
      ExtractFilePath(ParamStr(0)) + '\Ticket\标准填充.fr3');
    TReportUtil.designTicket(f);
  end;
end;

procedure TMainForm.resizeMain;
var w: integer;
  i, commonVisibleCount, otherVisibleCount: Integer;
begin
  if not PanelMain.Visible then
    Exit;
  PWeight1.Color := clBlack;
  if PanelMain.Visible then
  begin
    //如果左边的数量不够9,就把备用项目放到左边来，
    commonVisibleCount := 0;
    otherVisibleCount := 0;
    for i := 0 to PCommon.ControlCount - 1 do
    begin
      if PCommon.Controls[i].Visible then
        Inc(commonVisibleCount);
    end;
    for i := 0 to POther.ControlCount - 1 do
    begin
      if POther.Controls[i].Visible then
        Inc(otherVisibleCount);
    end;
    if otherVisibleCount <= (9 - commonVisibleCount) then
    begin
      PBackup1.Align := alBottom;
      PBackup1.Parent := PCommon;
      PBackup1.Align := alTop;
      PBackup2.Align := alBottom;
      PBackup2.Parent := PCommon;
      PBackup2.Align := alTop;
      PBackup3.Align := alBottom;
      PBackup3.Parent := PCommon;
      PBackup3.Align := alTop;
      PBackup4.Align := alBottom;
      PBackup4.Parent := PCommon;
      PBackup4.Align := alTop;
      PBackup5.Align := alBottom;
      PBackup5.Parent := PCommon;
      PBackup5.Align := alTop;
      PBackup6.Align := alBottom;
      PBackup6.Parent := PCommon;
      PBackup6.Align := alTop;
      PBackup7.Align := alBottom;
      PBackup7.Parent := PCommon;
      PBackup7.Align := alTop;
      PBackup8.Align := alBottom;
      PBackup8.Parent := PCommon;
      PBackup8.Align := alTop;
      PBackup9.Align := alBottom;
      PBackup9.Parent := PCommon;
      PBackup9.Align := alTop;

      POther.Visible := False;
    end
    else
    begin
      PBackup1.Align := alBottom;
      PBackup1.Parent := POther;
      PBackup1.Align := alTop;
      PBackup2.Align := alBottom;
      PBackup2.Parent := POther;
      PBackup2.Align := alTop;
      PBackup3.Align := alBottom;
      PBackup3.Parent := POther;
      PBackup3.Align := alTop;
      PBackup4.Align := alBottom;
      PBackup4.Parent := POther;
      PBackup4.Align := alTop;
      PBackup5.Align := alBottom;
      PBackup5.Parent := POther;
      PBackup5.Align := alTop;
      PBackup6.Align := alBottom;
      PBackup6.Parent := POther;
      PBackup6.Align := alTop;
      PBackup7.Align := alBottom;
      PBackup7.Parent := POther;
      PBackup7.Align := alTop;
      PBackup8.Align := alBottom;
      PBackup8.Parent := POther;
      PBackup8.Align := alTop;
      PBackup9.Align := alBottom;
      PBackup9.Parent := POther;
      PBackup9.Align := alTop;

      POther.Visible := True;
    end;
    if POther.Visible then
      PCommon.Width := PInfo.Width div 2
    else
      PCommon.Width := PInfo.Width;

    CBCar.Canvas.Lock;
    w := PCommon.Width - 100;
    CBCar.Width := w - 50;
    SBCar.Left := CBCar.Left + CBCar.Width + 5;
    SBTao.Left := SBCar.Left + SBCar.Width + 5;
    CBFaHuo.Width := w;
    CBShouHuo.Width := w;
    CBGoods.Width := w;
    CBSpec.Width := w;
    CBBundle.Width := w;
    CBPrice.Width := w;
    CBCost.Width := w;
    CBRemark.Width := w;
    CBCar.Canvas.UnLock;

    if POther.Visible then
      w := POther.Width - 100
    else
      w := PCommon.Width - 100;
    CBBackup1.Width := w;
    CBBackup2.Width := w;
    CBBackup3.Width := w;
    CBBackup4.Width := w;
    CBBackup5.Width := w;

    CBBackup6.Width := w;
    CBBackup7.Width := w;
    CBBackup8.Width := w;
    CBBackup9.Width := w;
  end;
end;

procedure TMainForm.SBCarClick(Sender: TObject);
begin
  CarForm.ShowModal;
  CBCar.Text := CarForm.LECar.Text;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  resizeMain;
end;

procedure TMainForm.CBCarDblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 0;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBFaHuoDblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 1;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBShouHuoDblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 2;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBGoodsDblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 3;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.PWeight1DblClick(Sender: TObject);
var fontDialog: TFontDialog;
begin
  fontDialog := TFontDialog.Create(nil);
  try
    fontDialog.Font := PWeight1.Font;
    if fontDialog.Execute then
      PWeight1.Font := fontDialog.Font;
  finally
    fontDialog.Free;
  end;
end;

procedure TMainForm.TLineTimer(Sender: TObject);
begin
  TDrawLine1.draw(PWeight1);
end;

procedure TMainForm.CBCarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBFaHuoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBShouHuoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBGoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBSpecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBundleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBCostKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBRemarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup1Enter(Sender: TObject);
begin
  CBBackup1.Color := clAqua;
  TPrepareUtil.addBackup1(CBBackup1);
end;

procedure TMainForm.CBBackup1Exit(Sender: TObject);
begin
  CBBackup1.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getBackup1ByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBBackup2Enter(Sender: TObject);
begin
  CBBackup2.Color := clAqua;
  TPrepareUtil.addBackup2(CBBackup2);
end;

procedure TMainForm.CBBackup2Exit(Sender: TObject);
begin
  CBBackup2.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getBackup2ByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBBackup3Enter(Sender: TObject);
begin
  CBBackup3.Color := clAqua;
  TPrepareUtil.addBackup3(CBBackup3);
end;

procedure TMainForm.CBBackup3Exit(Sender: TObject);
begin
  CBBackup3.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getBackup3ByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBBackup4Enter(Sender: TObject);
begin
  CBBackup4.Color := clAqua;
  TPrepareUtil.addBackup1(CBBackup4);
end;

procedure TMainForm.CBBackup4Exit(Sender: TObject);
begin
  CBBackup4.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getBackup4ByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBBackup5Enter(Sender: TObject);
begin
  CBBackup5.Color := clAqua;
  TPrepareUtil.addBackup5(CBBackup5);
end;

procedure TMainForm.CBBackup5Exit(Sender: TObject);
begin
  CBBackup5.Color := clWindow;
  if systemConfig.useCode then
    (Sender as TComboBox).Text := TPrepareUtil.getBackup5ByCode((Sender as TComboBox).Text);
end;

procedure TMainForm.CBBackup6Exit(Sender: TObject);
begin
  CBBackup6.Color := clWindow;
end;

procedure TMainForm.CBBackup6Enter(Sender: TObject);
begin
  CBBackup6.Color := clAqua;
end;

procedure TMainForm.CBBackup7Enter(Sender: TObject);
begin
  CBBackup7.Color := clAqua;
end;

procedure TMainForm.CBBackup7Exit(Sender: TObject);
begin
  CBBackup7.Color := clWindow;
end;

procedure TMainForm.CBBackup8Exit(Sender: TObject);
begin
  CBBackup8.Color := clWindow;
end;

procedure TMainForm.CBBackup8Enter(Sender: TObject);
begin
  CBBackup8.Color := clAqua;
end;

procedure TMainForm.loadFormDesign;
begin
  PCar.Visible := systemConfig.carVisible;
  PFaHuo.Visible := systemConfig.faHuoVisible;
  PShouHuo.Visible := systemConfig.shouHuoVisible;
  PGoods.Visible := systemConfig.goodsVisible;
  PSpec.Visible := systemConfig.specVisible;
  PBundle.Visible := systemConfig.bundleVisible;
  PPrice.Visible := systemConfig.priceVisible;
  PCost.Visible := systemConfig.costVisible;
  PRemark.Visible := systemConfig.remarkVisible;

  PBackup1.Visible := systemConfig.backup1Visible;
  PBackup2.Visible := systemConfig.backup2Visible;
  PBackup3.Visible := systemConfig.backup3Visible;
  PBackup4.Visible := systemConfig.backup4Visible;
  PBackup5.Visible := systemConfig.backup5Visible;
  PBackup6.Visible := systemConfig.backup6Visible;
  PBackup7.Visible := systemConfig.backup7Visible;
  PBackup8.Visible := systemConfig.backup8Visible;
  PBackup9.Visible := systemConfig.backup9Visible;

  lblCar.Caption := systemConfig.carCaption;
  lblFaHuo.Caption := systemConfig.faHuoCaption;
  lblShouHuo.Caption := systemConfig.shouHuoCaption;
  lblGoods.Caption := systemConfig.goodsCaption;
  lblSpec.Caption := systemConfig.specCaption;
  lblBundle.Caption := systemConfig.bundleCaption;
  lblPrice.Caption := systemConfig.priceCaption;
  lblCost.Caption := systemConfig.costCaption;
  lblRemark.Caption := systemConfig.remarkCaption;

  lblGross.Caption := systemConfig.grossCaption;
  lblTare.Caption := systemConfig.tareCaption;
  lblNet.Caption := systemConfig.netCaption;
  lblReal.Caption := systemConfig.realCaption;
  lblSum.Caption := systemConfig.sumCaption;

  lblBackup1.Caption := systemConfig.backup1Caption;
  lblBackup2.Caption := systemConfig.backup2Caption;
  lblBackup3.Caption := systemConfig.backup3Caption;
  lblBackup4.Caption := systemConfig.backup4Caption;
  lblBackup5.Caption := systemConfig.backup5Caption;
  lblBackup6.Caption := systemConfig.backup6Caption;
  lblBackup7.Caption := systemConfig.backup7Caption;
  lblBackup8.Caption := systemConfig.backup8Caption;
  lblBackup9.Caption := systemConfig.backup9Caption;

  CBBackup6.Enabled := True;
  CBBackup7.Enabled := True;
  CBBackup8.Enabled := True;
  CBBackup9.Enabled := True;

  DBGridEh1.FieldColumns['序号'].Visible := systemConfig.noVisible;
  DBGridEh1.FieldColumns['流水号'].Visible := systemConfig.glideNoVisible;
  DBGridEh1.FieldColumns['操作员'].Visible := systemConfig.operVisible;
  DBGridEh1.FieldColumns['过磅员'].Visible := systemConfig.scaleManVisible;
  DBGridEh1.FieldColumns['上传否'].Visible := systemConfig.uploadVisible;

  DBGridEh1.FieldColumns['车号'].Visible := systemConfig.carVisible;
  DBGridEh1.FieldColumns['发货单位'].Visible := systemConfig.faHuoVisible;
  DBGridEh1.FieldColumns['收货单位'].Visible := systemConfig.shouHuoVisible;
  DBGridEh1.FieldColumns['货名'].Visible := systemConfig.goodsVisible;
  DBGridEh1.FieldColumns['规格'].Visible := systemConfig.specVisible;
  DBGridEh1.FieldColumns['毛重'].Visible := systemConfig.grossVisible;
  DBGridEh1.FieldColumns['空重'].Visible := systemConfig.tareVisible;
  DBGridEh1.FieldColumns['净重'].Visible := systemConfig.netVisible;
  DBGridEh1.FieldColumns['扣重'].Visible := systemConfig.bundleVisible;
  DBGridEh1.FieldColumns['实重'].Visible := systemConfig.realVisible;
  DBGridEh1.FieldColumns['单价'].Visible := systemConfig.priceVisible;
  DBGridEh1.FieldColumns['金额'].Visible := systemConfig.sumVisible;
  DBGridEh1.FieldColumns['过磅费'].Visible := systemConfig.costVisible;
  DBGridEh1.FieldColumns['毛重时间'].Visible := systemConfig.grossTimeVisible;
  DBGridEh1.FieldColumns['空重时间'].Visible := systemConfig.tareTimeVisible;
  DBGridEh1.FieldColumns['备注'].Visible := systemConfig.remarkVisible;
  DBGridEh1.FieldColumns['备用1'].Visible := systemConfig.backup1Visible;
  DBGridEh1.FieldColumns['备用2'].Visible := systemConfig.backup2Visible;
  DBGridEh1.FieldColumns['备用3'].Visible := systemConfig.backup3Visible;
  DBGridEh1.FieldColumns['备用4'].Visible := systemConfig.backup4Visible;
  DBGridEh1.FieldColumns['备用5'].Visible := systemConfig.backup5Visible;
  DBGridEh1.FieldColumns['备用6'].Visible := systemConfig.backup6Visible;
  DBGridEh1.FieldColumns['备用7'].Visible := systemConfig.backup7Visible;
  DBGridEh1.FieldColumns['备用8'].Visible := systemConfig.backup8Visible;
  DBGridEh1.FieldColumns['备用9'].Visible := systemConfig.backup9Visible;

  DBGridEh1.FieldColumns['车号'].Title.Caption := lblCar.Caption;
  DBGridEh1.FieldColumns['发货单位'].Title.Caption := lblFaHuo.Caption;
  DBGridEh1.FieldColumns['收货单位'].Title.Caption := lblShouHuo.Caption;
  DBGridEh1.FieldColumns['货名'].Title.Caption := lblGoods.Caption;
  DBGridEh1.FieldColumns['规格'].Title.Caption := lblSpec.Caption;
  DBGridEh1.FieldColumns['扣重'].Title.Caption := lblBundle.Caption;
  DBGridEh1.FieldColumns['单价'].Title.Caption := lblPrice.Caption;
  DBGridEh1.FieldColumns['过磅费'].Title.Caption := lblCost.Caption;
  DBGridEh1.FieldColumns['备注'].Title.Caption := lblRemark.Caption;

  DBGridEh1.FieldColumns['毛重'].Title.Caption := lblGross.Caption;
  DBGridEh1.FieldColumns['空重'].Title.Caption := lblTare.Caption;
  DBGridEh1.FieldColumns['净重'].Title.Caption := lblNet.Caption;
  DBGridEh1.FieldColumns['实重'].Title.Caption := lblReal.Caption;
  DBGridEh1.FieldColumns['金额'].Title.Caption := lblSum.Caption;

  DBGridEh1.FieldColumns['备用1'].Title.Caption := lblBackup1.Caption;
  DBGridEh1.FieldColumns['备用2'].Title.Caption := lblBackup2.Caption;
  DBGridEh1.FieldColumns['备用3'].Title.Caption := lblBackup3.Caption;
  DBGridEh1.FieldColumns['备用4'].Title.Caption := lblBackup4.Caption;
  DBGridEh1.FieldColumns['备用5'].Title.Caption := lblBackup5.Caption;
  DBGridEh1.FieldColumns['备用6'].Title.Caption := lblBackup6.Caption;
  DBGridEh1.FieldColumns['备用7'].Title.Caption := lblBackup7.Caption;
  DBGridEh1.FieldColumns['备用8'].Title.Caption := lblBackup8.Caption;
  DBGridEh1.FieldColumns['备用9'].Title.Caption := lblBackup9.Caption;

end;

procedure TMainForm.CBBackup8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if systemConfig.EnterTab and (Key = 13) then
  begin
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TMainForm.CBBackup9Enter(Sender: TObject);
begin
  CBBackup9.Color := clAqua;
end;

procedure TMainForm.CBBackup9Exit(Sender: TObject);
begin
  CBBackup9.Color := clWindow;
end;

procedure TMainForm.CBBackup1DblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 5;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBBackup2DblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 6;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBBackup3DblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 7;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBBackup4DblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 8;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.CBBackup5DblClick(Sender: TObject);
begin
  if systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PageControl1.ActivePageIndex := 9;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TMainForm.PMWeightPopup(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('手工重量') then
  begin
    PWeight1.Caption := FloatToStr(StrToFloatDef(InputBox('请输入重量    ', '请输入重量    ',
      PWeight1.Caption), 0));
  end;
end;

procedure TMainForm.CBSimpleClick(Sender: TObject);
begin
  PStandard.Visible := not CBSimple.Checked;

  BtnWeight.Visible := CBSimple.Checked;
  BtnSave.Visible := CBSimple.Checked;
  BtnPrint.Visible := CBSimple.Checked;
  BtnCancel.Visible := CBSimple.Checked;
  TCommonUtil.getIni.WriteBool('主界面', '简单过磅', (Sender as TCheckBox).Checked);
end;

procedure TMainForm.BtnCancelClick(Sender: TObject);
begin
  if BtnSave.Enabled then
  begin
    BtnSave.Enabled := False;
    BtnPrint.Enabled := False;
    BtnWeight.Enabled := True;
    PGross.Caption := '0';
    PTare.Caption := '0';
    PNet.Caption := '0';
    PReal.Caption := '0';
    PSum.Caption := '0';
    CBCost.Text := '0';
    CBCar.Enabled := true;
  end
  else
  begin
    if systemConfig.clearCar then CBCar.Text := systemConfig.carDefault;
    if systemConfig.clearFaHuo then CBFaHuo.Text := systemConfig.faHuoDefault;
    if systemConfig.clearShouHuo then CBShouHuo.Text := systemConfig.shouHuoDefault;
    if systemConfig.clearGoods then CBGoods.Text := systemConfig.goodsDefault;
    if systemConfig.clearSpec then CBSpec.Text := systemConfig.specDefault;
    if systemConfig.clearBundle then CBBundle.Text := '0';
    if systemConfig.clearPrice then CBPrice.Text := '0';
    if systemConfig.clearCost then CBCost.Text := '0';
    if systemConfig.clearRemark then CBRemark.Text := systemConfig.remarkDefault;
    if systemConfig.clearBackup1 then CBBackup1.Text := systemConfig.backup1Default;
    if systemConfig.clearBackup2 then CBBackup2.Text := systemConfig.backup2Default;
    if systemConfig.clearBackup3 then CBBackup3.Text := systemConfig.backup3Default;
    if systemConfig.clearBackup4 then CBBackup4.Text := systemConfig.backup4Default;
    if systemConfig.clearBackup5 then CBBackup5.Text := systemConfig.backup5Default;
    if systemConfig.clearBackup6 then CBBackup6.Value := 0;
    if systemConfig.clearBackup7 then CBBackup7.Value := 0;
    if systemConfig.clearBackup8 then CBBackup8.Value := 0;
    if systemConfig.clearBackup9 then CBBackup9.Value := 0;
    CBCar.SetFocus
  end;
  CBCar.SetFocus;
end;

procedure TMainForm.BtnWeightClick(Sender: TObject);
begin
  if (StrToFloatDef(getWeight, 0) = 0) or (CBCar.Text = '') then
  begin
    ShowMsg('重量或车号不能为空，否则无法进行操作！');
    Exit
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  //等待稳定后才能称重
  if not getSteady then
    Exit;

  TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text); //预置车号,单位等信息
  TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text); //预置备用项目

  PGross.Caption := getWeight; //获取当前重量
  UpdateRecNo := ''; //如果是更新的话，取上一次的号码
  WeightType := '插入'; //称重类型，一种是插入，一种是更新
  WeightField := '毛重';

  operator := CurrentUser;
  //设置过磅费
  CreateGrossPoundCharge();

  //一次过磅
  if CBOnce.Checked then
  begin
    CalcNet;
  end
  else
  begin
    TareFindGross();
  end;

  BtnWeight.Enabled := False;
  BtnSave.Enabled := True;
  BtnPrint.Enabled := True;
  CBCar.Enabled := false;

  TReadWeight.Enabled := systemConfig.UseVoice;
end;

procedure TMainForm.BtnSaveClick(Sender: TObject);
var temp, sqlStr: string;
begin
  if TDBCommonUtil.getRecordCount() > 10000 then
    Exit;

  if StrToFloatDef(PNet.Caption, 0) < 0 then
  begin
    ShowMsg('净重不合法!');
    Exit
  end;

  if ((WeightType = '插入') or (WeightType = '预置') or (WeightType = '手工'))
    then
  begin
    MaxGlideNo := TDBCommonUtil.getMaxGlideNo;
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into 称重信息(备用1,备用2,备用3,备用4,备用5,备用6,备用7,备用8,备用9,'
      + '流水号,车号,操作员,发货单位,收货单位,'
      + '货名,规格,毛重,空重,净重,扣重,实重,单价,金额,过磅费,过磅员,';
    if (WeightType = '手工') or (WeightType = '预置') then
      sqlStr := sqlStr +
        '毛重时间,空重时间,备注)'
    else if WeightField = '毛重' then
      sqlStr := sqlStr + '毛重时间,备注)'
    else if WeightField = '空重' then
      sqlStr := sqlStr + '空重时间,备注)';

    sqlstr := sqlstr + ' values(:backup1,:backup2,:backup3,:backup4,:backup5,:backup6,'
      + ':backup7,:backup8,:backup9,:glideno,:car,:user,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:charge,:oper,';
    if (WeightType = '手工') or (WeightType = '预置') then
      sqlstr := sqlstr +
        ':grosstime,:taretime,'
    else if WeightField = '毛重' then
      sqlstr := sqlstr + ':grosstime,'
    else if WeightField = '空重' then
      sqlstr := sqlstr + ':taretime,';
    sqlstr := sqlstr + ':remark)';
  end
  else if (WeightType = '更新') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update 称重信息 set 备用1=:backup1,备用2=:backup2,'
      + '备用3=:backup3,备用4=:backup4,备用5=:backup5,备用6=:backup6,'
      + '备用7=:backup7,备用8=:backup8,备用9=:backup9,发货单位=:fahuo,收货单位=:shouhuo,'
      + '货名=:goods,规格=:spec,毛重=:gross,空重=:tare,净重=:net,扣重=:bundle,'
      + '实重=:real,单价=:price,金额=:sum,过磅费=:charge,过磅员=:oper,';
    sqlstr := sqlstr + '空重时间=:taretime,'
      + '备注=:remark';
    sqlstr := sqlstr + ' where 流水号=:glideno';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = '更新' then
      Parameters.ParamByName('glideno').Value := UpdateRecNo
    else
    begin
      Parameters.ParamByName('glideno').Value := MaxGlideNo;
      Parameters.ParamByName('car').Value := CBCar.Text;
      Parameters.ParamByName('user').Value := CurrentUser;
    end;

    Parameters.ParamByName('backup1').Value := CBBackup1.Text;
    Parameters.ParamByName('backup2').Value := CBBackup2.Text;
    Parameters.ParamByName('backup3').Value := CBBackup3.Text;
    Parameters.ParamByName('backup4').Value := CBBackup4.Text;
    Parameters.ParamByName('backup5').Value := CBBackup5.Text;
    Parameters.ParamByName('backup6').Value := CBBackup6.Value;
    Parameters.ParamByName('backup7').Value := CBBackup7.Value;
    Parameters.ParamByName('backup8').Value := CBBackup8.Value;
    Parameters.ParamByName('backup9').Value := CBBackup9.Value;

    Parameters.ParamByName('fahuo').Value := CBFaHuo.Text;
    Parameters.ParamByName('shouhuo').Value := CBShouHuo.Text;
    Parameters.ParamByName('goods').Value := CBGoods.Text;
    Parameters.ParamByName('spec').Value := CBSpec.Text;
    Parameters.ParamByName('gross').Value := StrToFloatDef(PGross.Caption, 0);
    Parameters.ParamByName('tare').Value := StrToFloatDef(PTare.Caption, 0);
    Parameters.ParamByName('net').Value := StrToFloatDef(PNet.Caption, 0);
    Parameters.ParamByName('bundle').Value := StrToFloatDef(CBBundle.Text, 0);
    Parameters.ParamByName('real').Value := StrToFloatDef(PReal.Caption, 0);
    Parameters.ParamByName('price').Value := StrToFloatDef(CBPrice.Text, 0);
    Parameters.ParamByName('sum').Value := StrToFloatDef(PSum.Caption, 0);
    Parameters.ParamByName('oper').Value := operator;
    Parameters.ParamByName('charge').Value := StrToFloatDef(CBCost.Text, 0);

    if WeightType = '更新' then
    begin
      Parameters.ParamByName('taretime').Value := Now;
    end
    else
    begin
      if WeightField = '毛重' then
      begin
        Parameters.ParamByName('grosstime').Value := Now;
      end
      else if WeightField = '空重' then
      begin
        Parameters.ParamByName('taretime').Value := Now;
      end
      else
      begin
        Parameters.ParamByName('grosstime').Value := Now;
        Parameters.ParamByName('taretime').Value := Now;
      end;
    end;
    Parameters.ParamByName('remark').Value := CBRemark.Text;
    ExecSQL;
  end;

  GetStaticInfo;
  showGridRecord;

  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  CBCost.Text := '0';
  CBCar.Enabled := true;
  BitBtnGross.Visible := true;
  BitBtnTare.Visible := true;
  BitBtnSave.Visible := false;
  BitBtnPrint.Visible := false;
  BitBtnClear.Caption := '清空(&C)';
  CBCar.SetFocus;

  BtnSave.Enabled := False;
  BtnPrint.Enabled := False;
  BtnWeight.Enabled := True;
  if CBAutoClear.Checked then
  begin
    BtnCancel.Click;
  end;
  if systemConfig.waitForZero then
  begin
    PRight.Visible := False;
    TWaitForZero.Enabled := True;
  end;
end;

procedure TMainForm.BtnPrintClick(Sender: TObject);
var num: string;
begin
  BtnSave.Click;
  if UpdateRecNo <> '' then
    Num := UpdateRecNo
  else
    Num := MaxGlideNo;
  TReportUtil.printTicket(Num, CBPreview.Checked);
end;

procedure TMainForm.TareFindGross;
begin
  //找寻上次的毛重记录
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 Where (车号=:car) '
      + 'And (空重=0) and (毛重<>0) and (净重=0) Order By 流水号');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then //查询结果不为空
    begin
      PTare.Caption := getWeight;

      if FieldByName('发货单位').AsString <> '' then
        CBFaHuo.Text := FieldByName('发货单位').AsString;
      if FieldByName('收货单位').AsString <> '' then
        CBShouHuo.Text := FieldByName('收货单位').AsString;
      if FieldByName('货名').AsString <> '' then
        CBGoods.Text := FieldByName('货名').AsString;
      if FieldByName('规格').AsString <> '' then
        CBSpec.Text := FieldByName('规格').AsString;
      if FieldByName('扣重').AsFloat <> 0 then
        CBBundle.Text := FieldByName('扣重').AsString;
      if FieldByName('单价').AsFloat <> 0 then
        CBPrice.Text := FieldByName('单价').AsString;
      if FieldByName('备注').AsString <> '' then
        CBRemark.Text := FieldByName('备注').AsString;

      if FieldByName('备用1').AsString <> '' then
        CBBackup1.Text := FieldByName('备用1').AsString;
      if FieldByName('备用2').AsString <> '' then
        CBBackup2.Text := FieldByName('备用2').AsString;
      if FieldByName('备用3').AsString <> '' then
        CBBackup3.Text := FieldByName('备用3').AsString;
      if FieldByName('备用4').AsString <> '' then
        CBBackup4.Text := FieldByName('备用4').AsString;
      if FieldByName('备用5').AsString <> '' then
        CBBackup5.Text := FieldByName('备用5').AsString;

      if FieldByName('备用6').AsFloat <> 0 then
        CBBackup6.Text := FieldByName('备用6').AsString;
      if FieldByName('备用7').AsFloat <> 0 then
        CBBackup7.Text := FieldByName('备用7').AsString;
      if FieldByName('备用8').AsFloat <> 0 then
        CBBackup8.Text := FieldByName('备用8').AsString;
      if FieldByName('备用9').AsFloat <> 0 then
        CBBackup9.Text := FieldByName('备用9').AsString;

      PGross.Caption := FieldByName('毛重').AsString; //毛重-空重
      PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
        StrToFloatDef(PTare.Caption, 0));

      //如果净重为零,就转换毛重和空重
      if StrToFloatDef(PNet.Caption, 0) < 0 then
      begin
        PNet.Caption := PGross.Caption;
        PGross.Caption := PTare.Caption;
        PTare.Caption := PNet.Caption;
        PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
          StrToFloatDef(PTare.Caption, 0));
      end;

      CalcNet;
      //更新过磅费
      UpdatePoundCharge(FieldByName('过磅费').AsFloat);
      WeightType := '更新';
      UpdateRecNo := FieldByName('流水号').AsString;
      operator := FieldByName('过磅员').AsString + ',' + operator;
    end
  end;
end;

function TMainForm.getWeight: string;
begin
  Result := PWeight1.Caption;
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('数据维护') then
  begin
    Application.CreateForm(TInitializeOptionForm, InitializeOptionForm);
    try
      InitializeOptionForm.ShowModal();
    finally
      InitializeOptionForm.Free;
    end;
  end;
  showGridRecord;
end;

function TMainForm.showGridRecord: string;
begin
  try
    if NToday.Checked then
      TDBCommonUtil.showTodayRecord(CBRecordType.ItemIndex)
    else if NToWeek.Checked then
      TDBCommonUtil.showToWeekRecord(CBRecordType.ItemIndex)
    else if NToMonth.Checked then
      TDBCommonUtil.showToMonthRecord(CBRecordType.ItemIndex)
    else if NToSeason.Checked then
      TDBCommonUtil.showToSeasonRecord(CBRecordType.ItemIndex)
    else if NToYear.Checked then
      TDBCommonUtil.showToYearRecord(CBRecordType.ItemIndex);
  except
    ShowMsg('数据库无法打开，请检查!');
  end;

  PanelDataCheck;
  Repaint
end;

procedure TMainForm.checkMenu(t: TMenuItem);
var i: integer;
begin
  for i := 0 to PMQuery.Items.Count - 1 do
  begin
    PMQuery.Items[i].Checked := False;
  end;
  t.Checked := True;
end;

procedure TMainForm.NTodayClick(Sender: TObject);
begin
  checkMenu(Sender as TMenuItem);
  showGridRecord;
end;

procedure TMainForm.NToWeekClick(Sender: TObject);
begin
  checkMenu(Sender as TMenuItem);
  showGridRecord;
end;

procedure TMainForm.NToMonthClick(Sender: TObject);
begin
  checkMenu(Sender as TMenuItem);
  showGridRecord;
end;

procedure TMainForm.NToSeasonClick(Sender: TObject);
begin
  checkMenu(Sender as TMenuItem);
  showGridRecord;
end;

procedure TMainForm.NToYearClick(Sender: TObject);
begin
  checkMenu(Sender as TMenuItem);
  showGridRecord;
end;

procedure TMainForm.CBRecordTypeChange(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.TWaitForZeroTimer(Sender: TObject);
begin
  if StrToFloat(getWeight) < systemConfig.ReturnZero then
  begin
    (Sender as TTimer).Enabled := False;
    PRight.Visible := True;
  end;
end;

function TMainForm.getSteady: Boolean;
begin
  if systemConfig.allowNotSteady then
  begin
    Result := True;
  end
  else
  begin
    Result := SpSteady1.Brush.Color = clLime;
  end;
end;

procedure TMainForm.AppendBtnClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('手工重量') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.Caption := '添加磅单';
      ManualInputForm.insertOrUpdate := True;
      ManualInputForm.ShowModal();
    finally
      ManualInputForm.Free;
    end;
  end;
  showGridRecord;
end;

procedure TMainForm.loadSysConfig;
var i: Integer;
begin
  //先导入配置
  TSysConfigUtil.loadConfig(systemConfig);

  setAutoBackup(systemConfig.backupType = 2);

  Label24.Caption := systemConfig.metricUnit;
  Label25.Caption := systemConfig.metricUnit;
  lblUnit1.Caption := systemConfig.metricUnit;

  CBCar.DropDownCount := systemConfig.dropCount;
  CBFaHuo.DropDownCount := systemConfig.dropCount;
  CBShouHuo.DropDownCount := systemConfig.dropCount;
  CBGoods.DropDownCount := systemConfig.dropCount;
  CBSpec.DropDownCount := systemConfig.dropCount;
  CBRemark.DropDownCount := systemConfig.dropCount;
  CBBackup1.DropDownCount := systemConfig.dropCount;
  CBBackup2.DropDownCount := systemConfig.dropCount;
  CBBackup3.DropDownCount := systemConfig.dropCount;
  CBBackup4.DropDownCount := systemConfig.dropCount;
  CBBackup5.DropDownCount := systemConfig.dropCount;

  CBCar.AutoDropDown := systemConfig.dropAuto;
  CBFaHuo.AutoDropDown := systemConfig.dropAuto;
  CBShouHuo.AutoDropDown := systemConfig.dropAuto;
  CBGoods.AutoDropDown := systemConfig.dropAuto;
  CBSpec.AutoDropDown := systemConfig.dropAuto;
  CBRemark.AutoDropDown := systemConfig.dropAuto;
  CBBackup1.AutoDropDown := systemConfig.dropAuto;
  CBBackup2.AutoDropDown := systemConfig.dropAuto;
  CBBackup3.AutoDropDown := systemConfig.dropAuto;
  CBBackup4.AutoDropDown := systemConfig.dropAuto;
  CBBackup5.AutoDropDown := systemConfig.dropAuto;

  CBCar.AutoComplete := systemConfig.autoComplete;
  CBFaHuo.AutoComplete := systemConfig.autoComplete;
  CBShouHuo.AutoComplete := systemConfig.autoComplete;
  CBGoods.AutoComplete := systemConfig.autoComplete;
  CBSpec.AutoComplete := systemConfig.autoComplete;
  CBRemark.AutoComplete := systemConfig.autoComplete;
  CBBackup1.AutoComplete := systemConfig.autoComplete;
  CBBackup2.AutoComplete := systemConfig.autoComplete;
  CBBackup3.AutoComplete := systemConfig.autoComplete;
  CBBackup4.AutoComplete := systemConfig.autoComplete;
  CBBackup5.AutoComplete := systemConfig.autoComplete;

  CBCost.Enabled := systemConfig.ManualInputPound;
  DBGridEh1.FrozenCols := systemConfig.FrozenCols;

  CBAutoClear.Checked := systemConfig.autoClear;
  CBPreview.Checked := systemConfig.previewTicket;
  CBSimple.Checked := systemConfig.simpleWeight;

  if systemConfig.deleteHistory then
    TDBCommonUtil.DelHistory();

  Application.Title := '称重管理系统';
  Caption := '称重管理系统';
  SpInfo.Caption := Format('%s 使用单位:%s 电话号码:%s', ['称重管理系统', systemConfig.company, systemConfig.tel]);

  SpMode.Caption := '[单机模式]';

  for i := 0 to Length(arrWeight1) - 1 do
    arrWeight1[i] := '0';
  cishu1 := 0;

  canAutoSave := True;
end;

procedure TMainForm.CalcNet;
begin
  PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
    StrToFloatDef(PTare.Caption, 0));
  if (Trim(CBBundle.Text) <> '') then
  begin
    if systemConfig.useBundleRate then
      PReal.Caption := FloatToStr(RoundTo(StrToFloatDef(PNet.Caption, 0)
        * (1 - StrToFloatDef(CBBundle.Text, 0) / 100), 0 - systemConfig.sumPoint))
    else
      PReal.Caption := FloatToStr(StrToFloatDef(PNet.Caption, 0) - StrToFloatDef(CBBundle.Text, 0));
    if (Trim(CBPrice.Text) <> '') then
      PSum.Caption := FloatToStr(RoundTo(StrToFloatDef(PReal.Caption, 0)
        * StrToFloatDef(CBPrice.Text, 0), 0 - systemConfig.sumPoint))
  end
end;

procedure TMainForm.SBTaoClick(Sender: TObject);
begin
  TaoForm.ShowModal;
end;

procedure TMainForm.BtnSetTareClick(Sender: TObject);
begin
  if TPrepareUtil.updateCarTare(CBCar.Text, getWeight) then
  begin
    Application.MessageBox(PChar(Format('预置皮重成功!车号:[%s],皮重:[%s]', [CBCar.Text, getWeight
      ])), '提示', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
  end
  else
  begin
    Application.MessageBox('预置皮重失败!', '提示', MB_OK + MB_ICONSTOP +
      MB_TOPMOST);
  end;
end;

procedure TMainForm.DBGridEh1DblClick(Sender: TObject);
begin
  if PInfo.Visible then
  begin
    with DBGridEh1.DataSource.DataSet do
    begin
      CBCar.Text := FieldByName('车号').AsString;
      CBFaHuo.Text := FieldByName('发货单位').AsString;
      CBShouHuo.Text := FieldByName('收货单位').AsString;
      CBGoods.Text := FieldByName('货名').AsString;
      CBSpec.Text := FieldByName('规格').AsString;
      CBBundle.Text := FieldByName('扣重').AsString;
      CBPrice.Text := FieldByName('单价').AsString;
      CBCost.Text := FieldByName('过磅费').AsString;
      CBRemark.Text := FieldByName('备注').AsString;
      CBBackup1.Text := FieldByName('备用1').AsString;
      CBBackup2.Text := FieldByName('备用2').AsString;
      CBBackup3.Text := FieldByName('备用3').AsString;
      CBBackup4.Text := FieldByName('备用4').AsString;
      CBBackup5.Text := FieldByName('备用5').AsString;
      CBBackup6.Text := FieldByName('备用6').AsString;
      CBBackup7.Text := FieldByName('备用7').AsString;
      CBBackup8.Text := FieldByName('备用8').AsString;
      CBBackup9.Text := FieldByName('备用9').AsString;
    end;
  end;
end;

procedure TMainForm.SMPrintCombineClick(Sender: TObject);
begin
  Application.CreateForm(TTareChartForm, TareChartForm);
  try
    TareChartForm.ShowModal;
  finally
    TareChartForm.Free;
  end;
end;

procedure TMainForm.N24Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('系统设置') then
  begin
    Application.CreateForm(TWeightSetForm, WeightSetForm);
    try
      WeightSetForm.ShowModal;
    finally
      WeightSetForm.Free
    end
  end
  else
    ShowMsg('对不起您没有系统设置权限，无法进行称重界面设置！');
end;

procedure TMainForm.BtnExitClick(Sender: TObject);
begin
  PanelMain.Visible := False;
end;

procedure TMainForm.BtnSecurityClick(Sender: TObject);
begin
  SMChange.Click
end;

procedure TMainForm.BtnJumptoLineClick(Sender: TObject);
begin
  SMWeight.Click
end;

procedure TMainForm.BtnNoteClick(Sender: TObject);
begin
  SMDataQuery.Click
end;

procedure TMainForm.BtnNewsgroupsClick(Sender: TObject);
begin
  SMComputer.Click
end;

procedure TMainForm.BtnChangeOptionsClick(Sender: TObject);
begin
  SMTicketSet.Click;
end;

procedure TMainForm.BtnVolumeClick(Sender: TObject);
begin
  Application.CreateForm(TVoiceForm, VoiceForm);
  try
    VoiceForm.ShowModal();
  finally
    VoiceForm.Free;
  end;
end;

end.

