unit SoftwareSet;

interface

uses
  Windows, Classes, Controls, Forms, ExtCtrls, ComCtrls, StdCtrls,
  Buttons, Spin, Registry, SysUtils, inifiles, Printers;

type
  TSoftwareSetForm = class(TForm)
    PageControl1: TPageControl;
    TSBase: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    EdtCompany: TEdit;
    Label2: TLabel;
    EdtTel: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TSWeightSet: TTabSheet;
    CBEnterAsTab: TCheckBox;
    CBAutoDropDown: TCheckBox;
    TSCostSet: TTabSheet;
    CBDelHistory: TCheckBox;
    CBShowPrepare: TCheckBox;
    CBAllowSecondTare: TCheckBox;
    CBAllowSecondGross: TCheckBox;
    Label4: TLabel;
    CBMeterUnit: TComboBox;
    Label9: TLabel;
    CBSoftUnit: TComboBox;
    CBWriteTare: TCheckBox;
    CBUseCode: TCheckBox;
    CBAutoComplete: TCheckBox;
    CBWaitForZero: TCheckBox;
    CBVoice: TCheckBox;
    CBUseBundleRate: TCheckBox;
    RBAttr: TRadioButton;
    RBChild: TRadioButton;
    CBManualInput: TCheckBox;
    LEPoint: TLabeledEdit;
    CBUsePound: TCheckBox;
    GBScale: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    EdtPound1: TEdit;
    EdtPound2: TEdit;
    EdtPound3: TEdit;
    EdtPound4: TEdit;
    EdtPound5: TEdit;
    EdtPound6: TEdit;
    EdtInitial: TLabeledEdit;
    EdtUnit: TLabeledEdit;
    EdtUnit2: TLabeledEdit;
    GroupBox1: TGroupBox;
    RBTwo: TRadioButton;
    RBGross: TRadioButton;
    RBNet: TRadioButton;
    CBAllowNotSteady: TCheckBox;
    CBSelectTicketBeforePrint: TCheckBox;
    CBTareDiff: TCheckBox;
    TSWeightSetII: TTabSheet;
    Label7: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    LEBackRecord: TLabeledEdit;
    LEReturnZero: TLabeledEdit;
    SEDropDownCount: TSpinEdit;
    LESumPoint: TLabeledEdit;
    SESteadyCount: TSpinEdit;
    LETareDiff: TLabeledEdit;
    LEPrinterBackRow: TLabeledEdit;
    Label10: TLabel;
    Label16: TLabel;
    CBAutoRun: TCheckBox;
    CBAutoShutdown: TCheckBox;
    DTPClose: TDateTimePicker;
    CBXMLExport: TCheckBox;
    LEReportTitle: TLabeledEdit;
    CBPrinter: TComboBox;
    Label12: TLabel;
    Label15: TLabel;
    CBGlideNo: TComboBox;
    BtnTestPrinter: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtTelKeyPress(Sender: TObject; var Key: Char);
    procedure CBAutoShutdownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnTestPrinterClick(Sender: TObject);
  private
    { Private declarations }
    myini: Tinifile;
  public
    { Public declarations }
    //////////////////////////////////////////
    function loadBasic(): Boolean;
    function writeBasic(): Boolean;
    //////////////////////////////////////////////
    function loadWeightSet(): Boolean;
    function writeWeightSet(): Boolean;
    /////////////////////////////////////////////
    function loadCostSet(): Boolean;
    function writeCostSet(): Boolean;
    /////////////////////////////////////////////
  end;

var
  SoftwareSetForm: TSoftwareSetForm;

implementation

uses Main, CommonUtil;

{$R *.dfm}

procedure TSoftwareSetForm.BitBtn1Click(Sender: TObject);
begin
  writeBasic;
  writeWeightSet;
  writeCostSet;
end;

procedure TSoftwareSetForm.FormShow(Sender: TObject);
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  loadBasic;
  loadWeightSet;
  loadCostSet;
  PageControl1.ActivePageIndex := 0
end;

procedure TSoftwareSetForm.BitBtn2Click(Sender: TObject);
begin
  Close
end;

procedure TSoftwareSetForm.EdtTelKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '-', '.', #8]) then
    Key := #0
end;

procedure TSoftwareSetForm.CBAutoShutdownClick(Sender: TObject);
begin
  DTPClose.Enabled := CBAutoShutdown.Checked;
end;

function TSoftwareSetForm.loadBasic: Boolean;
var i: Integer;
begin
  EdtCompany.Text := myini.ReadString('系统设置', '使用单位', '');
  EdtTel.Text := myini.ReadString('系统设置', '电话号码', '');
  CBMeterUnit.ItemIndex := myini.ReadInteger('系统设置', '仪表计量序号', 0);
  CBSoftUnit.ItemIndex := myini.ReadInteger('系统设置', '软件计量序号', 0);
  CBAutoRun.Checked := myini.ReadBool('系统设置', '开机运行', false);
  //流水号规则
  CBGlideNo.ItemIndex := myini.ReadInteger('system_set', 'glideNoRule', 0);
  if MainForm.systemConfig.CloseTime <> '' then
  begin
    CBAutoShutdown.Checked := true;
    DTPClose.Enabled := true;
    DTPClose.DateTime := StrToDate(MainForm.systemConfig.CloseTime);
  end;

  CBPrinter.Items.Clear; //枚举本地打印机
  for i := 0 to Printer.Printers.Count - 1 do
  begin
    CBPrinter.Items.Add(Printer.Printers.Strings[i]);
  end;
  CBPrinter.Items.Add('Default');

  CBPrinter.Text := myini.ReadString('system_set', 'printer', 'Default');

  CBXMLExport.Checked := myini.ReadBool('系统设置', '导出XML',
    false);
  RBAttr.Checked := myini.Readinteger('系统设置', 'XML导出方式', 0) = 0;
end;

function TSoftwareSetForm.loadCostSet: Boolean;
begin
  //过磅费设置
  CBUsePound.Checked := myini.ReadBool('系统设置', '启用磅费', False);
  EdtInitial.Text := myini.ReadString('系统设置', '起始磅费', '5');
  EdtUnit.Text := myini.ReadString('系统设置', '单位磅费1', '2');
  EdtUnit2.Text := myini.ReadString('系统设置', '单位磅费2', '1');
  CBManualInput.Checked := myini.ReadBool('系统设置', '手工输入磅费', False);
  EdtPound1.Text := myini.ReadString('系统设置', '等级1', '500');
  EdtPound2.Text := myini.ReadString('系统设置', '等级2', '10000');
  EdtPound3.Text := myini.ReadString('系统设置', '等级3', '10000');
  EdtPound4.Text := myini.ReadString('系统设置', '等级4', '100000');
  EdtPound5.Text := myini.ReadString('系统设置', '等级5', '100000');
  EdtPound6.Text := myini.ReadString('系统设置', '等级6', '120000');

  RBGross.Checked := myini.ReadInteger('系统设置', '计费方式', 1) = 1;
  RBTwo.Checked := myini.ReadInteger('系统设置', '计费方式', 1) = 2;
  RBNet.Checked := myini.ReadInteger('系统设置', '计费方式', 1) = 3;

  LEPoint.Text := myini.ReadString('系统设置', '小数点位数', '0');
end;

function TSoftwareSetForm.loadWeightSet: Boolean;
begin
  SEDropDownCount.Value := myini.ReadInteger('系统设置', '下拉项数', 5);
  CBAutoDropDown.Checked := myini.ReadBool('系统设置', '自动下拉', true);
  //自动补全列表框
  CBAutoComplete.Checked := myini.ReadBool('system_set', 'autoComplete', False);
  CBEnterAsTab.Checked := myini.ReadBool('系统设置', '回车制表', false);

  LEReturnZero.Text := myini.ReadString('系统设置', '回零重量', '10');
  //每次过磅之后要回零才能再次输入车号
  CBWaitForZero.Checked := myini.ReadBool('system_set', 'waitForZero', False);
  CBUseBundleRate.Checked := myini.ReadBool('system_set', 'useBundleRate', False);

  CBDelHistory.Checked := myini.ReadBool('系统设置', '删除历史记录', false);
  CBAllowSecondTare.Checked := myini.ReadBool('系统设置', '允许二次过皮', true);
  CBAllowSecondGross.Checked := myini.ReadBool('系统设置', '允许二次过毛', true);

  //每次过空车时自动预置车皮
  CBWriteTare.Checked := myini.ReadBool('system_set', 'autoWriteTare', False);
  //发货单位,收货单位等信息用代码输入
  CBUseCode.Checked := myini.ReadBool('system_set', 'useCode', True);
  //数据打印报表抬头
  LEReportTitle.Text := myini.ReadString('system_set', 'dataReportTitle', '数据报表');
  //金额小数点位数
  LESumPoint.Text := myini.ReadString('system_set', 'sumPoint', '2');
  //稳定次数
  SESteadyCount.Value := myini.ReadInteger('system_set', 'steadyCount', 4);
  //不稳定保存
  CBAllowNotSteady.Checked := myini.ReadBool('system_set', 'allowNotSteady', false);

  CBShowPrepare.Checked := myini.ReadBool('系统设置', '自动选择', false);

  CBVoice.Checked := myini.ReadBool('系统设置', '启用语音', false);
  //后台自动保存的最小重量
  LEBackRecord.Text := myini.ReadString('system_set', 'back_record_weight', LEBackRecord.Text);
  //每次称重打印时选择磅单
  CBSelectTicketBeforePrint.Checked := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);
  //皮重超差预警
  CBTareDiff.Checked := myini.ReadBool('system_set', 'useTareDiff', False);
  LETareDiff.Text := myini.ReadString('system_set', 'tareDiff', '5');

  LEPrinterBackRow.Text :=  myini.ReadString('system_set', 'printerBackRow','0');
end;

function TSoftwareSetForm.writeBasic: Boolean;
begin
  //公司信息
  myini.WriteString('系统设置', '使用单位', EdtCompany.Text);
  myini.WriteString('系统设置', '电话号码', EdtTel.Text);
  //计量单位转换
  if CBMeterUnit.Text <> '' then
  begin
    myini.Writeinteger('系统设置', '仪表计量序号', CBMeterUnit.ItemIndex);
    myini.WriteString('系统设置', '仪表计量单位', CBMeterUnit.Text);
  end;
  if CBSoftUnit.Text <> '' then
  begin
    myini.Writeinteger('系统设置', '软件计量序号', CBSoftUnit.ItemIndex);
    myini.WriteString('系统设置', '软件计量单位', CBSoftUnit.Text);
  end; 
  if CBSoftUnit.Text <> '' then
  begin
    MainForm.Label24.Caption := CBSoftUnit.Text;
    MainForm.Label25.Caption := CBSoftUnit.Text;

    MainForm.lblUnit1.Caption := CBSoftUnit.Text;
  end;
  //开机自动运行
  with TRegistry.Create do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
    if CBAutoRun.Checked and (not ValueExists('称重')) then
      WriteString('称重', Application.ExeName)
    else if ValueExists('称重') then
      DeleteValue('称重');
    CloseKey
  end;
  myini.WriteBool('系统设置', '开机运行', CBAutoRun.Checked);
  //打印机
  myini.WriteString('system_set', 'printer', CBPrinter.Text);
  //导出XML
  myini.WriteBool('系统设置', '导出XML', CBXMLExport.Checked);
  if RBAttr.Checked then
    myini.Writeinteger('系统设置', 'XML导出方式', 0)
  else if RBChild.Checked then
    myini.Writeinteger('系统设置', 'XML导出方式', 1);
  //自动关机
  if CBAutoShutdown.Checked then
    MainForm.systemConfig.CloseTime := FormatDateTime('hns', DTPClose.DateTime);
  //流水号规则
  myini.WriteInteger('system_set', 'glideNoRule', CBGlideNo.ItemIndex);
  MainForm.systemConfig.glideNoRule := CBGlideNo.ItemIndex;
end;

function TSoftwareSetForm.writeCostSet: Boolean;
begin
  //过磅费设置
  MainForm.systemConfig.usePound := CBUsePound.Checked;
  myini.WriteBool('系统设置', '启用磅费', CBUsePound.Checked);
  MainForm.systemConfig.BasicPound := StrToFloat(EdtInitial.Text);
  myini.WriteString('系统设置', '起始磅费', EdtInitial.Text);
  MainForm.systemConfig.UnitPound1 := StrToFloat(EdtUnit.Text);
  myini.WriteString('系统设置', '单位磅费1', EdtUnit.Text);
  MainForm.systemConfig.UnitPound2 := StrToFloat(EdtUnit2.Text);
  myini.WriteString('系统设置', '单位磅费2', EdtUnit2.Text);
  MainForm.systemConfig.ManualInputPound := CBManualInput.Checked;
  MainForm.CBCost.Enabled := CBManualInput.Checked;
  myini.WriteBool('系统设置', '手工输入磅费', CBManualInput.Checked);
  MainForm.systemConfig.poundGrade1 := StrToFloatDef(EdtPound1.Text, 500);
  MainForm.systemConfig.poundGrade2 := StrToFloatDef(EdtPound2.Text, 10000);
  MainForm.systemConfig.poundGrade3 := StrToFloatDef(EdtPound3.Text, 10000);
  MainForm.systemConfig.poundGrade4 := StrToFloatDef(EdtPound4.Text, 100000);
  MainForm.systemConfig.poundGrade5 := StrToFloatDef(EdtPound5.Text, 100000);
  MainForm.systemConfig.poundGrade6 := StrToFloatDef(EdtPound6.Text, 120000);
  myini.WriteString('系统设置', '等级1', EdtPound1.Text);
  myini.WriteString('系统设置', '等级2', EdtPound2.Text);
  myini.WriteString('系统设置', '等级3', EdtPound3.Text);
  myini.WriteString('系统设置', '等级4', EdtPound4.Text);
  myini.WriteString('系统设置', '等级5', EdtPound5.Text);
  myini.WriteString('系统设置', '等级6', EdtPound6.Text);

  if RBGross.Checked then
  begin
    MainForm.systemConfig.ChargeType := 1; //毛重计费
    myini.WriteInteger('系统设置', '计费方式', 1);
  end
  else if RBTwo.Checked then
  begin
    MainForm.systemConfig.ChargeType := 2; //毛重+皮重计费
    myini.WriteInteger('系统设置', '计费方式', 2);
  end
  else if RBNet.Checked then
  begin
    MainForm.systemConfig.ChargeType := 3; //净重计费
    myini.WriteInteger('系统设置', '计费方式', 3);
  end;
  myini.WriteInteger('系统设置', '小数点位数', StrToInt(LEPoint.Text));
  MainForm.systemConfig.scalePoint := StrToIntDef(LEPoint.Text, 0);
end;

function TSoftwareSetForm.writeWeightSet: Boolean;
begin
  //称重设置
  myini.Writeinteger('系统设置', '下拉项数', SEDropDownCount.Value);
  myini.WriteBool('系统设置', '自动下拉', CBAutoDropDown.Checked);
  myini.WriteBool('系统设置', '回车制表', CBEnterAsTab.Checked);
  //下拉项目
  MainForm.CBCar.DropDownCount := SEDropDownCount.Value;
  MainForm.CBFaHuo.DropDownCount := SEDropDownCount.Value;
  MainForm.CBShouHuo.DropDownCount := SEDropDownCount.Value;
  MainForm.CBGoods.DropDownCount := SEDropDownCount.Value;
  MainForm.CBSpec.DropDownCount := SEDropDownCount.Value;
  MainForm.CBRemark.DropDownCount := SEDropDownCount.Value;
  MainForm.CBBackup1.DropDownCount := SEDropDownCount.Value;
  MainForm.CBBackup2.DropDownCount := SEDropDownCount.Value;
  MainForm.CBBackup3.DropDownCount := SEDropDownCount.Value;
  MainForm.CBBackup4.DropDownCount := SEDropDownCount.Value;
  MainForm.CBBackup5.DropDownCount := SEDropDownCount.Value;
  //自动下拉
  MainForm.CBCar.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBFaHuo.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBShouHuo.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBGoods.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBSpec.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBRemark.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBBackup1.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBBackup2.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBBackup3.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBBackup4.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.CBBackup5.AutoDropDown := CBAutoDropDown.Checked;

  MainForm.systemConfig.EnterTab := CBEnterAsTab.Checked;
  //自动补全列表框
  myini.WriteBool('system_set', 'autoComplete', CBAutoComplete.Checked);
  MainForm.CBCar.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBFaHuo.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBShouHuo.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBGoods.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBSpec.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBRemark.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBBackup1.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBBackup2.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBBackup3.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBBackup4.AutoComplete := CBAutoComplete.Checked;
  MainForm.CBBackup5.AutoComplete := CBAutoComplete.Checked;

  //自动删除今天之前的历史记录
  myini.WriteBool('系统设置', '删除历史记录', CBDelHistory.Checked);
  //自动用鼠标来选择车号,货名等信息
  myini.WriteBool('系统设置', '自动选择', CBShowPrepare.Checked);
  MainForm.systemConfig.ShowPrepare := CBShowPrepare.Checked;
  //是否允许二次过皮
  myini.WriteBool('系统设置', '允许二次过皮', CBAllowSecondTare.Checked);
  MainForm.systemConfig.AllowSecondTare := CBAllowSecondTare.Checked;
  //是否允许二次过毛
  myini.WriteBool('系统设置', '允许二次过毛', CBAllowSecondGross.Checked);
  MainForm.systemConfig.AllowSecondGross := CBAllowSecondGross.Checked;

  myini.WriteFloat('系统设置', '回零重量', StrToFloatDef(LEReturnZero.Text,
    0));
  MainForm.systemConfig.ReturnZero := StrToFloatDef(LEReturnZero.Text, 0);
  //每次过磅之后要回零才能再次输入车号
  myini.WriteBool('system_set', 'waitForZero', CBWaitForZero.Checked);
  MainForm.systemConfig.waitForZero := CBWaitForZero.Checked;
  myini.WriteBool('system_set', 'useBundleRate', CBUseBundleRate.Checked);
  MainForm.systemConfig.useBundleRate := CBUseBundleRate.Checked;

  //每次过空车时自动预置车皮
  myini.WriteBool('system_set', 'autoWriteTare', CBWriteTare.Checked);
  mainForm.systemConfig.autoWriteTare := CBWriteTare.Checked;
  //发货单位,收货单位等信息用代码输入
  myini.WriteBool('system_set', 'useCode', CBUseCode.Checked);
  MainForm.systemConfig.useCode := CBUseCode.Checked;
  //数据打印报表抬头
  myini.WriteString('system_set', 'dataReportTitle', LEReportTitle.Text);
  //金额小数点位数
  myini.WriteString('system_set', 'sumPoint', LESumPoint.Text);
  MainForm.systemConfig.sumPoint := StrToIntDef(LESumPoint.Text, 2);
  //稳定次数
  myini.WriteInteger('system_set', 'steadyCount', SESteadyCount.Value);
  MainForm.systemConfig.steadyCount := SESteadyCount.Value;

  //允许不稳定时也能保存重量
  myini.WriteBool('system_set', 'allowNotSteady', CBAllowNotSteady.Checked);
  MainForm.systemConfig.allowNotSteady := CBAllowNotSteady.Checked;

  myini.WriteBool('系统设置', '启用语音', CBVoice.Checked);
  MainForm.systemConfig.UseVoice := CBVoice.Checked;

  //打印时选择磅单
  myini.WriteBool('system_set', 'selectTicketBeforePrint', CBSelectTicketBeforePrint.Checked);
  MainForm.systemConfig.selectTicketBeforePrint := CBSelectTicketBeforePrint.Checked;

  //皮重超差预警
  myini.WriteBool('system_set', 'useTareDiff', CBTareDiff.Checked);
  myini.WriteFloat('system_set', 'tareDiff', StrToFloatDef(LETareDiff.Text, 0));
  MainForm.systemConfig.useTareDiff := CBTareDiff.Checked;
  MainForm.systemConfig.tareDiff := StrToFloatDef(LETareDiff.Text, 0);

  myini.WriteFloat('system_set', 'printerBackRow', StrToFloatDef(LEPrinterBackRow.Text, 0));
  MainForm.systemConfig.printerBackRow := StrToFloatDef(LEPrinterBackRow.Text, 0);
end;

procedure TSoftwareSetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  myini.Free;
end;

procedure TSoftwareSetForm.BtnTestPrinterClick(Sender: TObject);
begin
  TCommonUtil.printerBack(StrToFloatDef(LEPrinterBackRow.Text,0));
end;

end.

