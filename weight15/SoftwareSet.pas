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
  EdtCompany.Text := myini.ReadString('ϵͳ����', 'ʹ�õ�λ', '');
  EdtTel.Text := myini.ReadString('ϵͳ����', '�绰����', '');
  CBMeterUnit.ItemIndex := myini.ReadInteger('ϵͳ����', '�Ǳ�������', 0);
  CBSoftUnit.ItemIndex := myini.ReadInteger('ϵͳ����', '����������', 0);
  CBAutoRun.Checked := myini.ReadBool('ϵͳ����', '��������', false);
  //��ˮ�Ź���
  CBGlideNo.ItemIndex := myini.ReadInteger('system_set', 'glideNoRule', 0);
  if MainForm.systemConfig.CloseTime <> '' then
  begin
    CBAutoShutdown.Checked := true;
    DTPClose.Enabled := true;
    DTPClose.DateTime := StrToDate(MainForm.systemConfig.CloseTime);
  end;

  CBPrinter.Items.Clear; //ö�ٱ��ش�ӡ��
  for i := 0 to Printer.Printers.Count - 1 do
  begin
    CBPrinter.Items.Add(Printer.Printers.Strings[i]);
  end;
  CBPrinter.Items.Add('Default');

  CBPrinter.Text := myini.ReadString('system_set', 'printer', 'Default');

  CBXMLExport.Checked := myini.ReadBool('ϵͳ����', '����XML',
    false);
  RBAttr.Checked := myini.Readinteger('ϵͳ����', 'XML������ʽ', 0) = 0;
end;

function TSoftwareSetForm.loadCostSet: Boolean;
begin
  //����������
  CBUsePound.Checked := myini.ReadBool('ϵͳ����', '���ð���', False);
  EdtInitial.Text := myini.ReadString('ϵͳ����', '��ʼ����', '5');
  EdtUnit.Text := myini.ReadString('ϵͳ����', '��λ����1', '2');
  EdtUnit2.Text := myini.ReadString('ϵͳ����', '��λ����2', '1');
  CBManualInput.Checked := myini.ReadBool('ϵͳ����', '�ֹ��������', False);
  EdtPound1.Text := myini.ReadString('ϵͳ����', '�ȼ�1', '500');
  EdtPound2.Text := myini.ReadString('ϵͳ����', '�ȼ�2', '10000');
  EdtPound3.Text := myini.ReadString('ϵͳ����', '�ȼ�3', '10000');
  EdtPound4.Text := myini.ReadString('ϵͳ����', '�ȼ�4', '100000');
  EdtPound5.Text := myini.ReadString('ϵͳ����', '�ȼ�5', '100000');
  EdtPound6.Text := myini.ReadString('ϵͳ����', '�ȼ�6', '120000');

  RBGross.Checked := myini.ReadInteger('ϵͳ����', '�Ʒѷ�ʽ', 1) = 1;
  RBTwo.Checked := myini.ReadInteger('ϵͳ����', '�Ʒѷ�ʽ', 1) = 2;
  RBNet.Checked := myini.ReadInteger('ϵͳ����', '�Ʒѷ�ʽ', 1) = 3;

  LEPoint.Text := myini.ReadString('ϵͳ����', 'С����λ��', '0');
end;

function TSoftwareSetForm.loadWeightSet: Boolean;
begin
  SEDropDownCount.Value := myini.ReadInteger('ϵͳ����', '��������', 5);
  CBAutoDropDown.Checked := myini.ReadBool('ϵͳ����', '�Զ�����', true);
  //�Զ���ȫ�б��
  CBAutoComplete.Checked := myini.ReadBool('system_set', 'autoComplete', False);
  CBEnterAsTab.Checked := myini.ReadBool('ϵͳ����', '�س��Ʊ�', false);

  LEReturnZero.Text := myini.ReadString('ϵͳ����', '��������', '10');
  //ÿ�ι���֮��Ҫ��������ٴ����복��
  CBWaitForZero.Checked := myini.ReadBool('system_set', 'waitForZero', False);
  CBUseBundleRate.Checked := myini.ReadBool('system_set', 'useBundleRate', False);

  CBDelHistory.Checked := myini.ReadBool('ϵͳ����', 'ɾ����ʷ��¼', false);
  CBAllowSecondTare.Checked := myini.ReadBool('ϵͳ����', '������ι�Ƥ', true);
  CBAllowSecondGross.Checked := myini.ReadBool('ϵͳ����', '������ι�ë', true);

  //ÿ�ι��ճ�ʱ�Զ�Ԥ�ó�Ƥ
  CBWriteTare.Checked := myini.ReadBool('system_set', 'autoWriteTare', False);
  //������λ,�ջ���λ����Ϣ�ô�������
  CBUseCode.Checked := myini.ReadBool('system_set', 'useCode', True);
  //���ݴ�ӡ����̧ͷ
  LEReportTitle.Text := myini.ReadString('system_set', 'dataReportTitle', '���ݱ���');
  //���С����λ��
  LESumPoint.Text := myini.ReadString('system_set', 'sumPoint', '2');
  //�ȶ�����
  SESteadyCount.Value := myini.ReadInteger('system_set', 'steadyCount', 4);
  //���ȶ�����
  CBAllowNotSteady.Checked := myini.ReadBool('system_set', 'allowNotSteady', false);

  CBShowPrepare.Checked := myini.ReadBool('ϵͳ����', '�Զ�ѡ��', false);

  CBVoice.Checked := myini.ReadBool('ϵͳ����', '��������', false);
  //��̨�Զ��������С����
  LEBackRecord.Text := myini.ReadString('system_set', 'back_record_weight', LEBackRecord.Text);
  //ÿ�γ��ش�ӡʱѡ�����
  CBSelectTicketBeforePrint.Checked := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);
  //Ƥ�س���Ԥ��
  CBTareDiff.Checked := myini.ReadBool('system_set', 'useTareDiff', False);
  LETareDiff.Text := myini.ReadString('system_set', 'tareDiff', '5');

  LEPrinterBackRow.Text :=  myini.ReadString('system_set', 'printerBackRow','0');
end;

function TSoftwareSetForm.writeBasic: Boolean;
begin
  //��˾��Ϣ
  myini.WriteString('ϵͳ����', 'ʹ�õ�λ', EdtCompany.Text);
  myini.WriteString('ϵͳ����', '�绰����', EdtTel.Text);
  //������λת��
  if CBMeterUnit.Text <> '' then
  begin
    myini.Writeinteger('ϵͳ����', '�Ǳ�������', CBMeterUnit.ItemIndex);
    myini.WriteString('ϵͳ����', '�Ǳ������λ', CBMeterUnit.Text);
  end;
  if CBSoftUnit.Text <> '' then
  begin
    myini.Writeinteger('ϵͳ����', '����������', CBSoftUnit.ItemIndex);
    myini.WriteString('ϵͳ����', '���������λ', CBSoftUnit.Text);
  end; 
  if CBSoftUnit.Text <> '' then
  begin
    MainForm.Label24.Caption := CBSoftUnit.Text;
    MainForm.Label25.Caption := CBSoftUnit.Text;

    MainForm.lblUnit1.Caption := CBSoftUnit.Text;
  end;
  //�����Զ�����
  with TRegistry.Create do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
    if CBAutoRun.Checked and (not ValueExists('����')) then
      WriteString('����', Application.ExeName)
    else if ValueExists('����') then
      DeleteValue('����');
    CloseKey
  end;
  myini.WriteBool('ϵͳ����', '��������', CBAutoRun.Checked);
  //��ӡ��
  myini.WriteString('system_set', 'printer', CBPrinter.Text);
  //����XML
  myini.WriteBool('ϵͳ����', '����XML', CBXMLExport.Checked);
  if RBAttr.Checked then
    myini.Writeinteger('ϵͳ����', 'XML������ʽ', 0)
  else if RBChild.Checked then
    myini.Writeinteger('ϵͳ����', 'XML������ʽ', 1);
  //�Զ��ػ�
  if CBAutoShutdown.Checked then
    MainForm.systemConfig.CloseTime := FormatDateTime('hns', DTPClose.DateTime);
  //��ˮ�Ź���
  myini.WriteInteger('system_set', 'glideNoRule', CBGlideNo.ItemIndex);
  MainForm.systemConfig.glideNoRule := CBGlideNo.ItemIndex;
end;

function TSoftwareSetForm.writeCostSet: Boolean;
begin
  //����������
  MainForm.systemConfig.usePound := CBUsePound.Checked;
  myini.WriteBool('ϵͳ����', '���ð���', CBUsePound.Checked);
  MainForm.systemConfig.BasicPound := StrToFloat(EdtInitial.Text);
  myini.WriteString('ϵͳ����', '��ʼ����', EdtInitial.Text);
  MainForm.systemConfig.UnitPound1 := StrToFloat(EdtUnit.Text);
  myini.WriteString('ϵͳ����', '��λ����1', EdtUnit.Text);
  MainForm.systemConfig.UnitPound2 := StrToFloat(EdtUnit2.Text);
  myini.WriteString('ϵͳ����', '��λ����2', EdtUnit2.Text);
  MainForm.systemConfig.ManualInputPound := CBManualInput.Checked;
  MainForm.CBCost.Enabled := CBManualInput.Checked;
  myini.WriteBool('ϵͳ����', '�ֹ��������', CBManualInput.Checked);
  MainForm.systemConfig.poundGrade1 := StrToFloatDef(EdtPound1.Text, 500);
  MainForm.systemConfig.poundGrade2 := StrToFloatDef(EdtPound2.Text, 10000);
  MainForm.systemConfig.poundGrade3 := StrToFloatDef(EdtPound3.Text, 10000);
  MainForm.systemConfig.poundGrade4 := StrToFloatDef(EdtPound4.Text, 100000);
  MainForm.systemConfig.poundGrade5 := StrToFloatDef(EdtPound5.Text, 100000);
  MainForm.systemConfig.poundGrade6 := StrToFloatDef(EdtPound6.Text, 120000);
  myini.WriteString('ϵͳ����', '�ȼ�1', EdtPound1.Text);
  myini.WriteString('ϵͳ����', '�ȼ�2', EdtPound2.Text);
  myini.WriteString('ϵͳ����', '�ȼ�3', EdtPound3.Text);
  myini.WriteString('ϵͳ����', '�ȼ�4', EdtPound4.Text);
  myini.WriteString('ϵͳ����', '�ȼ�5', EdtPound5.Text);
  myini.WriteString('ϵͳ����', '�ȼ�6', EdtPound6.Text);

  if RBGross.Checked then
  begin
    MainForm.systemConfig.ChargeType := 1; //ë�ؼƷ�
    myini.WriteInteger('ϵͳ����', '�Ʒѷ�ʽ', 1);
  end
  else if RBTwo.Checked then
  begin
    MainForm.systemConfig.ChargeType := 2; //ë��+Ƥ�ؼƷ�
    myini.WriteInteger('ϵͳ����', '�Ʒѷ�ʽ', 2);
  end
  else if RBNet.Checked then
  begin
    MainForm.systemConfig.ChargeType := 3; //���ؼƷ�
    myini.WriteInteger('ϵͳ����', '�Ʒѷ�ʽ', 3);
  end;
  myini.WriteInteger('ϵͳ����', 'С����λ��', StrToInt(LEPoint.Text));
  MainForm.systemConfig.scalePoint := StrToIntDef(LEPoint.Text, 0);
end;

function TSoftwareSetForm.writeWeightSet: Boolean;
begin
  //��������
  myini.Writeinteger('ϵͳ����', '��������', SEDropDownCount.Value);
  myini.WriteBool('ϵͳ����', '�Զ�����', CBAutoDropDown.Checked);
  myini.WriteBool('ϵͳ����', '�س��Ʊ�', CBEnterAsTab.Checked);
  //������Ŀ
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
  //�Զ�����
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
  //�Զ���ȫ�б��
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

  //�Զ�ɾ������֮ǰ����ʷ��¼
  myini.WriteBool('ϵͳ����', 'ɾ����ʷ��¼', CBDelHistory.Checked);
  //�Զ��������ѡ�񳵺�,��������Ϣ
  myini.WriteBool('ϵͳ����', '�Զ�ѡ��', CBShowPrepare.Checked);
  MainForm.systemConfig.ShowPrepare := CBShowPrepare.Checked;
  //�Ƿ�������ι�Ƥ
  myini.WriteBool('ϵͳ����', '������ι�Ƥ', CBAllowSecondTare.Checked);
  MainForm.systemConfig.AllowSecondTare := CBAllowSecondTare.Checked;
  //�Ƿ�������ι�ë
  myini.WriteBool('ϵͳ����', '������ι�ë', CBAllowSecondGross.Checked);
  MainForm.systemConfig.AllowSecondGross := CBAllowSecondGross.Checked;

  myini.WriteFloat('ϵͳ����', '��������', StrToFloatDef(LEReturnZero.Text,
    0));
  MainForm.systemConfig.ReturnZero := StrToFloatDef(LEReturnZero.Text, 0);
  //ÿ�ι���֮��Ҫ��������ٴ����복��
  myini.WriteBool('system_set', 'waitForZero', CBWaitForZero.Checked);
  MainForm.systemConfig.waitForZero := CBWaitForZero.Checked;
  myini.WriteBool('system_set', 'useBundleRate', CBUseBundleRate.Checked);
  MainForm.systemConfig.useBundleRate := CBUseBundleRate.Checked;

  //ÿ�ι��ճ�ʱ�Զ�Ԥ�ó�Ƥ
  myini.WriteBool('system_set', 'autoWriteTare', CBWriteTare.Checked);
  mainForm.systemConfig.autoWriteTare := CBWriteTare.Checked;
  //������λ,�ջ���λ����Ϣ�ô�������
  myini.WriteBool('system_set', 'useCode', CBUseCode.Checked);
  MainForm.systemConfig.useCode := CBUseCode.Checked;
  //���ݴ�ӡ����̧ͷ
  myini.WriteString('system_set', 'dataReportTitle', LEReportTitle.Text);
  //���С����λ��
  myini.WriteString('system_set', 'sumPoint', LESumPoint.Text);
  MainForm.systemConfig.sumPoint := StrToIntDef(LESumPoint.Text, 2);
  //�ȶ�����
  myini.WriteInteger('system_set', 'steadyCount', SESteadyCount.Value);
  MainForm.systemConfig.steadyCount := SESteadyCount.Value;

  //�����ȶ�ʱҲ�ܱ�������
  myini.WriteBool('system_set', 'allowNotSteady', CBAllowNotSteady.Checked);
  MainForm.systemConfig.allowNotSteady := CBAllowNotSteady.Checked;

  myini.WriteBool('ϵͳ����', '��������', CBVoice.Checked);
  MainForm.systemConfig.UseVoice := CBVoice.Checked;

  //��ӡʱѡ�����
  myini.WriteBool('system_set', 'selectTicketBeforePrint', CBSelectTicketBeforePrint.Checked);
  MainForm.systemConfig.selectTicketBeforePrint := CBSelectTicketBeforePrint.Checked;

  //Ƥ�س���Ԥ��
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

