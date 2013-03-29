program weight;

uses
  Windows,
  Forms,
  Main in 'Main.pas' {MainForm},
  SoftwareSet in 'SoftwareSet.pas' {SoftwareSetForm},
  UserPurview in 'UserPurview.pas' {UserPurviewForm},
  QueryDM in 'QueryDM.pas' {QueryDataModule: TDataModule},
  ModifyPassword in 'ModifyPassword.pas' {ModifyPasswordForm},
  Login in 'Login.pas' {LoginForm},
  PrepareMaintain in 'PrepareMaintain.pas' {PrepareMaintainForm},
  DataShowSetting in 'DataShowSetting.pas' {DataShowSettingForm},
  DBBackup in 'DBBackup.pas' {DBBackupForm},
  DBClear in 'DBClear.pas' {DBClearForm},
  DBMaintain in 'DBMaintain.pas' {DBMaintainForm},
  Autoshut in 'Autoshut.pas' {AutoShutForm},
  InputWeight in 'InputWeight.pas' {InputWeightForm},
  Print in 'Print.pas' {PreviewSetForm},
  About in 'About.pas' {AboutForm},
  Waiting in 'Waiting.pas' {WaitingForm},
  MeterUtil in 'Common\MeterUtil.pas',
  ReadWeight in 'ReadWeight.pas' {ReadWeightForm},
  MultiGross in 'MultiGross.pas' {MultiGrossForm},
  Log in 'Log.pas' {LogForm},
  BackRecord in 'BackRecord.pas' {BackRecordForm},
  TicketSet in 'TicketSet.pas' {TicketSetForm},
  CommonUtil in 'Common\CommonUtil.pas',
  Car in 'Car.pas' {CarForm},
  DrawLine1 in 'Common\DrawLine1.pas',
  DataQuery in 'DataQuery.pas' {DataQueryForm},
  SelectOrder in 'SelectOrder.pas' {SelectOrderForm},
  ManualInput in 'ManualInput.pas' {ManualInputForm},
  SysConfig in 'Common\SysConfig.pas',
  WeightRecord in 'Common\WeightRecord.pas',
  weight_TLB in 'weight_TLB.pas',
  Meter in 'Meter.pas' {Meter: CoClass},
  Tao in 'Tao.pas' {TaoForm},
  TareChart in 'TareChart.pas' {TareChartForm},
  WeightSet in 'WeightSet.pas' {WeightSetForm},
  TicketSel in 'TicketSel.pas' {TicketSelForm},
  PrepareUtil in 'Common\PrepareUtil.pas',
  InitializeOption in 'InitializeOption.pas' {InitializeOptionForm},
  Voice in 'Voice.pas' {VoiceForm},
  MeterSet1 in 'MeterSet1.pas' {MeterSet1Form};

{
var
  hMutex: HWND;
  Ret: Integer; }

{$R *.TLB}

{$R *.res}
{$R UAC.res}

begin
  {hMutex := CreateMutex(nil, false, 'weight'); //是判断值
  Ret := GetLastError;
  if Ret <> ERROR_ALREADY_EXISTS then
  begin       }

  Application.Initialize;
  Application.CreateForm(TQueryDataModule, QueryDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataQueryForm, DataQueryForm);
  Application.CreateForm(TReadWeightForm, ReadWeightForm);
  Application.CreateForm(TMultiGrossForm, MultiGrossForm);
  Application.CreateForm(TCarForm, CarForm);
  Application.CreateForm(TTaoForm, TaoForm);
  Application.CreateForm(TMeterSet1Form, MeterSet1Form);
  Application.Run;

  {end
  else
  begin
    Application.MessageBox('该程序已经运行！', '警告', MB_ICONERROR + MB_OK);
    ReleaseMutex(hMutex)
  end  }
end.

