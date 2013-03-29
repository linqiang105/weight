unit SysConfig;

interface

uses IniFiles, SysUtils;

type
  TSysConfig = class
  private
  public
    company, tel: string; //公司名称，联系电话
    metricUnit: string; // 计量单位
    meterUnitIndex, softUnitIndex, metricPoint: Integer;
    dropCount: Integer; //下拉项目数
    dropAuto: Boolean; //是否自动下拉
    autoComplete: Boolean; //列表框自动完成
    autoClear: Boolean; //自动清空
    previewTicket: Boolean; //预览磅单
    simpleWeight: Boolean; //简单过磅
    deleteHistory: Boolean; //开机自动删除所有的记录
    steadyCount: integer; //稳定次数
    ReturnZero: Double; //暗扣回零重量
    waitForZero: Boolean; //每次过磅之后要回零才能再次输入车号
    backRecordWeight: Double; //自动记录重量起始重量
    sumPoint: integer; //金额小数位
    backupType: Integer; //备份类型
    closeTime: string; //定时关机
    enterTab: boolean; //回车换行
    weightType, currentRecord: string; //当前点中的记录
    glideNo: string; //流水号
    useVoice: boolean; //启用语音报数
    manualInputPound: boolean; //不允话手工输入
    usePound: Boolean;
    basicPound, unitPound1, unitPound2: Double; //基本磅费
    poundGrade1, poundGrade2, poundGrade3, poundGrade4, poundGrade5, poundGrade6: Double; //分级单们磅费
    chargeType, scalePoint: Integer;
    //计费次数,小数点位数,毛重计费，１为毛重计费，0为净重计费
    cheat, carCheat: Double; //暗扣重量
    showPrepare: Boolean; //自动弹出车号选择框
    FrozenCols: Integer; //DBGridEh的固定列
    allowSecondGross, allowSecondTare: Boolean; //允许二次过毛和过皮
    //项目可见性
    noVisible, glideNoVisible, operVisible, scaleManVisible, uploadVisible: Boolean;
    carVisible, faHuoVisible, shouHuoVisible, goodsVisible, specVisible, grossVisible,
      tareVisible, netVisible, bundleVisible, realVisible, priceVisible, sumVisible,
      costVisible, grossTimeVisible, tareTimeVisible, remarkVisible: Boolean;
    backup1Visible, backup2Visible, backup3Visible, backup4Visible,
      backup5Visible, backup6Visible, backup7Visible, backup8Visible, backup9Visible: Boolean;
    //项目显示名称
    carCaption, faHuoCaption, shouHuoCaption, goodsCaption, specCaption, grossCaption,
      tareCaption, netCaption, bundleCaption, realCaption, priceCaption, sumCaption,
      costCaption, grossTimeCaption, tareTimeCaption, remarkCaption: string;
    backup1Caption, backup2Caption, backup3Caption, backup4Caption,
      backup5Caption, backup6Caption, backup7Caption, backup8Caption, backup9Caption: string;
    //项目默认值
    carDefault, faHuoDefault, shouHuoDefault, goodsDefault, specDefault, grossDefault,
      tareDefault, netDefault, bundleDefault, realDefault, priceDefault, sumDefault,
      costDefault, grossTimeDefault, tareTimeDefault, remarkDefault: string;
    backup1Default, backup2Default, backup3Default, backup4Default,
      backup5Default, backup6Default, backup7Default, backup8Default, backup9Default: string;
    autoWriteTare: Boolean; //自动预置皮重
    useCode: Boolean; //使用代码助记词
    //打印机
    printer: string;
    //使用扣率代替扣重
    useBundleRate: Boolean;
    //流水号规则
    glideNoRule: Integer;
    //自动清空选项
    clearCar, clearFaHuo, clearShouHuo, clearGoods, clearSpec, clearGross, clearTare, clearNet,
      clearBundle, clearReal, clearPrice, clearSum, clearCost,
      clearRemark, clearBackup1, clearBackup2, clearBackup3, clearBackup4, clearBackup5,
      clearBackup6, clearBackup7, clearBackup8, clearBackup9: Boolean;
    allowNotSteady: Boolean; //允许不稳定保存数据
    selectTicketBeforePrint: Boolean; //打印时选择磅单
    useTareDiff: Boolean;
    tareDiff: Double; //是否启用皮重预警,及允许皮重超差范围
    printerBackRow: Double; //退纸行数
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

    systemConfig.carCaption := myini.ReadString('formDesign', 'carCaption', '车　号');
    systemConfig.faHuoCaption := myini.ReadString('formDesign', 'faHuoCaption', '发货单位');
    systemConfig.shouHuoCaption := myini.ReadString('formDesign', 'shouHuoCaption', '收货单位');
    systemConfig.goodsCaption := myini.ReadString('formDesign', 'goodsCaption', '货　名');
    systemConfig.specCaption := myini.ReadString('formDesign', 'specCaption', '规　格');
    systemConfig.grossCaption := myini.ReadString('formDesign', 'grosssCaption', '毛　重');
    systemConfig.tareCaption := myini.ReadString('formDesign', 'tareCaption', '空　重');
    systemConfig.netCaption := myini.ReadString('formDesign', 'netCaption', '净　重');
    systemConfig.bundleCaption := myini.ReadString('formDesign', 'bundleCaption', '扣　重');
    systemConfig.realCaption := myini.ReadString('formDesign', 'realCaption', '实　重');
    systemConfig.priceCaption := myini.ReadString('formDesign', 'priceCaption', '单　价');
    systemConfig.sumCaption := myini.ReadString('formDesign', 'sumCaption', '金　额');
    systemConfig.costCaption := myini.ReadString('formDesign', 'costCaption', '过磅费');
    systemConfig.grossTimeCaption := myini.ReadString('formDesign', 'grossTimeCaption', '毛重时间');
    systemConfig.tareTimeCaption := myini.ReadString('formDesign', 'tareTimeCaption', '空重时间');
    systemConfig.remarkCaption := myini.ReadString('formDesign', 'remarkCaption', '备　注');
    systemConfig.backup1Caption := myini.ReadString('formDesign', 'backup1Caption', '备用1');
    systemConfig.backup2Caption := myini.ReadString('formDesign', 'backup2Caption', '备用2');
    systemConfig.backup3Caption := myini.ReadString('formDesign', 'backup3Caption', '备用3');
    systemConfig.backup4Caption := myini.ReadString('formDesign', 'backup4Caption', '备用4');
    systemConfig.backup5Caption := myini.ReadString('formDesign', 'backup5Caption', '备用5');
    systemConfig.backup6Caption := myini.ReadString('formDesign', 'backup6Caption', '备用6');
    systemConfig.backup7Caption := myini.ReadString('formDesign', 'backup7Caption', '备用7');
    systemConfig.backup8Caption := myini.ReadString('formDesign', 'backup8Caption', '备用8');
    systemConfig.backup9Caption := myini.ReadString('formDesign', 'backup9Caption', '备用9');

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

    //自动清空选项
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
    systemConfig.backupType := myini.ReadInteger('数据库', '备份类型', 3);
    systemConfig.company := myini.ReadString('系统设置', '使用单位', '');
    systemConfig.tel := myini.ReadString('系统设置', '电话号码', '');
    systemConfig.metricUnit := myini.ReadString('系统设置', '软件计量单位', '公  斤');

    systemConfig.meterUnitIndex := myini.ReadInteger('系统设置', '仪表计量序号', 0);
    systemConfig.softUnitIndex := myini.ReadInteger('系统设置', '软件计量序号', 0);
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

    systemConfig.dropCount := myini.ReadInteger('系统设置', '下拉项数', 5);
    systemConfig.dropAuto := myini.ReadBool('系统设置', '自动下拉', true);
    systemConfig.autoComplete := myini.ReadBool('system_set', 'autoComplete', False);
    systemConfig.ReturnZero := myini.ReadInteger('系统设置', '回零重量', 10);
    //每次过磅之后要回零才能再次输入车号
    systemConfig.waitForZero := myini.ReadBool('system_set', 'waitForZero', False);

    systemConfig.AllowSecondTare := myini.ReadBool('系统设置', '允许二次过皮', true);
    systemConfig.AllowSecondGross := myini.ReadBool('系统设置', '允许二次过毛', true);
    systemConfig.autoWriteTare := myini.ReadBool('system_set', 'autoWriteTare', False);
    //发货单位,收货单位等信息用代码输入
    systemConfig.useCode := myini.ReadBool('system_set', 'useCode', True);
    systemConfig.EnterTab := myini.ReadBool('系统设置', '回车制表', true);
    systemConfig.usePound := myini.ReadBool('系统设置', '启用磅费', False);
    systemConfig.ManualInputPound := myini.ReadBool('系统设置', '手工磅费', False);
    systemConfig.BasicPound := StrToFloat(myini.ReadString('系统设置', '起始磅费', '5'));
    systemConfig.UnitPound1 := StrToFloat(myini.ReadString('系统设置', '单位磅费1', '2'));
    systemConfig.UnitPound2 := StrToFloat(myini.ReadString('系统设置', '单位磅费2', '2'));
    systemConfig.ManualInputPound := myini.ReadBool('系统设置', '手工输入磅费', False);

    systemConfig.poundGrade1 := myini.ReadFloat('系统设置', '等级1', 0);
    systemConfig.poundGrade2 := myini.ReadFloat('系统设置', '等级2', 10000);
    systemConfig.poundGrade3 := myini.ReadFloat('系统设置', '等级3', 10000);
    systemConfig.poundGrade4 := myini.ReadFloat('系统设置', '等级4', 100000);
    systemConfig.poundGrade5 := myini.ReadFloat('系统设置', '等级5', 100000);
    systemConfig.poundGrade6 := myini.ReadFloat('系统设置', '等级6', 120000);

    systemConfig.ChargeType := Myini.ReadInteger('系统设置', '计费方式', 1);
    systemConfig.scalePoint := myini.ReadInteger('系统设置', '小数点位数', 0);

    systemConfig.ShowPrepare := myini.ReadBool('系统设置', '自动选择', false);

    systemConfig.FrozenCols := myini.ReadInteger('系统设置', '固定列', 0);
    systemConfig.useVoice := myini.ReadBool('系统设置', '启用语音', false);
    systemConfig.autoClear := myini.ReadBool('主界面', '自动清空', true);
    systemConfig.previewTicket := myini.ReadBool('主界面', '预览打印', false);
    systemConfig.simpleWeight := myini.ReadBool('主界面', '简单过磅', False);
    //关机时间
    systemConfig.closeTime := '';
    //是否后台自动保存
    systemConfig.backRecordWeight := myini.ReadFloat('system_set', 'back_record_weight', 1000);
    //金额小数点位数
    systemConfig.sumPoint := myini.ReadInteger('system_set', 'sumPoint', 2);
    //自动删除历史记录
    systemConfig.deleteHistory := myini.ReadBool('系统设置', '删除历史记录', false);
    //稳定次数
    systemConfig.steadyCount := myini.ReadInteger('system_set', 'steadyCount', 4);
    systemConfig.useBundleRate := myini.ReadBool('system_set', 'useBundleRate', False);
    systemConfig.glideNoRule := myini.ReadInteger('system_set', 'glideNoRule', 0);

    //允许不稳定保存重量
    systemConfig.allowNotSteady := myini.ReadBool('system_set', 'allowNotSteady', false);
    //每次称重打印时选择磅单
    systemConfig.selectTicketBeforePrint := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);

    //皮重超差预警
    systemConfig.useTareDiff := myini.ReadBool('system_set', 'useTareDiff', False);
    systemConfig.tareDiff := myini.ReadFloat('system_set', 'tareDiff', 5);

    //退纸行数
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

