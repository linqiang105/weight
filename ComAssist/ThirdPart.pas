unit ThirdPart;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls, Math, StrUtils;

type
  TThirdPartForm = class(TForm)
    GBTrans: TGroupBox;
    BtnIEEE2Num: TButton;
    BtnNumToIEEE: TButton;
    LEIEEE: TLabeledEdit;
    LENum: TLabeledEdit;
    GBDialog: TGroupBox;
    BtnInfo: TButton;
    BtnWarning: TButton;
    BtnError: TButton;
    BtnQuery: TButton;
    BtnConf: TButton;
    BtnDel: TButton;
    BtnSave: TButton;
    BtnExit: TButton;
    BtnDevelop: TButton;
    GBString: TGroupBox;
    BtnRepeatStr: TButton;
    EdtSubstr: TEdit;
    EdtCount: TEdit;
    EdtFinalStr: TEdit;
    GBOther: TGroupBox;
    SBLunar: TSpeedButton;
    DTP: TDateTimePicker;
    BtnSmallToBig: TButton;
    BtnJtoF: TButton;
    EdtSmall: TEdit;
    EdtBig: TEdit;
    EdtJian: TEdit;
    EdtFang: TEdit;
    EdtLunar: TEdit;
    EdtEncrypt: TEdit;
    EdtDecrypt: TEdit;
    BtnEncrypt: TButton;
    BtnDecrypt: TButton;
    EdtHanzi: TEdit;
    BtnHz: TButton;
    EdtPinYin: TEdit;
    EdtOne: TEdit;
    EdtTwo: TEdit;
    BtnAed: TButton;
    EdtAed: TEdit;
    GBDatabase: TGroupBox;
    BtnTestSQL: TButton;
    CBSQLInstalled: TCheckBox;
    CBAvalidSQL: TComboBox;
    GBMedia: TGroupBox;
    SBOK: TSpeedButton;
    SBInterrupt: TSpeedButton;
    SBError: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    EdtSource: TEdit;
    EdtDestin: TEdit;
    RBBmp2Jpg: TRadioButton;
    RBJpg2Bmp: TRadioButton;
    SBOpenSource: TSpeedButton;
    SBSaveDestin: TSpeedButton;
    BtnChange: TButton;
    GBFileOper: TGroupBox;
    BtnOpenFile: TButton;
    OpenDialog2: TOpenDialog;
    LblFileDetail: TLabel;
    CBFileUsing: TCheckBox;
    BtnDelReadOnly: TButton;
    BtnDelToRecycle: TButton;
    BtnDelMe: TButton;
    GBSysInfo: TGroupBox;
    BtnGetSysInfo: TButton;
    LEWinPath: TLabeledEdit;
    LEWinSysPath: TLabeledEdit;
    LEDesktopPath: TLabeledEdit;
    LEWinTempPath: TLabeledEdit;
    LECurrentPath: TLabeledEdit;
    LEAppPath: TLabeledEdit;
    LEProgPath: TLabeledEdit;
    BtnGetDrive: TButton;
    EdtDrive: TEdit;
    EdtDriveSerial: TEdit;
    EdtDiskSerial: TLabeledEdit;
    LECPU: TLabeledEdit;
    BtnReboot: TButton;
    BtnEAN: TButton;
    EdtSourceNum: TEdit;
    EdtDestinCode: TEdit;
    GBNet: TGroupBox;
    LELocalComputerName: TLabeledEdit;
    LELocalUserName: TLabeledEdit;
    LELocalIP: TLabeledEdit;
    LELocateIP: TLabeledEdit;
    BtnNetInfo: TButton;
    LEMac: TComboBox;
    Label1: TLabel;
    procedure BtnIEEE2NumClick(Sender: TObject);
    procedure BtnNumToIEEEClick(Sender: TObject);
    procedure BtnSmallToBigClick(Sender: TObject);
    procedure BtnJtoFClick(Sender: TObject);
    procedure SBLunarClick(Sender: TObject);
    procedure BtnInfoClick(Sender: TObject);
    procedure BtnWarningClick(Sender: TObject);
    procedure BtnErrorClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnDevelopClick(Sender: TObject);
    procedure BtnRepeatStrClick(Sender: TObject);
    procedure BtnEncryptClick(Sender: TObject);
    procedure BtnDecryptClick(Sender: TObject);
    procedure BtnHzClick(Sender: TObject);
    procedure BtnAedClick(Sender: TObject);
    procedure BtnTestSQLClick(Sender: TObject);
    procedure SBOKClick(Sender: TObject);
    procedure SBInterruptClick(Sender: TObject);
    procedure SBErrorClick(Sender: TObject);
    procedure SBOpenSourceClick(Sender: TObject);
    procedure SBSaveDestinClick(Sender: TObject);
    procedure BtnChangeClick(Sender: TObject);
    procedure BtnOpenFileClick(Sender: TObject);
    procedure BtnDelReadOnlyClick(Sender: TObject);
    procedure BtnDelToRecycleClick(Sender: TObject);
    procedure BtnDelMeClick(Sender: TObject);
    procedure BtnGetSysInfoClick(Sender: TObject);
    procedure BtnGetDriveClick(Sender: TObject);
    procedure BtnRebootClick(Sender: TObject);
    procedure BtnEANClick(Sender: TObject);
    procedure BtnNetInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ThirdPartForm: TThirdPartForm;

const
  c1: array[1..10] of string = ('��', '��', '��', '��', '��', '��', '��', '��', '��', '��');
  c2: array[1..12] of string = ('��', '��', '��', 'î', '��', '��', '��', 'δ', '��', '��', '��', '��');

implementation

uses  Lunar, wgPubCode;
 //senfore,

{$R *.dfm}


function HexToFloat(const Str: string): real;
var i: Integer;
begin
  result := 0;
  for i := 1 to 23 do
  begin
    result := result + StrToInt(Str[i]) * power(2, 0 - i)
  end;
  result := result + 1;
end;

function HexToInt(const Str: string): Integer;
var i: Integer;
begin
  result := 0;
  for i := 8 downto 1 do
  begin
    result := result + Trunc(StrToInt(Str[i]) * power(2, 8 - i))
  end;
  result := result - 127;
end;

function IEEEToNum(const input: string): string;
var temp, temp1: string;
  i, zhishu: Integer;
  weishu: real;
begin
  temp := '';
  for i := 1 to Length(input) do //ȥ���ո�
  begin
    if input[i] <> ' ' then
      temp := temp + input[i]
  end;
  if Length(temp) < 8 then
    Exit;
  temp1 := '';
  for i := 1 to Length(temp) do
  begin
    if temp[i] = '0' then
      temp1 := temp1 + '0000'
    else if temp[i] = '1' then
      temp1 := temp1 + '0001'
    else if temp[i] = '2' then
      temp1 := temp1 + '0010'
    else if temp[i] = '3' then
      temp1 := temp1 + '0011'
    else if temp[i] = '4' then
      temp1 := temp1 + '0100'
    else if temp[i] = '5' then
      temp1 := temp1 + '0101'
    else if temp[i] = '6' then
      temp1 := temp1 + '0110'
    else if temp[i] = '7' then
      temp1 := temp1 + '0111'
    else if temp[i] = '8' then
      temp1 := temp1 + '1000'
    else if temp[i] = '9' then
      temp1 := temp1 + '1001'
    else if UpperCase(temp[i]) = 'A' then
      temp1 := temp1 + '1010'
    else if UpperCase(temp[i]) = 'B' then
      temp1 := temp1 + '1011'
    else if UpperCase(temp[i]) = 'C' then
      temp1 := temp1 + '1100'
    else if UpperCase(temp[i]) = 'D' then
      temp1 := temp1 + '1101'
    else if UpperCase(temp[i]) = 'E' then
      temp1 := temp1 + '1110'
    else if UpperCase(temp[i]) = 'F' then
      temp1 := temp1 + '1111'
  end;

  weishu := HexToFloat(Copy(temp1, 10, 23));
  zhishu := HexToInt(Copy(temp1, 2, 8));
  result := FloatToStr(weishu * power(2, zhishu));
  if temp1[1] = '1' then
    result := '-' + result;
end;

function IntToBin(Value: Integer): string;
var
  i: Integer;
begin
  SetLength(result, 32);
  for i := 1 to 32 do
  begin
    if ((Value shl (i - 1)) shr 31) = 0 then
      result[i] := '0' {do not localize}
    else
      result[i] := '1'; {do not localize}
  end;
end;

function NumToIEEE(const input: Double): string;
var Initial, Code, weishu: real;
  zhishu, i: Integer;
  r, r1: string;
begin
  if input = 0 then
  begin
    result := '00000000';
    Exit;
  end;
  Initial := Abs(input);
  i := Trunc(Sqrt(Initial)) + 1; //�Ӹ���N��ʼ����ѭ����ֱ��2��i�η�����N��ͬʱ2��i-1�η�С��N
  while True do
  begin
    if (power(2, i) >= Initial) and (Initial > power(2, i - 1)) then
    begin
      zhishu := i - 1;
      break;
    end;
    i := i - 1;
  end;
  weishu := 1 + Initial / power(2, zhishu);
  r := RightStr(IntToBin(zhishu + 127), 8)
    + RightStr(IntToBin(Trunc(weishu * power(2, 23))), 23);

  if input > 0 then //����������
    r := '0' + r
  else
    r := '1' + r;

  r1 := '';
  i := 1;
  while i < 32 do
  begin
    if Copy(r, i, 4) = '0000' then
      r1 := r1 + '0'
    else if Copy(r, i, 4) = '0001' then
      r1 := r1 + '1'
    else if Copy(r, i, 4) = '0010' then
      r1 := r1 + '2'
    else if Copy(r, i, 4) = '0011' then
      r1 := r1 + '3'
    else if Copy(r, i, 4) = '0100' then
      r1 := r1 + '4'
    else if Copy(r, i, 4) = '0101' then
      r1 := r1 + '5'
    else if Copy(r, i, 4) = '0110' then
      r1 := r1 + '6'
    else if Copy(r, i, 4) = '0111' then
      r1 := r1 + '7'
    else if Copy(r, i, 4) = '1000' then
      r1 := r1 + '8'
    else if Copy(r, i, 4) = '1001' then
      r1 := r1 + '9'
    else if Copy(r, i, 4) = '1010' then
      r1 := r1 + 'A'
    else if Copy(r, i, 4) = '1011' then
      r1 := r1 + 'B'
    else if Copy(r, i, 4) = '1100' then
      r1 := r1 + 'C'
    else if Copy(r, i, 4) = '1101' then
      r1 := r1 + 'D'
    else if Copy(r, i, 4) = '1110' then
      r1 := r1 + 'E'
    else if Copy(r, i, 4) = '1111' then
      r1 := r1 + 'F';
    i := i + 4
  end;
  result := r1;
end;

function Small2Big(sourcemoney: currency): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  iwei, pospoint: Integer;
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //��������ת����ָ����ʽ�ַ���
  if Length(strsourcemoney) > 15 then //����ǧ��Ԫ
  begin
    showmessage('��������ȷ�����֣���Ҫ����ǧ�ڣ�15λ������');
    Exit;
  end;
  pospoint := pos('.', strsourcemoney); //С����λ��
  for iwei := Length(strsourcemoney) downto 1 do //���磺500.8 = 5 X=4
  begin
    case pospoint - iwei of //С����λ�� - �ܳ��� �� ���һλ��λ
      -3: thispos := '��';
      -2: thispos := '��';
      -1: thispos := '��';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //С����λ�ô�����,thispos := 'Ԫ';
          thispos := 'Ԫ';
      2: thispos := 'ʰ';
      3: thispos := '��';
      4: thispos := 'ǧ';
      5: thispos := '��';
      6: thispos := 'ʰ';
      7: thispos := '��';
      8: thispos := 'ǧ';
      9: thispos := '��';
      10: thispos := 'ʮ';
      11: thispos := '��';
      12: thispos := 'ǧ';
    end;
    case strsourcemoney[iwei] of //��ǰ����ת��������Һ���
      '.': Continue;
      '1': thiswei := 'Ҽ';
      '2': thiswei := '��';
      '3': thiswei := '��';
      '4': thiswei := '��';
      '5': thiswei := '��';
      '6': thiswei := '½';
      '7': thiswei := '��';
      '8': thiswei := '��';
      '9': thiswei := '��';
      '0':
        begin
          thiswei := '';
          if iwei < Length(strsourcemoney) then //���ǵ�һλ��ʱ��
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //��ǰһλ�������㣬��5005 Ϊ��ǧ���塣���� ǰһλ����. ���� 5.05 Ϊ��Ԫ���
              thiswei := '��';
          if (thispos <> '��') and (thispos <> '��') and (thispos <> 'Ԫ') then
            thispos := '' //��λ��ʮ���١�Ǫ   �ģ�Ϊ0������ʾ��λ��
          else
            thiswei := ''; //����λΪ�ڡ���Ԫ����ǰһλ0������ʾ'��'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //��ϳɴ�д���
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '����', '��'); //ȥ��'����'�е�'��'
  if ansicontainsstr(strobjectmoney, '��') then
    Small2Big := strobjectmoney
  else
  begin
    strobjectmoney := strobjectmoney + '��';
    Small2Big := strobjectmoney;
  end;
end;

procedure TThirdPartForm.BtnGetDriveClick(Sender: TObject);
begin
  EdtDriveSerial.Text := GetVolumeSerialNo(PChar(EdtDrive.Text)^);
end;

procedure TThirdPartForm.BtnIEEE2NumClick(Sender: TObject);
begin
  LENum.Text := IEEEToNum(LEIEEE.Text)
end;

procedure TThirdPartForm.BtnNumToIEEEClick(Sender: TObject);
begin
  LEIEEE.Text := NumToIEEE(StrToFloat(LENum.Text))
end;

procedure TThirdPartForm.BtnSmallToBigClick(Sender: TObject);
begin
  EdtBig.Text := Small2Big(StrToFloat(EdtSmall.Text))
end;

procedure TThirdPartForm.BtnJtoFClick(Sender: TObject);
begin
  //setmap;
  //EdtFang.Text := GBKJtoF(EdtJian.Text);
end;

procedure TThirdPartForm.SBLunarClick(Sender: TObject);
var y, M, d: word;
begin
  EdtLunar.Text := GregDateToCNStr(DTP.Date);
  //  ��ɵ�֧�㷨
  //  ���-1903 mod 10 �������
  //  ��� mod 12 - 3 ���ǵ�֧
  DecodeDate(DTP.Date, y, M, d);
  EdtLunar.Text := c1[(y - 1903) mod 10] + c2[(y mod 12) - 3]
    + Chr(13) + Chr(10) + EdtLunar.Text;
  case DayofWeek(DTP.Date) of
    1: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + '��';
    2: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + 'һ';
    3: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + '��';
    4: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + '��';
    5: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + '��';
    6: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + '��';
    7: EdtLunar.Text := EdtLunar.Text + Chr(13) + Chr(10) + '����' + '��';
  end;
  //Memo2.Text := Memo2.Text + chr(13) + chr(10) + GetLunarHolDay(DTP.Date);
end;

procedure TThirdPartForm.BtnInfoClick(Sender: TObject);
begin
  InfoMsgBox('this is info message!');
end;

procedure TThirdPartForm.BtnWarningClick(Sender: TObject);
begin
  WarningMsgBox('this is warning message!');
end;

procedure TThirdPartForm.BtnErrorClick(Sender: TObject);
begin
  ErrorMsgBox('this is error message!');
end;

procedure TThirdPartForm.BtnQueryClick(Sender: TObject);
begin
  QueryMsgBox('this is query message', 1); //2ΪĬ�Ϸ�
end;

procedure TThirdPartForm.BtnConfClick(Sender: TObject);
begin
  ConfMsgBox('this is confirmation message!', 1);
end;

procedure TThirdPartForm.BtnDelClick(Sender: TObject);
begin
  QueryDelMsgBox();
end;

procedure TThirdPartForm.BtnSaveClick(Sender: TObject);
begin
  QuerySaveMsgBox();
end;

procedure TThirdPartForm.BtnExitClick(Sender: TObject);
begin
  QueryExitMsgBox();
end;

procedure TThirdPartForm.BtnDevelopClick(Sender: TObject);
begin
  NotDevelopFinishMsgBox();
end;

procedure TThirdPartForm.BtnRepeatStrClick(Sender: TObject);
begin
  EdtFinalStr.Text := StrRepeat(EdtSubstr.Text, StrToIntDef(EdtCount.Text, 1));
end;

procedure TThirdPartForm.BtnEncryptClick(Sender: TObject);
begin
  EdtDecrypt.Text := SimplyEncryptStr(EdtEncrypt.Text);
end;

procedure TThirdPartForm.BtnDecryptClick(Sender: TObject);
begin
  EdtEncrypt.Text := SimplyDecryptStr(EdtDecrypt.Text);
end;

procedure TThirdPartForm.BtnHzClick(Sender: TObject);
begin
  EdtPinYin.Text := GetHzPy(EdtHanzi.Text);
end;

procedure TThirdPartForm.BtnAedClick(Sender: TObject);
begin
  EdtAed.Text := IntToStr(Aed(StrToIntDef(EdtOne.Text, 1), StrToIntDef(EdtTwo.Text, 1)));
end;

procedure TThirdPartForm.BtnTestSQLClick(Sender: TObject);
var AvalidSQL: TStringList;
begin
  if IsInstalledSQLServer then
  begin
    CBSQLInstalled.Checked := True;
    AvalidSQL := TStringList.Create;
    try
      GetSQLServerAvaiLsit(AvalidSQL);
      CBAvalidSQL.Items := AvalidSQL;
    finally
      AvalidSQL.Free;
    end;
  end;
end;

procedure TThirdPartForm.SBOKClick(Sender: TObject);
begin
  Bleep(vOK);
end;

procedure TThirdPartForm.SBInterruptClick(Sender: TObject);
begin
  Bleep(vInterrupt);
end;

procedure TThirdPartForm.SBErrorClick(Sender: TObject);
begin
  Bleep(vError);
end;

procedure TThirdPartForm.SBOpenSourceClick(Sender: TObject);
begin
  if RBBmp2Jpg.Checked then
    OpenDialog1.Filter := 'Bmp�ļ�|*.bmp'
  else if RBJpg2Bmp.Checked then
    OpenDialog1.Filter := 'Jpg�ļ�|*.jpg';
  if OpenDialog1.Execute then
    EdtSource.Text := OpenDialog1.FileName;
end;

procedure TThirdPartForm.SBSaveDestinClick(Sender: TObject);
begin
  if RBBmp2Jpg.Checked then
    SaveDialog1.Filter := 'Jpg�ļ�|*.jpg'
  else if RBJpg2Bmp.Checked then
    SaveDialog1.Filter := 'Bmp�ļ�|*.bmp';
  if SaveDialog1.Execute then
    EdtDestin.Text := SaveDialog1.FileName;
  if ExtractFileExt(EdtDestin.Text) = '' then
  begin
    if RBBmp2Jpg.Checked then
      EdtDestin.Text := EdtDestin.Text + '.jpg'
    else if RBJpg2Bmp.Checked then
      EdtDestin.Text := EdtDestin.Text + '.bmp'
  end;
end;

procedure TThirdPartForm.BtnChangeClick(Sender: TObject);
begin
  if RBBmp2Jpg.Checked then
    Bmp2Jpg(EdtSource.Text, EdtDestin.Text, 100 - StrToIntDef(InputBox('������ѹ������', '', '0'), 0))
  else if RBJpg2Bmp.Checked then
    Jpg2Bmp(EdtSource.Text, EdtDestin.Text);
  InfoMsgBox('ת���ɹ�');
end;

procedure TThirdPartForm.BtnOpenFileClick(Sender: TObject);
var MyFile: string;
begin
  if OpenDialog2.Execute then
  begin
    MyFile := OpenDialog2.FileName;
    LblFileDetail.Caption := '�ļ���С:' + IntToStr(GetFileSize(MyFile))
      + 'byte,��������:' + FormatDateTime('yyyy-mm-dd hh:nn:ss', GetFileDate(MyFile));
    CBFileUsing.Checked := IsFileInUse(MyFile);
  end;
end;

procedure TThirdPartForm.BtnDelReadOnlyClick(Sender: TObject);
var MyFile: string;
begin
  if OpenDialog2.Execute then
  begin
    MyFile := OpenDialog2.FileName;
    if ExDeleteFile(MyFile) then
      InfoMsgBox('ɾ���ɹ�');
  end;
end;

procedure TThirdPartForm.BtnDelToRecycleClick(Sender: TObject);
var MyFile: string;
begin
  if OpenDialog2.Execute then
  begin
    MyFile := OpenDialog2.FileName;
    DeleteToRecycleBin(GetActiveWindow, MyFile);
  end;
end;

procedure TThirdPartForm.BtnDelMeClick(Sender: TObject);
begin
  DeleteMe;
end;

procedure TThirdPartForm.BtnGetSysInfoClick(Sender: TObject);
var CPUUsage: Double;
begin
  LEWinPath.Text := GetWinPath;
  LEWinSysPath.Text := GetWinSysPath;
  LEDesktopPath.Text := GetDesktopPath;
  LEWinTempPath.Text := GetWinTempPath;
  LECurrentPath.Text := GetCurrentPath;
  LEAppPath.Text := GetAppPath;
  LEProgPath.Text := GetProgPath;
  EdtDiskSerial.Text := GetIdeSerialNumber^;
  if GetCPUUsage(CPUUsage) then
    LECPU.Text := format('%f %%', [CPUUsage]);
end;

procedure TThirdPartForm.BtnRebootClick(Sender: TObject);
begin
  RebootComputer;
end;

procedure TThirdPartForm.BtnEANClick(Sender: TObject);
begin
  EdtDestin.Text := EAN13(EdtSourceNum.Text);
end;

procedure TThirdPartForm.BtnNetInfoClick(Sender: TObject);
var myMac: TStringList;
  i: Integer;
begin
  LELocalComputerName.Text := GetLocalComputerName;
  LELocalUserName.Text := GetLocalUserName;
  LELocalIP.Text := GetLocalIP;
  LELocateIP.Text := GetLocateIP(False);
  myMac := TStringList.Create;
  try
    NBGetMac(myMac);
    LEMac.Items.Clear;
    for i := 0 to myMac.Count - 1 do
      LEMac.Items.Add(myMac.Strings[i]);
  finally
    myMac.Free;
  end;
end;

end.

