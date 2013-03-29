unit LED680;

interface

uses Windows, SysUtils;

type
  TLED680 = class
  private
    FFunc: integer;
    FLEDMessage: string;
    FShowDate: integer;
    FSpeed: integer;
    FCharMode: integer;
    FHoldType: integer;
    FInType: integer;
    FNormalMode: integer;
    FOutType: integer;
    FShowWeek: integer;
    FAddLogo: integer;
    FCurrentSec: integer;
    FShowTime: integer;
    FTotalSec: integer;
    FAddMessage: integer;
    FShowingTime: integer;
    procedure SetFunc(const Value: integer);
    procedure SetLEDMessage(const Value: string);
    procedure SetAddLogo(const Value: integer);
    procedure SetAddMessage(const Value: integer);
    procedure SetCharMode(const Value: integer);
    procedure SetCurrentSec(const Value: integer);
    procedure SetHoldType(const Value: integer);
    procedure SetInType(const Value: integer);
    procedure SetNormalMode(const Value: integer);
    procedure SetOutType(const Value: integer);
    procedure SetShowDate(const Value: integer);
    procedure SetShowingTime(const Value: integer);
    procedure SetShowTime(const Value: integer);
    procedure SetShowWeek(const Value: integer);
    procedure SetSpeed(const Value: integer);
    procedure SetTotalSec(const Value: integer);
  public
    constructor Create();
    function ExecuteCode: string;
    function UserDefineMessage: string;
    function ExecuteUserDefineMessage: string;
    function ExecuteFirstMessage: string;
    function ExecuteSecondMessage: string;
    function ExecuteThirdMessage: string;
    function ShowTempMessage: string;
    function Backup: string;
    function CheckTime: string;
    function SetLogo: string;
  published
    property Func: integer read FFunc write SetFunc;
    property LEDMessage: string read FLEDMessage write SetLEDMessage;
    //�ܶ���
    property TotalSec: integer read FTotalSec write SetTotalSec;
    //��ǰ��
    property CurrentSec: integer read FCurrentSec write SetCurrentSec;
    //���뷽ʽ
    property InType: integer read FInType write SetInType;
    //�˳���ʽ
    property OutType: integer read FOutType write SetOutType;
    //���ַ�ʽ
    property HoldType: integer read FHoldType write SetHoldType;
    //�ַ���ͼ����ʾ
    property CharMode: integer read FCharMode write SetCharMode;
    //�����򷴰���ʾ
    property NormalMode: integer read FNormalMode write SetNormalMode;
    //�Ƿ�ӹ�˾ͼ��
    property AddLogo: integer read FAddLogo write SetAddLogo;
    //�Ƿ���ʾ��ǰ����
    property ShowDate: integer read FShowDate write SetShowDate;
    //�Ƿ���ʾ��ǰʱ��
    property ShowTime: integer read FShowTime write SetShowTime;
    //�Ƿ���ʾ��ǰ����
    property ShowWeek: integer read FShowWeek write SetShowWeek;
    //���ԭ����Ϣ���滻ԭ����Ϣ
    property AddMessage: integer read FAddMessage write SetAddMessage;
    //��ʾʱ��
    property ShowingTime: integer read FShowingTime write SetShowingTime;
    //�ƶ��ٶ�
    property Speed: integer read FSpeed write SetSpeed;
  end;

implementation

{ TLED680 }

function TLED680.Backup: string;
begin

end;

function TLED680.CheckTime: string;
var y, m, d, h, n, s, w: integer;
  t: _SYSTEMTIME;
  tmp: string;
  i, check: integer;
begin
  GetSystemTime(t);
  y := t.wYear mod 100;
  m := t.wMonth;
  d := t.wDay;
  h := t.wHour + 8;
  n := t.wMinute;
  s := t.wSecond;
  w := t.wDayOfWeek + 1;
  tmp := Chr($7E) + Chr($0C) + Chr($08) + Chr($00)
    + Chr(StrToInt('$' + IntToStr(y))) + Chr(StrToInt('$' + IntToStr(m)))
    + Chr(StrToInt('$' + IntToStr(d))) + Chr(StrToInt('$' + IntToStr(h)))
    + Chr(StrToInt('$' + IntToStr(n))) + Chr(StrToInt('$' + IntToStr(s)))
    + Chr(StrToInt('$' + IntToStr(w)));
  check := 0;
  for i := 1 to Length(tmp) do
    check := check xor Ord(tmp[i]);
  result := tmp + Chr(check);
end;

constructor TLED680.Create;
begin
  AddLogo := 0; //Ĭ�ϲ����LOGO
  AddMessage := 0; //�滻��ǰ����
  CharMode := 0; //�ַ���ʽ
  CurrentSec := 1; //��һ��
  Func := 1; //�û��Զ�����Ϣ
  HoldType := 0; //��������
  InType := 1; //�����ƶ�����
  LEDMessage := '';
  NormalMode := 0; //������ʾ
  OutType := 1; //�����ƶ��˳�
  ShowDate := 0; //����ʾ����
  ShowingTime := 1; //������ʾʱ��
  ShowTime := 0; //����ʾʱ��
  ShowWeek := 0; //����ʾ����
  Speed := 0; //ϵͳĬ���ٶ�
  TotalSec := 1; //��ֻ��ʾһ��
end;

function TLED680.ExecuteCode: string;
begin
  case Func of
    1: result := UserDefineMessage;
    2: result := ExecuteUserDefineMessage;
    3: result := ExecuteFirstMessage;
    4: result := ExecuteSecondMessage;
    5: result := ExecuteThirdMessage;
    6: result := ShowTempMessage;
    7: result := Backup;
    8: result := CheckTime;
    9: result := SetLogo;
  end;
end;

function TLED680.ExecuteFirstMessage: string;
begin
  result := Chr($7E) + Chr($04) + Chr($03) + Chr(79);
end;

function TLED680.ExecuteSecondMessage: string;
begin
  result := Chr($7E) + Chr($04) + Chr($04) + Chr($7E);
end;

function TLED680.ExecuteThirdMessage: string;
begin
  result := Chr($7E) + Chr($04) + Chr($05) + Chr($7F);
end;

function TLED680.ExecuteUserDefineMessage: string;
begin
  result := Chr($7E) + Chr($04) + Chr($02) + Chr($78);
end;

procedure TLED680.SetAddLogo(const Value: integer);
begin
  FAddLogo := Value;
end;

procedure TLED680.SetAddMessage(const Value: integer);
begin
  FAddMessage := Value;
end;

procedure TLED680.SetCharMode(const Value: integer);
begin
  FCharMode := Value;
end;

procedure TLED680.SetCurrentSec(const Value: integer);
begin
  FCurrentSec := Value;
end;

procedure TLED680.SetFunc(const Value: integer);
begin
  FFunc := Value;
end;

procedure TLED680.SetHoldType(const Value: integer);
begin
  FHoldType := Value;
end;

procedure TLED680.SetInType(const Value: integer);
begin
  FInType := Value;
end;

procedure TLED680.SetLEDMessage(const Value: string);
begin
  FLEDMessage := Value;
end;

function TLED680.SetLogo: string;
begin

end;

procedure TLED680.SetNormalMode(const Value: integer);
begin
  FNormalMode := Value;
end;

procedure TLED680.SetOutType(const Value: integer);
begin
  FOutType := Value;
end;

procedure TLED680.SetShowDate(const Value: integer);
begin
  FShowDate := Value;
end;

procedure TLED680.SetShowingTime(const Value: integer);
begin
  FShowingTime := Value;
end;

procedure TLED680.SetShowTime(const Value: integer);
begin
  FShowTime := Value;
end;

procedure TLED680.SetShowWeek(const Value: integer);
begin
  FShowWeek := Value;
end;

procedure TLED680.SetSpeed(const Value: integer);
begin
  FSpeed := Value;
end;

procedure TLED680.SetTotalSec(const Value: integer);
begin
  FTotalSec := Value;
end;

function TLED680.ShowTempMessage: string;
var tmp: string;
  i, check: integer;
begin
  tmp := Chr($7E) + Chr(Length(LEDMessage) + 8) + Chr($06)
    + Chr(InType + OutType * 8 + HoldType * 64)
    + Chr(CharMode + NormalMode * 2 + AddLogo * 4 + ShowDate * 8 + ShowTime * 16 + ShowWeek * 32 + AddMessage * 64)
    + Chr(ShowingTime) + Chr(Speed) + LEDMessage;
  check := 0;
  for i := 1 to Length(tmp) do
    check := check xor Ord(tmp[i]);
  result := tmp + chr(check);
end; //13923789418  545503956

function TLED680.UserDefineMessage: string;
var tmp: string;
  i, check: integer;
begin
  tmp := Chr($7E) + Chr(Length(LEDMessage) + 10) + Chr($01) + Chr(TotalSec)
    + Chr(CurrentSec) + Chr(InType + OutType * 8 + HoldType * 64)
    + Chr(CharMode + NormalMode * 2 + AddLogo * 4 + ShowDate * 8 + ShowTime * 16 + ShowWeek * 32 + AddMessage * 64)
    + Chr(ShowingTime) + Chr(Speed) + LEDMessage;
  check := 0;
  for i := 1 to Length(tmp) do
    check := check xor Ord(tmp[i]);
  result := tmp + chr(check);
end;

end.

