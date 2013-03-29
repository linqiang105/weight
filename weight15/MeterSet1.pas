unit MeterSet1;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, CnRS232Dialog, CnRS232, Buttons, ExtCtrls,
  
  IniFiles, Math, StrUtils, CnClasses;

type
  TMeterSet1Form = class(TForm)
    PTop: TPanel;
    PMeter: TPanel;
    CnRS2321: TCnRS232;
    CnRS232Dialog1: TCnRS232Dialog;
    CBUseMeter: TCheckBox;
    CBScreen: TCheckBox;
    lblCom: TLabel;
    CBPort: TComboBox;
    lblMeterType: TLabel;
    CBMeterType: TComboBox;
    GBDefine: TGroupBox;
    LEStart: TLabeledEdit;
    LEGetFirst: TLabeledEdit;
    CBQueue: TComboBox;
    LEDataLength: TLabeledEdit;
    LEPoint: TLabeledEdit;
    CBType: TComboBox;
    lblReceive: TLabel;
    BtnClose: TBitBtn;
    BtnApply: TBitBtn;
    MemoReceive: TMemo;
    GBShow: TGroupBox;
    RBTen: TRadioButton;
    RBSixteen: TRadioButton;
    BtnClear: TBitBtn;
    EdtSend: TComboBox;
    BtnPortSet: TButton;
    TSend: TTimer;
    TUDPClient: TTimer;
    TScreen: TTimer;
    BtnSend: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure CBPortChange(Sender: TObject);
    procedure CnRS2321ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure TSendTimer(Sender: TObject);
    procedure CBScreenClick(Sender: TObject);
    procedure TScreenTimer(Sender: TObject);
    procedure BtnPortSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function OpenCom(state: Boolean = True): Boolean;
    function setZero(): Boolean;
    function addMemo(s: string): Boolean;
  end;

var
  MeterSet1Form: TMeterSet1Form;

implementation

uses
  Main, MeterUtil, CommonUtil;

{$R *.dfm}

function TMeterSet1Form.addMemo(s: string): Boolean;
begin
  if MemoReceive.Lines.Count > 100 then
    MemoReceive.Lines.Clear;
  MemoReceive.Lines.Add(s);
end;

procedure TMeterSet1Form.FormCreate(Sender: TObject);
var i: Integer;
  myini: TIniFile;
begin
  for i := 1 to 16 do
  begin
    CBPort.Items.Add('COM' + IntToStr(i));
  end;
  CBMeterType.Items.Clear;
  CBMeterType.Items.Add('1.上海耀华XK3190-A6'); CBMeterType.Items.Add('2.上海耀华XK3190-A9');
  CBMeterType.Items.Add('3.上海耀华XK3190-A12E'); CBMeterType.Items.Add('4.上海耀华XK3190-DS1');
  CBMeterType.Items.Add('5.上海耀华XK3190-DS3'); CBMeterType.Items.Add('6.上海耀华XK3190-D2+');
  CBMeterType.Items.Add('7.上海耀华XK3190-D'); CBMeterType.Items.Add('8.上海耀华XK3190-D9');
  CBMeterType.Items.Add('9.上海耀华XK3190-C8'); CBMeterType.Items.Add('10.宁波柯力D2002');
  CBMeterType.Items.Add('11.宁波柯力D2008F(tf=0)'); CBMeterType.Items.Add('12.宁波柯力D2008F(tf=2)');
  CBMeterType.Items.Add('13.宁波柯力D2008F(tf=3)'); CBMeterType.Items.Add('14.杭州衡天HT9800');
  CBMeterType.Items.Add('15.杭州顶松DS822-D4+'); CBMeterType.Items.Add('16.杭州四方XK3196-B');
  CBMeterType.Items.Add('17.托力多8142_07 pro+'); CBMeterType.Items.Add('18.托力多8142_08 pro+');
  CBMeterType.Items.Add('19.珠海志美PT650D'); CBMeterType.Items.Add('20.福州科杰ORMT-2000');
  CBMeterType.Items.Add('21.福州东南XK3188A'); CBMeterType.Items.Add('22.福州东南XK-SCS-A');
  CBMeterType.Items.Add('23.富林泰克FT-11D'); CBMeterType.Items.Add('24.济南金钟XK3102D');
  CBMeterType.Items.Add('25.上海彩信XK315A6'); CBMeterType.Items.Add('26.HBM2116');
  CBMeterType.Items.Add('27.杭州衡天HT9800D7'); CBMeterType.Items.Add('28.常州宏力XK3101');
  CBMeterType.Items.Add('29.北京能克XK319A'); CBMeterType.Items.Add('30.VT-300D');
  CBMeterType.Items.Add('31.厦门懿恒JIK系列'); CBMeterType.Items.Add('32.厦门懿恒JWI586');
  CBMeterType.Items.Add('33.厦门懿恒JWI700W'); CBMeterType.Items.Add('34.杭州四方XK3196G');
  CBMeterType.Items.Add('35.万泰吊钩秤XK3109'); CBMeterType.Items.Add('36.自定义');

  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\meter.ini');
  try
    CBUseMeter.Checked := myini.ReadBool('meter1', 'use', True);
    CBScreen.Checked := myini.ReadBool('meter1', 'to_screen', False);
    CBMeterType.ItemIndex := myini.ReadInteger('meter1', 'meter_type', 1);
    CBType.ItemIndex := myini.ReadInteger('meter1', 'type', 0);
    LEStart.Text := myini.ReadString('meter1', 'startbit', '=');
    LEGetFirst.Text := myini.ReadString('meter1', 'first', '1');
    LEDataLength.Text := myini.ReadString('meter1', 'length', '7');
    CBQueue.ItemIndex := myini.ReadInteger('meter1', 'queue', 0);
    LEPoint.Text := myini.ReadString('meter1', 'point', '0');
    EdtSend.Text := myini.ReadString('meter1', 'set_zero', '');

    CnRS2321.ReadFromIni(myini, 'com1');
    CBPort.Text := CnRS2321.CommName;

    if CBUseMeter.Checked then
    begin
      OpenCom(CBUseMeter.Checked);
    end;
  finally
    myini.Free;
  end;
end;

function TMeterSet1Form.OpenCom(state: Boolean): Boolean;
begin
  if state then
  begin
    if CnRS2321.Connected then
      CnRS2321.StopComm;
    CnRS2321.CommName := CBPort.Text;
    try
      CnRS2321.StartComm;
    except
      MessageBox(Handle, '1#仪表串口打开失败', '提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON2 + MB_TOPMOST);
    end;
  end
  else
  begin
    CnRS2321.StopComm;
  end;
end;

function TMeterSet1Form.setZero: Boolean;
var s: string;
begin
  s := EdtSend.Text;
  CnRS2321.WriteCommData(PAnsiChar(s), Length(s));
end;

procedure TMeterSet1Form.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMeterSet1Form.BtnApplyClick(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'meter.ini');
  try
    myini.WriteBool('meter1', 'use', CBUseMeter.Checked);
    myini.WriteBool('meter1', 'to_screen', CBScreen.Checked);
    myini.WriteInteger('meter1', 'meter_type', CBMeterType.ItemIndex);
    myini.WriteString('meter1', 'startbit', LEStart.Text);
    myini.WriteString('meter1', 'first', LEGetFirst.Text);
    myini.WriteString('meter1', 'length', LEDataLength.Text);
    myini.WriteString('meter1', 'point', LEPoint.Text);
    myini.WriteInteger('meter1', 'type', CBType.ItemIndex);
    myini.Writeinteger('meter1', 'queue', CBQueue.ItemIndex);
    myini.WriteString('meter1', 'set_zero', EdtSend.Text);
    CnRS2321.WriteToIni(myini, 'com1');
    OpenCom(CBUseMeter.Checked);
  finally
    myini.Free;
  end;
end;

procedure TMeterSet1Form.CBPortChange(Sender: TObject);
begin
  OpenCom(CBUseMeter.Checked);
end;

procedure TMeterSet1Form.CnRS2321ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var s, s16, w: string;
  i: Integer;
  sf: boolean;
  cheat: Double;
begin
  SetLength(s, BufferLength);
  Move(Buffer^, PAnsiChar(s)^, BufferLength);
  if s <> '' then
    MainForm.SpTrans1.Brush.Color := clLime;

  if RBTen.Checked then
  begin
    addMemo(s);
  end
  else if RBSixteen.Checked then
  begin
    for i := 0 to Length(s) do
      s16 := s16 + Char(32) + Char(32) + IntToHex(Ord(s[i]), 2);
    addMemo(s16)
  end;

  try
    case CBMeterType.ItemIndex of
      0: w := TMeterUtil.YB3198A(s);
      1: w := TMeterUtil.XK3190A9(s);
      2: w := TMeterUtil.XK3190A12(s);
      3: w := TMeterUtil.XK3190A9(s);
      4: w := TMeterUtil.XK3190A9(s);
      5: w := TMeterUtil.YB3198B(s);
      6: w := TMeterUtil.YB3198D(s);
      7: w := TMeterUtil.YB3198BD9(s);
      8: w := TMeterUtil.XK3190A9(s);
      9: w := TMeterUtil.YBORMT2000(s);
      10: w := TMeterUtil.XK3190A9(s);
      11: w := TMeterUtil.D2008F_2(s);
      12: w := TMeterUtil.D2008F_3(s);
      13: w := TMeterUtil.HT9800(s);
      14: w := TMeterUtil.YB2005D(s);
      15: w := TMeterUtil.XK3196B(s, sf);
      16: w := TMeterUtil.YB8142Pro(s);
      17: w := TMeterUtil.YB8142Pro(s);
      18: w := TMeterUtil.YBPT650D(s);
      19: w := TMeterUtil.YBORMT2000(s);
      20: w := TMeterUtil.XK3188A(s);
      21: w := TMeterUtil.DNSCSA(s);
      22: w := TMeterUtil.FT11D(s);
      23: w := TMeterUtil.XK3102(s);
      24: w := TMeterUtil.XK315A6(s);
      25: w := TMeterUtil.HBM2116(s);
      26: w := TMeterUtil.HT9800D7PF(s, sf);
      27: w := TMeterUtil.XK3101(s, sf);
      28: w := TMeterUtil.XK319A(s);
      29: w := TMeterUtil.VT300_D(s);
      30: w := TMeterUtil.JIK(s);
      31: w := TMeterUtil.JWI586(s);
      32: w := TMeterUtil.JWI700(s);
      33: w := TMeterUtil.XK3196G(s);
      34: w := TMeterUtil.WTN81(s);
      35: w := TMeterUtil.Personlize(s, LEStart.Text, StrToIntDef(LEGetFirst.Text, 1),
          StrToIntDef(LEDataLength.Text, 6), StrToIntDef(LEPoint.Text, 0), CBQueue.ItemIndex,
          CBType.ItemIndex);
    end;
    if w = '' then
      Exit;

    MainForm.PWeight1.Caption := FloatToStr(
      StrToFloat(w) * power(10, MainForm.systemConfig.metricPoint))

  except
    Exit
  end
end;

procedure TMeterSet1Form.BtnClearClick(Sender: TObject);
begin
  MemoReceive.Lines.Clear;
end;

procedure TMeterSet1Form.BtnSendClick(Sender: TObject);
var s: string;
begin
  if CnRS2321.Connected then
  begin
    s := EdtSend.Text;
    CnRS2321.WriteCommData(PAnsiChar(s), Length(s));
  end;
end;

procedure TMeterSet1Form.TSendTimer(Sender: TObject);
var s: string;
begin
  case CBMeterType.ItemIndex of
    25: begin
        if CnRS2321.Connected then
        begin
          s := Chr($4D) + Chr($53) + Chr($56) + Chr($3F) + Chr($0D) + Chr($0A);
          CnRS2321.WriteCommData(PAnsiChar(s), Length(s));
        end;
      end;
    36: begin
        if CnRS2321.Connected then
        begin
          s := '010300000008';
          s := ':' + TCommonUtil.modbusAsciiCheck(s) + Chr($0D) + Chr($0A);
          CnRS2321.WriteCommData(PAnsiChar(s), Length(s));
        end;
      end;
  end;
end;

procedure TMeterSet1Form.CBScreenClick(Sender: TObject);
begin
  TScreen.Enabled := CBScreen.Checked;
end;

procedure TMeterSet1Form.TScreenTimer(Sender: TObject);
var WeightTemp, OutWeight: string[10];
  i: integer;
  s: string;
begin
  try
    WeightTemp := MainForm.PWeight1.Caption;
    OutWeight := '';
    for i := Length(WeightTemp) downto 1 do
    begin
      if WeightTemp[i] in ['0'..'9', '.'] then
        OutWeight := OutWeight + WeightTemp[i];
    end;
    if AnsiContainsText(WeightTemp, '-') then
    begin
      for i := 1 to 8 - Length(WeightTemp) do
        OutWeight := OutWeight + '0';
      OutWeight := OutWeight + '-'
    end
    else
    begin
      for i := 1 to 7 - Length(WeightTemp) do
        OutWeight := OutWeight + '0';
    end;
    s := '=' + OutWeight;
    CnRS2321.WriteCommData(PAnsiChar(s), Length(s));
  except
  end;
end;

procedure TMeterSet1Form.BtnPortSetClick(Sender: TObject);
begin
  CnRS232Dialog1.CommConfig := CnRS2321.CommConfig;
  CnRS232Dialog1.Timeouts := CnRS2321.Timeouts;
  if CnRS232Dialog1.Execute then
  begin
    CnRS2321.CommConfig := CnRS232Dialog1.CommConfig;
    CnRS2321.Timeouts := CnRS232Dialog1.Timeouts;
    OpenCom(CBUseMeter.Checked);
  end;
end;

end.

