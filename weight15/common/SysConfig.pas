unit SysConfig;

interface

uses IniFiles, SysUtils;

type
  TSysConfig = class
  private
  public
    company, tel: string; //��˾���ƣ���ϵ�绰
    metricUnit: string; // ������λ
    meterUnitIndex, softUnitIndex, metricPoint: Integer;
    dropCount: Integer; //������Ŀ��
    dropAuto: Boolean; //�Ƿ��Զ�����
    autoComplete: Boolean; //�б���Զ����
    autoClear: Boolean; //�Զ����
    previewTicket: Boolean; //Ԥ������
    simpleWeight: Boolean; //�򵥹���
    deleteHistory: Boolean; //�����Զ�ɾ�����еļ�¼
    steadyCount: integer; //�ȶ�����
    ReturnZero: Double; //���ۻ�������
    waitForZero: Boolean; //ÿ�ι���֮��Ҫ��������ٴ����복��
    backRecordWeight: Double; //�Զ���¼������ʼ����
    sumPoint: integer; //���С��λ
    backupType: Integer; //��������
    closeTime: string; //��ʱ�ػ�
    enterTab: boolean; //�س�����
    weightType, currentRecord: string; //��ǰ���еļ�¼
    glideNo: string; //��ˮ��
    useVoice: boolean; //������������
    manualInputPound: boolean; //���ʻ��ֹ�����
    usePound: Boolean;
    basicPound, unitPound1, unitPound2: Double; //��������
    poundGrade1, poundGrade2, poundGrade3, poundGrade4, poundGrade5, poundGrade6: Double; //�ּ����ǰ���
    chargeType, scalePoint: Integer;
    //�ƷѴ���,С����λ��,ë�ؼƷѣ���Ϊë�ؼƷѣ�0Ϊ���ؼƷ�
    cheat, carCheat: Double; //��������
    showPrepare: Boolean; //�Զ���������ѡ���
    FrozenCols: Integer; //DBGridEh�Ĺ̶���
    allowSecondGross, allowSecondTare: Boolean; //������ι�ë�͹�Ƥ
    //��Ŀ�ɼ���
    noVisible, glideNoVisible, operVisible, scaleManVisible, uploadVisible: Boolean;
    carVisible, faHuoVisible, shouHuoVisible, goodsVisible, specVisible, grossVisible,
      tareVisible, netVisible, bundleVisible, realVisible, priceVisible, sumVisible,
      costVisible, grossTimeVisible, tareTimeVisible, remarkVisible: Boolean;
    backup1Visible, backup2Visible, backup3Visible, backup4Visible,
      backup5Visible, backup6Visible, backup7Visible, backup8Visible, backup9Visible: Boolean;
    //��Ŀ��ʾ����
    carCaption, faHuoCaption, shouHuoCaption, goodsCaption, specCaption, grossCaption,
      tareCaption, netCaption, bundleCaption, realCaption, priceCaption, sumCaption,
      costCaption, grossTimeCaption, tareTimeCaption, remarkCaption: string;
    backup1Caption, backup2Caption, backup3Caption, backup4Caption,
      backup5Caption, backup6Caption, backup7Caption, backup8Caption, backup9Caption: string;
    //��ĿĬ��ֵ
    carDefault, faHuoDefault, shouHuoDefault, goodsDefault, specDefault, grossDefault,
      tareDefault, netDefault, bundleDefault, realDefault, priceDefault, sumDefault,
      costDefault, grossTimeDefault, tareTimeDefault, remarkDefault: string;
    backup1Default, backup2Default, backup3Default, backup4Default,
      backup5Default, backup6Default, backup7Default, backup8Default, backup9Default: string;
    autoWriteTare: Boolean; //�Զ�Ԥ��Ƥ��
    useCode: Boolean; //ʹ�ô������Ǵ�
    //��ӡ��
    printer: string;
    //ʹ�ÿ��ʴ������
    useBundleRate: Boolean;
    //��ˮ�Ź���
    glideNoRule: Integer;
    //�Զ����ѡ��
    clearCar, clearFaHuo, clearShouHuo, clearGoods, clearSpec, clearGross, clearTare, clearNet,
      clearBundle, clearReal, clearPrice, clearSum, clearCost,
      clearRemark, clearBackup1, clearBackup2, clearBackup3, clearBackup4, clearBackup5,
      clearBackup6, clearBackup7, clearBackup8, clearBackup9: Boolean;
    allowNotSteady: Boolean; //�����ȶ���������
    selectTicketBeforePrint: Boolean; //��ӡʱѡ�����
    useTareDiff: Boolean;
    tareDiff: Double; //�Ƿ�����Ƥ��Ԥ��,������Ƥ�س��Χ
    printerBackRow: Double; //��ֽ����
  end;

  TSysConfigUtil = class
  private
  public
    class function loadSoftConfig(var systemConfig: TSysConfig): Boolean;
    class function loadFormConfig(var systemConfig: TSysConfig): Boolean;
    class function loadConfig(var systemConfig: TSysConfig): Boolean;
    class function saveConfig(var systemConfig: TSysConfig): Boolean;
  end;

implementation



{ TSysConfigUtil }

class function TSysConfigUtil.loadConfig(
  var systemConfig: TSysConfig): Boolean;
begin
  Result := loadSoftConfig(systemConfig) and loadFormConfig(systemConfig);
end;

class function TSysConfigUtil.loadFormConfig(
  var systemConfig: TSysConfig): Boolean;
var myini: TiniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\design.ini');
  try
    systemConfig.noVisible := myini.ReadBool('formDesign', 'no', False);
    systemConfig.glideNoVisible := myini.ReadBool('formDesign', 'glideNo', True);
    systemConfig.operVisible := myini.ReadBool('formDesign', 'oper', True);
    systemConfig.scaleManVisible := myini.ReadBool('formDesign', 'scaleMan', True);
    systemConfig.uploadVisible := myini.ReadBool('formDesign', 'upload', False);

    systemConfig.carVisible := myini.ReadBool('formDesign', 'car', True);
    systemConfig.faHuoVisible := myini.ReadBool('formDesign', 'faHuo', True);
    systemConfig.shouHuoVisible := myini.ReadBool('formDesign', 'shouHuo', True);
    systemConfig.goodsVisible := myini.ReadBool('formDesign', 'goods', True);
    systemConfig.specVisible := myini.ReadBool('formDesign', 'spec', True);
    systemConfig.grossVisible := myini.ReadBool('formDesign', 'grosss', True);
    systemConfig.tareVisible := myini.ReadBool('formDesign', 'tare', True);
    systemConfig.netVisible := myini.ReadBool('formDesign', 'net', True);
    systemConfig.bundleVisible := myini.ReadBool('formDesign', 'bundle', True);
    systemConfig.realVisible := myini.ReadBool('formDesign', 'real', True);
    systemConfig.priceVisible := myini.ReadBool('formDesign', 'price', True);
    systemConfig.sumVisible := myini.ReadBool('formDesign', 'sum', True);
    systemConfig.costVisible := myini.ReadBool('formDesign', 'cost', True);
    systemConfig.grossTimeVisible := myini.ReadBool('formDesign', 'grossTime', True);
    systemConfig.tareTimeVisible := myini.ReadBool('formDesign', 'tareTime', True);
    systemConfig.remarkVisible := myini.ReadBool('formDesign', 'remark', True);
    systemConfig.backup1Visible := myini.ReadBool('formDesign', 'backup1', False);
    systemConfig.backup2Visible := myini.ReadBool('formDesign', 'backup2', False);
    systemConfig.backup3Visible := myini.ReadBool('formDesign', 'backup3', False);
    systemConfig.backup4Visible := myini.ReadBool('formDesign', 'backup4', False);
    systemConfig.backup5Visible := myini.ReadBool('formDesign', 'backup5', False);
    systemConfig.backup6Visible := myini.ReadBool('formDesign', 'backup6', False);
    systemConfig.backup7Visible := myini.ReadBool('formDesign', 'backup7', False);
    systemConfig.backup8Visible := myini.ReadBool('formDesign', 'backup8', False);
    systemConfig.backup9Visible := myini.ReadBool('formDesign', 'backup9', False);

    systemConfig.carCaption := myini.ReadString('formDesign', 'carCaption', '������');
    systemConfig.faHuoCaption := myini.ReadString('formDesign', 'faHuoCaption', '������λ');
    systemConfig.shouHuoCaption := myini.ReadString('formDesign', 'shouHuoCaption', '�ջ���λ');
    systemConfig.goodsCaption := myini.ReadString('formDesign', 'goodsCaption', '������');
    systemConfig.specCaption := myini.ReadString('formDesign', 'specCaption', '�桡��');
    systemConfig.grossCaption := myini.ReadString('formDesign', 'grosssCaption', 'ë����');
    systemConfig.tareCaption := myini.ReadString('formDesign', 'tareCaption', '�ա���');
    systemConfig.netCaption := myini.ReadString('formDesign', 'netCaption', '������');
    systemConfig.bundleCaption := myini.ReadString('formDesign', 'bundleCaption', '�ۡ���');
    systemConfig.realCaption := myini.ReadString('formDesign', 'realCaption', 'ʵ����');
    systemConfig.priceCaption := myini.ReadString('formDesign', 'priceCaption', '������');
    systemConfig.sumCaption := myini.ReadString('formDesign', 'sumCaption', '�𡡶�');
    systemConfig.costCaption := myini.ReadString('formDesign', 'costCaption', '������');
    systemConfig.grossTimeCaption := myini.ReadString('formDesign', 'grossTimeCaption', 'ë��ʱ��');
    systemConfig.tareTimeCaption := myini.ReadString('formDesign', 'tareTimeCaption', '����ʱ��');
    systemConfig.remarkCaption := myini.ReadString('formDesign', 'remarkCaption', '����ע');
    systemConfig.backup1Caption := myini.ReadString('formDesign', 'backup1Caption', '����1');
    systemConfig.backup2Caption := myini.ReadString('formDesign', 'backup2Caption', '����2');
    systemConfig.backup3Caption := myini.ReadString('formDesign', 'backup3Caption', '����3');
    systemConfig.backup4Caption := myini.ReadString('formDesign', 'backup4Caption', '����4');
    systemConfig.backup5Caption := myini.ReadString('formDesign', 'backup5Caption', '����5');
    systemConfig.backup6Caption := myini.ReadString('formDesign', 'backup6Caption', '����6');
    systemConfig.backup7Caption := myini.ReadString('formDesign', 'backup7Caption', '����7');
    systemConfig.backup8Caption := myini.ReadString('formDesign', 'backup8Caption', '����8');
    systemConfig.backup9Caption := myini.ReadString('formDesign', 'backup9Caption', '����9');

    systemConfig.carDefault := myini.ReadString('formDesign', 'carDefault', '');
    systemConfig.faHuoDefault := myini.ReadString('formDesign', 'faHuoDefault', '');
    systemConfig.shouHuoDefault := myini.ReadString('formDesign', 'shouHuoDefault', '');
    systemConfig.goodsDefault := myini.ReadString('formDesign', 'goodsDefault', '');
    systemConfig.specDefault := myini.ReadString('formDesign', 'specDefault', '');
    systemConfig.grossDefault := myini.ReadString('formDesign', 'grosssDefault', '');
    systemConfig.tareDefault := myini.ReadString('formDesign', 'tareDefault', '');
    systemConfig.netDefault := myini.ReadString('formDesign', 'netDefault', '');
    systemConfig.bundleDefault := myini.ReadString('formDesign', 'bundleDefault', '');
    systemConfig.realDefault := myini.ReadString('formDesign', 'realDefault', '');
    systemConfig.priceDefault := myini.ReadString('formDesign', 'priceDefault', '');
    systemConfig.sumDefault := myini.ReadString('formDesign', 'sumDefault', '');
    systemConfig.costDefault := myini.ReadString('formDesign', 'costDefault', '');
    systemConfig.grossTimeDefault := myini.ReadString('formDesign', 'grossTimeDefault', '');
    systemConfig.tareTimeDefault := myini.ReadString('formDesign', 'tareTimeDefault', '');
    systemConfig.remarkDefault := myini.ReadString('formDesign', 'remarkDefault', '');
    systemConfig.backup1Default := myini.ReadString('formDesign', 'backup1Default', '');
    systemConfig.backup2Default := myini.ReadString('formDesign', 'backup2Default', '');
    systemConfig.backup3Default := myini.ReadString('formDesign', 'backup3Default', '');
    systemConfig.backup4Default := myini.ReadString('formDesign', 'backup4Default', '');
    systemConfig.backup5Default := myini.ReadString('formDesign', 'backup5Default', '');

    //�Զ����ѡ��
    systemConfig.clearCar := myini.ReadBool('formDesign', 'clearCar', True);
    systemConfig.clearFaHuo := myini.ReadBool('formDesign', 'clearFaHuo', True);
    systemConfig.clearShouHuo := myini.ReadBool('formDesign', 'clearShouHuo', True);
    systemConfig.clearGoods := myini.ReadBool('formDesign', 'clearGoods', True);
    systemConfig.clearSpec := myini.ReadBool('formDesign', 'clearSpec', True);
    systemConfig.clearBundle := myini.ReadBool('formDesign', 'clearBundle', True);
    systemConfig.clearPrice := myini.ReadBool('formDesign', 'clearPrice', True);
    systemConfig.clearCost := myini.ReadBool('formDesign', 'clearCost', True);
    systemConfig.clearRemark := myini.ReadBool('formDesign', 'clearRemark', True);
    systemConfig.clearBackup1 := myini.ReadBool('formDesign', 'clearBackup1', True);
    systemConfig.clearBackup2 := myini.ReadBool('formDesign', 'clearBackup2', True);
    systemConfig.clearBackup3 := myini.ReadBool('formDesign', 'clearBackup3', True);
    systemConfig.clearBackup4 := myini.ReadBool('formDesign', 'clearBackup4', True);
    systemConfig.clearBackup5 := myini.ReadBool('formDesign', 'clearBackup5', True);
    systemConfig.clearBackup6 := myini.ReadBool('formDesign', 'clearBackup6', True);
    systemConfig.clearBackup7 := myini.ReadBool('formDesign', 'clearBackup7', True);
    systemConfig.clearBackup8 := myini.ReadBool('formDesign', 'clearBackup8', True);
    systemConfig.clearBackup9 := myini.ReadBool('formDesign', 'clearBackup9', True);
  finally
    myini.Free;
  end;
end;

class function TSysConfigUtil.loadSoftConfig(
  var systemConfig: TSysConfig): Boolean;
var myini: TiniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    systemConfig.backupType := myini.ReadInteger('���ݿ�', '��������', 3);
    systemConfig.company := myini.ReadString('ϵͳ����', 'ʹ�õ�λ', '');
    systemConfig.tel := myini.ReadString('ϵͳ����', '�绰����', '');
    systemConfig.metricUnit := myini.ReadString('ϵͳ����', '���������λ', '��  ��');

    systemConfig.meterUnitIndex := myini.ReadInteger('ϵͳ����', '�Ǳ�������', 0);
    systemConfig.softUnitIndex := myini.ReadInteger('ϵͳ����', '����������', 0);
    if (systemConfig.meterUnitIndex < 3) then
    begin
      if (systemConfig.softUnitIndex < 3) then systemConfig.metricPoint := 0
      else systemConfig.metricPoint := -3;
    end
    else
    begin
      if (systemConfig.softUnitIndex < 3) then systemConfig.metricPoint := 3
      else systemConfig.metricPoint := 0;
    end;

    systemConfig.dropCount := myini.ReadInteger('ϵͳ����', '��������', 5);
    systemConfig.dropAuto := myini.ReadBool('ϵͳ����', '�Զ�����', true);
    systemConfig.autoComplete := myini.ReadBool('system_set', 'autoComplete', False);
    systemConfig.ReturnZero := myini.ReadInteger('ϵͳ����', '��������', 10);
    //ÿ�ι���֮��Ҫ��������ٴ����복��
    systemConfig.waitForZero := myini.ReadBool('system_set', 'waitForZero', False);

    systemConfig.AllowSecondTare := myini.ReadBool('ϵͳ����', '������ι�Ƥ', true);
    systemConfig.AllowSecondGross := myini.ReadBool('ϵͳ����', '������ι�ë', true);
    systemConfig.autoWriteTare := myini.ReadBool('system_set', 'autoWriteTare', False);
    //������λ,�ջ���λ����Ϣ�ô�������
    systemConfig.useCode := myini.ReadBool('system_set', 'useCode', True);
    systemConfig.EnterTab := myini.ReadBool('ϵͳ����', '�س��Ʊ�', true);
    systemConfig.usePound := myini.ReadBool('ϵͳ����', '���ð���', False);
    systemConfig.ManualInputPound := myini.ReadBool('ϵͳ����', '�ֹ�����', False);
    systemConfig.BasicPound := StrToFloat(myini.ReadString('ϵͳ����', '��ʼ����', '5'));
    systemConfig.UnitPound1 := StrToFloat(myini.ReadString('ϵͳ����', '��λ����1', '2'));
    systemConfig.UnitPound2 := StrToFloat(myini.ReadString('ϵͳ����', '��λ����2', '2'));
    systemConfig.ManualInputPound := myini.ReadBool('ϵͳ����', '�ֹ��������', False);

    systemConfig.poundGrade1 := myini.ReadFloat('ϵͳ����', '�ȼ�1', 0);
    systemConfig.poundGrade2 := myini.ReadFloat('ϵͳ����', '�ȼ�2', 10000);
    systemConfig.poundGrade3 := myini.ReadFloat('ϵͳ����', '�ȼ�3', 10000);
    systemConfig.poundGrade4 := myini.ReadFloat('ϵͳ����', '�ȼ�4', 100000);
    systemConfig.poundGrade5 := myini.ReadFloat('ϵͳ����', '�ȼ�5', 100000);
    systemConfig.poundGrade6 := myini.ReadFloat('ϵͳ����', '�ȼ�6', 120000);

    systemConfig.ChargeType := Myini.ReadInteger('ϵͳ����', '�Ʒѷ�ʽ', 1);
    systemConfig.scalePoint := myini.ReadInteger('ϵͳ����', 'С����λ��', 0);

    systemConfig.ShowPrepare := myini.ReadBool('ϵͳ����', '�Զ�ѡ��', false);

    systemConfig.FrozenCols := myini.ReadInteger('ϵͳ����', '�̶���', 0);
    systemConfig.useVoice := myini.ReadBool('ϵͳ����', '��������', false);
    systemConfig.autoClear := myini.ReadBool('������', '�Զ����', true);
    systemConfig.previewTicket := myini.ReadBool('������', 'Ԥ����ӡ', false);
    systemConfig.simpleWeight := myini.ReadBool('������', '�򵥹���', False);
    //�ػ�ʱ��
    systemConfig.closeTime := '';
    //�Ƿ��̨�Զ�����
    systemConfig.backRecordWeight := myini.ReadFloat('system_set', 'back_record_weight', 1000);
    //���С����λ��
    systemConfig.sumPoint := myini.ReadInteger('system_set', 'sumPoint', 2);
    //�Զ�ɾ����ʷ��¼
    systemConfig.deleteHistory := myini.ReadBool('ϵͳ����', 'ɾ����ʷ��¼', false);
    //�ȶ�����
    systemConfig.steadyCount := myini.ReadInteger('system_set', 'steadyCount', 4);
    systemConfig.useBundleRate := myini.ReadBool('system_set', 'useBundleRate', False);
    systemConfig.glideNoRule := myini.ReadInteger('system_set', 'glideNoRule', 0);

    //�����ȶ���������
    systemConfig.allowNotSteady := myini.ReadBool('system_set', 'allowNotSteady', false);
    //ÿ�γ��ش�ӡʱѡ�����
    systemConfig.selectTicketBeforePrint := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);

    //Ƥ�س���Ԥ��
    systemConfig.useTareDiff := myini.ReadBool('system_set', 'useTareDiff', False);
    systemConfig.tareDiff := myini.ReadFloat('system_set', 'tareDiff', 5);

    //��ֽ����
    systemConfig.printerBackRow := myini.ReadFloat('system_set', 'printerBackRow', 0);
  finally
    myini.Free;
  end;
  Result := True;
end;

class function TSysConfigUtil.saveConfig(var systemConfig: TSysConfig): Boolean;
begin
  Result := False;
end;

end.

