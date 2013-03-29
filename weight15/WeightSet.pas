unit WeightSet;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, IniFiles, ExtCtrls;

type
  TWeightSetForm = class(TForm)
    CBCar: TCheckBox;
    CBFaHuo: TCheckBox;
    CBShouHuo: TCheckBox;
    CBGoods: TCheckBox;
    CBSpec: TCheckBox;
    CBBundle: TCheckBox;
    CBPrice: TCheckBox;
    CBRemark: TCheckBox;
    CBCost: TCheckBox;
    CBBackup1: TCheckBox;
    CBBackup2: TCheckBox;
    CBBackup3: TCheckBox;
    CBBackup4: TCheckBox;
    CBBackup5: TCheckBox;
    CBBackup6: TCheckBox;
    CBBackup7: TCheckBox;
    CBBackup8: TCheckBox;
    CBBackup9: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdtCar: TEdit;
    EdtFaHuo: TEdit;
    EdtShouHuo: TEdit;
    EdtGoods: TEdit;
    CBGross: TCheckBox;
    CBTare: TCheckBox;
    CBNet: TCheckBox;
    CBReal: TCheckBox;
    CBSum: TCheckBox;
    CBGrossTime: TCheckBox;
    CBTareTime: TCheckBox;
    EdtSpec: TEdit;
    EdtGross: TEdit;
    EdtTare: TEdit;
    EdtNet: TEdit;
    EdtBundle: TEdit;
    EdtReal: TEdit;
    EdtPrice: TEdit;
    EdtSum: TEdit;
    EdtCost: TEdit;
    EdtGrossTime: TEdit;
    EdtTareTime: TEdit;
    EdtRemark: TEdit;
    EdtBackup1: TEdit;
    EdtBackup2: TEdit;
    EdtBackup3: TEdit;
    EdtBackup4: TEdit;
    EdtBackup5: TEdit;
    EdtBackup6: TEdit;
    EdtBackup7: TEdit;
    EdtBackup8: TEdit;
    EdtBackup9: TEdit;
    EdtCarDefault: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtFaHuoDefault: TEdit;
    EdtShouHuoDefault: TEdit;
    EdtSpecDefault: TEdit;
    EdtTareDefault: TEdit;
    EdtBundleDefault: TEdit;
    EdtPriceDefault: TEdit;
    EdtCostDefault: TEdit;
    EdtTareTimeDefault: TEdit;
    EdtBackup1Default: TEdit;
    EdtBackup3Default: TEdit;
    EdtBackup5Default: TEdit;
    EdtGoodsDefault: TEdit;
    EdtGrossDefault: TEdit;
    EdtNetDefault: TEdit;
    EdtRealDefault: TEdit;
    EdtSumDefault: TEdit;
    EdtGrossTimeDefault: TEdit;
    EdtRemarkDefault: TEdit;
    EdtBackup2Default: TEdit;
    EdtBackup4Default: TEdit;
    CBNo: TCheckBox;
    CBOper: TCheckBox;
    CBScaleMan: TCheckBox;
    CBUpload: TCheckBox;
    CBGlideNo: TCheckBox;
    CBClearCar: TCheckBox;
    CBClearShouHuo: TCheckBox;
    CBClearSpec: TCheckBox;
    CBClearTare: TCheckBox;
    CBClearBundle: TCheckBox;
    CBClearPrice: TCheckBox;
    CBClearCost: TCheckBox;
    CBClearTareTime: TCheckBox;
    CBClearBackup1: TCheckBox;
    CBClearBackup3: TCheckBox;
    CBClearBackup5: TCheckBox;
    CBClearFahuo: TCheckBox;
    CBClearGoods: TCheckBox;
    CBClearGross: TCheckBox;
    CBClearNet: TCheckBox;
    CBClearReal: TCheckBox;
    CBClearSum: TCheckBox;
    CBClearGrossTime: TCheckBox;
    CBClearRemark: TCheckBox;
    CBClearBackup2: TCheckBox;
    CBClearBackup4: TCheckBox;
    Label8: TLabel;
    CBClearBackup6: TCheckBox;
    CBClearBackup7: TCheckBox;
    CBClearBackup8: TCheckBox;
    CBClearBackup9: TCheckBox;
    Bevel1: TBevel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function loadFormDesign(): Boolean;
    function writeFormDesign(): Boolean;
  end;

var
  WeightSetForm: TWeightSetForm;

implementation

uses Main;

{$R *.dfm}

function TWeightSetForm.loadFormDesign: Boolean;
var myini: TIniFile;
begin
  myini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + 'design.ini');
  try
    CBNo.Checked := myini.ReadBool('formDesign', 'no', False);
    CBGlideNo.Checked := myini.ReadBool('formDesign', 'glideNo', True);
    CBOper.Checked := myini.ReadBool('formDesign', 'oper', True);
    CBScaleMan.Checked := myini.ReadBool('formDesign', 'scaleMan', True);
    CBUpload.Checked := myini.ReadBool('formDesign', 'upload', False);

    CBCar.Checked := myini.ReadBool('formDesign', 'car', True);
    CBFaHuo.Checked := myini.ReadBool('formDesign', 'faHuo', True);
    CBShouHuo.Checked := myini.ReadBool('formDesign', 'shouHuo', True);
    CBGoods.Checked := myini.ReadBool('formDesign', 'goods', True);
    CBSpec.Checked := myini.ReadBool('formDesign', 'spec', True);

    CBGross.Checked := myini.ReadBool('formDesign', 'grosss', True);
    CBTare.Checked := myini.ReadBool('formDesign', 'tare', True);
    CBNet.Checked := myini.ReadBool('formDesign', 'net', True);
    CBBundle.Checked := myini.ReadBool('formDesign', 'bundle', True);
    CBReal.Checked := myini.ReadBool('formDesign', 'real', True);

    CBPrice.Checked := myini.ReadBool('formDesign', 'price', True);
    CBSum.Checked := myini.ReadBool('formDesign', 'sum', True);
    CBCost.Checked := myini.ReadBool('formDesign', 'cost', True);
    CBGrossTime.Checked := myini.ReadBool('formDesign', 'grossTime', True);
    CBTareTime.Checked := myini.ReadBool('formDesign', 'tareTime', True);
    CBRemark.Checked := myini.ReadBool('formDesign', 'remark', True);

    CBBackup1.Checked := myini.ReadBool('formDesign', 'backup1', False);
    CBBackup2.Checked := myini.ReadBool('formDesign', 'backup2', False);
    CBBackup3.Checked := myini.ReadBool('formDesign', 'backup3', False);
    CBBackup4.Checked := myini.ReadBool('formDesign', 'backup4', False);
    CBBackup5.Checked := myini.ReadBool('formDesign', 'backup5', False);
    CBBackup6.Checked := myini.ReadBool('formDesign', 'backup6', False);
    CBBackup7.Checked := myini.ReadBool('formDesign', 'backup7', False);
    CBBackup8.Checked := myini.ReadBool('formDesign', 'backup8', False);
    CBBackup9.Checked := myini.ReadBool('formDesign', 'backup9', False);
    ////////////////////////////////////////////////////////////////////
    //读显示名称
    EdtCar.Text := myini.ReadString('formDesign', 'carCaption', '车　号');
    EdtFaHuo.Text := myini.ReadString('formDesign', 'faHuoCaption', '发货单位');
    EdtShouHuo.Text := myini.ReadString('formDesign', 'shouHuoCaption', '收货单位');
    EdtGoods.Text := myini.ReadString('formDesign', 'goodsCaption', '货　名');
    EdtSpec.Text := myini.ReadString('formDesign', 'specCaption', '规　格');

    EdtGross.Text := myini.ReadString('formDesign', 'grosssCaption', '毛　重');
    EdtTare.Text := myini.ReadString('formDesign', 'tareCaption', '空　重');
    EdtNet.Text := myini.ReadString('formDesign', 'netCaption', '净　重');
    EdtBundle.Text := myini.ReadString('formDesign', 'bundleCaption', '扣　重');
    EdtReal.Text := myini.ReadString('formDesign', 'realCaption', '实　重');

    EdtPrice.Text := myini.ReadString('formDesign', 'priceCaption', '单　价');
    EdtSum.Text := myini.ReadString('formDesign', 'sumCaption', '金　额');
    EdtCost.Text := myini.ReadString('formDesign', 'costCaption', '过磅费');
    EdtGrossTime.Text := myini.ReadString('formDesign', 'grossTimeCaption', '毛重时间');
    EdtTareTime.Text := myini.ReadString('formDesign', 'tareTimeCaption', '空重时间');
    EdtRemark.Text := myini.ReadString('formDesign', 'remarkCaption', '备　注');

    EdtBackup1.Text := myini.ReadString('formDesign', 'backup1Caption', '备用1');
    EdtBackup2.Text := myini.ReadString('formDesign', 'backup2Caption', '备用2');
    EdtBackup3.Text := myini.ReadString('formDesign', 'backup3Caption', '备用3');
    EdtBackup4.Text := myini.ReadString('formDesign', 'backup4Caption', '备用4');
    EdtBackup5.Text := myini.ReadString('formDesign', 'backup5Caption', '备用5');
    EdtBackup6.Text := myini.ReadString('formDesign', 'backup6Caption', '备用6');
    EdtBackup7.Text := myini.ReadString('formDesign', 'backup7Caption', '备用7');
    EdtBackup8.Text := myini.ReadString('formDesign', 'backup8Caption', '备用8');
    EdtBackup9.Text := myini.ReadString('formDesign', 'backup9Caption', '备用9');
    ////////////////////////////////////////////////////////////////////
    //读默认值
    EdtCarDefault.Text := myini.ReadString('formDesign', 'carDefault', '');
    EdtFaHuoDefault.Text := myini.ReadString('formDesign', 'faHuoDefault', '');
    EdtShouHuoDefault.Text := myini.ReadString('formDesign', 'shouHuoDefault', '');
    EdtGoodsDefault.Text := myini.ReadString('formDesign', 'goodsDefault', '');
    EdtSpecDefault.Text := myini.ReadString('formDesign', 'specDefault', '');

    EdtGrossDefault.Text := myini.ReadString('formDesign', 'grosssDefault', '');
    EdtTareDefault.Text := myini.ReadString('formDesign', 'tareDefault', '');
    EdtNetDefault.Text := myini.ReadString('formDesign', 'netDefault', '');
    EdtBundleDefault.Text := myini.ReadString('formDesign', 'bundleDefault', '');
    EdtRealDefault.Text := myini.ReadString('formDesign', 'realDefault', '');

    EdtPriceDefault.Text := myini.ReadString('formDesign', 'priceDefault', '');
    EdtSumDefault.Text := myini.ReadString('formDesign', 'sumDefault', '');
    EdtCostDefault.Text := myini.ReadString('formDesign', 'costDefault', '');
    EdtGrossTimeDefault.Text := myini.ReadString('formDesign', 'grossTimeDefault', '');
    EdtTareTimeDefault.Text := myini.ReadString('formDesign', 'tareTimeDefault', '');
    EdtRemarkDefault.Text := myini.ReadString('formDesign', 'remarkDefault', '');

    EdtBackup1Default.Text := myini.ReadString('formDesign', 'backup1Default', '');
    EdtBackup2Default.Text := myini.ReadString('formDesign', 'backup2Default', '');
    EdtBackup3Default.Text := myini.ReadString('formDesign', 'backup3Default', '');
    EdtBackup4Default.Text := myini.ReadString('formDesign', 'backup4Default', '');
    EdtBackup5Default.Text := myini.ReadString('formDesign', 'backup5Default', '');

    //自动清空选项
    CBClearCar.Checked := myini.ReadBool('formDesign', 'clearCar', True);
    CBClearFaHuo.Checked := myini.ReadBool('formDesign', 'clearFaHuo', True);
    CBClearShouHuo.Checked := myini.ReadBool('formDesign', 'clearShouHuo', True);
    CBClearGoods.Checked := myini.ReadBool('formDesign', 'clearGoods', True);
    CBClearSpec.Checked := myini.ReadBool('formDesign', 'clearSpec', True);
    CBClearGross.Checked := myini.ReadBool('formDesign', 'clearGross', True);
    CBClearTare.Checked := myini.ReadBool('formDesign', 'clearTare', True);
    CBClearNet.Checked := myini.ReadBool('formDesign', 'clearNet', True);
    CBClearBundle.Checked := myini.ReadBool('formDesign', 'clearBundle', True);
    CBClearReal.Checked := myini.ReadBool('formDesign', 'clearReal', True);
    CBClearPrice.Checked := myini.ReadBool('formDesign', 'clearPrice', True);
    CBClearSum.Checked := myini.ReadBool('formDesign', 'clearSum', True);
    CBClearCost.Checked := myini.ReadBool('formDesign', 'clearCost', True);
    CBClearRemark.Checked := myini.ReadBool('formDesign', 'clearRemark', True);
    CBClearBackup1.Checked := myini.ReadBool('formDesign', 'clearBackup1', True);
    CBClearBackup2.Checked := myini.ReadBool('formDesign', 'clearBackup2', True);
    CBClearBackup3.Checked := myini.ReadBool('formDesign', 'clearBackup3', True);
    CBClearBackup4.Checked := myini.ReadBool('formDesign', 'clearBackup4', True);
    CBClearBackup5.Checked := myini.ReadBool('formDesign', 'clearBackup5', True);
    CBClearBackup6.Checked := myini.ReadBool('formDesign', 'clearBackup6', True);
    CBClearBackup7.Checked := myini.ReadBool('formDesign', 'clearBackup7', True);
    CBClearBackup8.Checked := myini.ReadBool('formDesign', 'clearBackup8', True);
    CBClearBackup9.Checked := myini.ReadBool('formDesign', 'clearBackup9', True);

  finally
    myini.Free;
  end;
end;

function TWeightSetForm.writeFormDesign: Boolean;
var myini: TIniFile;
begin
  myini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + 'design.ini');
  try
    //写入可见性
    myini.WriteBool('formDesign', 'no', CBNo.Checked);
    myini.WriteBool('formDesign', 'glideNo', CBGlideNo.Checked);
    myini.WriteBool('formDesign', 'oper', CBOper.Checked);
    myini.WriteBool('formDesign', 'scaleMan', CBScaleMan.Checked);
    myini.WriteBool('formDesign', 'upload', CBUpload.Checked);

    myini.WriteBool('formDesign', 'car', True);
    myini.WriteBool('formDesign', 'faHuo', CBFaHuo.Checked);
    myini.WriteBool('formDesign', 'shouHuo', CBShouHuo.Checked);
    myini.WriteBool('formDesign', 'goods', CBGoods.Checked);
    myini.WriteBool('formDesign', 'spec', CBSpec.Checked);

    myini.WriteBool('formDesign', 'grosss', CBGross.Checked);
    myini.WriteBool('formDesign', 'tare', CBTare.Checked);
    myini.WriteBool('formDesign', 'net', CBNet.Checked);
    myini.WriteBool('formDesign', 'bundle', CBBundle.Checked);
    myini.WriteBool('formDesign', 'real', CBReal.Checked);

    myini.WriteBool('formDesign', 'price', CBPrice.Checked);
    myini.WriteBool('formDesign', 'sum', CBSum.Checked);
    myini.WriteBool('formDesign', 'cost', CBCost.Checked);
    myini.WriteBool('formDesign', 'grossTime', CBGrossTime.Checked);
    myini.WriteBool('formDesign', 'tareTime', CBTareTime.Checked);
    myini.WriteBool('formDesign', 'remark', CBRemark.Checked);

    myini.WriteBool('formDesign', 'backup1', CBBackup1.Checked);
    myini.WriteBool('formDesign', 'backup2', CBBackup2.Checked);
    myini.WriteBool('formDesign', 'backup3', CBBackup3.Checked);
    myini.WriteBool('formDesign', 'backup4', CBBackup4.Checked);
    myini.WriteBool('formDesign', 'backup5', CBBackup5.Checked);
    myini.WriteBool('formDesign', 'backup6', CBBackup6.Checked);
    myini.WriteBool('formDesign', 'backup7', CBBackup7.Checked);
    myini.WriteBool('formDesign', 'backup8', CBBackup8.Checked);
    myini.WriteBool('formDesign', 'backup9', CBBackup9.Checked);
    ////////////////////////////////////////////////////////////////////
    //写显示名称
    myini.WriteString('formDesign', 'carCaption', EdtCar.Text);
    myini.WriteString('formDesign', 'faHuoCaption', EdtFaHuo.Text);
    myini.WriteString('formDesign', 'shouHuoCaption', EdtShouHuo.Text);
    myini.WriteString('formDesign', 'goodsCaption', EdtGoods.Text);
    myini.WriteString('formDesign', 'specCaption', EdtSpec.Text);

    myini.WriteString('formDesign', 'grosssCaption', EdtGross.Text);
    myini.WriteString('formDesign', 'tareCaption', EdtTare.Text);
    myini.WriteString('formDesign', 'netCaption', EdtNet.Text);
    myini.WriteString('formDesign', 'bundleCaption', EdtBundle.Text);
    myini.WriteString('formDesign', 'realCaption', EdtReal.Text);

    myini.WriteString('formDesign', 'priceCaption', EdtPrice.Text);
    myini.WriteString('formDesign', 'sumCaption', EdtSum.Text);
    myini.WriteString('formDesign', 'costCaption', EdtCost.Text);
    myini.WriteString('formDesign', 'grossTimeCaption', EdtGrossTime.Text);
    myini.WriteString('formDesign', 'tareTimeCaption', EdtTareTime.Text);
    myini.WriteString('formDesign', 'remarkCaption', EdtRemark.Text);

    myini.WriteString('formDesign', 'backup1Caption', EdtBackup1.Text);
    myini.WriteString('formDesign', 'backup2Caption', EdtBackup2.Text);
    myini.WriteString('formDesign', 'backup3Caption', EdtBackup3.Text);
    myini.WriteString('formDesign', 'backup4Caption', EdtBackup4.Text);
    myini.WriteString('formDesign', 'backup5Caption', EdtBackup5.Text);
    myini.WriteString('formDesign', 'backup6Caption', EdtBackup6.Text);
    myini.WriteString('formDesign', 'backup7Caption', EdtBackup7.Text);
    myini.WriteString('formDesign', 'backup8Caption', EdtBackup8.Text);
    myini.WriteString('formDesign', 'backup9Caption', EdtBackup9.Text);
    ////////////////////////////////////////////////////////////////////
    //写默认值
    myini.WriteString('formDesign', 'carDefault', EdtCarDefault.Text);
    myini.WriteString('formDesign', 'faHuoDefault', EdtFaHuoDefault.Text);
    myini.WriteString('formDesign', 'shouHuoDefault', EdtShouHuoDefault.Text);
    myini.WriteString('formDesign', 'goodsDefault', EdtGoodsDefault.Text);
    myini.WriteString('formDesign', 'specDefault', EdtSpecDefault.Text);

    myini.WriteString('formDesign', 'grosssDefault', EdtGrossDefault.Text);
    myini.WriteString('formDesign', 'tareDefault', EdtTareDefault.Text);
    myini.WriteString('formDesign', 'netDefault', EdtNetDefault.Text);
    myini.WriteString('formDesign', 'bundleDefault', EdtBundleDefault.Text);
    myini.WriteString('formDesign', 'realDefault', EdtRealDefault.Text);

    myini.WriteString('formDesign', 'priceDefault', EdtPriceDefault.Text);
    myini.WriteString('formDesign', 'sumDefault', EdtSumDefault.Text);
    myini.WriteString('formDesign', 'costDefault', EdtCostDefault.Text);
    myini.WriteString('formDesign', 'grossTimeDefault', EdtGrossTimeDefault.Text);
    myini.WriteString('formDesign', 'tareTimeDefault', EdtTareTimeDefault.Text);
    myini.WriteString('formDesign', 'remarkDefault', EdtRemarkDefault.Text);

    myini.WriteString('formDesign', 'backup1Default', EdtBackup1Default.Text);
    myini.WriteString('formDesign', 'backup2Default', EdtBackup2Default.Text);
    myini.WriteString('formDesign', 'backup3Default', EdtBackup3Default.Text);
    myini.WriteString('formDesign', 'backup4Default', EdtBackup4Default.Text);
    myini.WriteString('formDesign', 'backup5Default', EdtBackup5Default.Text);

    //自动清空选项
    myini.WriteBool('formDesign', 'clearCar', CBClearCar.Checked);
    myini.WriteBool('formDesign', 'clearFaHuo', CBClearFaHuo.Checked);
    myini.WriteBool('formDesign', 'clearShouHuo', CBClearShouHuo.Checked);
    myini.WriteBool('formDesign', 'clearGoods', CBClearGoods.Checked);
    myini.WriteBool('formDesign', 'clearSpec', CBClearSpec.Checked);
    myini.WriteBool('formDesign', 'clearGross', CBClearGross.Checked);
    myini.WriteBool('formDesign', 'clearTare', CBClearTare.Checked);
    myini.WriteBool('formDesign', 'clearNet', CBClearNet.Checked);
    myini.WriteBool('formDesign', 'clearBundle', CBClearBundle.Checked);
    myini.WriteBool('formDesign', 'clearReal', CBClearReal.Checked);
    myini.WriteBool('formDesign', 'clearPrice', CBClearPrice.Checked);
    myini.WriteBool('formDesign', 'clearSum', CBClearSum.Checked);
    myini.WriteBool('formDesign', 'clearCost', CBClearCost.Checked);
    myini.WriteBool('formDesign', 'clearRemark', CBClearRemark.Checked);
    myini.WriteBool('formDesign', 'clearBackup1', CBClearBackup1.Checked);
    myini.WriteBool('formDesign', 'clearBackup2', CBClearBackup2.Checked);
    myini.WriteBool('formDesign', 'clearBackup3', CBClearBackup3.Checked);
    myini.WriteBool('formDesign', 'clearBackup4', CBClearBackup4.Checked);
    myini.WriteBool('formDesign', 'clearBackup5', CBClearBackup5.Checked);
    myini.WriteBool('formDesign', 'clearBackup6', CBClearBackup6.Checked);
    myini.WriteBool('formDesign', 'clearBackup7', CBClearBackup7.Checked);
    myini.WriteBool('formDesign', 'clearBackup8', CBClearBackup8.Checked);
    myini.WriteBool('formDesign', 'clearBackup9', CBClearBackup9.Checked);

    /////////////////////////////////////////////////////////////////////////////////////
    //写到系统变量中
    MainForm.systemConfig.noVisible := CBNo.Checked;
    MainForm.systemConfig.glideNoVisible := CBGlideNo.Checked;
    MainForm.systemConfig.operVisible := CBOper.Checked;
    MainForm.systemConfig.scaleManVisible := CBScaleMan.Checked;
    MainForm.systemConfig.uploadVisible := CBUpload.Checked;

    MainForm.systemConfig.carVisible := True;
    MainForm.systemConfig.faHuoVisible := CBFaHuo.Checked;
    MainForm.systemConfig.shouHuoVisible := CBShouHuo.Checked;
    MainForm.systemConfig.goodsVisible := CBGoods.Checked;
    MainForm.systemConfig.specVisible := CBSpec.Checked;

    MainForm.systemConfig.grossVisible := CBGross.Checked;
    MainForm.systemConfig.tareVisible := CBTare.Checked;
    MainForm.systemConfig.netVisible := CBNet.Checked;
    MainForm.systemConfig.bundleVisible := CBBundle.Checked;
    MainForm.systemConfig.realVisible := CBReal.Checked;

    MainForm.systemConfig.priceVisible := CBPrice.Checked;
    MainForm.systemConfig.sumVisible := CBSum.Checked;
    MainForm.systemConfig.costVisible := CBCost.Checked;
    MainForm.systemConfig.grossTimeVisible := CBGrossTime.Checked;
    MainForm.systemConfig.tareTimeVisible := CBTareTime.Checked;
    MainForm.systemConfig.remarkVisible := CBRemark.Checked;

    MainForm.systemConfig.backup1Visible := CBBackup1.Checked;
    MainForm.systemConfig.backup2Visible := CBBackup2.Checked;
    MainForm.systemConfig.backup3Visible := CBBackup3.Checked;
    MainForm.systemConfig.backup4Visible := CBBackup4.Checked;
    MainForm.systemConfig.backup5Visible := CBBackup5.Checked;
    MainForm.systemConfig.backup6Visible := CBBackup6.Checked;
    MainForm.systemConfig.backup7Visible := CBBackup7.Checked;
    MainForm.systemConfig.backup8Visible := CBBackup8.Checked;
    MainForm.systemConfig.backup9Visible := CBBackup9.Checked;
    ////////////////////////////////////////////////////////////////////
    //写显示名称
    MainForm.systemConfig.carCaption := EdtCar.Text;
    MainForm.systemConfig.faHuoCaption := EdtFaHuo.Text;
    MainForm.systemConfig.shouHuoCaption := EdtShouHuo.Text;
    MainForm.systemConfig.goodsCaption := EdtGoods.Text;
    MainForm.systemConfig.specCaption := EdtSpec.Text;

    MainForm.systemConfig.grossCaption := EdtGross.Text;
    MainForm.systemConfig.tareCaption := EdtTare.Text;
    MainForm.systemConfig.netCaption := EdtNet.Text;
    MainForm.systemConfig.bundleCaption := EdtBundle.Text;
    MainForm.systemConfig.realCaption := EdtReal.Text;

    MainForm.systemConfig.priceCaption := EdtPrice.Text;
    MainForm.systemConfig.sumCaption := EdtSum.Text;
    MainForm.systemConfig.costCaption := EdtCost.Text;
    MainForm.systemConfig.grossTimeCaption := EdtGrossTime.Text;
    MainForm.systemConfig.tareTimeCaption := EdtTareTime.Text;
    MainForm.systemConfig.remarkCaption := EdtRemark.Text;

    MainForm.systemConfig.backup1Caption := EdtBackup1.Text;
    MainForm.systemConfig.backup2Caption := EdtBackup2.Text;
    MainForm.systemConfig.backup3Caption := EdtBackup3.Text;
    MainForm.systemConfig.backup4Caption := EdtBackup4.Text;
    MainForm.systemConfig.backup5Caption := EdtBackup5.Text;
    MainForm.systemConfig.backup6Caption := EdtBackup6.Text;
    MainForm.systemConfig.backup7Caption := EdtBackup7.Text;
    MainForm.systemConfig.backup8Caption := EdtBackup8.Text;
    MainForm.systemConfig.backup9Caption := EdtBackup9.Text;
    ////////////////////////////////////////////////////////////////////
    //写默认值
    MainForm.systemConfig.carDefault := EdtCarDefault.Text;
    MainForm.systemConfig.faHuoDefault := EdtFaHuoDefault.Text;
    MainForm.systemConfig.shouHuoDefault := EdtShouHuoDefault.Text;
    MainForm.systemConfig.goodsDefault := EdtGoodsDefault.Text;
    MainForm.systemConfig.specDefault := EdtSpecDefault.Text;

    MainForm.systemConfig.grossDefault := EdtGrossDefault.Text;
    MainForm.systemConfig.tareDefault := EdtTareDefault.Text;
    MainForm.systemConfig.netDefault := EdtNetDefault.Text;
    MainForm.systemConfig.bundleDefault := EdtBundleDefault.Text;
    MainForm.systemConfig.realDefault := EdtRealDefault.Text;

    MainForm.systemConfig.priceDefault := EdtPriceDefault.Text;
    MainForm.systemConfig.sumDefault := EdtSumDefault.Text;
    MainForm.systemConfig.costDefault := EdtCostDefault.Text;
    MainForm.systemConfig.grossTimeCaption := EdtGrossTimeDefault.Text;
    MainForm.systemConfig.tareTimeDefault := EdtTareTimeDefault.Text;
    MainForm.systemConfig.remarkDefault := EdtRemarkDefault.Text;

    MainForm.systemConfig.backup1Default := EdtBackup1Default.Text;
    MainForm.systemConfig.backup2Default := EdtBackup2Default.Text;
    MainForm.systemConfig.backup3Default := EdtBackup3Default.Text;
    MainForm.systemConfig.backup4Default := EdtBackup4Default.Text;
    MainForm.systemConfig.backup5Default := EdtBackup5Default.Text;

    //自动清空
    MainForm.systemConfig.clearCar := CBClearCar.Checked;
    MainForm.systemConfig.clearFaHuo := CBClearFaHuo.Checked;
    MainForm.systemConfig.clearShouHuo := CBClearShouHuo.Checked;
    MainForm.systemConfig.clearGoods := CBClearGoods.Checked;
    MainForm.systemConfig.clearSpec := CBClearSpec.Checked;
    MainForm.systemConfig.clearGross := CBClearGross.Checked;
    MainForm.systemConfig.clearTare := CBClearTare.Checked;
    MainForm.systemConfig.clearNet := CBClearNet.Checked;
    MainForm.systemConfig.clearBundle := CBClearBundle.Checked;
    MainForm.systemConfig.clearReal := CBClearReal.Checked;
    MainForm.systemConfig.clearPrice := CBClearPrice.Checked;
    MainForm.systemConfig.clearSum := CBClearSum.Checked;
    MainForm.systemConfig.clearCost := CBClearCost.Checked;
    MainForm.systemConfig.clearRemark := CBClearRemark.Checked;
    MainForm.systemConfig.clearBackup1 := CBClearBackup1.Checked;
    MainForm.systemConfig.clearBackup2 := CBClearBackup2.Checked;
    MainForm.systemConfig.clearBackup3 := CBClearBackup3.Checked;
    MainForm.systemConfig.clearBackup4 := CBClearBackup4.Checked;
    MainForm.systemConfig.clearBackup5 := CBClearBackup5.Checked;
    MainForm.systemConfig.clearBackup6 := CBClearBackup6.Checked;
    MainForm.systemConfig.clearBackup7 := CBClearBackup7.Checked;
    MainForm.systemConfig.clearBackup8 := CBClearBackup8.Checked;
    MainForm.systemConfig.clearBackup9 := CBClearBackup9.Checked;
  finally
    myini.Free;
  end;
end;

procedure TWeightSetForm.BitBtn1Click(Sender: TObject);
begin
  //界面设置配置
  writeFormDesign();
  //生效到主窗体中　
  MainForm.loadFormDesign;
  MainForm.resizeMain;
end;

procedure TWeightSetForm.FormShow(Sender: TObject);
begin
  loadFormDesign;
end;

procedure TWeightSetForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
