{
���ߣ�WilliamGui   QQ:4980688(���ֱ���)
������վ��http://www.e-erpchina.com/

��������ã�����һ�����˺ܾõ� �������� �⣬���У�InfoMsgBox��Ƶ����ߡ�
���õ�DBGridEh�ȵ�Ԫ������ûװ��ɾ����غ��������ˡ�

�����õĺ��������黶ӭ��ϵ���������š�
*/
 }
unit wgPubCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ShellAPI, Math, DB, ADODB, DBClient, Jpeg,
  DBGrids, DBGridEh, DBGridEhImpExp, Registry, IniFiles, MMSystem, WinSock,
  ShlObj, ActiveX, Menus, ComObj, DateUtils, NB30, TypInfo, WinSvc, EncdDecd,
  WinInet;



{-----------------------------------------------------------------------------
  Messages Function
-----------------------------------------------------------------------------}

const
  TIP_STRING = '��ʾ';
  WARNING_STRING = '����';
  ERROR_STRING = '����';
  CONFIRM_STRING = 'ȷ��';
  QUERY_DELETE_STRING = '   �Ƿ�Ҫɾ��������¼(Y/N)?     ';
  QUERY_SAVE_STRING = '   �Ƿ񱣴����޸Ļ�����ļ�¼(Y/N)?   ';
  QUERY_EXIT_STRING = '   �Ƿ����Ҫ�˳�(Y/N)?     ';
  NOT_DEVELOP_FINISH_STRING = '   �ù��ܻ��ڿ�����......         ';
function InfoMsgBox(pInformationString: string): Integer;
function WarningMsgBox(pWarningString: string): Integer;
function ErrorMsgBox(pErrorString: string): Integer;
function QueryMsgBox(pQuestionString: string; pDefaultButton: Integer = 1): Integer;
function ConfMsgBox(pQuestionString: string; pDefaultButton: Integer = 1): Integer;
function QueryDelMsgBox(pDeleteString: string = QUERY_DELETE_STRING): Integer;
function QuerySaveMsgBox(pSaveString: string = QUERY_SAVE_STRING; pDefaultButton: Integer = 1): Integer;
function QueryExitMsgBox(pExitString: string = QUERY_EXIT_STRING): Integer;
function NotDevelopFinishMsgBox(pNotDevelopFinishString: string = NOT_DEVELOP_FINISH_STRING): Integer;



{-----------------------------------------------------------------------------
  string Function
-----------------------------------------------------------------------------}

//����ֵ��Substr��S�����һ�γ��ֵ�λ�ã������ǵ�һ�γ��ֵ�λ��
function PosRight(const Substr, S: string): Integer;
//�ظ��ַ���n��
function StrRepeat(AProcessString: string; n: Integer): string;
//�ұ�����һ�ַ�����㹻���ȵ�ָ���ַ���
function RFillStr(const Str: string; const TotalLen: Integer; const FillStr: string): string;
//�������һ�ַ�����㹻���ȵ�ָ���ַ���
function LFillStr(const Str: string; const TotalLen: Integer; const FillStr: string): string;

//�򵥼����ַ���(��������ּ��ܺ�ǰ���пո�)
function SimplyEncryptStr(AString: string): string;
//�򵥽����ַ���(��������ֽ��ܺ�ǰ���пո�)
function SimplyDecryptStr(AString: string): string;

//ȡ�ĺ���ƴ��������ĸ
function GetHzPy(const AHzStr: string): string;
//ת�����Ϊ��д
function CurrencyToChinese(ACurrency: currency; Default: string = ''): string;
//ת��"N"Ϊ����Ҵ�д
function Money_Convert(n: Double): string;
//�����Сдת��д
function RMB(AMoney: Double): string;

//����BIG5תGB����
function BIG52GB(BIG5Str: string): AnsiString;
//����GBתBIG5����
function GB2BIG5(GBStr: string): AnsiString;
//����GBK����ת����
function GBCht2Chs(GBStr: string): AnsiString;
//����GBK����ת����
function GBChs2Cht(GBStr: string): AnsiString;



{-----------------------------------------------------------------------------
  Math Function
-----------------------------------------------------------------------------}

//��չ�������뺯��
{pRoundToExType:
  1: ������������
  2: ������������(������������˫)
  3: ��ȥС��λ(���ܺ����Ƕ���)
  4: ����0��λ(�������0���λ)
����������һ��Ӧ�÷ǳ��㷺�Ľ��Ƽ��㷽���������������뷨�����м����뷨���֡�
��ν�������뷨����������ͨ�������ϵ��������뷨��������ǣ�
����ȥλ����ֵ���ڵ���5ʱ������ȥ��λ��ͬʱ��ǰλ��һ��
����ȥλ����ֵС��5ʱ����ֱ����ȥ��λ��
��ν���м����뷨����ʵ����һ��������������˫(�ֳ�������������ż)����
������ǣ�����ȥλ����ֵС��5ʱ��ֱ����ȥ��λ��
����ȥλ����ֵ���ڵ���6ʱ������ȥ��λ��ͬʱ��ǰλ��һ��
����ȥλ����ֵ����5ʱ�����ǰλ��ֵΪ�棬������ȥ��λ��ͬʱ��ǰλ��һ�����ǰλ��ֵΪż����ֱ����ȥ��λ��
  ������
  i := Round(11.5)    ���: i=12
  i := Round(10.5)    ���: i=10
SimpleRoundTo: �������루���Գ�����������
1. ��SimpleRoundTo����RoundTo
2. 10532.175���ֵ�Ƚ�����, ���ڼ�����еĶ����Ʊ�ʾ�������ļ�������ֵ��ʵ��ֵ����
����ͳ�����SimpleRoundTo(10532.175, -2)=10532.17�Ĵ��������
�������SimpleRoundTo����ʱ������Ҫ���������ֵ����һ����С��ֵ��
���磺SimpleRoundTo(10532.175 + 1E-10, -2) }
type
  TRoundToExType = 1..4;
function RoundToEx(pX: Double; pScale: TRoundToRange; pRoundToExType: TRoundToExType = 1): Double;
//�����Լ�� ps: aed(aed(A, B), C)
function Aed(a, B: Integer): Integer;



{-----------------------------------------------------------------------------
  DateTime Function
-----------------------------------------------------------------------------}

//�����Ƿ����
function IsEqualDate(ADate1, ADate2: TDate): Boolean;
//�Ƿ�����
function IsLeapYear(ADateTime: TDateTime): Boolean;
//����ϵͳ����ʱ��
function SetSysDateTime(ADateTime: TDateTime): Boolean;
//��ʽ��SQL���ڸ�ʽ
function FmtSQLDatetime(ADateTime: TDateTime; Format: string = 'yyyymmdd'): string;
//��ʽ�������������ڣ����򷵻ؿ��ַ���
function FmtVarToDateTime(Val: Variant; Format: string = 'yyyymmdd'): string;



{-----------------------------------------------------------------------------
  Database Function
-----------------------------------------------------------------------------}

//�Ƿ��Ѱ�װ���ݿ�
function IsInstalledSQLServer: Boolean;
//ȡ����������SQLServer�������б�
function GetSQLServerAvaiLsit(var pList: TStringList): Boolean;

//�ر��ٴ����ݼ�(OnlyActive=Trueֻ���Ѵ򿪵����ݼ�����)
function ReOpen(DataSet: TDataSet; OnlyActive: Boolean = False): Boolean;
//�ر����ݼ�
procedure CloseDataSet(DataSet: TDataSet);
//ɾ�����ݱ���������
function DelDataSetAllData(DataSet: TDataSet): Boolean;
//Post�������ݼ�
function PostDataSet(DataSet: TDataSet): Boolean;
//�����������ݿ�(pConnObj=nilʱ��������ʱ���Ӷ���pConnType=1:SQLServer��SQL��֤,=2:SQLServer��Windows��֤)
function TryConn(pConnObj: TADOConnection; pConnType: string; pIsKeepConn: Boolean;
  pDBSvrName, pDBName, pDBUserName, pDBUserPwd: string): Boolean;

//��Table�������ļ�
function TableToFile(pConnObj: TADOConnection; pTableName: string; pSQLWhere: string;
  pFileName: string; pFormat: TPersistFormat;
  var pResultMsg: string): Boolean;
//���ļ�����Table
function TableFromFile(pConnObj: TADOConnection; pTableName: string; pFileName: string;
  pKeyFieldName: string; pIsDelAll: Boolean; pIsExistReplace: Boolean;
  var pResultMsg: string): Boolean;

//TDBGrid����Excel�ļ�
function DBGridToExcel(pDBGrid: TDBGrid;
  pVisible: Boolean = False; pExcelFileName: string = ''): Boolean;
//TDBGrid����Excel�ļ�
function DBGridEhExportToFile(pDBGrid: TDBGridEh;
  pVisible: Boolean = False; pFileName: string = ''): Boolean;

//����µ����ݼ�Seq�ֶ�ֵ
function NewDSSeq(pDataSet: TDataSet;
  pSeqFieldName: string; pStepSeq: Integer = 10; pInitSeq: Integer = 10): Integer;
//�õ����ݼ���¼��(���ѹ��˵ļ�¼��)
function GetDSRecCount(pDataSet: TDataSet): Integer;
//���Ƽ�¼(pDestDataSet����ΪdsInsert��dsEdit״̬)
function CopyRecord(pSourDataSet, pDestDataSet: TDataSet): Boolean;
//ˢ�����ݼ�Seq�ֶ�ֵ(ע��:һ�������������ݼ�BeforePost�¼�����)
function RefreshDSSeq(pDataSet: TDataSet;
  pKeyFieldName, pSeqFieldName: string; pStepSeq: Integer = 10; pInitSeq: Integer = 10): Boolean;



{-----------------------------------------------------------------------------
  Media Function
-----------------------------------------------------------------------------}

//��������
type
  TBleepType = (vOK, vInterrupt, vError);
procedure Bleep(BleepType: TBleepType);

//ת��JPG��BMP��ʽ
procedure Jpg2Bmp(const Source, Dest: string);
//ת��BMP��JPG��ʽ
procedure Bmp2Jpg(const Source, Dest: string; const scale: byte);
//��Ico�ļ��õ�Bmp
procedure GetBitmapFromIcon(const result: TBitmap; Icon: TIcon; BgColor: TColor);
//��ʾͼƬ
procedure SimplyShowPic(pPicFile: string);
//FitBitmap�����õģ�������һ��ͼƬ��С�ı�
procedure FitBitmap(const Source, Dest: string;
  const x, y: Integer; const ColorBit: TPixelFormat);

//�Ƿ�װ������
function IsHasSoundCard: Boolean;
//��������Ƿ����
function SoundCardExist: Boolean;



{-----------------------------------------------------------------------------
  System Function
-----------------------------------------------------------------------------}

{ Ini�ļ� }

function ReadIniFileString(const filename, Section, Ident: string; var Value: string; //��ȡIniFileֵ, IsCreate��ʾ���û�У��Ƿ񴴽�
  IsCreate: Boolean = True; DefVal: string = ''): Boolean;
function WriteIniFileString(const filename, Section, Ident, Value: string): Boolean; //д��IniFileֵ

{ ע��� }

function ReadRegKey(const RegKeyString, RegKeyName: string; var RegKeyValue: string;
  IsCreate: Boolean = False; DefVal: string = ''; HKEY: Dword = HKEY_LOCAL_MACHINE): Boolean;
function WriteRegKey(const RegKeyString, RegKeyName, RegKeyValue: string;
  HKEY: Dword = HKEY_LOCAL_MACHINE): Boolean;
function DelRegNode(const RegKeyString: string; //ɾ��ע��������ڵ�
  HKEY: Dword = HKEY_LOCAL_MACHINE): Boolean;

{ �ļ����� }

//ȡ���ļ���С
function GetFileSize(const filename: string): Longint;
//ȡ���ļ���������
function GetFileDate(AFileName: string): TDateTime;
//����ļ��Ƿ����ڱ�ʹ��
function IsFileInUse(fName: string): Boolean;
//������ʱ�ļ���
function CreateTempFileName(aPrefix: string): string;

//��������Ŀ¼������ͨ���(��֪Ϊʲô��Ŀ¼���ܸ���)(ע�⣺CopyFile���ܸ���ֻ���ļ�)
function WinCopyFile(pForm, pTo: string;
  pFlags: FILEOP_FLAGS = FOF_NOCONFIRMMKDIR or FOF_NOCONFIRMATION or FOF_SILENT): Boolean;
//���ƶ���ļ�
function CopyFiles(const Source, Dest: string): Boolean;
//ȡ�����д��������ļ�
procedure GetCopyFiles(Source, Dest: string; var ASource, ADest: TStringList);
//ֻ�����ļ����Ե��ļ�Ҳ����ɾ��
function ExDeleteFile(const filename: string): Boolean;
//ɾ���ļ�������վ
function DeleteToRecycleBin(WindowHandle: THandle; filename: string): Boolean;

//ɾ���Լ�
procedure DeleteMe_(ABatchFile: string);
//������������ĳ������˳�֮����Զ�ɾ��Exe
procedure DeleteMe;

{ Ŀ¼��� }

//��֤�ַ�������ַ�Ϊ'\'(��·���ַ���)
function Slash(Value: string): string;
//������ѡ��Ŀ¼�Ի���
function SelectDirectory(handle: THandle; const Caption: string;
  const Root: WideString; out Directory: string): Boolean;
//����Ŀ¼
procedure CreateDirectory(APath: string);
//ɾ��Ŀ¼
function DeleteDirectory(const ASource: string): Boolean;
//����Ŀ¼
function CopyDirectory(const Source, Dest: string): Boolean;

{ ������ }

//�������Ƿ�׼����
function DiskInDrive(Drive: char): Boolean;

{ ��ݷ�ʽ }

//����һ����ݷ�ʽ
{ ShortCutFileName: ���ɵĿ�ݷ�ʽ�ļ�����   Description: ���ı�ע��Ϣ
LinkFileName: ָ����ļ�����   Parameters: �������в���   WorkingDir: ����Ŀ¼
IconFilename: ͼ���ļ�����   IconIndex: ͼ������
ShowCmd ����״̬(SW_SHOWMAXIMIZED, SW_NORMAL)
pDefVal ����������ɹ����򷵻ش�Ĭ��ֵ
��: CreateLinkFile('D:\ABC.lnk', 'ABC Link', 'c:\ABC.exe',
    '', 'c:\', '', 0, SW_NORMAL )
ItemIDList:PItemIDList;   //ϵͳIDList��δʹ��
RelativePath:array[0..255] of char;	//���·��
ShowState:integer;  //����ʱ����ʵ״̬
HotKey:word;  //�ȼ� }
function CreateLinkFile(const ShortCutFileName, Description, LinkFileName, Parameters,
  WorkingDir, IconFilename: string; const IconIndex, ShowCmd: Integer;
  pDefVal: Boolean = False): Boolean;
//�ѿ�ݼ����һ���ַ���
function ShortCutToString(const HotKey: word): string;

{ ���� }

//����ϵͳ����
function SystemServiceStart(const pSystemServiceName: string): Boolean;
//ֹͣϵͳ����
function SystemServiceStop(const pSystemServiceName: string): Boolean;

{ ȡ��ϵͳ��Ϣ }

//��� Windows Ŀ¼, ��: C:\WINDOWS\
function GetWinPath: string;
//��� Windows ϵͳĿ¼, ��: C:\WINDOWS\SYSTEM\
function GetWinSysPath: string;
//�������·��
function GetDesktopPath: string;
//��õ�Windows��ʱĿ¼
function GetWinTempPath: string;
//ͬ���ǻ�õ�ǰ�������ڵ�Ŀ¼,������ǿ�ݷ�ʽ,�Ϳ��ܲ���
function GetCurrentPath: string;
//��õ�ǰ�������ڵ�Ŀ¼(��ǰExe����)
function GetAppPath: string;
//��ó���·��
function GetProgPath: string;

//�õ�����ʽ�˵��߶�
function GetPopupMenuHeight(APopupMenu: TPopupMenu): Integer;
//�õ��˵�Ĭ������
function GetMenuDefaultFont(const AFont: TFont): Integer;

{ ���� }

//����߼��̷��־����к�
function GetVolumeSerialNo(pDriveLetter: char = 'C'): string;
//��ȡӲ�̵��������к�(ֻ�ܻ�ȡIDEӲ���������кţ�Win98���У�����Ҫ����ԱȨ��)
function GetIdeSerialNumber: pchar;

//���ÿ����Զ����г���
// pAutoRunType:�Զ��������� 1:Run 2:RunOnce;   pAddDel:'Add'/'Del'
function SetAutoRun(pAutoRunType: Integer; pAddDel: string;
  pAutoRunName, pAutoRunFileName: string): Boolean;
//ע��DLL�ļ�
type
  TDllRegisterServer = function: HResult; stdcall;
function RegisterDll(filename: string): Boolean;
//������̻�����
procedure EmptyKeyBoardQueue;
//�õ�CPUռ����
function GetCPUUsage(var pCPUUsage: Double; pSleepMiSec: Cardinal = 1000): Boolean;
//ͬ��ʱ��
function SynLocalDatetime(ServerName: string): Boolean;
//���������
procedure RebootComputer;
//������
function EAN13(t_str: string): string;
//ִ��һ���ⲿ���򣬲��ҵȴ����Ľ���
{ WinExecExW("a.exe","c:\",SW_SHOW); }
function WinExecExW(cmd, workdir: pchar; visiable: Integer): Dword;
//��Windows��������ʾ���ڰ�ť
function ShowWinInTaskbar(hWin: THandle; IsShow: Boolean): Boolean;

//��������״̬
procedure SetScreenSaverState(const B: Boolean);
//������Ļ���� ע: WinӦ�����ù�����
procedure RunScreenSaver;

//�Ƿ�Win95
function IsWin95: Boolean;
//�Ƿ�WinNT
function IsWinNT: Boolean;



{-----------------------------------------------------------------------------
  NetWork Function
-----------------------------------------------------------------------------}

//��ñ��ؼ��������
function GetLocalComputerName: string;
//��ñ��ؼ�����û���
function GetLocalUserName: string;
//ȡ�ñ�����IP��ַ
function GetLocalIP: string;
//ȡ�ñ�����IP��ַ
function GetLocateIP(InternetIp: Boolean = False): string;

//���ص�ǰϵͳ�������Ѱ�װ������MAC��ַ�б� ps: NBΪNetBIOS����
procedure NBGetMac(Strings: TStrings);
//ȡ��ÿһ�������������ַ
function NBGetFirstMac: string;
//ȡ�õ�N��������ַ Adindexֵ: 0-Max
function NBGetIndexMac(AIndex: Integer = 0): string;
//�ж�ָ��������ַ�Ƿ����
function NBIsMacInList(Mac: string): Boolean;

//����ַ
procedure OpenURL(URL: string);
//����Url
{pUrl: ������url���� .\abc\def.htm
 pWebPageUrl: Դ��ҳ��ַ }
function ParsingUrl(pUrl: string; pWebPageUrl: string): string;

//�жϻ����Ƿ�����״̬  ������ WinInet.pas ��Ԫ
function GetOnlineStatus: Boolean;
//�Ƿ�������Internet
//function IsConnectInternet: boolean;



{-----------------------------------------------------------------------------
  Object Pascal
-----------------------------------------------------------------------------}

//�õ�Ψһ��GUIDֵ(����unit������Ҫuse ActiveX)
function NewGUID: string;
//�õ���СGUIDֵ
function MiniGUID: string;

//���ý���
procedure SetControlFocus(WinControl: TWinControl);
//�������
procedure ClearMemory;
//���е�ʱ���϶�һ���ؼ�
procedure DragControl(aControl: TWinControl);
//ɾ���ظ���Ԫ��(�ο�pRefListɾ��pProcessList��Ԫ��)
function DelReElemOfList(pProcessList: THashedStringList;
  pRefList: THashedStringList): Boolean;
//�������һ�β���ʱ��
{ �ṩһ��ϵͳ����ʱ�亯����ms��,�������timer�ؼ���ʱ��⣬
  ���ϵͳ����ʱ�䳬��ָ��ʱ���������������£�
  ϵͳ����-ָϵͳ���κβ������������̺���꣩ }
function LastInput: Dword;

//�Ƿ��������пؼ�
function IsDataAware(AComponent: TComponent): Boolean;
//�Ƿ���ĳ���������� Published
function CheckProperty(AComponent: TComponent; APropertyName: string): Boolean;

//���������жϺ���
procedure BreakIf(Test: Boolean = True);

//��֧�ж�
function iif(const BOOL: Boolean; TrueValue, FalseValue: Integer): Integer; overload;
function iif(const BOOL: Boolean; TrueValue, FalseValue: string): string; overload;
function iif(const BOOL: Boolean; TrueValue, FalseValue: real): real; overload;
function CaseString(const S: string; //�ַ���Case���
  const x: array of string; ci: Boolean; p: Boolean): Integer;

//������ʽSleep
procedure SleepEx(pMilliSeconds: Cardinal);
//�ȴ�����΢��(1��=1000΢��)
procedure Delay(const uDelay: Dword);

//���Delphi�Ƿ�������
function DelphiRunning: Boolean;
function DelphiRunningByExeName(AFileName: TFileName): Boolean;
//���Windows95�Ƿ���SoftIce������
function SoftIce95Running: Boolean;
//���WindowsNT�Ƿ���SoftIce������
function SoftIceNTRunning: Boolean;



{--- Code ---}

implementation

procedure SetControlFocus(WinControl: TWinControl);
begin
  if WinControl <> nil then
    if WinControl.CanFocus then
      WinControl.SetFocus;
end;

procedure ClearMemory;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then //ָ��Win32ƽ̨�ı�ʶ��
  begin
    SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
    Application.ProcessMessages;
  end;
end;

function SimplyEncryptStr(AString: string): string;
begin
  result := EncodeString(AString);
  {
    //Delphi �Դ��ӽ��ܺ���  EncdDecd.pas
    procedure EncodeStream(Input, Output: TStream);
    procedure DecodeStream(Input, Output: TStream);
    function  EncodeString(const Input: string): string;
    function  DecodeString(const Input: string): string;
  }
end;

function SimplyDecryptStr(AString: string): string;
begin
  result := DecodeString(AString);
  {
    //Delphi �Դ��ӽ��ܺ���  EncdDecd.pas
    procedure EncodeStream(Input, Output: TStream);
    procedure DecodeStream(Input, Output: TStream);
    function  EncodeString(const Input: string): string;
    function  DecodeString(const Input: string): string;
  }
end;

function PosRight(const Substr, S: string): Integer;
var
  i, j, len: Integer;
  PCharS, PCharSub: pchar;
begin
  PCharS := pchar(S); //���ַ���ת��ΪPChar��ʽ(���Ǽ�����)
  PCharSub := pchar(Substr);
  result := 0;
  len := Length(Substr);
  for i := 0 to Length(S) - 1 do
  begin
    for j := 0 to len - 1 do
    begin
      if PCharS[i + j] <> PCharSub[j] then
        break;
    end;
    if j = len then
      result := i + 1;
  end;
end;

function StrRepeat(AProcessString: string; n: Integer): string;
var
  i: Integer;
  TempVar: string;
begin
  TempVar := '';
  for i := 1 to n do
    TempVar := TempVar + AProcessString;
  result := TempVar;
end;

function CurrencyToChinese(ACurrency: currency; Default: string = ''): string;
  function RightStr(S: string; n: Integer): string; // ����ָ���ַ������ұ� N ���ַ�
  var
    Start: Integer;
  begin
    Start := Length(S) - n + 1;
    if Start <= Length(S) then
      result := Copy(S, Start, n)
    else
      result := '';
  end;
const
  UNITAGE_STR: string = 'Ǫ��ʰ��Ǫ��ʰ��Ǫ��ʰԪ�Ƿ�';
  UPPER_STR: string = '��Ҽ��������½��ƾ�';
  CURRENCY_UOM_STR: string = 'Ԫ�Ƿ�';
  CURRENCY_SUFFIX_STR: string = '������';
var
  LowStr: string; // Сд����ַ���
  CurrentChar: char; // ��ǰ��ֵ��ASCII��
  CurrentNum: Integer; // ��ǰ��ֵ
  UpperStr, UnitageChar: string[4]; // ��д����ַ����ͽ�λ�ַ���
  CurrentPos, UnitagePos: Integer; // ����
begin
  // Is Zero?
  if ACurrency = 0 then
  begin
    result := Default;
    Exit;
  end;
  result := '';
  FmtStr(LowStr, '%15.2f', [ACurrency]); // Convert to string
  LowStr := trim(LowStr);
  if ACurrency < 0 then
    LowStr := Copy(LowStr, 2, Length(LowStr) - 1); // ����Ǹ�ֵ���Ȱ��ַ�������Ǹ�����ȥ��
  CurrentPos := 1;
  UnitagePos := 15 - Length(LowStr);
  while UnitagePos < 14 do
  begin
    CurrentChar := LowStr[CurrentPos]; // ȡ��ǰλ����
    if (CurrentChar > '9') or (CurrentChar < '0') then
    begin // ȡ�����ַ����ܲ������֣�����˵��С���㣩
      if CurrentChar = '.' then
      begin // �����С����...
        if Copy(result, Length(result) - 1, Length(result)) = Copy(UPPER_STR, 1, 2) then // ���С����ǰ���㣬�Ȱ���ȥ��
          result := Copy(result, 1, Length(result) - 2);
        if Copy(result, Length(result) - 1, Length(result)) <> Copy(CURRENCY_UOM_STR, 1, 2) then //���Ԫ��λ��û�����֣����Ԫ����
          result := result + Copy(CURRENCY_UOM_STR, 1, 2);
      end;
      inc(CurrentPos);
      Continue;
    end;
    CurrentNum := ord(CurrentChar) - ord('0'); // ȡ��ǰ���ֵ�ֵ
    UpperStr := Copy(UPPER_STR, (CurrentNum shl 1) + 1, 2); // ȡ��Ӧ�Ĵ�д����
    UnitageChar := Copy(UNITAGE_STR, (UnitagePos shl 1) + 1, 2); // ��Ӧ�ĵ�λ
    if (CurrentNum <> 0) then
    begin // ���ȡ�õ����ֲ����㣬�ܼ򵥣����ַ��������������ֵ�͵�λ������
      result := result + UpperStr + UnitageChar;
      inc(UnitagePos);
      inc(CurrentPos);
      Continue;
    end;
    if RightStr(result, 2) <> Copy(UPPER_STR, 1, 2) then
      result := result + Copy(UPPER_STR, 1, 2); // ������鷳�ˣ��ȿ����ǲ����ظ��㣬���Ǿ��ȼ�һ��'��'��˵
    { �����������������'��'��'��'��'Ԫ'������λ���ϣ��͡���
      ��Ҷ������û��'��ʰ��Ԫ'��'��ʰ�����Ǫ'����˵����ֻ��
      '��ʰԪ'��'��ʰ���Ǫ'�����Ҫɾȥ�����Ǿ�������ӵ�'��'�ַ� }
    if (UnitageChar = Copy(UNITAGE_STR, 7, 2)) or (UnitageChar = Copy(UNITAGE_STR, 15, 2)) or (UnitageChar = '��') then
    begin
      Delete(result, Length(result) - 1, 2);
      if RightStr(result, 2) <> Copy(UNITAGE_STR, 7, 2) then
        result := result + UnitageChar; // ��Ҫ����ǰһλ�ǲ���'��'λ���ǾͲ��ӵ�λ��
      result := result + Copy(UPPER_STR, 1, 2);
    end;
    inc(UnitagePos);
    inc(CurrentPos);
  end;
  if RightStr(result, 2) = Copy(UPPER_STR, 1, 2) then
    result := Copy(result, 1, Length(result) - 2); // ѽ������ת�����ˣ���æ����������ĩβ��'��'��Ҫɾȥ��
  if Copy(result, 1, 2) = Copy(UPPER_STR, 1, 2) then
    result := Copy(result, 3, Length(result) - 2); // �������Ŀ�ʼ�����㣬ҲҪɾ����
  if RightStr(result, 2) = Copy(CURRENCY_UOM_STR, 3, 2) then
    result := result + Copy(CURRENCY_SUFFIX_STR, 3, 2) // ������������'XXXX��'����ϰ��Ӧ�ü���һ��'XXXX����'
  else if RightStr(result, 2) <> Copy(CURRENCY_UOM_STR, 5, 2) then
    result := result + Copy(CURRENCY_SUFFIX_STR, 1, 2); // ����������'XXXX�֣���Ҫ����һ��'��'��
  if Copy(result, 1, 2) = Copy(CURRENCY_UOM_STR, 1, 2) then
    result := RightStr(result, Length(result) - 4); // ����һ��С���⣬����...
  if ACurrency < 0 then
    result := Copy(CURRENCY_SUFFIX_STR, 5, 2) + result; // �������Ǹ�ֵ��Ҫ����һ��'��'
end;

function GetHzPy(const AHzStr: string): string;
const
  ChinaCode: array[0..25, 0..1] of Integer = ((1601, 1636), (1637, 1832), (1833, 2077),
    (2078, 2273), (2274, 2301), (2302, 2432), (2433, 2593), (2594, 2786), (9999, 0000),
    (2787, 3105), (3106, 3211), (3212, 3471), (3472, 3634), (3635, 3722), (3723, 3729),
    (3730, 3857), (3858, 4026), (4027, 4085), (4086, 4389), (4390, 4557), (9999, 0000),
    (9999, 0000), (4558, 4683), (4684, 4924), (4925, 5248), (5249, 5589));
var
  i, j, HzOrd: Integer;
begin
  i := 1;
  while i <= Length(AHzStr) do
  begin
    if (AHzStr[i] >= #160) and (AHzStr[i + 1] >= #160) then
    begin
      HzOrd := (ord(AHzStr[i]) - 160) * 100 + ord(AHzStr[i + 1]) - 160;
      for j := 0 to 25 do
      begin
        if (HzOrd >= ChinaCode[j][0]) and (HzOrd <= ChinaCode[j][1]) then
        begin
          result := result + char(byte('A') + j);
          break;
        end;
      end;
      inc(i);
    end
    else
    begin
      result := result + AHzStr[i];
    end;
    inc(i);
  end;
end;

function BIG52GB(BIG5Str: string): AnsiString;
var
  len: Integer;
  pBIG5Char: pchar;
  pGBCHSChar: pchar;
  pGBCHTChar: pchar;
  pUniCodeChar: PWideChar;
begin
  //String -> PChar
  pBIG5Char := pchar(BIG5Str);
  len := MultiByteToWideChar(950, 0, pBIG5Char, -1, nil, 0);
  GetMem(pUniCodeChar, len * 2);
  ZeroMemory(pUniCodeChar, len * 2);
  //Big5 -> UniCode
  MultiByteToWideChar(950, 0, pBIG5Char, -1, pUniCodeChar, len);
  len := WideCharToMultiByte(936, 0, pUniCodeChar, -1, nil, 0, nil, nil);
  GetMem(pGBCHTChar, len * 2);
  GetMem(pGBCHSChar, len * 2);
  ZeroMemory(pGBCHTChar, len * 2);
  ZeroMemory(pGBCHSChar, len * 2);
  //UniCode->GB CHT
  WideCharToMultiByte(936, 0, pUniCodeChar, -1, pGBCHTChar, len, nil, nil);
  //GB CHT -> GB CHS
  LCMapString($804, LCMAP_SIMPLIFIED_CHINESE, pGBCHTChar, -1, pGBCHSChar, len);
  result := string(pGBCHSChar);
  FreeMem(pGBCHTChar);
  FreeMem(pGBCHSChar);
  FreeMem(pUniCodeChar);
end;

function GB2BIG5(GBStr: string): AnsiString;
var
  len: Integer;
  pGBCHTChar: pchar;
  pGBCHSChar: pchar;
  pUniCodeChar: PWideChar;
  pBIG5Char: pchar;
begin
  pGBCHSChar := pchar(GBStr);
  len := MultiByteToWideChar(936, 0, pGBCHSChar, -1, nil, 0);
  GetMem(pGBCHTChar, len * 2 + 1);
  ZeroMemory(pGBCHTChar, len * 2 + 1);
  //GB CHS -> GB CHT
  LCMapString($804, LCMAP_TRADITIONAL_CHINESE, pGBCHSChar, -1, pGBCHTChar, len * 2);
  GetMem(pUniCodeChar, len * 2);
  ZeroMemory(pUniCodeChar, len * 2);
  //GB CHT -> UniCode
  MultiByteToWideChar(936, 0, pGBCHTChar, -1, pUniCodeChar, len * 2);
  len := WideCharToMultiByte(950, 0, pUniCodeChar, -1, nil, 0, nil, nil);
  GetMem(pBIG5Char, len);
  ZeroMemory(pBIG5Char, len);
  //UniCode -> Big5
  WideCharToMultiByte(950, 0, pUniCodeChar, -1, pBIG5Char, len, nil, nil);
  result := string(pBIG5Char);
  FreeMem(pBIG5Char);
  FreeMem(pGBCHTChar);
  FreeMem(pUniCodeChar);
end;

function GBCht2Chs(GBStr: string): AnsiString;
var
  len: Integer;
  pGBCHTChar: pchar;
  pGBCHSChar: pchar;
begin
  pGBCHTChar := pchar(GBStr);
  len := MultiByteToWideChar(936, 0, pGBCHTChar, -1, nil, 0);
  GetMem(pGBCHSChar, len * 2 + 1);
  ZeroMemory(pGBCHSChar, len * 2 + 1);
  //GB CHS -> GB CHT
  LCMapString($804, LCMAP_SIMPLIFIED_CHINESE, pGBCHTChar, -1, pGBCHSChar, len * 2);
  result := string(pGBCHSChar);
  //FreeMem(pGBCHTChar);
  FreeMem(pGBCHSChar);
end;

function GBChs2Cht(GBStr: string): AnsiString;
var
  len: Integer;
  pGBCHTChar: pchar;
  pGBCHSChar: pchar;
begin
  pGBCHSChar := pchar(GBStr);
  len := MultiByteToWideChar(936, 0, pGBCHSChar, -1, nil, 0);
  GetMem(pGBCHTChar, len * 2 + 1);
  ZeroMemory(pGBCHTChar, len * 2 + 1);
  //GB CHS -> GB CHT
  LCMapString($804, LCMAP_TRADITIONAL_CHINESE, pGBCHSChar, -1, pGBCHTChar, len * 2);
  result := string(pGBCHTChar);
  FreeMem(pGBCHTChar);
  //FreeMem(pGBCHSChar);
end;

function Money_Convert(n: Double): string;
const
  str1: array[1..10] of string = ('ʰ', '��', 'ǧ', '��', 'ʰ', '��', 'ǧ', '��', 'ʰ', 'Ԫ');
  Str2: array[1..2] of string = ('��', '��');
  Str3: array[0..9] of string = ('��', 'Ҽ', '��', '��', '��', '��', '½', '��', '��', '��');
var
  S, S1, s2, S3, S4, S5, S6: string;
  i, j, N1, N2: Integer;
begin
  result := '';
  S := FloatToStr(n); i := pos('.', S);
  if i = 0 then
    i := Length(S) + 1;
  S1 := Copy(S, 1, i - 1); s2 := Copy(S, i + 1, Length(S) - i);
  if (Length(S1) > 9) or (Length(s2) > 2) then
  begin
    //ShowMsg('UMS10000011');  //��ֵ̫��
    Exit;
  end;
  if Length(S1) > 5 then
  begin
    S3 := Copy(S1, 1, Length(S1) - 5); S4 := Copy(S1, Length(S1) - 5 + 1, 5);
  end
  else
  begin
    S3 := ''; S4 := S1;
  end;
  S5 := ''; j := 1; i := Length(S3);
  while j <= i do
  begin
    N1 := StrToInt(Copy(S3, j, 1));
    if N1 <> 0 then
      S5 := S5 + Str3[N1] + str1[5 - i + j]
    else if Copy(S5, Length(S5) - 1, 2) <> Str3[0] then
      S5 := S5 + Str3[0];
    j := j + 1;
  end;
  //
  j := 1; i := Length(S4); S := '';
  while j <= i do
  begin
    N1 := StrToInt(Copy(S4, j, 1));
    if N1 <> 0 then
      S := S + Str3[N1] + str1[10 - i + j]
    else if Copy(S, Length(S) - 1, 2) <> Str3[0] then
      S := S + Str3[0];
    j := j + 1
  end;
  if Copy(S5, Length(S5) - 1, 2) = Str3[0] then
  begin
    if Copy(S, 1, 2) = Str3[0] then
      S5 := Copy(S5, 1, Length(S5) - 2) + str1[6];
    //else if Length(s)=0 then s5:=Copy(s5,1,Length(s5)-2)+Str1[6];
  end
  else
  begin
    if (Length(S5) = 0) and (Copy(S, Length(S) - 1, 2) = Str3[0]) then
      S := Copy(S, 1, Length(S) - 2) + str1[10]
    else if (Copy(S5, Length(S5) - 1, 2) <> str1[6]) and (Copy(S, 1, 2) = Str3[0]) then
      S5 := S5 + str1[6];
  end;
  if Copy(S, Length(S) - 1, 2) = Str3[0] then
    S := Copy(S, 1, Length(S) - 2) + str1[10];
  //
  S6 := '';
  if Length(s2) = 2 then
  begin
    N1 := StrToInt(Copy(s2, 1, 1)); N2 := StrToInt(Copy(s2, 2, 1));
  end
  else
  begin
    if Length(s2) = 1 then
    begin
      N1 := StrToInt(Copy(s2, 1, 1)); N2 := 0;
    end
    else
    begin
      N1 := 0; N2 := 0;
    end;
  end;
  if N1 = 0 then
  begin
    if N2 = 0 then
      S6 := ''
    else
      S6 := Str3[0] + Str3[N2] + Str2[2];
  end
  else
  begin
    if N2 = 0 then
      S6 := Str3[N1] + Str2[1]
    else
      S6 := Str3[N1] + Str2[1] + Str3[N2] + Str2[2];
  end;
  result := S5 + S + S6;
end;

function RMB(AMoney: Double): string;
  function StrTran(const S, S1, s2: string): string;
  begin
    result := StringReplace(S, S1, s2, [rfReplaceAll]);
  end;
const
  S1: string = '��Ҽ��������½��ƾ�';
  s2: string = '�ֽ�Ԫʰ��Ǫ��ʰ��Ǫ��ʰ��Ǫ��';
var
  S, dx: string;
  i, len: Integer;
begin
  if AMoney < 0 then
  begin
    dx := '��';
    AMoney := -AMoney;
  end;
  S := Format('%.0f', [AMoney]); len := Length(S);
  for i := 1 to len do
    dx := dx + Copy(S1, (ord(S[i]) - ord('0')) * 2 + 1, 2) + Copy(s2, (len - i) * 2 + 1, 2);
  dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '��Ǫ', '��'), '���', '��'), '��ʰ', '��'), '���', '��'), '���', '��');
  dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '����', '��'), '����', '��'), '����', '��'), '����', '��'), '��Ԫ', 'Ԫ');
  if dx = '��' then
    result := '��Ԫ��'
  else
    result := StrTran(StrTran(StrTran(dx, '����', '����'), '����', '��'), '����', '��');
end;

function Slash(Value: string): string;
begin
  Value := trim(Value);
  if (Value[Length(Value)] <> '\') then
    result := Value + '\'
  else
    result := Value;
end;

function RFillStr(const Str: string; const TotalLen: Integer;
  const FillStr: string): string;
var
  sStr, sFillStr: string; iFillLen: Integer;
begin
  sStr := trim(Str);
  iFillLen := TotalLen - Length(sStr);
  while Length(sFillStr) < iFillLen do
    sFillStr := sFillStr + FillStr;
  sStr := sStr + sFillStr;
  result := Copy(sStr, 1, TotalLen);
end;

function LFillStr(const Str: string; const TotalLen: Integer;
  const FillStr: string): string;
var
  sStr, sFillStr: string; iFillLen: Integer;
begin
  sStr := trim(Str);
  iFillLen := TotalLen - Length(sStr);
  while Length(sFillStr) < iFillLen do
    sFillStr := sFillStr + FillStr;
  sStr := sFillStr + sStr;
  result := Copy(sStr, Length(sStr) - TotalLen + 1, TotalLen);
end;

function IsEqualDate(ADate1, ADate2: TDate): Boolean;
begin
  result := ((Trunc(ADate1) - Trunc(ADate2)) = 0)
end;

function IsLeapYear(ADateTime: TDateTime): Boolean;
var
  Year: Integer;
begin
  Year := YearOf(ADateTime);
  result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0))
end;

function SetSysDateTime(ADateTime: TDateTime): Boolean;
var
  tTZI: TTimeZoneInforMation;
  tmpDateTime: TDateTime; vDateBias: Variant;
  iYear, iMonth, iDay, iHour, iMin, iSec, iMSec: word;
  tmpSystemTime: TSystemTime;
begin
  result := False;
  GetTimeZoneInformation(tTZI); //�õ�ʱ��
  vDateBias := tTZI.Bias / 1440;
  tmpDateTime := ADateTime + vDateBias; //�õ������õ�GMTʱ��
  DecodeDateTime(tmpDateTime, iYear, iMonth, iDay, iHour, iMin, iSec, iMSec);
  with tmpSystemTime do
  begin
    wYear := iYear; wMonth := iMonth; wDay := iDay;
    wHour := iHour; wMinute := iMin; wSecond := iSec; wMilliseconds := iMSec;
  end;
  result := SetSystemTime(tmpSystemTime);
end;

function FmtVarToDateTime(Val: Variant; Format: string): string;
begin
  result := '';
  if not VarIsType(Val, varDate) then
    Exit;
  result := FormatDateTime(Format, Val);
end;

function FmtSQLDatetime(ADateTime: TDateTime; Format: string): string;
begin
  result := FormatDateTime(Format, ADateTime);
end;

function DelDataSetAllData(DataSet: TDataSet): Boolean;
begin
  result := False;
  if (DataSet = nil) or (not DataSet.Active) then
    Exit;
  if not DataSet.CanModify then
    Exit;
  if DataSet.State in [dsInsert, dsEdit] then
    DataSet.Cancel;
  DataSet.First;
  while not DataSet.Eof do
  begin
    DataSet.Delete;
    Application.ProcessMessages;
  end;
  result := True;
end;

procedure CloseDataSet(DataSet: TDataSet);
begin
  if not Assigned(DataSet) then
    Exit;
  if DataSet.Active then
    DataSet.Close;
end;

function ReOpen(DataSet: TDataSet; OnlyActive: Boolean = False): Boolean;
var
  tmpControlsDisabled: Boolean;
begin
  result := False;
  if OnlyActive and (not DataSet.Active) then
  begin
    result := True;
    Exit;
  end;
  tmpControlsDisabled := DataSet.ControlsDisabled;
  if not tmpControlsDisabled then
    DataSet.DisableControls;
  if DataSet.Active then
    DataSet.Close;
  try
    DataSet.Open;
  except
    result := False;
    Exit;
  end;
  if not tmpControlsDisabled then
    DataSet.EnableControls;
  result := True;
end;

function PostDataSet(DataSet: TDataSet): Boolean;
begin
  result := False;
  if DataSet.Active and (DataSet.State in [dsInsert, dsEdit]) then
  try
    DataSet.Post;
  except
    Exit;
  end;
  result := True;
end;

function TryConn(pConnObj: TADOConnection; pConnType: string; pIsKeepConn: Boolean;
  pDBSvrName, pDBName, pDBUserName, pDBUserPwd: string): Boolean;
const
  DBConnString1 = 'Provider=SQLOLEDB.1;User ID=%s;Password=%s;Persist Security Info=false;'
    + 'Initial Catalog=%s;Data Source=%s';
  DBConnString2 = 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=false;'
    + 'Initial Catalog=%s;Data Source=%s';
var
  tmpConnObj: TADOConnection;
begin
  result := False;
  if pConnObj = nil then
  begin
    //����Create(Application)����������DLL�е��ã����˳�������exeʱ���ܳ���
    tmpConnObj := TADOConnection.Create(nil);
  end
  else
  begin
    tmpConnObj := pConnObj;
  end;
  try
    with tmpConnObj do
    begin
      if Connected then
        Connected := False;
      if UpperCase(trim(pConnType)) = 'SQL' then
      begin //SQLServer��SQL��֤
        ConnectionString := Format(DBConnString1, [pDBUserName, pDBUserPwd, pDBName, pDBSvrName]);
      end
      else if UpperCase(trim(pConnType)) = 'WIN' then
      begin //SQLServer��Windows��֤
        ConnectionString := Format(DBConnString2, [pDBName, pDBSvrName]);
      end
      else
      begin
        Exit;
      end;
      LoginPrompt := False;
      try
        Connected := True;
        result := True;
      except
        result := False;
      end;
      if (pConnObj = nil) or (not pIsKeepConn) then
        if Connected then
          Connected := False;
    end;
  finally
    if pConnObj = nil then
      FreeAndNil(tmpConnObj);
  end;
end;

function TableToFile(pConnObj: TADOConnection; pTableName: string; pSQLWhere: string;
  pFileName: string; pFormat: TPersistFormat;
  var pResultMsg: string): Boolean;
var
  SQL: string;
  cq: Integer;
  tmpDS1: TADODataSet;
begin
  result := False;
  pResultMsg := '';
  if (pConnObj = nil) or (not pConnObj.Connected) then
    Exit;
  pTableName := trim(pTableName);
  if pTableName = '' then
    Exit;
  pFileName := trim(pFileName);
  if pFileName = '' then
    Exit;
  //
  tmpDS1 := TADODataSet.Create(nil);
  tmpDS1.Connection := pConnObj;
  try
    SQL := 'select * from ' + pTableName;
    if trim(pSQLWhere) <> '' then
      SQL := SQL + ' where ' + pSQLWhere;
    tmpDS1.CommandText := SQL;
    tmpDS1.Open;
    cq := tmpDS1.RecordCount;
    tmpDS1.SaveToFile(pFileName, pFormat);
    pResultMsg := 'RecordCount=' + inttostr(cq);
    tmpDS1.Close;
    result := True;
  finally
    tmpDS1.Free;
  end;
end;

function TableFromFile(pConnObj: TADOConnection; pTableName: string; pFileName: string;
  pKeyFieldName: string; pIsDelAll: Boolean; pIsExistReplace: Boolean;
  var pResultMsg: string): Boolean;
var
  i: Integer;
  cq, dq, rq, aq: Integer;
  IsReplace: Boolean;
  SQL: string;
  tmpDS1, tmpDS2: TADODataSet;
begin
  result := False;
  pResultMsg := '';
  if (pConnObj = nil) or (not pConnObj.Connected) then
    Exit;
  pTableName := trim(pTableName);
  if pTableName = '' then
    Exit;
  pFileName := trim(pFileName);
  if pFileName = '' then
    Exit;
  pKeyFieldName := trim(pKeyFieldName);
  if pKeyFieldName = '' then
  begin
    tmpDS1 := TADODataSet.Create(nil);
    tmpDS1.Connection := pConnObj;
    try
      SQL := 'exec sp_pkeys %s';
      SQL := Format(SQL, [QuotedStr(pTableName)]);
      tmpDS1.CommandText := SQL;
      tmpDS1.Open;
      if tmpDS1.RecordCount <> 1 then
        Exit;
      pKeyFieldName := tmpDS1.FieldByName('column_name').asstring;
    finally
      tmpDS1.Free;
    end;
  end;
  if pKeyFieldName = '' then
    Exit;
  //
  cq := 0; dq := 0; rq := 0; aq := 0;
  tmpDS1 := TADODataSet.Create(nil);
  tmpDS2 := TADODataSet.Create(nil);
  tmpDS1.Connection := pConnObj;
  tmpDS2.Connection := pConnObj;
  try
    tmpDS1.LockType := ltBatchOptimistic;
    SQL := 'select * from ' + pTableName;
    tmpDS1.CommandText := SQL;
    tmpDS1.Open;
    tmpDS2.LoadFromFile(pFileName);
    cq := tmpDS2.RecordCount;
    //
    if tmpDS1.FieldCount <> tmpDS2.FieldCount then
      Exit;
    if tmpDS1.FindField(pKeyFieldName) = nil then
      Exit;
    if tmpDS2.FindField(pKeyFieldName) = nil then
      Exit;
    //
    if pIsDelAll then
    begin
      dq := tmpDS1.RecordCount;
      tmpDS1.First;
      while not tmpDS1.Eof do
        tmpDS1.Delete;
    end;
    tmpDS2.First;
    while not tmpDS2.Eof do
    begin
      IsReplace := False;
      if pIsExistReplace then
      begin
        tmpDS1.First;
        if tmpDS1.Locate(pKeyFieldName, tmpDS2.FindField(pKeyFieldName).Value, []) then
        begin
          tmpDS1.Edit;
          for i := 0 to tmpDS1.FieldCount - 1 do
          begin
            if LowerCase(trim(tmpDS1.Fields[i].FieldName)) <> LowerCase(trim(pKeyFieldName)) then
              tmpDS1.Fields[i].Value := tmpDS2.Fields[i].Value;
          end;
          tmpDS1.Post;
          IsReplace := True;
          rq := rq + 1;
        end;
      end;
      if not IsReplace then
      begin
        tmpDS1.Append;
        for i := 0 to tmpDS1.FieldCount - 1 do
        begin
          tmpDS1.Fields[i].Value := tmpDS2.Fields[i].Value;
        end;
        tmpDS1.Post;
        aq := aq + 1;
      end;
      tmpDS2.Next;
    end;
    pResultMsg := 'RecordCount=' + inttostr(cq) + '; '
      + 'DeleteCount=' + inttostr(dq) + '; '
      + 'ReplaceCount=' + inttostr(rq) + '; '
      + 'AppendCount=' + inttostr(aq);
    tmpDS1.UpdateBatch(arAll);
    tmpDS1.Close;
    result := True;
  finally
    tmpDS1.Free;
    tmpDS2.Free;
  end;
end;

function DBGridToExcel(pDBGrid: TDBGrid; pVisible: Boolean;
  pExcelFileName: string): Boolean;
begin
  result := False;
end;

function DBGridEhExportToFile(pDBGrid: TDBGridEh; pVisible: Boolean;
  pFileName: string): Boolean;
var
  Ext: string;
  filename: string;
  ExpClass: TDBGridEhExportClass;
  tmpSaveDialog: TSaveDialog;
begin
  result := False;
  if (not Assigned(pDBGrid))
    //or (pDBGrid.Tag<>0)
  or (not Assigned(pDBGrid.DataSource))
    or (not Assigned(pDBGrid.DataSource.DataSet))
    or (not pDBGrid.DataSource.DataSet.Active)
    then
    Exit;
  if trim(pFileName) <> '' then
    tmpSaveDialog := TSaveDialog.Create(Application);
  try
    if trim(pFileName) = '' then
    begin
      tmpSaveDialog.Filter := 'Microsoft Excel Workbook (*.xls)|*.XLS|'
        + 'Comma separated values (*.csv)|*.CSV|Text files (*.txt)|*.TXT|'
        + 'Rich Text Format (*.rtf)|*.RTF';
      //+'Rich Text Format (*.rtf)|*.RTF|HTML file (*.htm)|*.HTM';
      tmpSaveDialog.filename := '�ļ�1';
      if not tmpSaveDialog.Execute then
        Exit;
      case tmpSaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsXLS; Ext := 'xls'; end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
        3:
          begin
            ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        5:
          begin
            ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      else
        ExpClass := nil; Ext := '';
      end; //case
      filename := tmpSaveDialog.filename;
    end
    else
    begin
      Ext := ExtractFileExt(pFileName);
      if Ext = 'xls' then
        ExpClass := TDBGridEhExportAsXLS
      else if Ext = 'csv' then
        ExpClass := TDBGridEhExportAsCSV
      else if Ext = 'txt' then
        ExpClass := TDBGridEhExportAsText
      else if Ext = 'rtf' then
        ExpClass := TDBGridEhExportAsRTF
      else if Ext = 'htm' then
        ExpClass := TDBGridEhExportAsHTML
      else
        Exit;
      filename := pFileName;
    end;
    if ExpClass = nil then
      Exit;
    if UpperCase(Copy(filename, Length(filename) - 2, 3))
      <> UpperCase(Ext)
      then
      filename := filename + '.' + Ext;
    if FileExists(filename) then
      if QueryMsgBox(' �ļ��Ѵ��ڣ��Ƿ񸲸�(Y/N)?   ') = IDNO
        then
        Exit;
    SaveDBGridEhToExportFile(ExpClass, pDBGrid,
      filename, True);
    if pVisible then
      ShellExecute(0, nil, pchar(filename),
        nil, nil, sw_shownormal);
  finally
    if Assigned(tmpSaveDialog) then
      FreeAndNil(tmpSaveDialog);
  end;
end;

function GetDSRecCount(pDataSet: TDataSet): Integer;
var
  k: Integer;
  bk: TBookMark;
  tmpEvent1, tmpEvent2: TDataSetNotifyEvent;
begin
  result := 0;
  with pDataSet do
  begin
    if (not Assigned(pDataSet))
      or (not Active) or IsEmpty
      then
      Exit;
    tmpEvent1 := BeforeScroll;
    BeforeScroll := nil;
    tmpEvent2 := AfterScroll;
    AfterScroll := nil;
    bk := GetBookmark;
    DisableControls;
    try
      k := 0;
      First;
      while not Eof do
      begin
        inc(k);
        Next;
      end;
      result := k;
    finally
      GotoBookmark(bk);
      FreeBookmark(bk);
      EnableControls;
      BeforeScroll := tmpEvent1;
      AfterScroll := tmpEvent2;
    end;
  end; //with
end;

function CopyRecord(pSourDataSet, pDestDataSet: TDataSet): Boolean;
var
  i: Integer;
  tmpField: TField;
  RetCopyInfo: string; //���ƹ�����Ϣ
begin
  //���Ƽ�¼(pDestDataSet����ΪdsInsert��dsEdit״̬)
  result := False;
  RetCopyInfo := '';
  if (not Assigned(pSourDataSet)) or (not Assigned(pDestDataSet)) then
    Exit;
  if (not pSourDataSet.Active) or (not pDestDataSet.Active) then
    Exit;
  if pSourDataSet.IsEmpty then
    Exit;
  if not (pDestDataSet.State in [dsInsert, dsEdit]) then
    Exit;
  for i := 0 to pSourDataSet.FieldCount - 1 do
  begin
    Application.ProcessMessages;
    tmpField := pDestDataSet.FindField(pSourDataSet.Fields[i].FieldName);
    if tmpField = nil then
      Continue;
    if (pSourDataSet.Fields[i] is TDateField) //���⴦��
    and (YearOf(TDateField(pSourDataSet.Fields[i]).AsDateTime) = 1899)
      then
    begin
      try
        tmpField.Clear;
      except
      end;
      Continue;
    end; //if
    if pSourDataSet.Fields[i].AsVariant <> tmpField.AsVariant then
    begin
      tmpField.AsVariant := pSourDataSet.Fields[i].AsVariant;
      if RetCopyInfo <> '' then
        RetCopyInfo := RetCopyInfo + ' / ';
      RetCopyInfo := RetCopyInfo + pSourDataSet.Fields[i].FieldName;
    end; //if
  end; //for
  if RetCopyInfo <> '' then
    RetCopyInfo := 'Modify Field: ' + RetCopyInfo;
  result := True;
end;

function NewDSSeq(pDataSet: TDataSet; pSeqFieldName: string;
  pStepSeq: Integer; pInitSeq: Integer): Integer;
var
  k: Integer;
  bk: TBookMark;
  tmpADS: TADODataSet;
  tmpCDS: TClientDataSet;
begin
  result := -1;
  if (not pDataSet.Active) then
    Exit;
  if pDataSet.FindField(pSeqFieldName) = nil then
    Exit;
  if not (pDataSet.FieldByName(pSeqFieldName) is TIntegerField) then
    Exit;
  if pDataSet.IsEmpty or (pDataSet.RecordCount <= 0) then
  begin //��֪Ϊʲô��Ҫ�ж�RecordCountֵ
    result := pInitSeq;
    Exit;
  end;
  if pDataSet is TADODataSet then
  begin
    bk := pDataSet.GetBookmark;
    pDataSet.DisableControls;
    tmpADS := TADODataSet.Create(nil);
    try
      tmpADS.Clone(TADODataSet(pDataSet));
      k := 0;
      tmpADS.First;
      while not tmpADS.Eof do
      begin
        if tmpADS.FieldByName(pSeqFieldName).AsInteger > k then
          k := tmpADS.FieldByName(pSeqFieldName).AsInteger;
        tmpADS.Next;
      end;
    finally
      tmpADS.Free;
      pDataSet.EnableControls;
      pDataSet.GotoBookmark(bk);
      pDataSet.FreeBookmark(bk);
    end;
  end
  else if pDataSet is TClientDataSet then
  begin
    bk := pDataSet.GetBookmark;
    pDataSet.DisableControls;
    tmpCDS := TClientDataSet.Create(nil);
    try
      k := 0;
      tmpCDS.CloneCursor(TClientDataSet(pDataSet), False, True);
      tmpCDS.First;
      while not tmpCDS.Eof do
      begin
        if tmpCDS.FieldByName(pSeqFieldName).AsInteger > k then
          k := tmpCDS.FieldByName(pSeqFieldName).AsInteger;
        tmpCDS.Next;
      end;
    finally
      tmpCDS.Free;
      pDataSet.EnableControls;
      pDataSet.GotoBookmark(bk);
      pDataSet.FreeBookmark(bk);
    end;
  end
  else
  begin
    Exit;
  end;
  k := (Trunc(k / pStepSeq) + 1) * pStepSeq;
  result := k;
end;

function RefreshDSSeq(pDataSet: TDataSet; pKeyFieldName, pSeqFieldName: string;
  pStepSeq: Integer = 10; pInitSeq: Integer = 10): Boolean;
var
  i, j: Integer;
  sk, ss: string;
  sIndexFieldNames, sIndexName: string;
  a: array of array[0..1] of string;
begin
  result := False;
  if (not pDataSet.Active) or pDataSet.IsEmpty then
    Exit;
  if pDataSet.FindField(pKeyFieldName) = nil then
    Exit;
  if pDataSet.FindField(pSeqFieldName) = nil then
    Exit;
  if not (pDataSet.FieldByName(pSeqFieldName) is TIntegerField) then
    Exit;
  if (not (pDataSet is TADODataSet))
    and (not (pDataSet is TClientDataSet))
    then
    Exit;
  pDataSet.DisableControls;
  if pDataSet is TADODataSet then
  begin //��Ҫע��: IndexFieldNames��IndexName����
    sIndexFieldNames := TADODataSet(pDataSet).IndexFieldNames;
    sIndexName := TADODataSet(pDataSet).IndexName;
    if (sIndexFieldNames <> '') or (sIndexName <> '') then
      TADODataSet(pDataSet).IndexFieldNames := '';
  end
  else if pDataSet is TClientDataSet then
  begin
    sIndexFieldNames := TClientDataSet(pDataSet).IndexFieldNames;
    sIndexName := TClientDataSet(pDataSet).IndexName;
    if (sIndexFieldNames <> '') or (sIndexName <> '') then
      TClientDataSet(pDataSet).IndexFieldNames := '';
  end;
  try
    //��ʼ���������
    SetLength(a, pDataSet.RecordCount);
    i := 0;
    pDataSet.First;
    while not pDataSet.Eof do
    begin
      a[i, 0] := pDataSet.FieldByName(pKeyFieldName).asstring;
      a[i, 1] := pDataSet.FieldByName(pSeqFieldName).asstring;
      inc(i);
      pDataSet.Next;
    end;
    //ð������
    for i := 0 to High(a) do
    begin
      for j := i + 1 to High(a) do
      begin
        if StrToInt(a[j, 1]) < StrToInt(a[i, 1]) then
        begin
          sk := a[i, 0];
          ss := a[i, 1];
          a[i, 0] := a[j, 0];
          a[i, 1] := a[j, 1];
          a[j, 0] := sk;
          a[j, 1] := ss;
        end; //if
      end; //for
    end; //for
    //�趨��ֵ
    for i := 0 to High(a) do
      a[i, 1] := inttostr(pInitSeq + pStepSeq * i);
    //�������ݼ��ֶ�ֵ
    pDataSet.First;
    while not pDataSet.Eof do
    begin
      for i := 0 to High(a) do
      begin
        if a[i, 0] = pDataSet.FieldByName(pKeyFieldName).asstring then
        begin
          if pDataSet.FieldByName(pSeqFieldName).AsInteger <> StrToInt(a[i, 1]) then
          begin
            if not (pDataSet.State in [dsInsert, dsEdit]) then
              pDataSet.Edit;
            pDataSet.FieldByName(pSeqFieldName).AsInteger := StrToInt(a[i, 1]);
            pDataSet.Post;
          end;
          break;
        end; //if
      end; //for
      pDataSet.Next;
    end; //while
    //
  finally
    if pDataSet is TADODataSet then
    begin //��Ҫע��: IndexFieldNames��IndexName����
      if (sIndexFieldNames <> '') then
        TADODataSet(pDataSet).IndexFieldNames := sIndexFieldNames;
      if (sIndexName <> '') then
        TADODataSet(pDataSet).IndexName := sIndexName;
    end
    else if pDataSet is TClientDataSet then
    begin
      if (sIndexFieldNames <> '') then
        TClientDataSet(pDataSet).IndexFieldNames := sIndexFieldNames;
      if (sIndexName <> '') then
        TClientDataSet(pDataSet).IndexName := sIndexName;
    end;
    pDataSet.First;
    pDataSet.EnableControls;
  end;
  result := True;
end;

function IsInstalledSQLServer: Boolean;
var
  RegisterTemp: TRegistry;
begin
  result := False;
  RegisterTemp := TRegistry.Create;
  with RegisterTemp do
  begin
    rootkey := HKEY_LOCAL_MACHINE;
    if OpenKey('Software\Microsoft\MSSQLServer\Setup', True) then
    begin
      if valueexists('SQLPath') then
      begin
        result := True;
      end
      else
      begin
        result := False;
      end;
    end;
  end;
  RegisterTemp.CloseKey;
  RegisterTemp.Free;
end;

function GetSQLServerAvaiLsit(var pList: TStringList): Boolean;
var
  SQLServer: Variant;
  ServerList: Variant;
  i, nServers: Integer;
begin
  result := False;
  pList.Clear;
  try
    SQLServer := CreateOleObject('SQLDMO.Application');
    ServerList := SQLServer.ListAvailableSQLServers;
    nServers := ServerList.Count;
    for i := 1 to nServers do
      pList.Add(ServerList.Item(i));
    SQLServer := NULL;
    ServerList := NULL;
  except
    //Application.MessageBox('����ǰ�Ļ���û�а�װSQL Server���޷�����SQL Server�������б�'+#13+#10+'��ֱ������SQL Server���������ƣ�','��Ϣ��ʾ',MB_OK+MB_ICONINFORMATION);
  end;
  result := True;
end;

procedure Bleep(BleepType: TBleepType);
var
  SysWinNT: Boolean;
  function IsSysWinNT: Boolean;
  var
    VersionInfo: TOSVersionInfo;
  begin
    VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
    GetVersionEx(VersionInfo);
    result := VersionInfo.dwPlatformID = VER_PLATFORM_WIN32_NT;
  end;
  procedure BeepEx(const feq: word = 1200; const Delay: word = 1);
    procedure BeepOff;
    begin
      asm
         in al,$61;
         and al,$fc;
         out $61,al;
      end;
    end;
  const
    FREQ_SCALE = $1193180;
  var
    temp: word;
  begin
    temp := FREQ_SCALE div feq;
    asm
      in al,61h;
      or al,3;
      out 61h,al;
      mov al,$b6;
      out 43h,al;
      mov ax,temp;
      out 42h,al;
      mov al,ah;
      out 42h,al;
    end;
    sleep(Delay);
    BeepOff;
  end;
  procedure DoBleep(Freq: word; MSecs: Integer);
  begin
    if SysWinNT then //����SysWinNTϵͳ��������
      Windows.Beep(Freq, MSecs) //Ƶ�ʣ�����ʱ��
    else
      BeepEx(Freq, MSecs);
  end;
begin
  SysWinNT := IsSysWinNT;
  case BleepType of
    vOK:
      begin
        DoBleep(1047, 100);
        DoBleep(1109, 100);
        DoBleep(1175, 100);
      end;
    vInterrupt:
      begin
        DoBleep(2093, 100);
        DoBleep(1976, 100);
        DoBleep(1857, 100);
      end;
    vError:
      begin
        DoBleep(80, 500);
      end;
  end;
end;

procedure Jpg2Bmp(const Source, Dest: string);
var
  MyJpeg: TJpegImage;
  bmp: TBitmap;
begin
  bmp := TBitmap.Create;
  MyJpeg := TJpegImage.Create;
  try
    MyJpeg.LoadFromFile(Source);
    bmp.Assign(MyJpeg);
    bmp.SaveToFile(Dest);
  finally
    bmp.Free;
    MyJpeg.Free;
  end;
end;

procedure Bmp2Jpg(const Source, Dest: string; const scale: byte);
var
  MyJpeg: TJpegImage;
  Image1: TImage;
begin
  //����Create(Application)����������DLL�е��ã����˳�������exeʱ���ܳ���
  Image1 := TImage.Create(nil);
  MyJpeg := TJpegImage.Create;
  try
    Image1.Picture.Bitmap.LoadFromFile(Source);
    MyJpeg.Assign(Image1.Picture.Bitmap);
    MyJpeg.CompressionQuality := scale;
    MyJpeg.Compress;
    MyJpeg.SaveToFile(Dest);
  finally
    Image1.Free;
    MyJpeg.Free;
  end;
end;

procedure FitBitmap(const Source, Dest: string; const x, y: Integer; const ColorBit: TPixelFormat);
var
  abmp, bbmp: TBitmap;
  scalex, scaley: real;
begin
  abmp := TBitmap.Create;
  bbmp := TBitmap.Create;
  try
    abmp.LoadFromFile(Source);
    scaley := abmp.Height / y;
    scalex := abmp.Width / x;
    bbmp.Width := round(abmp.Width / scalex);
    bbmp.Height := round(abmp.Height / scaley);
    bbmp.PixelFormat := pf8bit;
    SetStretchBltMode(bbmp.Canvas.handle, COLORONCOLOR);
    stretchblt(bbmp.Canvas.handle, 0, 0, bbmp.Width, bbmp.Height, abmp.Canvas.handle, 0, 0, abmp.Width, abmp.Height, srccopy);
    bbmp.SaveToFile(Dest);
  finally
    abmp.Free;
    bbmp.Free;
  end;
end;

function IsHasSoundCard: Boolean;
var
  WaveOutPutDeviceCount, MidiOutPutDeviceCount: Cardinal;
begin
  WaveOutPutDeviceCount := waveOutGetNumDevs;
  MidiOutPutDeviceCount := midiOutGetNumDevs;
  result := ((WaveOutPutDeviceCount > 0) and (MidiOutPutDeviceCount > 0));
end;

function InfoMsgBox(pInformationString: string): Integer;
begin
  result := MessageBox(GetActiveWindow, pchar(pInformationString), pchar(TIP_STRING), MB_ICONINFORMATION + MB_OK);
end;

function WarningMsgBox(pWarningString: string): Integer;
begin
  result := MessageBox(GetActiveWindow, pchar(pWarningString), pchar(WARNING_STRING), MB_ICONWARNING + MB_OK);
end;

function ErrorMsgBox(pErrorString: string): Integer;
begin
  result := MessageBox(GetActiveWindow, pchar(pErrorString), pchar(ERROR_STRING), MB_ICONERROR + MB_OK);
end;

function QueryMsgBox(pQuestionString: string; pDefaultButton: Integer = 1): Integer;
begin
  if pDefaultButton = 2 then
    result := MessageBox(GetActiveWindow, pchar(pQuestionString), pchar(CONFIRM_STRING), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2)
  else
    result := MessageBox(GetActiveWindow, pchar(pQuestionString), pchar(CONFIRM_STRING), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1);
end;

function ConfMsgBox(pQuestionString: string; pDefaultButton: Integer = 1): Integer;
begin
  result := QueryMsgBox(pQuestionString, pDefaultButton);
end;

function QueryDelMsgBox(pDeleteString: string = QUERY_DELETE_STRING): Integer;
begin
  result := QueryMsgBox(pDeleteString, 2);
end;

function QuerySaveMsgBox(pSaveString: string = QUERY_SAVE_STRING; pDefaultButton: Integer = 1): Integer;
begin
  case pDefaultButton of
    1: result := MessageBox(GetActiveWindow, pchar(pSaveString), pchar(CONFIRM_STRING), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1);
    2: result := MessageBox(GetActiveWindow, pchar(pSaveString), pchar(CONFIRM_STRING), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON2);
    3: result := MessageBox(GetActiveWindow, pchar(pSaveString), pchar(CONFIRM_STRING), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON3);
  else
    result := MessageBox(GetActiveWindow, pchar(pSaveString), pchar(CONFIRM_STRING), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1);
  end;
end;

function QueryExitMsgBox(pExitString: string = QUERY_EXIT_STRING): Integer;
begin
  result := QueryMsgBox(pExitString, 2);
end;

function NotDevelopFinishMsgBox(pNotDevelopFinishString: string = NOT_DEVELOP_FINISH_STRING): Integer;
begin
  result := InfoMsgBox(pNotDevelopFinishString);
end;

function ShowWinInTaskbar(hWin: THandle; IsShow: Boolean): Boolean;
begin
  if IsShow then
  begin
    SetWindowLong(hWin, GWL_EXSTYLE,
      ((GetWindowLong(hWin, GWL_EXSTYLE) and (not WS_EX_TOOLWINDOW)) or WS_EX_APPWINDOW));
  end
  else
  begin
    SetWindowLong(hWin, GWL_EXSTYLE,
      (GetWindowLong(hWin, GWL_EXSTYLE) and (not WS_EX_APPWINDOW)));
  end;
  result := True;
end;

function ReadRegKey(const RegKeyString, RegKeyName: string; var RegKeyValue: string;
  IsCreate: Boolean; DefVal: string; HKEY: Dword): Boolean;
var
  Reg: TRegistry;
  tmpVar1: string;
begin
  result := False;
  Reg := TRegistry.Create;
  try
    Reg.rootkey := HKEY;
    if Reg.OpenKey(RegKeyString, True) then
    begin
      if Reg.valueexists(RegKeyName) then
      begin
        tmpVar1 := Reg.ReadString(RegKeyName);
      end
      else
      begin
        if IsCreate then
        begin
          Reg.WriteString(RegKeyName, DefVal);
          tmpVar1 := DefVal;
        end
        else
        begin
          tmpVar1 := RegKeyValue;
        end;
      end;
      RegKeyValue := tmpVar1;
      Reg.CloseKey;
      result := True;
    end;
  finally
    Reg.Free;
  end;
end;

function WriteRegKey(const RegKeyString, RegKeyName, RegKeyValue: string;
  HKEY: Dword): Boolean;
var
  Reg: TRegistry;
begin
  result := False;
  Reg := TRegistry.Create;
  try
    Reg.rootkey := HKEY;
    if Reg.OpenKey(RegKeyString, True) then
    begin
      Reg.WriteString(RegKeyName, RegKeyValue);
      Reg.CloseKey;
      result := True;
    end;
  finally
    Reg.Free;
  end;
end;

function DelRegNode(const RegKeyString: string; HKEY: Dword): Boolean;
var
  Reg: TRegistry;
begin
  result := False;
  Reg := TRegistry.Create;
  try
    Reg.rootkey := HKEY;
    Reg.DeleteKey(RegKeyString); //ע�⣺����ҪҲ������OpenKey();
    result := True;
  finally
    Reg.Free;
  end;
end;

function WriteIniFileString(const filename, Section, Ident, Value: string): Boolean;
var
  MyIniFile: TIniFile;
begin
  result := False;
  if (trim(Section) = '') or (trim(Ident) = '') then
    Exit;
  MyIniFile := TIniFile.Create(filename);
  try
    MyIniFile.WriteString(Section, Ident, Value);
    result := True;
  finally
    MyIniFile.Free;
  end;
end;

function ReadIniFileString(const filename, Section, Ident: string; var Value: string;
  IsCreate: Boolean; DefVal: string): Boolean;
var
  tmpValue: string;
  MyIniFile: TIniFile;
begin
  result := False;
  MyIniFile := TIniFile.Create(filename);
  try
    tmpValue := MyIniFile.ReadString(Section, Ident, '_NoIdent');
    if tmpValue = '_NoIdent' then
    begin
      Value := DefVal;
      if IsCreate then
        WriteIniFileString(filename, Section, Ident, DefVal);
      result := True;
    end
    else
    begin
      Value := tmpValue;
      result := True;
    end;
  finally
    MyIniFile.Free;
  end;
end;

function DiskInDrive(Drive: char): Boolean;
var
  ErrorMode: word;
begin
  { make it upper case }
  if Drive in ['a'..'z'] then
    Dec(Drive, $20);
  { make sure it's a letter }
  if not (Drive in ['A'..'Z']) then
    raise EConvertError.Create('Not a valid drive ID');
  { turn off critical errors }
  ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
  try
    { drive 1 = a, 2 = b, 3 = c, etc. }
    if DiskSize(ord(Drive) - $40) = -1 then
      result := False
    else
      result := True;
  finally
    { restore old error mode }
    SetErrorMode(ErrorMode);
  end;
end;

function GetWinTempPath: string;
var
  WinTempDir: array[0..MAX_PATH] of char;
begin
  GetTempPath(MAX_PATH, WinTempDir);
  result := Slash(trim(StrPas(WinTempDir)));
end;

function GetAppPath: string;
begin
  result := Slash(trim(ExtractFilePath(Application.ExeName)));
  //ExtractFilePath(paramstr(0))������ͬ���ɲ鿴ExeName���Ե�GetExeName����
end;

procedure Delay(const uDelay: Dword);
var
  n: Dword;
begin
  n := GetTickCount;
  while ((GetTickCount - n) <= uDelay) do
    Application.ProcessMessages;
end;

function IsDataAware(AComponent: TComponent): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(AComponent.classinfo, 'DataSource');
  result := PropInfo <> nil;
  if result then
    if not ((PropInfo^.PropType^.Kind = tkClass)
      and (GetTypeData(PropInfo^.PropType^).ClassType.InheritsFrom(TDataSource))) then
      result := False;
end;

function CheckProperty(AComponent: TComponent; APropertyName: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(AComponent.classinfo, APropertyName);
  result := PropInfo <> nil;
end;

function MiniGUID: string;
const
  GUID: TGUID = '{00000000-0000-0000-0000-000000000000}'; //��СGUID
begin
  result := GUIDToString(GUID)
end;

function NewGUID: string;
var
  GUID: TGUID;
begin
  result := '';
  if CoCreateGUID(GUID) = s_OK then
    result := GUIDToString(GUID)
  else
    Abort;
  //Raise CreateClassID NewClassID
end;

function SoundCardExist: Boolean;
begin
  result := waveOutGetNumDevs > 0;
end;

procedure GetBitmapFromIcon(const result: TBitmap; Icon: TIcon; BgColor: TColor);
begin
  with result, result.Canvas do
  try
    Width := Icon.Width;
    Height := Icon.Height;
    Brush.Color := BgColor;
    FillRect(Rect(0, 0, Width, Height));
    Draw(0, 0, Icon);
  except
    raise;
  end;
end;

procedure SimplyShowPic(pPicFile: string);
var
  tmpForm: TForm;
  tmpImage: TImage;
begin
  if not FileExists(pPicFile) then
    Exit;
  tmpForm := TForm.Create(Application);
  tmpImage := TImage.Create(tmpForm);
  try
    with tmpForm do
    begin
      BorderStyle := bsDialog;
      Position := poOwnerFormCenter;
      Width := 680;
      Height := 500;
    end;
    with tmpImage do
    begin
      Parent := tmpForm;
      Align := alClient;
      Stretch := True;
      Center := True;
      Proportional := True;
      Picture.LoadFromFile(pPicFile);
    end;
    tmpForm.ShowModal;
  finally
    tmpImage.Free;
    tmpForm.Free;
  end;
end;

function SetAutoRun(pAutoRunType: Integer; pAddDel: string;
  pAutoRunName, pAutoRunFileName: string): Boolean;
var
  tmpReg: TRegistry;
begin
  // pAutoRunType:�Զ��������� 1:Run 2:RunOnce;   pAddDel:'Add'/'Del'
  result := False;
  if pAutoRunType = 1 then
  begin
  end;
  if pAutoRunType = 2 then
  begin
    if UpperCase(trim(pAddDel)) = 'ADD' then
    begin
      tmpReg := TRegistry.Create; //����һ���¼�
      tmpReg.rootkey := HKEY_LOCAL_MACHINE; //����������ΪHKEY_LOCAL_MACHINE
      tmpReg.OpenKey('SOFTWARE\Microsoft\windows\CurrentVersion\RunOnce', True); //��һ����
      tmpReg.WriteString(pAutoRunName, pAutoRunFileName); //��Reg�������д���������ƺ�������ֵ
      tmpReg.CloseKey; //�رռ�
      result := True;
    end
    else if UpperCase(trim(pAddDel)) = 'DEL' then
    begin
      tmpReg := TRegistry.Create; //����һ���¼�
      tmpReg.rootkey := HKEY_LOCAL_MACHINE; //����������ΪHKEY_LOCAL_MACHINE
      tmpReg.OpenKey('SOFTWARE\Microsoft\windows\CurrentVersion\RunOnce', True); //��һ����
      tmpReg.DeleteValue(pAutoRunName); //��Reg�������ɾ��
      tmpReg.CloseKey; //�رռ�
      result := True;
    end;
  end;
end;

procedure OpenURL(URL: string);
begin
  ShellExecute(0, nil, PAnsiChar(URL), nil, nil, SW_NORMAL);
end;

function WinExecExW(cmd, workdir: pchar; visiable: Integer): Dword;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := visiable;
  if not CreateProcess(nil, cmd, nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, workdir, StartupInfo, ProcessInfo)
    //Create_new_console or Normal_priority_class,nil,nil,StartupInfo,ProcessInfo)
  then
  begin
    result := 0
  end
  else
  begin
    waitforsingleobject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, result);
  end;
end;

function GetLocalIP: string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  i: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(Buffer);
  if phe = nil then
    Exit;
  pptr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do
  begin
    result := StrPas(inet_ntoa(pptr^[i]^));
    inc(i);
  end;
  WSACleanup;
end;

function GetLocateIP(InternetIp: Boolean = False): string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  i: Integer;
  GInitData: TWSADATA;
  IP: string;
begin
  Screen.Cursor := crHourGlass;
  try
    WSAStartup($101, GInitData);
    IP := '0.0.0.0';
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(Buffer);
    if phe = nil then
    begin
      showmessage(IP);
      result := IP;
      Exit;
    end;
    pptr := PaPInAddr(phe^.h_addr_list);
    if InternetIp then
    begin
      i := 0;
      while pptr^[i] <> nil do
      begin
        IP := inet_ntoa(pptr^[i]^);
        inc(i);
      end;
    end
    else
      IP := StrPas(inet_ntoa(pptr^[0]^));
    WSACleanup;
    result := IP; //���������Ϊ����ip����������ip
  finally
    Screen.Cursor := crDefault;
  end;
end;

function ShortCutToString(const HotKey: word): string;
var
  shift: tshiftstate;
begin
  shift := [];
  if ((wordrec(HotKey).hi shr 0) and 1) <> 0 then
    include(shift, ssshift);
  if ((wordrec(HotKey).hi shr 1) and 1) <> 0 then
    include(shift, ssctrl);
  if ((wordrec(HotKey).hi shr 2) and 1) <> 0 then
    include(shift, ssalt);
  result := shortcuttotext(shortcut(wordrec(HotKey).lo, shift));
end;

function IsFileInUse(fName: string): Boolean;
var
  HFileRes: HFILE;
begin
  result := False;
  if not FileExists(fName) then
    Exit;
  HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  result := (HFileRes = INVALID_HANDLE_VALUE);
  if not result then
    CloseHandle(HFileRes);
end;

function SelectDirectory(handle: THandle; const Caption: string; const Root: WideString; out Directory: string): Boolean;
var
  lpbi: _browseinfo;
  buf: array[0..MAX_PATH] of char;
  id: ishellfolder;
  eaten, att: Cardinal;
  rt: PItemIdList;
  initdir: PWideChar;
begin
  result := False;
  lpbi.hwndOwner := handle;
  lpbi.lpfn := nil;
  lpbi.lpszTitle := pchar(Caption);
  lpbi.ulFlags := BIF_ReturnOnlyFsDirs + 64;
  SHGetDesktopFolder(id);
  initdir := pwchar(Root);
  id.ParseDisplayName(0, nil, initdir, eaten, rt, att);
  lpbi.pidlRoot := rt;
  GetMem(lpbi.pszDisplayName, MAX_PATH);
  try
    result := SHGetPathFromIdList(SHBrowseForFolder(lpbi), buf);
  except
    FreeMem(lpbi.pszDisplayName);
  end;
  if result then
    Directory := buf;
end;

function GetFileSize(const filename: string): Longint;
var
  SearchRec: TSearchRec;
begin
  try
    if FindFirst(ExpandFileName(filename), faAnyFile, SearchRec) = 0 then
    begin
      result := SearchRec.Size
        //SearchRec.FindData.ftCreationTime//����ʱ��
    //SearchRec.FindData.ftLastAccessTime//����ʱ��
    //SearchRec.FindData.ftLastWriteTime//�޸�ʱ��
    end
    else
    begin
      result := -1;
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

function GetFileDate(AFileName: string): TDateTime; //;uFlag:byte
var
  ffd: TWin32FindData;
  dft: Dword;
  lft: TFileTime;
  h: THandle;
begin
  h := FindFirstFile(pchar(AFileName), ffd);
  if h <> INVALID_HANDLE_VALUE then
  begin
    FileTimeToLocalFileTime(ffd.ftLastWriteTime, lft);
    //  case uFlag of
    //  FILE_CREATE_TIME:FileTimeToLocalFileTime(ffd.ftCreationTime,lft);
    //    FILE_MODIFY_TIME:FileTimeToLocalFileTime(ffd.ftLastWriteTime,lft);
    //  FILE_ACCESS_TIME:FileTimeToLocalFileTime(ffd.ftLastAccessTime,lft);
    //  else
    //    FileTimeToLocalFileTime(ffd.ftLastAccessTime,lft);
    //  end;
    FileTimeToDosDateTime(lft, LongRec(dft).hi, LongRec(dft).lo);
    result := FileDateToDateTime(dft);
    Windows.FindClose(h);
  end
  else
    result := 0;
end;

procedure DragControl(aControl: TWinControl);
const
  sc_dragmove = $F012;
begin
  releasecapture;
  aControl.Perform(wm_syscommand, sc_dragmove, 0);
end;

procedure DeleteMe;
var
  BatchFile: TextFile;
  BatchFileName: string;
  ProcessInfo: TProcessInformation;
  StartupInfo: TStartupInfo;
begin
  BatchFileName := changefileext(paramstr(0), '.bat');
  AssignFile(BatchFile, BatchFileName);
  Rewrite(BatchFile);
  Writeln(BatchFile, ':try');
  Writeln(BatchFile, 'del "' + paramstr(0) + '"');
  Writeln(BatchFile, 'if exist "' + paramstr(0) + '"' + ' goto try');
  Writeln(BatchFile, 'del %0');
  CloseFile(BatchFile);
  FillChar(StartupInfo, SizeOf(StartupInfo), $00);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;
  if CreateProcess(nil, pchar(BatchFileName), nil, nil, False, IDLE_PRIORITY_CLASS,
    nil, nil, StartupInfo, ProcessInfo) then
  begin
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ProcessInfo.hProcess);
  end;
end;

procedure RebootComputer;
begin
  ExitWindowsEx(EWX_REBOOT, 2); //������API����
end;

function EAN13(t_str: string): string;
var
  S: array[2..13] of Integer;
  answer: string;
begin
  t_str := trim(t_str);
  result := '';
  //�ո�����
  if Length(t_str) < 12 then
    Exit;
  S[13] := strtointdef(t_str[1], -1);
  S[12] := strtointdef(t_str[2], -1);
  S[11] := strtointdef(t_str[3], -1);
  S[10] := strtointdef(t_str[4], -1);
  S[9] := strtointdef(t_str[5], -1);
  S[8] := strtointdef(t_str[6], -1);
  S[7] := strtointdef(t_str[7], -1);
  S[6] := strtointdef(t_str[8], -1);
  S[5] := strtointdef(t_str[9], -1);
  S[4] := strtointdef(t_str[10], -1);
  S[3] := strtointdef(t_str[11], -1);
  S[2] := strtointdef(t_str[12], -1);
  if S[13] < 0 then
    Exit;
  if S[12] < 0 then
    Exit;
  if S[11] < 0 then
    Exit;
  if S[10] < 0 then
    Exit;
  if S[9] < 0 then
    Exit;
  if S[8] < 0 then
    Exit;
  if S[7] < 0 then
    Exit;
  if S[6] < 0 then
    Exit;
  if S[5] < 0 then
    Exit;
  if S[4] < 0 then
    Exit;
  if S[3] < 0 then
    Exit;
  if S[2] < 0 then
    Exit;
  answer := inttostr((S[2] + S[4] + S[6] + S[8] + S[10] + S[12]) * 3 +
    S[3] + S[5] + S[7] + S[9] + S[11] + S[13]);
  answer := inttostr(10 - (StrToInt(answer) mod 10)); //����У����
  result := t_str + Copy(answer, 1, 1);
end;

procedure CreateDirectory(APath: string);
begin
  if not ForceDirectories(APath) then
  begin
    //ShowMsg('UMS10000200');  //�����ļ���ʧ��
    Abort;
  end;
end;

function DeleteDirectory(const ASource: string): Boolean;
var
  fo: TSHFILEOPSTRUCT;
begin
  FillChar(fo, SizeOf(fo), 0);
  with fo do
  begin
    Wnd := 0;
    wFunc := FO_DELETE;
    pFrom := pchar(ASource + #0);
    pTo := #0#0;
    fFlags := FOF_NOCONFIRMATION + FOF_SILENT;
  end;
  result := (SHFileOperation(fo) = 0);
end;

function CopyDirectory(const Source, Dest: string): Boolean;
var
  fo: TSHFILEOPSTRUCT;
begin
  FillChar(fo, SizeOf(fo), 0);
  with fo do
  begin
    Wnd := 1;
    wFunc := FO_COPY;
    pFrom := pchar(Source + #0);
    pTo := pchar(Dest + #0);
    fFlags := FOF_NOCONFIRMATION + FOF_NOCONFIRMMKDIR;
  end;
  result := (SHFileOperation(fo) = 0);
end;

function CopyFiles(const Source, Dest: string): Boolean;
var
  fo: TSHFILEOPSTRUCT;
begin
  FillChar(fo, SizeOf(fo), 0);
  with fo do
  begin
    Wnd := 0;
    wFunc := FO_COPY;
    pFrom := @Source[1];
    pTo := pchar(Dest);
    fFlags := FOF_NOCONFIRMATION + FOF_NOCONFIRMMKDIR;
  end;
  result := (SHFileOperation(fo) = 0);
end;

procedure GetCopyFiles(Source, Dest: string; var ASource, ADest: TStringList);
var
  ARec: TSearchRec;
begin
  if Source[Length(Source)] <> '\' then
    Source := Source + '\';
  if Dest[Length(Dest)] <> '\' then
    Dest := Dest + '\';
  if FindFirst(Source + '*.*', faAnyFile, ARec) = 0 then
  begin
    repeat
      if ARec.Attr and faDirectory = faDirectory then
      begin
        if not DirectoryExists(Source + ARec.Name) then
          Exit;
        if (ARec.Name <> '.') and (ARec.Name <> '..') then
          GetCopyFiles(Source + ARec.Name, Dest + ARec.Name, ASource, ADest);
      end
      else
      begin
        if (ARec.Name <> '.') and (ARec.Name <> '..') then
        begin
          ForceDirectories(Dest);
          ASource.Add(Source + ARec.Name);
          ADest.Add(Dest + ARec.Name);
        end;
      end;
    until FindNext(ARec) <> 0;
    FindClose(ARec);
  end;
end;

procedure DeleteMe_(ABatchFile: string);
var
  ProcessInfo: TProcessInformation;
  StartupInfo: TStartupInfo;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), $00);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  if CreateProcess(nil, pchar(ABatchFile), nil, nil,
    False, IDLE_PRIORITY_CLASS, nil, nil, StartupInfo,
    ProcessInfo) then
  begin
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ProcessInfo.hProcess);
  end;
end;

procedure EmptyKeyBoardQueue;
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, 0, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do
    ;
end;

function GetIdeSerialNumber: pchar;
const
  IDENTIFY_BUFFER_SIZE = 512;
type
  TIDERegs = packed record
    bFeaturesReg: byte; // Used for specifying SMART "commands".
    bSectorCountReg: byte; // IDE sector count register
    bSectorNumberReg: byte; // IDE sector number register
    bCylLowReg: byte; // IDE low order cylinder value
    bCylHighReg: byte; // IDE high order cylinder value
    bDriveHeadReg: byte; // IDE drive/head register
    bCommandReg: byte; // Actual IDE command.
    bReserved: byte; // reserved for future use. Must be zero.
  end;
  TSendCmdInParams = packed record
    // Buffer size in bytes
    cBufferSize: Dword;
    // Structure with drive register values.
    irDriveRegs: TIDERegs;
    // Physical drive number to send command to (0,1,2,3).
    bDriveNumber: byte;
    bReserved: array[0..2] of byte;
    dwReserved: array[0..3] of Dword;
    bBuffer: array[0..0] of byte; // Input buffer.
  end;
  TIdSector = packed record
    wGenConfig: word;
    wNumCyls: word;
    wReserved: word;
    wNumHeads: word;
    wBytesPerTrack: word;
    wBytesPerSector: word;
    wSectorsPerTrack: word;
    wVendorUnique: array[0..2] of word;
    sSerialNumber: array[0..19] of char;
    wBufferType: word;
    wBufferSize: word;
    wECCSize: word;
    sFirmwareRev: array[0..7] of char;
    sModelNumber: array[0..39] of char;
    wMoreVendorUnique: word;
    wDoubleWordIO: word;
    wCapabilities: word;
    wReserved1: word;
    wPIOTiming: word;
    wDMATiming: word;
    wBS: word;
    wNumCurrentCyls: word;
    wNumCurrentHeads: word;
    wNumCurrentSectorsPerTrack: word;
    ulCurrentSectorCapacity: Dword;
    wMultSectorStuff: word;
    ulTotalAddressableSectors: Dword;
    wSingleWordDMA: word;
    wMultiWordDMA: word;
    bReserved: array[0..127] of byte;
  end;
  PIdSector = ^TIdSector;
  TDriverStatus = packed record
    // ���������صĴ�����룬�޴��򷵻�0
    bDriverError: byte;
    // IDE����Ĵ��������ݣ�ֻ�е�bDriverError Ϊ SMART_IDE_ERROR ʱ��Ч
    bIDEStatus: byte;
    bReserved: array[0..1] of byte;
    dwReserved: array[0..1] of Dword;
  end;
  TSendCmdOutParams = packed record
    // bBuffer�Ĵ�С
    cBufferSize: Dword;
    // ������״̬
    DriverStatus: TDriverStatus;
    // ���ڱ�������������������ݵĻ�������ʵ�ʳ�����cBufferSize����
    bBuffer: array[0..0] of byte;
  end;
  procedure ChangeByteOrder(var Data; Size: Integer);
  var
    ptr: pchar;
    i: Integer;
    c: char;
  begin
    ptr := @Data;
    for i := 0 to (Size shr 1) - 1 do
    begin
      c := ptr^;
      ptr^ := (ptr + 1)^;
      (ptr + 1)^ := c;
      inc(ptr, 2);
    end;
  end;
var
  hDevice: THandle;
  cbBytesReturned: Dword;
  SCIP: TSendCmdInParams;
  aIdOutCmd: array[0..(SizeOf(TSendCmdOutParams) + IDENTIFY_BUFFER_SIZE - 1) - 1] of byte;
  IdOutCmd: TSendCmdOutParams absolute aIdOutCmd;
begin
  result := ''; // ��������򷵻ؿմ�
  if SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT then
  begin // Windows NT, Windows 2000
    // ��ʾ! �ı����ƿ���������������������ڶ����������� '\\.\PhysicalDrive1\'
    hDevice := CreateFile('\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE,
      FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
  end
  else
  begin // Version Windows 95 OSR2, Windows 98
    hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);
  end;
  if hDevice = INVALID_HANDLE_VALUE then
    Exit;
  try
    FillChar(SCIP, SizeOf(TSendCmdInParams) - 1, #0);
    FillChar(aIdOutCmd, SizeOf(aIdOutCmd), #0);
    cbBytesReturned := 0;
    // Set up data structures for IDENTIFY command.
    with SCIP do
    begin
      cBufferSize := IDENTIFY_BUFFER_SIZE;
      // bDriveNumber := 0;
      with irDriveRegs do
      begin
        bSectorCountReg := 1;
        bSectorNumberReg := 1;
        // if Win32Platform=VER_PLATFORM_WIN32_NT then bDriveHeadReg := $A0
        // else bDriveHeadReg := $A0 or ((bDriveNum and 1) shl 4);
        bDriveHeadReg := $A0;
        bCommandReg := $EC;
      end; //with
    end; //with
    if not DeviceIoControl(hDevice, $0007C088, @SCIP, SizeOf(TSendCmdInParams) - 1,
      @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil)
      then
      Exit;
  finally
    CloseHandle(hDevice);
  end;
  with PIdSector(@IdOutCmd.bBuffer)^ do
  begin
    ChangeByteOrder(sSerialNumber, SizeOf(sSerialNumber));
    (pchar(@sSerialNumber) + SizeOf(sSerialNumber))^ := #0;
    result := pchar(@sSerialNumber);
  end; //with
end;

function RegisterDll(filename: string): Boolean;
var
  aHandle: THandle;
  RegFunc: TDllRegisterServer;
begin
  //��ע��Midas.dll��FileName�Ǻ�ȫ·���� Midas.dll �ļ���
  aHandle := LoadLibrary(pchar(filename));
  RegFunc := GetProcAddress(aHandle, 'DllRegisterServer');
  if @RegFunc <> nil then
    result := RegFunc = s_OK
  else
    result := False;
  FreeLibrary(aHandle);
end;

procedure SleepEx(pMilliSeconds: Cardinal);
var
  t: Cardinal;
  Msg: TMsg;
begin
  t := GetTickCount() + pMilliSeconds;
  while (GetTickCount() < t) do
  begin
    Application.ProcessMessages;
    //if PeekMessage(msg, 0, 0, 0, PM_REMOVE) then begin
    //  TranslateMessage(msg);
    //  DispatchMessage(msg);
    //end;
  end;
end;

function GetCPUUsage(var pCPUUsage: Double; pSleepMiSec: Cardinal = 1000): Boolean;
const
  SystemBasicInformation = 0;
  SystemPerformanceInformation = 2;
  SystemTimeInformation = 3;
type
  TPDWord = ^Dword;
  TSystem_Basic_Information = packed record
    dwUnknown1: Dword;
    uKeMaximumIncrement: ULONG;
    uPageSize: ULONG;
    uMmNumberOfPhysicalPages: ULONG;
    uMmLowestPhysicalPage: ULONG;
    uMmHighestPhysicalPage: ULONG;
    uAllocationGranularity: ULONG;
    pLowestUserAddress: Pointer;
    pMmHighestUserAddress: Pointer;
    uKeActiveProcessors: ULONG;
    bKeNumberProcessors: byte;
    bUnknown2: byte;
    wUnknown3: word;
  end;
  TSystem_Performance_Information = packed record
    liIdleTime: LARGE_INTEGER; //LARGE_INTEGER
    dwSpare: array[0..75] of Dword;
  end;
  TSystem_Time_Information = packed record
    liKeBootTime: LARGE_INTEGER;
    liKeSystemTime: LARGE_INTEGER;
    liExpTimeZoneBias: LARGE_INTEGER;
    uCurrentTimeZoneId: ULONG;
    dwReserved: Dword;
  end;
  function Li2Double(x: LARGE_INTEGER): Double;
  begin
    result := x.HighPart * 4.294967296E9 + x.LowPart
  end;
var
  NtQuerySystemInformation: function(infoClass: Dword;
    Buffer: Pointer; bufSize: Dword; returnSize: TPDWord): Dword; stdcall;
  liOldIdleTime: LARGE_INTEGER;
  liOldSystemTime: LARGE_INTEGER;
  //
  SysBaseInfo: TSystem_Basic_Information;
  SysPerfInfo: TSystem_Performance_Information;
  SysTimeInfo: TSystem_Time_Information;
  status: Longint; //long
  dbSystemTime: Double;
  dbIdleTime: Double;
  bLoopAborted: Boolean;
begin
  result := False;
  //
  NtQuerySystemInformation := GetProcAddress(GetModuleHandle('ntdll.dll'), 'NtQuerySystemInformation');
  //
  status := NtQuerySystemInformation(SystemBasicInformation, @SysBaseInfo, SizeOf(SysBaseInfo), nil);
  if status <> 0 then
    Exit;
  status := NtQuerySystemInformation(SystemPerformanceInformation, @SysPerfInfo, SizeOf(SysPerfInfo), nil);
  if status <> 0 then
    Exit;
  status := NtQuerySystemInformation(SystemTimeInformation, @SysTimeInfo, SizeOf(SysTimeInfo), 0);
  if status <> 0 then
    Exit;
  liOldIdleTime := SysPerfInfo.liIdleTime;
  liOldSystemTime := SysTimeInfo.liKeSystemTime;
  sleep(pSleepMiSec);
  status := NtQuerySystemInformation(SystemPerformanceInformation, @SysPerfInfo, SizeOf(SysPerfInfo), nil);
  if status <> 0 then
    Exit;
  status := NtQuerySystemInformation(SystemTimeInformation, @SysTimeInfo, SizeOf(SysTimeInfo), 0);
  if status <> 0 then
    Exit;
  //
  //CurrentValue = NewValue - OldValue
  dbIdleTime := Li2Double(SysPerfInfo.liIdleTime) - Li2Double(liOldIdleTime);
  dbSystemTime := Li2Double(SysTimeInfo.liKeSystemTime) - Li2Double(liOldSystemTime);
  //CurrentCpuIdle = IdleTime / SystemTime
  if dbSystemTime = 0 then
    dbIdleTime := 0
  else
    dbIdleTime := dbIdleTime / dbSystemTime;
  //CurrentCpuUsage% = 100 - (CurrentCpuIdle * 100) / NumberOfProcessors
  if SysBaseInfo.bKeNumberProcessors = 0 then
    dbIdleTime := 0
  else
    dbIdleTime := 100.0 - dbIdleTime * 100.0 / SysBaseInfo.bKeNumberProcessors + 0.5;
  //
  //Show Percentage
  pCPUUsage := dbIdleTime;
  //Form1.Label1.Caption := FormatFloat( 'CPU Usage: 0.0 % ',dbIdleTime);
  result := True;
  {
    NtQuerySystemInformation := GetProcAddress(GetModuleHandle('ntdll.dll'), 'NtQuerySystemInformation');
    status := NtQuerySystemInformation(SystemBasicInformation, @SysBaseInfo, SizeOf(SysBaseInfo), nil);
    if status <> 0 then exit;
    with SysBaseInfo do begin //��ʾ��Ϣ
      ShowMessage( Format(
        'uKeMaximumIncrement: %d '+#13
        +'uPageSize: %d '#13
        +'uMmNumberOfPhysicalPages: %d '+#13
        +'uMmLowestPhysicalPage: %d '+#13
        +'uMmHighestPhysicalPage: %d '+#13
        +'uAllocationGranularity: %d '#13
        +'uKeActiveProcessors: %d '+#13
        +'bKeNumberProcessors: %d ',
        [uKeMaximumIncrement, uPageSize, uMmNumberOfPhysicalPages,
        uMmLowestPhysicalPage, uMmHighestPhysicalPage, uAllocationGranularity,
        uKeActiveProcessors, bKeNumberProcessors]) );
    end;
    bLoopAborted := False;
    while not bLoopAborted do begin
      //Get new system time
      status := NtQuerySystemInformation(SystemTimeInformation, @SysTimeInfo, SizeOf(SysTimeInfo), 0);
      if status<>0 then exit;
      //Get new CPU 's idle time
      status := NtQuerySystemInformation(SystemPerformanceInformation, @SysPerfInfo, SizeOf(SysPerfInfo), nil);
      if status<>0 then exit;
      //if it's a first call - skip it
      if (liOldIdleTime.QuadPart <> 0) then  begin
        // CurrentValue = NewValue - OldValue
        dbIdleTime := Li2Double(SysPerfInfo.liIdleTime) - Li2Double(liOldIdleTime);
        dbSystemTime := Li2Double(SysTimeInfo.liKeSystemTime) - Li2Double(liOldSystemTime);
        // CurrentCpuIdle = IdleTime / SystemTime
        dbIdleTime := dbIdleTime / dbSystemTime;
        // CurrentCpuUsage% = 100 - (CurrentCpuIdle * 100) / NumberOfProcessors
        dbIdleTime := 100.0 - dbIdleTime * 100.0 / SysBaseInfo.bKeNumberProcessors + 0.5;
        // Show Percentage
        Form1.Label1.Caption := FormatFloat( 'CPU Usage: 0.0 % ',dbIdleTime);
        Application.ProcessMessages;
        // Abort if user pressed ESC or Application is terminated
        bLoopAborted := (GetKeyState(VK_ESCAPE) and 128 = 128) or Application.Terminated;
      end;
      //Store new   CPU 's   idle   and   system   time
      liOldIdleTime   :=   SysPerfInfo.liIdleTime;
      liOldSystemTime   :=   SysTimeInfo.liKeSystemTime;
      // wait one second
      Sleep(1000);
    end; //while
  }
end;

function DelphiRunning: Boolean;
var
  H1, H2, H3, H4: Hwnd;
const
{$IFNDEF BCB}
{$IFDEF VER90}
  A0: array[0..10] of char = 'Delphi 2.0'#0;
{$ENDIF}
{$IFDEF VER100}
  A0: array[0..8] of char = 'Delphi 3'#0;
{$ENDIF}
{$IFDEF VER120}
  A0: array[0..8] of char = 'Delphi 4'#0;
{$ENDIF}
{$IFDEF VER130}
  A0: array[0..8] of char = 'Delphi 5'#0;
{$ENDIF}
{$IFDEF VER140}
  A0: array[0..8] of char = 'Delphi 6'#0;
{$ENDIF}
{$IFDEF VER150}
  A0: array[0..8] of char = 'Delphi 7'#0;
{$ENDIF}
{$IFDEF VER180}
  A0: array[0..8] of char = 'BDS 2006'#0;
{$ENDIF}
{$ELSE}
{$IFDEF VER140}
  A0: array[0..12] of char = 'C++Builder 6'#0;
{$ENDIF}

{$IFDEF VER130}
  A0: array[0..12] of char = 'C++Builder 5'#0;
{$ENDIF}

{$IFDEF VER125}
  A0: array[0..12] of char = 'C++Builder 3'#0;
{$ENDIF}
{$ENDIF}
  a1: array[0..12] of char = 'TApplication'#0;
  A2: array[0..15] of char = 'TAlignPalette'#0;
  A3: array[0..18] of char = 'TPropertyInspector'#0;
  A4: array[0..11] of char = 'TAppBuilder'#0;
begin
  H1 := findwindow(a1, A0);
  H2 := findwindow(A2, nil);
  H3 := findwindow(A3, nil);
  H4 := findwindow(A4, nil);
  result := (H1 <> 0) and (H2 <> 0) and (H3 <> 0) and (H4 <> 0);
end;

function DelphiRunningByExeName(AFileName: TFileName): Boolean;
begin
  with TRegIniFile.Create('') do
  try
    rootkey := HKEY_LOCAL_MACHINE;
    result := (CompareText(AFileName, ReadString('Software\Borland\Delphi\2.0', 'Delphi 2.0', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\Delphi\3.0', 'Delphi 3', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\Delphi\4.0', 'Delphi 4', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\Delphi\5.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\Delphi\6.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\Delphi\7.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\C++Builder\1.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\C++Builder\3.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\C++Builder\4.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\C++Builder\5.0', 'App', '')) = 0) or
      (CompareText(AFileName, ReadString('Software\Borland\C++Builder\6.0', 'App', '')) = 0);
  finally
    Free;
  end;
end;

function GetMenuDefaultFont(const AFont: TFont): Integer;
var
  Metrics: TNonClientMetrics;
begin
  Metrics.cbSize := SizeOf(Metrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @Metrics, 0) then
    AFont.handle := CreateFontIndirect(Metrics.lfMenuFont)
  else
    AFont.handle := GetStockObject(SYSTEM_FONT);
  result := AFont.Height;
end;

function DelReElemOfList(pProcessList: THashedStringList; pRefList: THashedStringList): Boolean;
var
  i: Integer;
begin
  result := False;
  if not pRefList.Sorted then
    Exit;
  i := 0;
  while i < pProcessList.Count do
  begin
    if pRefList.IndexOf(pProcessList[i]) <> -1 then
    begin
      pProcessList.Delete(i);
    end
    else
    begin
      i := i + 1;
    end;
    Application.ProcessMessages;
  end;
  result := True;
end;

function LastInput: Dword;
var
  LInput: TLastInputInfo;
begin
  LInput.cbSize := SizeOf(TLastInputInfo);
  GetLastInputInfo(LInput);
  result := GetTickCount - LInput.dwtime;
end;

function SystemServiceStart(const pSystemServiceName: string): Boolean;
var
  tmpService: SC_HANDLE;
  tmpSCManager: SC_HANDLE;
  ssStatus: TServiceStatus;
  Argv: pchar;
begin
  result := False;
  tmpSCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  tmpService := OpenService(tmpSCManager, pchar(pSystemServiceName), SERVICE_ALL_ACCESS);
  //��������
  if (QueryServiceStatus(tmpService, ssStatus))
    and (ssStatus.dwCurrentState = SERVICE_RUNNING)
    then
  begin
    result := True;
  end
  else if StartService(tmpService, 0, Argv) then
  begin
    //caption:='Start Service Now ';
    sleep(1000);
    while (QueryServiceStatus(tmpService, ssStatus)) do
    begin
      Application.ProcessMessages;
      if ssStatus.dwCurrentState = SERVICE_START_PENDING then
      begin
        //caption:=caption+('.');
        sleep(1000);
      end
      else
        break;
    end;
    if ssStatus.dwCurrentState = SERVICE_RUNNING then
    begin
      //caption:='Service Start Ok'
      result := True;
    end
    else
    begin
      //caption:='Service Start Fail';
    end;
  end
  else
  begin
    //caption:='Service Start Fail';
  end;
  CloseServiceHandle(tmpService);
  CloseServiceHandle(tmpSCManager);
end;

function SystemServiceStop(const pSystemServiceName: string): Boolean;
var
  tmpService: SC_HANDLE;
  tmpSCManager: SC_HANDLE;
  ssStatus: TServiceStatus;
  Argv: pchar;
begin
  result := False;
  tmpSCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  tmpService := OpenService(tmpSCManager, pchar(pSystemServiceName), SERVICE_ALL_ACCESS);
  //ֹͣ����
  if ControlService(tmpService, SERVICE_CONTROL_STOP, ssStatus) then
  begin
    //caption:='Stopping Service Now ';
    sleep(1000);
    while (QueryServiceStatus(tmpService, ssStatus)) do
    begin
      Application.ProcessMessages;
      if ssStatus.dwCurrentState = SERVICE_STOP_PENDING then
      begin
        //caption:=caption+('.');
        sleep(1000);
      end
      else
        break;
    end;
    if ssStatus.dwCurrentState = SERVICE_STOPPED then
    begin
      //caption:='Service Stop Ok'
      result := True;
    end
    else
    begin
      //caption:='Service Stop Fail';
    end;
  end
  else
  begin
    //caption:='Service Stop Fail';
  end;
  CloseServiceHandle(tmpService);
  CloseServiceHandle(tmpSCManager);
end;

function GetWinSysPath: string;
var
  WinSysDir: array[0..MAX_PATH] of char;
begin
  GetSystemDirectory(WinSysDir, MAX_PATH);
  result := Slash(trim(StrPas(WinSysDir)));
end;

function GetWinPath: string;
var
  WinDir: array[0..MAX_PATH] of char;
begin
  GetWindowsDirectory(WinDir, MAX_PATH);
  result := Slash(trim(StrPas(WinDir)));
end;

function GetCurrentPath: string;
var
  CurrDir: array[0..MAX_PATH] of char;
begin
  GetCurrentDirectory(MAX_PATH, CurrDir);
  result := Slash(trim(StrPas(CurrDir)));
end;

function GetDesktopPath: string;
var
  PIDL: PItemIdList;
  DesktopDir: array[0..MAX_PATH] of char;
begin
  SHGetSpecialFolderLocation(0, CSIDL_COMMON_DESKTOPDIRECTORY, PIDL); //��ù��������Itemidlist
  SHGetPathFromIdList(PIDL, DesktopDir); //�������·��
  result := Slash(trim(DesktopDir));
end;

function GetProgPath: string;
var
  PIDL: PItemIdList;
  ProgDir: array[0..MAX_PATH] of char;
begin
  SHGetSpecialFolderLocation(0, CSIDL_COMMON_PROGRAMS, PIDL); //��������Itemidlist
  SHGetPathFromIdList(PIDL, ProgDir); //��ó���·��
  result := Slash(trim(ProgDir));
end;

function WinCopyFile(pForm, pTo: string; pFlags: FILEOP_FLAGS): Boolean;
var
  r: Integer;
  fData: TSHFILEOPSTRUCT;
begin
  fData.pFrom := pchar(pForm + #0#0); //��Ҫע��:����#0#0��ż������
  fData.pTo := pchar(pTo + #0#0);
  fData.wFunc := FO_COPY;
  fData.Wnd := Application.handle;
  fData.lpszProgressTitle := nil; //'���ڸ���'
  fData.fFlags := pFlags;
  r := SHFileOperation(fData);
  result := (r = 0);
end;

function IsWin95: Boolean;
begin
  result := Win32Platform = VER_PLATFORM_WIN32_WINDOWS;
end;

function IsWinNT: Boolean;
begin
  result := Win32Platform = VER_PLATFORM_WIN32_NT;
end;

function GetLocalComputerName: string;
var
  aLength: Dword;
  aLocalComputerName: array[0..MAX_PATH - 1] of char;
begin
  aLength := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(aLocalComputerName, aLength);
  result := aLocalComputerName;
end;

function GetLocalUserName: string;
var
  aLength: Dword;
  aUserName: array[0..MAX_PATH - 1] of char;
begin
  aLength := MAX_PATH;
  GetUserName(aUserName, aLength);
  result := aUserName;
end;

function DeleteToRecycleBin(WindowHandle: THandle; filename: string): Boolean;
var
  FromName: pchar;
  SH: TSHFILEOPSTRUCT;
begin
  FromName := pchar(filename);
  FillChar(SH, SizeOf(SH), 0);
  with SH do
  begin
    Wnd := WindowHandle;
    wFunc := FO_DELETE;
    pFrom := FromName;
    StrCat(pFrom, #0);
    fFlags := FOF_SILENT or FOF_ALLOWUNDO;
  end;
  result := SHFileOperation(SH) = 0;
end;

function CreateTempFileName(aPrefix: string): string;
var
  buf: array[0..MAX_PATH] of char;
  temp: array[0..MAX_PATH] of char;
begin
  GetTempPath(MAX_PATH, buf);
  GetTempFilename(buf, pchar(aPrefix), 0, temp);
  result := string(temp);
end;

function ExDeleteFile(const filename: string): Boolean; //ֻ�����ļ����Ե��ļ�Ҳ����ɾ��
begin
  result := False;
  if not FileExists(filename) then
    Exit;
  FileSetAttr(filename, (not SysUtils.faReadOnly) and (not SysUtils.faHidden) and (not SysUtils.faSysFile));
  result := DeleteFile(filename);
end;

function GetPopupMenuHeight(APopupMenu: TPopupMenu): Integer;
var
  i: Integer;
  GenCount, HCount: Integer;
begin
  GenCount := 0; HCount := 0;
  for i := 0 to APopupMenu.Items.Count - 1 do
  begin
    if APopupMenu.Items.Items[i].Caption = '-' then
      HCount := HCount + 1
    else
      GenCount := GenCount + 1;
  end;
  //Result:=GenCount * GetSystemMetrics(SM_CYMENU) + HCount * GetSystemMetrics(SM_CYSMCAPTION);
  result := GenCount * GetSystemMetrics(SM_CYMENU) + HCount * Trunc(GetSystemMetrics(SM_CYMENU) / 2);
end;

procedure SetScreenSaverState(const B: Boolean);
begin
  SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, Dword(B), nil, 0);
end;

procedure RunScreenSaver;
begin
  SendMessage(HWND_BROADCAST, wm_syscommand, SC_SCREENSAVE, 0);
end;

function SynLocalDatetime(ServerName: string): Boolean;
begin
  result := False;
  try
    WinExec(pchar('net time \\' + trim(ServerName) + ' /set /yes'), SW_HIDE);
  except
    Exit;
  end;
  result := True;
end;

function RoundToEx(pX: Double; pScale: TRoundToRange;
  pRoundToExType: TRoundToExType = 1): Double;
var
  k: Double; //��Ҫע�⣺Extended;Ϊ�Ǿ�ȷ���ͣ�������ֵ��仯
  r: Double;
begin
  r := pX;
  case pRoundToExType of
    1:
      begin
        k := IntPower(10, -1 * pScale);
        if Trunc(Frac(r * k) * 10) >= 5 then
          r := (Trunc(r * k) + 1) / k
        else
          r := Trunc(r * k) / k;
      end;
    2:
      begin
        r := RoundTo(r, pScale);
      end;
    3:
      begin
        k := IntPower(10, -1 * pScale);
        r := Trunc(r * k) / k;
      end;
    4:
      begin
        k := IntPower(10, -1 * pScale);
        if Frac(r * k) > 0 then
          r := (Trunc(r * k) + 1) / k
        else
          r := Trunc(r * k) / k;
      end;
  end;
  result := r;
end;

function Aed(a, B: Integer): Integer;
var
  tmp: Integer;
begin
  while a mod B <> 0 do
  begin
    tmp := B;
    B := a mod tmp;
    a := tmp;
  end;
  result := B;
end;

{example:
search:='delphi3000';
case CaseString(search, ['delphi3000', 'delphipages', 'Torry''s']) of
 0: s:='Excellent!';
  1: s:='Good source';
  2: s:='Not bad!';
end;}
function CaseString(const S: string;
  const x: array of string; ci: Boolean; p: Boolean): Integer;
var
  i: Integer;
  S1, s2: string;
begin
  result := -1;
  for i := Low(x) to High(x) do
  begin
    S1 := S; s2 := x[i];
    if ci then
    begin
      AnsiUpperCase(S1);
      AnsiUpperCase(s2);
    end;
    if p then
    begin
      if pos(S1, s2) > 0 then
      begin
        result := i; Exit; end;
    end
    else
    begin
      if S1 = s2 then
      begin
        result := i; Exit; end;
    end;
  end;
end;

function iif(const BOOL: Boolean; TrueValue, FalseValue: Integer): Integer; overload;
begin
  if BOOL then
    result := TrueValue
  else
    result := FalseValue;
end;

function iif(const BOOL: Boolean; TrueValue, FalseValue: string): string; overload;
begin
  if BOOL then
    result := TrueValue
  else
    result := FalseValue;
end;

function iif(const BOOL: Boolean; TrueValue, FalseValue: real): real; overload;
begin
  if BOOL then
    result := TrueValue
  else
    result := FalseValue;
end;

procedure BreakIf(Test: Boolean = True);
begin
  if Test then
    asm
    	int 3;
    end;
end;

function SoftIce95Running: Boolean;
var
  HFILE: THandle;
begin
  result := False;
  HFILE := CreateFile('\\.\SICE', GENERIC_READ or GENERIC_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if HFILE <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(HFILE);
    result := True;
  end;
end;

function SoftIceNTRunning: Boolean;
var
  HFILE: THandle;
begin
  result := False;
  HFILE := CreateFile('\\.\NTICE', GENERIC_READ or GENERIC_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if HFILE <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(HFILE);
    result := True;
  end;
end;

procedure NBGetMac(Strings: TStrings);
  function HexBL(by: byte): string;
  begin
    result := Format('%x', [by]);
    if Length(result) < 2 then
      result := '0' + result;
  end;
var
  NCB: TNCB;
  Adapter: TAdapterStatus;
  LanaEnum: TLanaEnum;
  i, j: Integer;
  Str: string;
begin
  Strings.Clear;
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBENUM);
  Netbios(@NCB);
  NCB.ncb_buffer := @LanaEnum;
  NCB.ncb_length := SizeOf(LanaEnum);
  NCB.ncb_command := Chr(NCBENUM);
  Netbios(@NCB);
  for i := 0 to ord(LanaEnum.Length) - 1 do
  begin
    ZeroMemory(@NCB, SizeOf(NCB));
    NCB.ncb_command := Chr(NCBRESET);
    NCB.ncb_lana_num := LanaEnum.Lana[i];
    Netbios(@NCB);
    ZeroMemory(@NCB, SizeOf(NCB));
    NCB.ncb_command := Chr(NCBASTAT);
    NCB.ncb_lana_num := LanaEnum.Lana[i];
    StrPCopy(NCB.ncb_callname, '*');
    NCB.ncb_buffer := @Adapter;
    NCB.ncb_length := SizeOf(Adapter);
    Netbios(@NCB);
    Str := '';
    for j := 0 to 5 do
    begin
      if j > 0 then
        Str := Str + '-';
      Str := Str + HexBL(byte(Adapter.adapter_address[j]));
    end;
    Strings.Add(Str);
  end;
end;

function NBGetFirstMac: string;
var
  Strings: TStringList;
  i, j: Integer;
begin
  result := '';
  Strings := TStringList.Create;
  try
    NBGetMac(Strings);
    for i := 0 to Strings.Count - 1 do
    begin
      for j := 0 to Length(Strings.Strings[i]) do
      begin
        if (Strings.Strings[i][j] <> '0') and (Strings.Strings[i][j] <> '-') then
        begin
          result := Strings.Strings[i];
          break;
        end;
      end;
      if result <> '' then
        break;
    end;
  finally
    Strings.Free;
  end;
end;

function NBGetIndexMac(AIndex: Integer = 0): string;
var
  Strings: TStringList;
begin
  result := '';
  Strings := TStringList.Create;
  try
    NBGetMac(Strings);
    result := Strings.Strings[AIndex];
  finally
    Strings.Free;
  end;
end;

function ParsingUrl(pUrl: string; pWebPageUrl: string): string;
var
  hurl, S: string;
  k, a: Integer;
begin
  pUrl := trim(pUrl);
  if trim(pUrl) = '' then
  begin
    result := '';
    Exit;
  end;
  if LowerCase(Copy(pWebPageUrl, 1, 7)) <> 'http://' then
  begin
    if LowerCase(Copy(pWebPageUrl, 1, 6)) = 'http:/' then
    begin
      pWebPageUrl := 'http://' + Copy(pWebPageUrl, 7, Length(pWebPageUrl));
    end
    else if LowerCase(Copy(pWebPageUrl, 1, 5)) = 'http:' then
    begin
      pWebPageUrl := 'http://' + Copy(pWebPageUrl, 6, Length(pWebPageUrl));
    end
    else
    begin
      pWebPageUrl := 'http://' + pWebPageUrl;
    end;
  end;
  //
  if pUrl[1] = '.' then
  begin
    k := PosRight('/', pWebPageUrl);
    if k = 7 then
    begin
      S := pWebPageUrl + '/';
    end
    else
    begin
      S := Copy(pWebPageUrl, 1, k);
    end;
    if (Length(pUrl) >= 2) and (pUrl[2] = '/') then
    begin
      result := S + Copy(pUrl, 3, Length(pUrl));
    end
    else
    begin
      result := S + pUrl;
    end;
  end
  else if pUrl[1] = '/' then
  begin //if else
    S := Copy(pWebPageUrl, 8, Length(pWebPageUrl));
    k := pos('/', S);
    if k > 0 then
    begin
      S := Copy(S, 1, k);
    end
    else
    begin
      S := S + '/';
    end;
    S := 'http://' + S;
    result := S + Copy(pUrl, 2, Length(pUrl));
  end
  else
  begin //if else
    if LowerCase(Copy(pUrl, 1, 7)) = 'http://' then
    begin
      result := pUrl;
    end
    else if LowerCase(Copy(pUrl, 1, 6)) = 'http:/' then
    begin
      result := 'http://' + Copy(pUrl, 7, Length(pUrl));
    end
    else if LowerCase(Copy(pUrl, 1, 5)) = 'http:' then
    begin
      result := 'http://' + Copy(pUrl, 6, Length(pUrl));
    end
    else
    begin
      k := PosRight('/', pWebPageUrl);
      S := Copy(pWebPageUrl, 1, k);
      result := S + pUrl;
    end;
  end; //if else
end;

function GetOnlineStatus: Boolean;
var
  ConTypes: Integer;
begin
  ConTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  if (InternetGetConnectedState(@ConTypes, 0) = False) then
    result := False
  else
    result := True;
end;

function NBIsMacInList(Mac: string): Boolean;
var
  Strings: TStringList;
  i: Integer;
begin
  result := False;
  Strings := TStringList.Create;
  try
    NBGetMac(Strings);
    for i := 0 to Strings.Count - 1 do
    begin
      if Strings.Strings[i] = Mac then
      begin
        result := True;
        break;
      end;
    end;
  finally
    Strings.Free;
  end;
end;

function CreateLinkFile(const ShortCutFileName, Description, LinkFileName, Parameters,
  WorkingDir, IconFilename: string; const IconIndex, ShowCmd: Integer;
  pDefVal: Boolean): Boolean;
var
  obj: IUnknown;
  SL: IShellLink;
  PF: IPersistFile;
  WideFilename: WideString;
begin
  obj := CreateComObject(CLSID_ShellLink);
  SL := obj as IShellLink;
  SL.SetPath(pchar(LinkFileName));
  SL.SetArguments(pchar(Parameters));
  if WorkingDir <> '' then
    SL.SetWorkingDirectory(pchar(WorkingDir));
  if IconFilename <> '' then
    SL.SetIconLocation(pchar(IconFilename), IconIndex);
  SL.SetShowCmd(ShowCmd);
  if Description <> '' then
    SL.SetDescription(pchar(Description));
  PF := obj as IPersistFile;
  WideFilename := changefileext(ShortCutFileName, '.lnk');
  result := SUCCEEDED(PF.Save(PWideChar(WideFilename), True));
  if not result then
    result := pDefVal;
  //SL.SetHotkey(info.HotKey);
  //SL.SetRelativePath(info.RelativePath,0);
end;

function GetVolumeSerialNo(pDriveLetter: char): string;
var
  dw: Dword;
  mc, fl: Dword;
begin
  result := '';
  if trim(pDriveLetter) = '' then
    Exit;
  pDriveLetter := UpCase(pDriveLetter);
  GetVolumeInformation(pchar(pDriveLetter + ':\'), nil, 0, @dw, mc, fl, nil, 0);
  result := IntToHex(dw, 8);
end;

initialization

end.

