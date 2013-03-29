unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Spin, ExtCtrls, CPort, CPortCtl,
  FileCtrl, Menus, ImgList;

type
  TFrmMain = class(TForm)
    PClient: TPanel;
    PButtom: TPanel;
    PTopLeft: TPanel;
    MemoIn: TMemo;
    cbsendHex: TCheckBox;
    cbAutoSend: TCheckBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    BtnClear2: TButton;
    Panel4: TPanel;
    btnSend: TButton;
    BtnChooseFile: TButton;
    BtnSendFile: TButton;
    edSendFile: TEdit;
    MemoOut: TMemo;
    ImageList1: TImageList;
    GBCOM: TGroupBox;
    ComComboBox2: TComComboBox;
    ComComboBox3: TComComboBox;
    ComComboBox4: TComComboBox;
    ComComboBox5: TComComboBox;
    ComComboBox6: TComComboBox;
    ComPort: TComPort;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComLed1: TComLed;
    Label9: TLabel;
    ComLed2: TComLed;
    Label10: TLabel;
    ComLed3: TComLed;
    Label11: TLabel;
    btnSwitch: TButton;
    BtnClear: TButton;
    cbRecHex: TCheckBox;
    cbAutoClean: TCheckBox;
    btnStopShow: TButton;
    BtnSave: TButton;
    BtnChange: TButton;
    edPath: TEdit;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    CBMultiline: TCheckBox;
    GBModBus: TGroupBox;
    LEAddr: TLabeledEdit;
    LEFunc: TLabeledEdit;
    LEStart: TLabeledEdit;
    LELength: TLabeledEdit;
    LECheck: TLabeledEdit;
    SBSendModBus: TSpeedButton;
    edStatus: TEdit;
    edRx: TEdit;
    edTx: TEdit;
    BtnZero: TButton;
    PMChange: TPopupMenu;
    N161: TMenuItem;
    N1: TMenuItem;
    PRight: TPanel;
    GBCheckType: TGroupBox;
    BtnJS: TButton;
    BtnModBus: TButton;
    BtnRFS: TButton;
    BtnCRC8: TButton;
    BtnCRC16: TButton;
    BtnCRC32: TButton;
    BtnThirdPart: TButton;
    GBLLLED: TGroupBox;
    SBDefineMessage: TSpeedButton;
    SBShowMessage: TSpeedButton;
    SBShowFirst: TSpeedButton;
    SBShowSecond: TSpeedButton;
    SBShowThird: TSpeedButton;
    SBShowTemp: TSpeedButton;
    SBCheckTime: TSpeedButton;
    EdtLEDMessage: TEdit;
    GBPPI: TGroupBox;
    SpRun: TShape;
    BtnLogin: TButton;
    BtnRun: TButton;
    BtnStop: TButton;
    BtnRead: TButton;
    BtnWrite: TButton;
    EdtPLCAddr: TEdit;
    BtnConfirm: TButton;
    CBDataType: TComboBox;
    CBDataMode: TComboBox;
    EdtDataAddr: TEdit;
    EdtDataLen: TEdit;
    BtnSet: TButton;
    EdtData: TEdit;
    SpeedButton1: TSpeedButton;
    ComComboBox1: TComComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);
    procedure btnSwitchClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnZeroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComComboBox1Change(Sender: TObject);
    procedure BtnClear2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure cbAutoSendClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnStopShowClick(Sender: TObject);
    procedure BtnChangeClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnChooseFileClick(Sender: TObject);
    procedure BtnSendFileClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure BtnJSClick(Sender: TObject);
    procedure BtnModBusClick(Sender: TObject);
    procedure BtnRFSClick(Sender: TObject);
    procedure BtnCRC8Click(Sender: TObject);
    procedure BtnCRC16Click(Sender: TObject);
    procedure BtnCRC32Click(Sender: TObject);
    procedure BtnThirdPartClick(Sender: TObject);
    procedure LEAddrChange(Sender: TObject);
    procedure LEAddrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBSendModBusClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnWriteClick(Sender: TObject);
    procedure BtnSetClick(Sender: TObject);
    procedure SBDefineMessageClick(Sender: TObject);
    procedure SBShowMessageClick(Sender: TObject);
    procedure SBShowFirstClick(Sender: TObject);
    procedure SBShowSecondClick(Sender: TObject);
    procedure SBShowThirdClick(Sender: TObject);
    procedure SBShowTempClick(Sender: TObject);
    procedure SBCheckTimeClick(Sender: TObject);
    procedure N161Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    FShowText: Boolean;
    FRXNum: Integer;
    FTXNum: Integer;
    str_write: array of char;
    procedure ShowRX;
    procedure ShowTX;
    procedure ShowStatus;
    procedure SendFile(const filename: string);
    procedure SendString(const Str: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses UCRC16, ThirdPart, PPI, LED680;

{$R *.dfm}

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
var
  B: TBitmap;
begin
  if PRight.Width = 454 then
    PRight.Width := 0
  else
    PRight.Width := 454;
end;

procedure TFrmMain.ComPortAfterOpen(Sender: TObject);
begin
  btnSwitch.Caption := '关闭串口';
  ShowStatus;
end;

procedure TFrmMain.ComPortAfterClose(Sender: TObject);
begin
  btnSwitch.Caption := '打开串口';
  ShowStatus;
end;

procedure TFrmMain.btnSwitchClick(Sender: TObject);
begin
  if ComPort.Connected then
    ComPort.Close
  else
    ComPort.Open;
end;

procedure TFrmMain.BtnClearClick(Sender: TObject);
begin
  MemoIn.Clear;
  if ComPort.Connected then
    ComPort.ClearBuffer(True, False);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  exefile: file of byte;
  ConstStr: byte;
begin
  {AssignFile(exefile, Application.ExeName);
  filemode := 0; //读写属性设置为只读，这样才不会出错！
  ReSet(exefile);
  Seek(exefile, 655355); //exe文件的第5+1个位置（自己设要查找的位置）
  Read(exefile, ConstStr);
  //showmessage(inttostr(ord(ConstStr))); //看看实际是多少（假定为56）
  CloseFile(exefile);
  if ConstStr <>  0 then
    Application.Terminate; //如果第5+1个位置的值不是56退出（说明你的软件被改动了）
  }
  FShowText := True;
  FRXNum := 0;
  FTXNum := 0;
  edPath.Text := ExtractFilePath(Application.ExeName) + 'ComRec';
end;

procedure TFrmMain.ShowRX;
begin
  edRx.Text := 'Rx:' + inttostr(FRXNum);
end;

procedure TFrmMain.ShowStatus;
begin
  if ComPort.Connected then
  begin
    edStatus.Text := Format('STATUS:%s Opend %s %s %s %s %s', [ComComboBox2.Text,
      ComComboBox2.Text, ComComboBox3.Text, ComComboBox4.Text, ComComboBox5.Text,
        ComComboBox6.Text]);
  end
  else
    edStatus.Text := 'STATUS:COM Port Closed';
end;

procedure TFrmMain.ShowTX;
begin
  edTx.Text := 'Tx:' + inttostr(FTXNum);
end;

procedure TFrmMain.BtnZeroClick(Sender: TObject);
begin
  FRXNum := 0;
  FTXNum := 0;
  ShowRX;
  ShowTX;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPort.OnAfterClose := nil;
end;

procedure TFrmMain.ComComboBox1Change(Sender: TObject);
begin
  ShowStatus;
end;

procedure TFrmMain.BtnClear2Click(Sender: TObject);
begin
  MemoOut.Clear;
end;

procedure TFrmMain.SpinEdit1Change(Sender: TObject);
begin
  Timer1.Interval := SpinEdit1.Value;
end;

procedure TFrmMain.cbAutoSendClick(Sender: TObject);
begin
  Timer1.Enabled := cbAutoSend.Checked;
end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
  if MemoOut.Text <> '' then
    btnSend.Click;
end;

procedure TFrmMain.TrayIcon1DblClick(Sender: TObject);
begin
  Visible := not Visible
end;

procedure TFrmMain.btnStopShowClick(Sender: TObject);
begin
  FShowText := not FShowText;
  if FShowText then
    btnStopShow.Caption := '停止显示'
  else
    btnStopShow.Caption := '继续显示';
end;

procedure TFrmMain.BtnChangeClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := edPath.Text;
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
    edPath.Text := Dir;
end;

function AddBackSlash(const S: string): string;
begin
  result := S;
  if S <> '' then
  begin
    if result[Length(result)] <> '\' then
      result := result + '\';
  end;
end;

procedure TFrmMain.BtnSaveClick(Sender: TObject);
var
  S: string;
begin
  S := AddBackSlash(edPath.Text);
  if not DirectoryExists(S) then
    CreateDir(S);
  S := S + 'Rec' + FormatDateTime('yymmddhhssnn', Now) + '.txt';
  MemoIn.Lines.SaveToFile(S);
  showmessage(S + '已保存');
end;

procedure TFrmMain.BtnChooseFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edSendFile.Text := OpenDialog1.filename;
end;

procedure TFrmMain.SendFile(const filename: string);
var
  S: TStringList;
begin
  S := TStringList.Create;
  try
    S.LoadFromFile(filename);
    SendString(S.Text);
  finally
    S.Free;
  end;
end;

function HexStrToStr(const S: string): string;
//16进制字符串转换成字符串
var
  t: Integer;
  ts: string;
  M, Code: Integer;
begin
  t := 1;
  result := '';
  while t <= Length(S) do
  begin
    while not (S[t] in ['0'..'9', 'A'..'F', 'a'..'f']) do
      inc(t);
    if (t + 1 > Length(S)) or (not (S[t + 1] in ['0'..'9', 'A'..'F', 'a'..'f'])) then
      ts := '$' + S[t]
    else
      ts := '$' + S[t] + S[t + 1];
    Val(ts, M, Code);
    if Code = 0 then
      result := result + Chr(M);
    inc(t, 2);
  end;
end;

procedure TFrmMain.BtnSendFileClick(Sender: TObject);
begin
  if FileExists(edSendFile.Text) then
    SendFile(edSendFile.Text);
  //ComPort.WriteStr(HexStrToStr('0241') + 'N0701181xx' + HexStrToStr('0003'));
end;

procedure TFrmMain.btnSendClick(Sender: TObject);
begin
  if cbsendHex.Checked then
    SendString(HexStrToStr(MemoOut.Text))
  else
    SendString(MemoOut.Text);
end;

procedure TFrmMain.SendString(const Str: string);
var
  obj: PAsync;
begin
  InitAsync(obj);
  try
    if ComPort.Connected then
    begin
      ComPort.WriteStrAsync(Str, obj);
      ComPort.WaitForAsync(obj);
      FTXNum := FTXNum + Length(Str);
    end;
  finally
    DoneAsync(obj);
    ShowTX;
  end;
end;

function StrToHexStr(const S: string): string;
//字符串转换成16进制字符串
var
  i: Integer;
begin
  for i := 1 to Length(S) do
  begin
    if i = 1 then
      result := IntToHex(ord(S[1]), 2)
    else
      result := result + ' ' + IntToHex(ord(S[i]), 2);
  end;
end;

procedure TFrmMain.ComPortRxChar(Sender: TObject; Count: Integer);
var
  Str: string;
begin
  ComPort.ReadStr(Str, Count);
  if FShowText then
  begin
    if cbRecHex.Checked then
    begin
      if CBMultiline.Checked then
        MemoIn.Lines.Add(StrToHexStr(Str))
      else
        MemoIn.Text := MemoIn.Text + StrToHexStr(Str);
    end
    else
    begin
      if CBMultiline.Checked then
        MemoIn.Lines.Add(Str)
      else
        MemoIn.Text := MemoIn.Text + Str;
    end;
  end;
  FRXNum := FRXNum + Count;
  ShowRX;
  //MemoIn.Text := MemoIn.Text + Chr(13) + Chr(10);
end;

function Check(OutChr: array of Char; Num: Integer): Char;
var i, r1: Longint;
begin
  r1 := ord(OutChr[1]);
  for i := 2 to Num do
    r1 := r1 xor ord(OutChr[i]);
  result := Chr(r1 or ord(OutChr[4]));
end;

procedure TFrmMain.BtnJSClick(Sender: TObject);
var c: array[0..25] of Char;
  i, j, a: Integer;
  Str, str1: string;
  B: Char;
begin
  str1 := MemoOut.Lines.Text;
  for i := 1 to Length(str1) do //去掉不相关的字节
    if str1[i] in ['0'..'9', 'a'..'f', 'A'..'F'] then
      Str := Str + str1[i];
  i := 1;
  a := Length(Str) div 2;
  for j := 0 to a - 1 do
  begin
    c[j] := Chr(StrToInt('$' + Str[i] + Str[i + 1]));
    i := i + 2;
  end;
  B := Check(c, a - 1);
  MemoOut.Lines.Text := MemoOut.Lines.Text + IntToHex(ord(B), 2) + '03';
  MemoOut.SetFocus;
end;

function ModBusCheck(S: string): string;
var CRC16, UseCRC: Dword;
  i, j: Integer;
  Data: array[0..200] of Integer;
  TempCRC, a: string;
begin
  for i := 1 to Length(S) do
    if S[i] <> ' ' then
      a := a + S[i];
  CRC16 := $FFFF;
  for i := 0 to Length(a) div 2 - 1 do
  begin
    Data[i] := StrToInt('$' + Copy(a, i * 2 + 1, 2));
    CRC16 := Data[i] xor CRC16; //异或运算
    for j := 1 to 8 do //执行8次
    begin
      UseCRC := CRC16;
      CRC16 := CRC16 shr 1; //右移一位
      if ((UseCRC and $1) = $1) then //右移前，如果最后一位是1的话
        CRC16 := CRC16 xor $A001; //低右移后的数据和 A001异或
    end;
  end;
  result := IntToHex(CRC16, 4);
end;

procedure TFrmMain.BtnModBusClick(Sender: TObject);
var TempCRC: string;
begin
  TempCRC := ModBusCheck(MemoOut.Text);
  MemoOut.Text := MemoOut.Text + ' ' + Copy(TempCRC, 3, 2) + ' ' + Copy(TempCRC, 1, 2);
end;

procedure TFrmMain.BtnRFSClick(Sender: TObject);
var c: array of byte;
  i, j, a: Integer;
  Str, str1: string;
  B: byte;
begin
  str1 := MemoOut.Lines.Text;
  for i := 1 to Length(str1) do //去掉不相关的字节
    if str1[i] in ['0'..'9', 'a'..'f', 'A'..'F'] then
      Str := Str + str1[i];
  i := 1;
  a := Length(Str) div 2;
  SetLength(c, a);
  for j := 0 to a - 1 do
  begin
    c[j] := StrToInt('$' + Str[i] + Str[i + 1]);
    i := i + 2;
  end;
  for i := 0 to a - 1 do
    B := B + c[i];
  B := not B;
  inc(B);
  MemoOut.Lines.Text := MemoOut.Lines.Text + IntToHex(B, 2);
  MemoOut.SetFocus;
end;

procedure GenerateCRC8(Value: byte; var CrcValue: byte);
var
  CRC: Word;
begin
  CRC := CrcValue xor Value;
  CRC := CRC xor (CRC shl 1) xor (CRC shl 2) xor (CRC shl 3) xor (CRC shl 4)
    xor (CRC shl 5) xor (CRC shl 6) xor (CRC shl 7);
  CRC := (CRC and $FE) xor ((CRC shr 8) and $01);
  CrcValue := CRC;
end;

function GetCrc8(AStr: string; Count: Integer): byte;
var
  i: Integer;
begin
  result := 0;
  for i := 1 to Count do
    GenerateCRC8(ord(AStr[i]), result);
  result := result xor $FF;
end;

function MyTrim(str1: string): string;
var i: Integer;
begin
  result := '';
  for i := 1 to Length(str1) do //去掉不相关的字节
    if str1[i] in ['0'..'9', 'a'..'f', 'A'..'F'] then
      result := result + str1[i];
end;

procedure TFrmMain.BtnCRC8Click(Sender: TObject);
var crc8: byte;
  strTmp, strTransfer: string;
  i: Integer;
begin
  strTmp := MyTrim(MemoOut.Text);
  strTransfer := '';
  i := 1;
  while i < Length(strTmp) do
  begin
    strTransfer := strTransfer + Chr(StrToInt('$' + Copy(strTmp, i, 2)));
    i := i + 2;
  end;
  crc8 := GetCrc8(strTransfer, Length(strTransfer));
  MemoOut.Text := MemoOut.Text + ' ' + IntToHex(crc8, 2);
end;

procedure TFrmMain.BtnCRC16Click(Sender: TObject);
var strTmp, strTransfer: string;
  i: Integer;
begin
  strTmp := MyTrim(MemoOut.Text);
  strTransfer := '';
  i := 1;
  while i < Length(strTmp) do
  begin
    strTransfer := strTransfer + Chr(StrToInt('$' + Copy(strTmp, i, 2)));
    i := i + 2;
  end;
  MemoOut.Text := MemoOut.Text + ' ' + Get_CRC16Code(strTransfer);
end;

procedure TFrmMain.BtnCRC32Click(Sender: TObject);
var strTmp, strTransfer: string;
  i: Integer;
begin
  strTmp := MyTrim(MemoOut.Text);
  strTransfer := '';
  i := 1;
  while i < Length(strTmp) do
  begin
    strTransfer := strTransfer + Chr(StrToInt('$' + Copy(strTmp, i, 2)));
    i := i + 2;
  end;
  MemoOut.Text := MemoOut.Text + ' ' + Get_Crc32(strTransfer, Length(strTransfer));
end;

procedure TFrmMain.BtnThirdPartClick(Sender: TObject);
begin
  ThirdPartForm.ShowModal;
end;

procedure TFrmMain.LEAddrChange(Sender: TObject);
var CheckText: string;
begin
  CheckText := ModBusCheck(LEAddr.Text + LEFunc.Text + LEStart.Text + LELength.Text);
  LECheck.Text := Copy(CheckText, 3, 2) + Copy(CheckText, 1, 2);
end;

procedure TFrmMain.LEAddrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    PostMessage(TWinControl(Sender).Handle, WM_KEYDOWN, VK_TAB, 0);
end;

procedure TFrmMain.SBSendModBusClick(Sender: TObject);
begin
  cbsendHex.Checked := True;
  MemoOut.Text := LEAddr.Text + LEFunc.Text + LEStart.Text + LELength.Text + LECheck.Text;
  btnSend.Click;
end;

procedure TFrmMain.BtnLoginClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
    MemoOut.Text := StrToHexStr(plc.PLCLogin);
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.BtnRunClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
    MemoOut.Text := StrToHexStr(plc.PLCRun);
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.BtnStopClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
    MemoOut.Text := StrToHexStr(plc.PLCStop);
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.BtnReadClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
    plc.DataType := CBDataType.ItemIndex; // 区
    plc.DataMode := CBDataMode.ItemIndex; //字节
    plc.DataAddr := StrToIntDef(EdtDataAddr.Text, 0);
    plc.DataLen := StrToIntDef(EdtDataLen.Text, 1); //读1位
    MemoOut.Text := StrToHexStr(plc.PLCReadData);
    {//if Chr($E5) then
    MemoOut.Lines.Add(StrToHexStr(plc.PLCConfirm)); }
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.BtnConfirmClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
    MemoOut.Text := StrToHexStr(plc.PLCConfirm);
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.BtnWriteClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
    plc.DataType := CBDataType.ItemIndex; // 区
    plc.DataMode := CBDataMode.ItemIndex; //字节
    plc.DataAddr := StrToIntDef(EdtDataAddr.Text, 0);
    plc.DataLen := StrToIntDef(EdtDataLen.Text, 1); //读1位
    plc.DataValue := StrToIntDef(EdtData.Text, 0);
    MemoOut.Text := StrToHexStr(plc.PLCWriteData);
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.BtnSetClick(Sender: TObject);
var plc: TPPI;
begin
  plc := TPPI.Create;
  try
    if (Sender as TButton).Caption = '强制' then
    begin
      plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
      plc.DataType := CBDataType.ItemIndex; // 区
      plc.DataMode := CBDataMode.ItemIndex; //读取类型
      plc.DataAddr := StrToIntDef(EdtDataAddr.Text, 0);
      plc.DataLen := StrToIntDef(EdtDataLen.Text, 1); //默认读1位
      plc.DataValue := StrToIntDef(EdtData.Text, 0);
      MemoOut.Text := StrToHexStr(plc.PLCEnforce);
      (Sender as TButton).Caption := '复位';
    end
    else
    begin
      plc.Addr := StrToIntDef(EdtPLCAddr.Text, 2);
      plc.DataType := CBDataType.ItemIndex; // 区
      plc.DataMode := CBDataMode.ItemIndex; //读取类型
      plc.DataAddr := StrToIntDef(EdtDataAddr.Text, 0);
      plc.DataLen := StrToIntDef(EdtDataLen.Text, 1); //默认读1位
      plc.DataValue := StrToIntDef(EdtData.Text, 0);
      MemoOut.Text := StrToHexStr(plc.PLCReset);
      (Sender as TButton).Caption := '强制';
    end;
  finally
    plc.Free;
  end;
end;

procedure TFrmMain.SBDefineMessageClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    led.LEDMessage := EdtLEDMessage.Text;
    led.Func := 1;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.SBShowMessageClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    led.Func := 2;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.SBShowFirstClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    led.Func := 3;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.SBShowSecondClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    led.Func := 4;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.SBShowThirdClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    led.Func := 5;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.SBShowTempClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    //led.LEDMessage := EdtLedMessage.Text;
    led.Func := 6;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.SBCheckTimeClick(Sender: TObject);
var led: TLED680;
begin
  led := TLED680.Create;
  try
    led.Func := 8;
    MemoOut.Text := StrToHexStr(led.ExecuteCode);
  finally
    led.Free;
  end;
end;

procedure TFrmMain.N161Click(Sender: TObject);
var s,s_16:string;
  i:integer;
begin
  s := MemoOut.Text;
  s_16 := '';
  for i:=1 to Length(s) do
  begin
    s_16 := s_16 + StrToHexStr(s[i]) + ' ';
  end;
  MemoOut.Text := s_16;
end;

procedure TFrmMain.N1Click(Sender: TObject);
var s,s_out:string;
  i:integer;
begin
  s := MemoOut.Text;
  s_out := '';
  for i:=1 to Length(s) do
  begin
    if s[i] in ['0'..'9','a'..'f','A'..'F'] then
      s_out := s_out + s[i];
  end;
  MemoOut.Text := HexStrToStr(s_out);
end;

end.

