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
    //�ж��ȶ�
    arrWeight1, arrWeight2: array[0..50] of string;
    cishu1, cishu2: integer;
    FCurrentUser: string;
    //y, maxY: Integer; //����ͼY��
    procedure SetCurrentUser(const Value: string);
  public
    { Public declarations }
    WeightType, CurrentRecord: string; //��ǰ���еļ�¼
    systemConfig: TSysConfig; //ϵͳ����
    procedure PanelDataCheck();
    procedure ShowMsg(Msg: string); //��ʾ��Ϣ
    procedure GrossFindTare(); //���ë��ʱѰ�ҿ��ؼ�¼
    procedure TareFindGross(); //�������ʱѰ��ë�ؼ�¼
    procedure CreateGrossPoundCharge();
    procedure CreateTarePoundCharge();
    procedure UpdatePoundCharge(lastPound: Double); //���������
    procedure saveBackRecordWeight(weight: string); //����
    procedure GetStaticInfo(); //������ؽ������Ͻǵ�ͳ����Ϣ
    procedure setAutoBackup(t: boolean); //�����Զ��������ݿ�
    procedure resizeMain(); //�������ų��ؽ���Ĵ�С
    procedure loadFormDesign();
    function getWeight(): string; //һ��˫��ʱȡ����
    function getSteady(): Boolean; //ȡ�ȶ�״̬
    function showGridRecord(): string; //��ʾ���ļ�¼,��������
    procedure checkMenu(t: TMenuItem); //ѡ��ǰ��ѯ����
    procedure loadSysConfig(); //��ȡ����
    procedure CalcNet(); //���㾻�أ����أ�ʵ�ؼ����
    property
      CurrentUser: string read FCurrentUser write SetCurrentUser; //��ǰ�û�
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

//ÿ�����������û�Ȩ�޵ļ�⣬���ѯ��

procedure TMainForm.PanelDataCheck;
begin
  GBDataOper.Enabled := TDBCommonUtil.HasAuthority('����ά��');
  DBGridEh1.ReadOnly := not TDBCommonUtil.HasAuthority('����ά��');
  DBGridEh1.ReadOnly := not TDBCommonUtil.HasAuthority('����ά��');
  DBGridEh1.FieldColumns['ë��'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['����'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['����'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['����'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['ʵ��'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['����'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['���'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['������'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['ë��ʱ��'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  DBGridEh1.FieldColumns['����ʱ��'].ReadOnly := not TDBCommonUtil.HasAuthority('ϵͳ����');
  PrintBtn.Enabled := TDBCommonUtil.HasAuthority('��ӡ����')
end;

//��ʾ�ֶ�

procedure TMainForm.ListBtnClick(Sender: TObject);
begin
  Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
  try
    DataShowSettingForm.DBGridEh1 := DBGridEh1;
    DataShowSettingForm.TableName := '������Ϣ';
    DataShowSettingForm.ShowModal;
    Repaint;
  finally
    DataShowSettingForm.Free
  end
end;

//�����¼ΪExcel or Txt

procedure TMainForm.OutputBtnClick(Sender: TObject);
begin
  if TCommonUtil.exportExcel(DBGridEh1) then
    ShowMsg('���ݵ����ɹ���')
  else
    ShowMsg('���ݵ���ʧ�ܣ�');
end;

//��ӡ���

procedure TMainForm.PrintBtnClick(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEh1;
    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(TCommonUtil.getIni.ReadString('system_set', 'dataReportTitle', '���ݱ���'));
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('����Ա��' + CurrentUser + '        ' + '����ʱ�䣺' +
      DateTimeToStr(Now));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('��&[Page]ҳ/��&[Pages]ҳ');
    Preview
  end
end;

//��ʾ��ǰʱ���Լ��ж������Ƿ��ȶ�

procedure TMainForm.TTimeTimer(Sender: TObject);
var i: integer;
  flag1, flag2: boolean;
begin
  SpTrans1.Brush.Color := clWhite;
  if PanelMain.Visible then
  begin
    //һ���Ǳ��ж��ȶ�
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
  if MessageDlg('ȷ��Ҫ�ر������?',
    mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    CanClose := false
end;

procedure TMainForm.SMMeter1Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('�Ǳ�����') then
    MeterSet1Form.ShowModal
  else
    ShowMsg('�Բ�����û���Ǳ�����Ȩ�ޣ��޷������Ǳ����ã�')
end;

procedure TMainForm.SMCloseClick(Sender: TObject);
begin
  Close
end;

procedure TMainForm.SMSoftSetClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('ϵͳ����') then
  begin
    Application.CreateForm(TSoftwareSetForm, SoftwareSetForm);
    try
      SoftwareSetForm.ShowModal;
    finally
      SoftwareSetForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û��ϵͳ����Ȩ�ޣ��޷�����������ã�')
end;

procedure TMainForm.SMChangeClick(Sender: TObject);
begin
  CurrentUser := '';
  Application.CreateForm(TLoginForm, LoginForm);
  try
    LoginForm.ShowModal;
    if CurrentUser = '' then
      Application.Terminate;
    TDBCommonUtil.AddLog(CurrentUser + '��½');
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
  //������ؽ������Ͻǵ�ͳ����Ϣ
  GetStaticInfo();
  showGridRecord;

  CBCar.SetFocus;
end;

procedure TMainForm.SMUserClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('�û�����') then
  begin
    Application.CreateForm(TUserPurviewForm, UserPurviewForm);
    try
      UserPurviewForm.ShowModal;
    finally
      UserPurviewForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û���û�����Ȩ�ޣ��޷����в���Աά����')
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if QueryDataModule.ConnectFlag then
  begin
    //resizeMain;
    TTime.Enabled := True; //��ʼ��ʱ
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
  //��ȡϵͳ��������
  loadSysConfig();
  //������ؽ�������
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
  if TDBCommonUtil.HasAuthority('���ݱ���') then
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
  //��Ѱ�ϴεĿ��ؼ�¼
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Text := 'select * from ������Ϣ where (����=:car) and (ë��=0) '
      + 'and (����<>0) and (����=0) Order By ��ˮ��';
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      //ѯ���û��Ƿ�ʹ�ù�ס��Ƥ��
      if MessageDlg('�Ƿ����������Ƥ��?', mtConfirmation, [mbYes, mbNo], 0)
        <> mrYes then
        Exit;
      if RecordCount = 1 then
      begin
        if FieldByName('������λ').AsString <> '' then
          CBFaHuo.Text := FieldByName('������λ').AsString;
        if FieldByName('�ջ���λ').AsString <> '' then
          CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
        if FieldByName('����').AsString <> '' then
          CBGoods.Text := FieldByName('����').AsString;
        if FieldByName('���').AsString <> '' then
          CBSpec.Text := FieldByName('���').AsString;
        if FieldByName('����').AsFloat <> 0 then
          CBBundle.Text := FieldByName('����').AsString;
        if FieldByName('����').AsFloat <> 0 then
          CBPrice.Text := FieldByName('����').AsString;
        if FieldByName('��ע').AsString <> '' then
          CBRemark.Text := FieldByName('��ע').AsString;

        if FieldByName('����1').AsString <> '' then
          CBBackup1.Text := FieldByName('����1').AsString;
        if FieldByName('����2').AsString <> '' then
          CBBackup2.Text := FieldByName('����2').AsString;
        if FieldByName('����3').AsString <> '' then
          CBBackup3.Text := FieldByName('����3').AsString;
        if FieldByName('����4').AsString <> '' then
          CBBackup4.Text := FieldByName('����4').AsString;
        if FieldByName('����5').AsString <> '' then
          CBBackup5.Text := FieldByName('����5').AsString;

        if FieldByName('����6').AsFloat <> 0 then
          CBBackup6.Text := FieldByName('����6').AsString;
        if FieldByName('����7').AsFloat <> 0 then
          CBBackup7.Text := FieldByName('����7').AsString;
        if FieldByName('����8').AsFloat <> 0 then
          CBBackup8.Text := FieldByName('����8').AsString;
        if FieldByName('����9').AsFloat <> 0 then
          CBBackup9.Text := FieldByName('����9').AsString;

        PTare.Caption := FieldByName('����').AsString; //ë��-����=����
        CalcNet;
        //���¹�����
        UpdatePoundCharge(FieldByName('������').AsFloat);
        WeightType := '����';
        UpdateRecNo := FieldByName('��ˮ��').AsString;

        operator := operator + FieldByName('����Ա').AsString;
      end
      else if RecordCount > 1 then
        //�д���һ���Ŀ��ؼ�¼,�����Ի������û�ѡ������һ��
      begin
        with QueryDataModule.ADOQMultiGross do
        begin
          Close;
          SQL.Text := 'Select * From ������Ϣ Where (����=:car)'
            + ' And (ë��=0) and (����<>0) and (����=0) Order By ��� desc';
          Parameters.ParamByName('car').Value := CBCar.Text;
          Open;
        end;
        MultiGrossForm.Width := Screen.Width - 10;
        MultiGrossForm.ShowModal;
        UpdateRecNo := MultiGrossForm.UpdateRecNo;
        with MultiGrossForm.DBGridEh1.DataSource.DataSet do
        begin
          if FieldByName('������λ').AsString <> '' then
            CBFaHuo.Text := FieldByName('������λ').AsString;
          if FieldByName('�ջ���λ').AsString <> '' then
            CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
          if FieldByName('����').AsString <> '' then
            CBGoods.Text := FieldByName('����').AsString;
          if FieldByName('���').AsString <> '' then
            CBSpec.Text := FieldByName('���').AsString;
          if FieldByName('����').AsFloat <> 0 then
            CBBundle.Text := FieldByName('����').AsString;
          if FieldByName('����').AsFloat <> 0 then
            CBPrice.Text := FieldByName('����').AsString;
          if FieldByName('��ע').AsString <> '' then
            CBRemark.Text := FieldByName('��ע').AsString;

          if FieldByName('����1').AsString <> '' then
            CBBackup1.Text := FieldByName('����1').AsString;
          if FieldByName('����2').AsString <> '' then
            CBBackup2.Text := FieldByName('����2').AsString;
          if FieldByName('����3').AsString <> '' then
            CBBackup3.Text := FieldByName('����3').AsString;
          if FieldByName('����4').AsString <> '' then
            CBBackup4.Text := FieldByName('����4').AsString;
          if FieldByName('����5').AsString <> '' then
            CBBackup5.Text := FieldByName('����5').AsString;

          if FieldByName('����6').AsFloat <> 0 then
            CBBackup6.Text := FieldByName('����6').AsString;
          if FieldByName('����7').AsFloat <> 0 then
            CBBackup7.Text := FieldByName('����7').AsString;
          if FieldByName('����8').AsFloat <> 0 then
            CBBackup8.Text := FieldByName('����8').AsString;
          if FieldByName('����9').AsFloat <> 0 then
            CBBackup9.Text := FieldByName('����9').AsString;

          PTare.Caption := FieldByName('����').AsString; //ë��-����
          CalcNet;
          //���¹�����
          UpdatePoundCharge(FieldByName('������').AsFloat);
          WeightType := '����';

          operator := FieldByName('����Ա').AsString + ' ' + operator
        end;
      end
    end
  end
end;

procedure TMainForm.BitBtnGrossClick(Sender: TObject);
var grossGlideNo: string;
  Account: Double; //���أ����������
  Flag: boolean; //Ԥ�ñ�־
begin
  Account := 0.00;
  //Flag := true;
  if (StrToFloatDef(getWeight, 0) = 0) or (CBCar.Text = '') then
  begin
    ShowMsg('�����򳵺Ų���Ϊ�գ������޷����в�����');
    Exit
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  //�ȴ��ȶ�����ܳ���
  if not getSteady then
    Exit;

  TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text); //Ԥ�ó���,��λ����Ϣ
  TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text); //Ԥ�ñ�����Ŀ

  PGross.Caption := getWeight; //��ȡ��ǰ����
  UpdateRecNo := ''; //����Ǹ��µĻ���ȡ��һ�εĺ���
  WeightType := '����'; //�������ͣ�һ���ǲ��룬һ���Ǹ���
  WeightField := 'ë��';

  operator := 'ë:' + CurrentUser;
  //���ù�����
  CreateGrossPoundCharge();

  //�����������ι�ë��,��ô����а���ë��,�͵����Ի������û�ѡ���Ƿ�����ϴ�ë��
  //���ѡ�Ǿ͸���,�����ܹ���
  if not systemConfig.AllowSecondGross then
  begin
    if TDBCommonUtil.hasLastGross(CBCar.Text, grossGlideNo) then
    begin
      if MessageBoxW(Handle, '�ó��ѹ����ذ�,�Ƿ�����ϴε�ë��?', '��ʾ',
        MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        if TDBCommonUtil.HasAuthority('����ά��') then
        begin
          TDBCommonUtil.updateLastGross(grossGlideNo, PGross.Caption);
        end
        else
        begin
          MessageBox(0, '�Բ���,��û��Ȩ�޸��´˼�¼', '����', MB_OK +
            MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
        Exit;
      end
      else
        Exit;
    end;
  end;

  //Ԥ�õķ���,ΪTrue ����Ԥ��Ƥ��
  Flag := true;
  //��Ѱ�Ƿ���Ԥ�õ�Ƥ��
  QueryDataModule.PrepareMaintainDS.Enabled := false;
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Ƥ�� From ���� Where ����=:car');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      if FieldByName('Ƥ��').AsFloat <> 0 then
      begin
        if MessageDlg('����Ϊ��' + CBCar.Text + '����Ԥ��Ƥ��Ϊ��'
          + FieldByName('Ƥ��').AsString + Char(13) + '�Ƿ�ʹ�õ�ǰ��Ԥ��Ƥ��?'
          , mtWarning, [mbOK, mbCancel], 0) = mrOk then
        begin
          Flag := false;
          Account := FieldByName('Ƥ��').AsFloat
        end
      end
    end;
    Close;
    SQL.Clear
  end;
  QueryDataModule.PrepareMaintainDS.Enabled := true;
  if Flag then //��Ԥ��ʱ
  begin
    GrossFindTare;
    //һ�ι���
    if CBOnce.Checked then
    begin
      PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
        StrToFloatDef(PTare.Caption, 0));
      CalcNet;
    end;
  end
  else //��Ԥ��Ƥ��ʱ
  begin
    with QueryDataModule.WeightMaintainQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select top 1 * from ������Ϣ order by ��ˮ��');
      Open
    end;
    PTare.Caption := FloatToStr(Account);
    PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
      StrToFloatDef(PTare.Caption, 0));
    CalcNet;
    WeightType := 'Ԥ��';
    operator := operator + ' ��:' + CurrentUser
  end;

  CBCar.Enabled := false;
  BitBtnGross.Visible := false;
  BitBtnTare.Visible := false;
  BitBtnSave.Visible := true;
  BitBtnPrint.Visible := true;
  BitBtnClear.Caption := 'ȡ��(&C)';

  TReadWeight.Enabled := systemConfig.UseVoice;
end;

procedure TMainForm.BitBtnTareClick(Sender: TObject);
var tareGlideNo: string;
  sysTare, nowTare: Double;
begin
  if (StrToFloatDef(getWeight, 0) = 0) or (CBCar.Text = '') then
  begin
    ShowMsg('�����򳵺Ų���Ϊ�գ������޷����в�����');
    Exit
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  //�ȴ������ȶ�
  if not getSteady then
    Exit;

  TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text); //Ԥ�ó���,��λ����Ϣ
  TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text); //Ԥ�ñ�����Ŀ

  PTare.Caption := getWeight;

  //��ʾƤ�س���
  if systemConfig.useTareDiff then
  begin
    nowTare := StrToFloatDef(PTare.Caption, 0);
    sysTare := TPrepareUtil.getCarTare(CBCar.Text);
    //����5%������
    if sysTare > 0 then
    begin
      if (abs(nowTare - sysTare) / sysTare) > systemConfig.tareDiff / 100 then
      begin
        if Application.MessageBox(PChar(Format('�ó�Ƥ��ϵͳ��Ƥ�������,���һ�ι���Ϊ[%f],���[%f],�Ƿ������������?',
          [sysTare, sysTare - nowTare])), '��ʾ', MB_YESNO + MB_ICONWARNING + MB_TOPMOST) = IDYES then
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
  WeightType := '����';
  WeightField := '����';

  operator := '��:' + CurrentUser;
  //������
  CreateTarePoundCharge();

  //�����������ι�Ƥ��,��ô����а���Ƥ��,�͵����Ի������û�ѡ���Ƿ�����ϴ�Ƥ��
  //���ѡ�Ǿ͸���,�����ܹ���
  if not systemConfig.AllowSecondTare then
  begin
    if TDBCommonUtil.hasLastTare(CBCar.Text, tareGlideNo) then
    begin
      if MessageBoxW(Handle, '�ó��ѹ��˿հ�,�Ƿ�����ϴε�Ƥ��?', '��ʾ',
        MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        if TDBCommonUtil.HasAuthority('����ά��') then
        begin
          TDBCommonUtil.updateLastTare(tareGlideNo, PTare.Caption);
        end
        else
        begin
          MessageBox(0, '�Բ���,��û��Ȩ�޸��´˼�¼', '����', MB_OK +
            MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
        Exit;
      end
      else
        Exit;
    end;
  end;
  //�Զ�Ԥ��Ƥ��
  if systemConfig.autoWriteTare then
    TPrepareUtil.updateCarTare(CBCar.Text, PTare.Caption);
  //��Ѱ�ϴε�ë�ؼ�¼
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From ������Ϣ Where (����=:car) '
      + 'And (����=0) and (ë��<>0) and (����=0) Order By ��ˮ��');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then //��ѯ�����Ϊ��
    begin
      if RecordCount = 1 then
      begin
        if FieldByName('������λ').AsString <> '' then
          CBFaHuo.Text := FieldByName('������λ').AsString;
        if FieldByName('�ջ���λ').AsString <> '' then
          CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
        if FieldByName('����').AsString <> '' then
          CBGoods.Text := FieldByName('����').AsString;
        if FieldByName('���').AsString <> '' then
          CBSpec.Text := FieldByName('���').AsString;
        if FieldByName('����').AsFloat <> 0 then
          CBBundle.Text := FieldByName('����').AsString;
        if FieldByName('����').AsFloat <> 0 then
          CBPrice.Text := FieldByName('����').AsString;
        if FieldByName('��ע').AsString <> '' then
          CBRemark.Text := FieldByName('��ע').AsString;

        if FieldByName('����1').AsString <> '' then
          CBBackup1.Text := FieldByName('����1').AsString;
        if FieldByName('����2').AsString <> '' then
          CBBackup2.Text := FieldByName('����2').AsString;
        if FieldByName('����3').AsString <> '' then
          CBBackup3.Text := FieldByName('����3').AsString;
        if FieldByName('����4').AsString <> '' then
          CBBackup4.Text := FieldByName('����4').AsString;
        if FieldByName('����5').AsString <> '' then
          CBBackup5.Text := FieldByName('����5').AsString;

        if FieldByName('����6').AsFloat <> 0 then
          CBBackup6.Text := FieldByName('����6').AsString;
        if FieldByName('����7').AsFloat <> 0 then
          CBBackup7.Text := FieldByName('����7').AsString;
        if FieldByName('����8').AsFloat <> 0 then
          CBBackup8.Text := FieldByName('����8').AsString;
        if FieldByName('����9').AsFloat <> 0 then
          CBBackup9.Text := FieldByName('����9').AsString;

        PGross.Caption := FieldByName('ë��').AsString; //ë��-����
        PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
          StrToFloatDef(PTare.Caption, 0));
        CalcNet;
      //���¹�����
        UpdatePoundCharge(FieldByName('������').AsFloat);
        WeightType := '����';
        UpdateRecNo := FieldByName('��ˮ��').AsString;
        operator := FieldByName('����Ա').AsString + ' ' + operator;
      end
      else if RecordCount > 1 then
      //�д���һ����ë�ؼ�¼,�����Ի������û�ѡ������һ��
      begin
        with QueryDataModule.ADOQMultiGross do
        begin
          Close;
          SQL.Text := 'Select * From ������Ϣ Where (����=:car)'
            + ' And (����=0) and (ë��<>0) and (����=0) Order By ��� desc';
          Parameters.ParamByName('car').Value := CBCar.Text;
          Open;
        end;
        MultiGrossForm.Width := Screen.Width - 10;
        MultiGrossForm.ShowModal;
        UpdateRecNo := MultiGrossForm.UpdateRecNo;
        with MultiGrossForm.DBGridEh1.DataSource.DataSet do
        begin
          if FieldByName('������λ').AsString <> '' then
            CBFaHuo.Text := FieldByName('������λ').AsString;
          if FieldByName('�ջ���λ').AsString <> '' then
            CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
          if FieldByName('����').AsString <> '' then
            CBGoods.Text := FieldByName('����').AsString;
          if FieldByName('���').AsString <> '' then
            CBSpec.Text := FieldByName('���').AsString;
          if FieldByName('����').AsFloat <> 0 then
            CBBundle.Text := FieldByName('����').AsString;
          if FieldByName('����').AsFloat <> 0 then
            CBPrice.Text := FieldByName('����').AsString;
          if FieldByName('��ע').AsString <> '' then
            CBRemark.Text := FieldByName('��ע').AsString;

          if FieldByName('����1').AsString <> '' then
            CBBackup1.Text := FieldByName('����1').AsString;
          if FieldByName('����2').AsString <> '' then
            CBBackup2.Text := FieldByName('����2').AsString;
          if FieldByName('����3').AsString <> '' then
            CBBackup3.Text := FieldByName('����3').AsString;
          if FieldByName('����4').AsString <> '' then
            CBBackup4.Text := FieldByName('����4').AsString;
          if FieldByName('����5').AsString <> '' then
            CBBackup5.Text := FieldByName('����5').AsString;

          if FieldByName('����6').AsFloat <> 0 then
            CBBackup6.Text := FieldByName('����6').AsString;
          if FieldByName('����7').AsFloat <> 0 then
            CBBackup7.Text := FieldByName('����7').AsString;
          if FieldByName('����8').AsFloat <> 0 then
            CBBackup8.Text := FieldByName('����8').AsString;
          if FieldByName('����9').AsFloat <> 0 then
            CBBackup9.Text := FieldByName('����9').AsString;

          PGross.Caption := FieldByName('ë��').AsString; //ë��-����
          PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
            StrToFloatDef(PTare.Caption, 0));
          CalcNet;
        //���¹�����
          UpdatePoundCharge(FieldByName('������').AsFloat);
          WeightType := '����';
          operator := FieldByName('����Ա').AsString + ' ' + operator;
        end;
      end;
    end
  end;

  CBCar.Enabled := false;
  BitBtnGross.Visible := false;
  BitBtnTare.Visible := false;
  BitBtnSave.Visible := true;
  BitBtnPrint.Visible := true;
  BitBtnClear.Caption := 'ȡ��(&C)';

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
    ShowMsg('���ز��Ϸ�!');
    Exit
  end;

  if ((WeightType = '����') or (WeightType = 'Ԥ��') or (WeightType = '�ֹ�'))
    then
  begin
    MaxGlideNo := TDBCommonUtil.getMaxGlideNo;
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into ������Ϣ(����1,����2,����3,����4,����5,����6,����7,����8,����9,'
      + '��ˮ��,����,����Ա,������λ,�ջ���λ,'
      + '����,���,ë��,����,����,����,ʵ��,����,���,������,����Ա,';
    if (WeightType = '�ֹ�') or (WeightType = 'Ԥ��') then
      sqlStr := sqlStr +
        'ë��ʱ��,����ʱ��,��ע)'
    else if WeightField = 'ë��' then
      sqlStr := sqlStr + 'ë��ʱ��,��ע)'
    else if WeightField = '����' then
      sqlStr := sqlStr + '����ʱ��,��ע)';

    sqlstr := sqlstr + ' values(:backup1,:backup2,:backup3,:backup4,:backup5,:backup6,'
      + ':backup7,:backup8,:backup9,:glideno,:car,:user,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:charge,:oper,';
    if (WeightType = '�ֹ�') or (WeightType = 'Ԥ��') then
      sqlstr := sqlstr +
        ':grosstime,:taretime,'
    else if WeightField = 'ë��' then
      sqlstr := sqlstr + ':grosstime,'
    else if WeightField = '����' then
      sqlstr := sqlstr + ':taretime,';
    sqlstr := sqlstr + ':remark)';
  end
  else if (WeightType = '����') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update ������Ϣ set ����1=:backup1,����2=:backup2,'
      + '����3=:backup3,����4=:backup4,����5=:backup5,����6=:backup6,'
      + '����7=:backup7,����8=:backup8,����9=:backup9,������λ=:fahuo,�ջ���λ=:shouhuo,'
      + '����=:goods,���=:spec,ë��=:gross,����=:tare,����=:net,����=:bundle,'
      + 'ʵ��=:real,����=:price,���=:sum,������=:charge,����Ա=:oper,';
    if WeightField = 'ë��' then
      sqlstr := sqlstr + 'ë��ʱ��=:grosstime,'
        + '��ע=:remark'
    else if WeightField = '����' then
      sqlstr := sqlstr + '����ʱ��=:taretime,'
        + '��ע=:remark';
    sqlstr := sqlstr + ' where ��ˮ��=:glideno';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = '����' then
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

    if WeightType = '����' then
    begin
      if WeightField = 'ë��' then
      begin
        Parameters.ParamByName('grosstime').Value := Now;
      end
      else if WeightField = '����' then
      begin
        Parameters.ParamByName('taretime').Value := Now;
      end
    end
    else
    begin
      if WeightField = 'ë��' then
      begin
        Parameters.ParamByName('grosstime').Value := Now;
      end
      else if WeightField = '����' then
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
  BitBtnClear.Caption := '���(&C)';
  CBCar.SetFocus;

  if systemConfig.waitForZero then
  begin
    PRight.Visible := False;
    TWaitForZero.Enabled := True;
  end;
end;

procedure TMainForm.SMPreMaintainClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('Ԥ��ά��') then
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
    ShowMsg('�Բ�����û��Ԥ��ά��Ȩ�ޣ��޷�����Ԥ��ά����')
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
  if TDBCommonUtil.HasAuthority('��������') then
  begin
    Application.CreateForm(TDBClearForm, DBClearForm);
    try
      DBClearForm.ShowModal;
    finally
      DBClearForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û�����ݵ���Ȩ�ޣ��޷��������ݿ�����')
end;

procedure TMainForm.TAutoBackupTimer(Sender: TObject); //ÿСʱ����
begin
  Application.CreateForm(TDBBackupForm, DBBackupForm);
  DBBackupForm.ShowModal
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TCommonUtil.getIni.ReadBool('ϵͳ����', '����XML', false) then
  begin
    case TCommonUtil.getIni.ReadInteger('ϵͳ����', 'XML������ʽ', 0) of
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
    //�ж�ԭ����ʽ
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
  if (CBAutoClear.Checked) or (BitBtnClear.Caption = '���(&C)') then
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
  if BitBtnGross.Visible then //��հ�ť��ȡ����ť�л�
    BitBtnClear.Caption := '���(&C)';
  if BitBtnSave.Visible then
    BitBtnClear.Caption := 'ȡ��(&C)'
end;

procedure TMainForm.BitBtnPrintClick(Sender: TObject);
var
  Num: string;
begin
  BitBtnClear.Caption := '���(&C)';
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
  if TDBCommonUtil.HasAuthority('�ֹ�����') then
  begin
    Application.CreateForm(TInputWeightForm, InputWeightForm);
    try
      InputWeightForm.ShowModal;
    finally
      InputWeightForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û���ֹ�����Ȩ�ޣ��޷������ֹ��������룡')
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
  if TDBCommonUtil.HasAuthority('����Ա') then
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
    ShowMsg('�Բ��������ǹ���Ա���޷�����ģ����أ�')
end;

procedure TMainForm.SPMPrintClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString, True);
  end
end;

procedure TMainForm.SPMDeleteClick(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('����ά��') then
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
  //����������,����о��صó�,�ͱ�����,���򱨵�ǰ����
  if PNet.Caption = '0' then
    ReadWeightForm.EdtSource.Text := getWeight
  else
    ReadWeightForm.EdtSource.Text := PNet.Caption;
  ReadWeightForm.BtnRead.Click;
  TReadWeight.Enabled := false;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('��ӡ����') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString);
  end
end;

procedure TMainForm.CBAutoClearClick(Sender: TObject);
begin
  TCommonUtil.getIni.WriteBool('������', '�Զ����', CBAutoClear.Checked)
end;

procedure TMainForm.CBPreviewClick(Sender: TObject);
begin
  TCommonUtil.getIni.WriteBool('������', 'Ԥ����ӡ', CBPreview.Checked)
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
  if MessageDlg('ȷʵҪɾ��������¼��?', mtConfirmation, [mbOK, mbCancel], 0) =
    mrOk then
  begin
    DBGridEh1.DataSource.DataSet.Delete;
  end;
end;

procedure TMainForm.SetCurrentUser(const Value: string);
begin
  FCurrentUser := Value;
  SpUser.Caption := Format('��ǰ�û�: %s', [Value]);
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
    SQL.Text := 'select top 1 * from ������Ϣ where (����=:carNo) and (����=0) order by ��� desc';
    Parameters.ParamByName('carNo').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      CBFaHuo.Text := FieldByName('������λ').AsString;
      CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
      CBGoods.Text := FieldByName('����').AsString;
      CBSpec.Text := FieldByName('���').AsString;
      CBBundle.Text := FieldByName('����').AsString;
      CBPrice.Text := FieldByName('����').AsString;
      CBRemark.Text := FieldByName('��ע').AsString;
      CBBackup1.Text := FieldByName('����1').AsString;
      CBBackup2.Text := FieldByName('����2').AsString;
      CBBackup3.Text := FieldByName('����3').AsString;
      CBBackup4.Text := FieldByName('����4').AsString;
      CBBackup5.Text := FieldByName('����5').AsString;
      CBBackup6.Text := FieldByName('����6').AsString;
      CBBackup7.Text := FieldByName('����7').AsString;
      CBBackup8.Text := FieldByName('����8').AsString;
      CBBackup9.Text := FieldByName('����9').AsString;
      PGross.Caption := FieldByName('ë��').AsString;
      PTare.Caption := FieldByName('����').AsString;
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

  if (lblUnit1.Caption = '��  ��') or (lblUnit1.Caption = 'KG') or (lblUnit1.Caption
    = 'kg') then
    CBCost.Value := RoundTo(UnitPound * (w / 1000), 0 -
      systemConfig.scalePoint) //С����λ��
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

  if (lblUnit1.Caption = '��  ��') or (lblUnit1.Caption = 'KG') or (lblUnit1.Caption
    = 'kg') then
    CBCost.Value := RoundTo(UnitPound * (w / 1000), 0 -
      systemConfig.scalePoint) //С����λ��
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

  if (lblUnit1.Caption = '��  ��') or (lblUnit1.Caption = 'KG') or (lblUnit1.Caption
    = 'kg') then
    CBCost.Value := RoundTo(UnitPound * (w / 1000), 0 -
      systemConfig.scalePoint) //С����λ��
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
  //��̨�Զ���������
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
  if TDBCommonUtil.HasAuthority('ϵͳ����') then
  begin
    Application.CreateForm(TTicketSetForm, TicketSetForm);
    try
      TicketSetForm.ShowModal();
    finally
      TicketSetForm.Free;
    end;
  end
  else
    ShowMsg('�Բ�����û�а����޸�Ȩ�ޣ��޷����а����޸ģ�')
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
  if TDBCommonUtil.HasAuthority('��ӡ����') then
  begin
    f := TCommonUtil.getIni.ReadString('ϵͳ����', '������ʽ',
      ExtractFilePath(ParamStr(0)) + '\Ticket\��׼���.fr3');
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
    //�����ߵ���������9,�Ͱѱ�����Ŀ�ŵ��������
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

  DBGridEh1.FieldColumns['���'].Visible := systemConfig.noVisible;
  DBGridEh1.FieldColumns['��ˮ��'].Visible := systemConfig.glideNoVisible;
  DBGridEh1.FieldColumns['����Ա'].Visible := systemConfig.operVisible;
  DBGridEh1.FieldColumns['����Ա'].Visible := systemConfig.scaleManVisible;
  DBGridEh1.FieldColumns['�ϴ���'].Visible := systemConfig.uploadVisible;

  DBGridEh1.FieldColumns['����'].Visible := systemConfig.carVisible;
  DBGridEh1.FieldColumns['������λ'].Visible := systemConfig.faHuoVisible;
  DBGridEh1.FieldColumns['�ջ���λ'].Visible := systemConfig.shouHuoVisible;
  DBGridEh1.FieldColumns['����'].Visible := systemConfig.goodsVisible;
  DBGridEh1.FieldColumns['���'].Visible := systemConfig.specVisible;
  DBGridEh1.FieldColumns['ë��'].Visible := systemConfig.grossVisible;
  DBGridEh1.FieldColumns['����'].Visible := systemConfig.tareVisible;
  DBGridEh1.FieldColumns['����'].Visible := systemConfig.netVisible;
  DBGridEh1.FieldColumns['����'].Visible := systemConfig.bundleVisible;
  DBGridEh1.FieldColumns['ʵ��'].Visible := systemConfig.realVisible;
  DBGridEh1.FieldColumns['����'].Visible := systemConfig.priceVisible;
  DBGridEh1.FieldColumns['���'].Visible := systemConfig.sumVisible;
  DBGridEh1.FieldColumns['������'].Visible := systemConfig.costVisible;
  DBGridEh1.FieldColumns['ë��ʱ��'].Visible := systemConfig.grossTimeVisible;
  DBGridEh1.FieldColumns['����ʱ��'].Visible := systemConfig.tareTimeVisible;
  DBGridEh1.FieldColumns['��ע'].Visible := systemConfig.remarkVisible;
  DBGridEh1.FieldColumns['����1'].Visible := systemConfig.backup1Visible;
  DBGridEh1.FieldColumns['����2'].Visible := systemConfig.backup2Visible;
  DBGridEh1.FieldColumns['����3'].Visible := systemConfig.backup3Visible;
  DBGridEh1.FieldColumns['����4'].Visible := systemConfig.backup4Visible;
  DBGridEh1.FieldColumns['����5'].Visible := systemConfig.backup5Visible;
  DBGridEh1.FieldColumns['����6'].Visible := systemConfig.backup6Visible;
  DBGridEh1.FieldColumns['����7'].Visible := systemConfig.backup7Visible;
  DBGridEh1.FieldColumns['����8'].Visible := systemConfig.backup8Visible;
  DBGridEh1.FieldColumns['����9'].Visible := systemConfig.backup9Visible;

  DBGridEh1.FieldColumns['����'].Title.Caption := lblCar.Caption;
  DBGridEh1.FieldColumns['������λ'].Title.Caption := lblFaHuo.Caption;
  DBGridEh1.FieldColumns['�ջ���λ'].Title.Caption := lblShouHuo.Caption;
  DBGridEh1.FieldColumns['����'].Title.Caption := lblGoods.Caption;
  DBGridEh1.FieldColumns['���'].Title.Caption := lblSpec.Caption;
  DBGridEh1.FieldColumns['����'].Title.Caption := lblBundle.Caption;
  DBGridEh1.FieldColumns['����'].Title.Caption := lblPrice.Caption;
  DBGridEh1.FieldColumns['������'].Title.Caption := lblCost.Caption;
  DBGridEh1.FieldColumns['��ע'].Title.Caption := lblRemark.Caption;

  DBGridEh1.FieldColumns['ë��'].Title.Caption := lblGross.Caption;
  DBGridEh1.FieldColumns['����'].Title.Caption := lblTare.Caption;
  DBGridEh1.FieldColumns['����'].Title.Caption := lblNet.Caption;
  DBGridEh1.FieldColumns['ʵ��'].Title.Caption := lblReal.Caption;
  DBGridEh1.FieldColumns['���'].Title.Caption := lblSum.Caption;

  DBGridEh1.FieldColumns['����1'].Title.Caption := lblBackup1.Caption;
  DBGridEh1.FieldColumns['����2'].Title.Caption := lblBackup2.Caption;
  DBGridEh1.FieldColumns['����3'].Title.Caption := lblBackup3.Caption;
  DBGridEh1.FieldColumns['����4'].Title.Caption := lblBackup4.Caption;
  DBGridEh1.FieldColumns['����5'].Title.Caption := lblBackup5.Caption;
  DBGridEh1.FieldColumns['����6'].Title.Caption := lblBackup6.Caption;
  DBGridEh1.FieldColumns['����7'].Title.Caption := lblBackup7.Caption;
  DBGridEh1.FieldColumns['����8'].Title.Caption := lblBackup8.Caption;
  DBGridEh1.FieldColumns['����9'].Title.Caption := lblBackup9.Caption;

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
  if TDBCommonUtil.HasAuthority('�ֹ�����') then
  begin
    PWeight1.Caption := FloatToStr(StrToFloatDef(InputBox('����������    ', '����������    ',
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
  TCommonUtil.getIni.WriteBool('������', '�򵥹���', (Sender as TCheckBox).Checked);
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
    ShowMsg('�����򳵺Ų���Ϊ�գ������޷����в�����');
    Exit
  end;
  PGross.Caption := '0';
  PTare.Caption := '0';
  PNet.Caption := '0';
  PReal.Caption := '0';
  PSum.Caption := '0';
  //�ȴ��ȶ�����ܳ���
  if not getSteady then
    Exit;

  TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text); //Ԥ�ó���,��λ����Ϣ
  TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text); //Ԥ�ñ�����Ŀ

  PGross.Caption := getWeight; //��ȡ��ǰ����
  UpdateRecNo := ''; //����Ǹ��µĻ���ȡ��һ�εĺ���
  WeightType := '����'; //�������ͣ�һ���ǲ��룬һ���Ǹ���
  WeightField := 'ë��';

  operator := CurrentUser;
  //���ù�����
  CreateGrossPoundCharge();

  //һ�ι���
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
    ShowMsg('���ز��Ϸ�!');
    Exit
  end;

  if ((WeightType = '����') or (WeightType = 'Ԥ��') or (WeightType = '�ֹ�'))
    then
  begin
    MaxGlideNo := TDBCommonUtil.getMaxGlideNo;
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into ������Ϣ(����1,����2,����3,����4,����5,����6,����7,����8,����9,'
      + '��ˮ��,����,����Ա,������λ,�ջ���λ,'
      + '����,���,ë��,����,����,����,ʵ��,����,���,������,����Ա,';
    if (WeightType = '�ֹ�') or (WeightType = 'Ԥ��') then
      sqlStr := sqlStr +
        'ë��ʱ��,����ʱ��,��ע)'
    else if WeightField = 'ë��' then
      sqlStr := sqlStr + 'ë��ʱ��,��ע)'
    else if WeightField = '����' then
      sqlStr := sqlStr + '����ʱ��,��ע)';

    sqlstr := sqlstr + ' values(:backup1,:backup2,:backup3,:backup4,:backup5,:backup6,'
      + ':backup7,:backup8,:backup9,:glideno,:car,:user,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:charge,:oper,';
    if (WeightType = '�ֹ�') or (WeightType = 'Ԥ��') then
      sqlstr := sqlstr +
        ':grosstime,:taretime,'
    else if WeightField = 'ë��' then
      sqlstr := sqlstr + ':grosstime,'
    else if WeightField = '����' then
      sqlstr := sqlstr + ':taretime,';
    sqlstr := sqlstr + ':remark)';
  end
  else if (WeightType = '����') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update ������Ϣ set ����1=:backup1,����2=:backup2,'
      + '����3=:backup3,����4=:backup4,����5=:backup5,����6=:backup6,'
      + '����7=:backup7,����8=:backup8,����9=:backup9,������λ=:fahuo,�ջ���λ=:shouhuo,'
      + '����=:goods,���=:spec,ë��=:gross,����=:tare,����=:net,����=:bundle,'
      + 'ʵ��=:real,����=:price,���=:sum,������=:charge,����Ա=:oper,';
    sqlstr := sqlstr + '����ʱ��=:taretime,'
      + '��ע=:remark';
    sqlstr := sqlstr + ' where ��ˮ��=:glideno';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = '����' then
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

    if WeightType = '����' then
    begin
      Parameters.ParamByName('taretime').Value := Now;
    end
    else
    begin
      if WeightField = 'ë��' then
      begin
        Parameters.ParamByName('grosstime').Value := Now;
      end
      else if WeightField = '����' then
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
  BitBtnClear.Caption := '���(&C)';
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
  //��Ѱ�ϴε�ë�ؼ�¼
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From ������Ϣ Where (����=:car) '
      + 'And (����=0) and (ë��<>0) and (����=0) Order By ��ˮ��');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then //��ѯ�����Ϊ��
    begin
      PTare.Caption := getWeight;

      if FieldByName('������λ').AsString <> '' then
        CBFaHuo.Text := FieldByName('������λ').AsString;
      if FieldByName('�ջ���λ').AsString <> '' then
        CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
      if FieldByName('����').AsString <> '' then
        CBGoods.Text := FieldByName('����').AsString;
      if FieldByName('���').AsString <> '' then
        CBSpec.Text := FieldByName('���').AsString;
      if FieldByName('����').AsFloat <> 0 then
        CBBundle.Text := FieldByName('����').AsString;
      if FieldByName('����').AsFloat <> 0 then
        CBPrice.Text := FieldByName('����').AsString;
      if FieldByName('��ע').AsString <> '' then
        CBRemark.Text := FieldByName('��ע').AsString;

      if FieldByName('����1').AsString <> '' then
        CBBackup1.Text := FieldByName('����1').AsString;
      if FieldByName('����2').AsString <> '' then
        CBBackup2.Text := FieldByName('����2').AsString;
      if FieldByName('����3').AsString <> '' then
        CBBackup3.Text := FieldByName('����3').AsString;
      if FieldByName('����4').AsString <> '' then
        CBBackup4.Text := FieldByName('����4').AsString;
      if FieldByName('����5').AsString <> '' then
        CBBackup5.Text := FieldByName('����5').AsString;

      if FieldByName('����6').AsFloat <> 0 then
        CBBackup6.Text := FieldByName('����6').AsString;
      if FieldByName('����7').AsFloat <> 0 then
        CBBackup7.Text := FieldByName('����7').AsString;
      if FieldByName('����8').AsFloat <> 0 then
        CBBackup8.Text := FieldByName('����8').AsString;
      if FieldByName('����9').AsFloat <> 0 then
        CBBackup9.Text := FieldByName('����9').AsString;

      PGross.Caption := FieldByName('ë��').AsString; //ë��-����
      PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
        StrToFloatDef(PTare.Caption, 0));

      //�������Ϊ��,��ת��ë�غͿ���
      if StrToFloatDef(PNet.Caption, 0) < 0 then
      begin
        PNet.Caption := PGross.Caption;
        PGross.Caption := PTare.Caption;
        PTare.Caption := PNet.Caption;
        PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) -
          StrToFloatDef(PTare.Caption, 0));
      end;

      CalcNet;
      //���¹�����
      UpdatePoundCharge(FieldByName('������').AsFloat);
      WeightType := '����';
      UpdateRecNo := FieldByName('��ˮ��').AsString;
      operator := FieldByName('����Ա').AsString + ',' + operator;
    end
  end;
end;

function TMainForm.getWeight: string;
begin
  Result := PWeight1.Caption;
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  if TDBCommonUtil.HasAuthority('����ά��') then
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
    ShowMsg('���ݿ��޷��򿪣�����!');
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
  if TDBCommonUtil.HasAuthority('�ֹ�����') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.Caption := '��Ӱ���';
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
  //�ȵ�������
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

  Application.Title := '���ع���ϵͳ';
  Caption := '���ع���ϵͳ';
  SpInfo.Caption := Format('%s ʹ�õ�λ:%s �绰����:%s', ['���ع���ϵͳ', systemConfig.company, systemConfig.tel]);

  SpMode.Caption := '[����ģʽ]';

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
    Application.MessageBox(PChar(Format('Ԥ��Ƥ�سɹ�!����:[%s],Ƥ��:[%s]', [CBCar.Text, getWeight
      ])), '��ʾ', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
  end
  else
  begin
    Application.MessageBox('Ԥ��Ƥ��ʧ��!', '��ʾ', MB_OK + MB_ICONSTOP +
      MB_TOPMOST);
  end;
end;

procedure TMainForm.DBGridEh1DblClick(Sender: TObject);
begin
  if PInfo.Visible then
  begin
    with DBGridEh1.DataSource.DataSet do
    begin
      CBCar.Text := FieldByName('����').AsString;
      CBFaHuo.Text := FieldByName('������λ').AsString;
      CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
      CBGoods.Text := FieldByName('����').AsString;
      CBSpec.Text := FieldByName('���').AsString;
      CBBundle.Text := FieldByName('����').AsString;
      CBPrice.Text := FieldByName('����').AsString;
      CBCost.Text := FieldByName('������').AsString;
      CBRemark.Text := FieldByName('��ע').AsString;
      CBBackup1.Text := FieldByName('����1').AsString;
      CBBackup2.Text := FieldByName('����2').AsString;
      CBBackup3.Text := FieldByName('����3').AsString;
      CBBackup4.Text := FieldByName('����4').AsString;
      CBBackup5.Text := FieldByName('����5').AsString;
      CBBackup6.Text := FieldByName('����6').AsString;
      CBBackup7.Text := FieldByName('����7').AsString;
      CBBackup8.Text := FieldByName('����8').AsString;
      CBBackup9.Text := FieldByName('����9').AsString;
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
  if TDBCommonUtil.HasAuthority('ϵͳ����') then
  begin
    Application.CreateForm(TWeightSetForm, WeightSetForm);
    try
      WeightSetForm.ShowModal;
    finally
      WeightSetForm.Free
    end
  end
  else
    ShowMsg('�Բ�����û��ϵͳ����Ȩ�ޣ��޷����г��ؽ������ã�');
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

