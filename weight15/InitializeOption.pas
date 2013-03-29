unit InitializeOption;

interface

uses
  Windows, Classes, Controls, Forms,
  StdCtrls, Buttons;

type
  TInitializeOptionForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBWeight: TCheckBox;
    CBUser: TCheckBox;
    CBCar: TCheckBox;
    CBGoods: TCheckBox;
    CBSpec: TCheckBox;
    CBFaHuo: TCheckBox;
    CBShouHuo: TCheckBox;
    CBBackup1: TCheckBox;
    CBBackup2: TCheckBox;
    CBBackup3: TCheckBox;
    CBBackup4: TCheckBox;
    CBBackup5: TCheckBox;
    CBBackRecord: TCheckBox;
    CBLog: TCheckBox;
    CBTao: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InitializeOptionForm: TInitializeOptionForm;

implementation

uses
  Main, CommonUtil;

{$R *.dfm}

procedure TInitializeOptionForm.FormShow(Sender: TObject);
begin
  CBCar.Caption := MainForm.systemConfig.carCaption;
  CBFaHuo.Caption := MainForm.systemConfig.faHuoCaption;
  CBShouHuo.Caption := MainForm.systemConfig.shouHuoCaption;
  CBGoods.Caption := MainForm.systemConfig.goodsCaption;
  CBSpec.Caption := MainForm.systemConfig.specCaption;
  CBBackup1.Caption := MainForm.systemConfig.backup1Caption;
  CBBackup2.Caption := MainForm.systemConfig.backup2Caption;
  CBBackup3.Caption := MainForm.systemConfig.backup3Caption;
  CBBackup4.Caption := MainForm.systemConfig.backup4Caption;
  CBBackup5.Caption := MainForm.systemConfig.backup5Caption;
end;

procedure TInitializeOptionForm.BitBtn1Click(Sender: TObject);
begin
  try
    if CBWeight.Checked then TDBCommonUtil.clearWeightInfo;
    if CBUser.Checked then TDBCommonUtil.clearUserInfo;
    if CBCar.Checked then TDBCommonUtil.clearCar;
    if CBFaHuo.Checked then TDBCommonUtil.clearFaHuo;
    if CBShouHuo.Checked then TDBCommonUtil.clearShouHuo;
    if CBGoods.Checked then TDBCommonUtil.clearGoods;
    if CBSpec.Checked then TDBCommonUtil.clearSpec;
    if CBBackup1.Checked then TDBCommonUtil.clearBackup1;
    if CBBackup2.Checked then TDBCommonUtil.clearBackup2;
    if CBBackup3.Checked then TDBCommonUtil.clearBackup3;
    if CBBackup4.Checked then TDBCommonUtil.clearBackup4;
    if CBBackup5.Checked then TDBCommonUtil.clearBackup5;
    if CBBackRecord.Checked then TDBCommonUtil.clearBackRecord;
    if CBLog.Checked then TDBCommonUtil.clearLog;
    if CBTao.Checked then TDBCommonUtil.clearTao;
    Application.MessageBox('数据库初始化成功!', '提示', MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  except
    Application.MessageBox('数据库初始化失败!', '错误', MB_OK + MB_ICONSTOP +
      MB_TOPMOST);
  end;
end;

end.
