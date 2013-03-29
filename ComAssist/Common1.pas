unit Common1;

interface

uses
  Windows, SysUtils, TLHelp32, ShlObj;

function FindProcess(AFileName: string): Boolean; //Ѱ�ҽ���
procedure EndProcess(AFileName: string); //��ֹ����
function SetScreenMode(Width: Integer): Boolean; //�ı�ֱ���
function SmallToBig(small: real): string; //Сдת��д
function SelectFolder(const h: THandle; const DlgTitle: string): string; //����·��
function GetSystemLogicalDrivesInfo(): string; //��ȡϵͳ�̷�

implementation



function FindProcess(AFileName: string): Boolean;
var
  hSnapshot: THandle; //���ڻ�ý����б�
  lppe: TProcessEntry32; //���ڲ��ҽ���
  Found: Boolean; //�����жϽ��̱����Ƿ����
  KillHandle: THandle; //����ɱ������
begin
  result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0); //���ϵͳ�����б�
  lppe.dwSize := SizeOf(TProcessEntry32); //�ڵ���Process32First API֮ǰ����Ҫ��ʼ��lppe��¼�Ĵ�С
  Found := Process32First(hSnapshot, lppe); //�������б�ĵ�һ��������Ϣ����ppe��¼��
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName))
      or (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      {if MsShow('���ִ�Excel,�Ƿ���ر�?',2)=6 then
      begin
      //�����ҵĲ���ϵͳ��xp�������ڵ���TerminateProcess API֮ǰ
      //�ұ����Ȼ�ùرս��̵�Ȩ��,�������ϵͳ��NT���¿���ֱ����ֹ����
      KillHandle := OpenProcess(PROCESS_TERMINATE, False, lppe.th32ProcessID);
      TerminateProcess(KillHandle, 0);//ǿ�ƹرս���
      CloseHandle(KillHandle);
      end;}
      result := True
    end;
    Found := Process32Next(hSnapshot, lppe) //�������б����һ��������Ϣ����lppe��¼��
  end
end;

procedure EndProcess(AFileName: string);
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapShotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapShotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapShotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(AFileName))
      or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(AFileName))) then
      TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0);
    ContinueLoop := Process32Next(FSnapShotHandle, FProcessEntry32)
  end
end;

function SetScreenMode(Width: Integer): Boolean;
var
  cw, j: Integer;
  whd: THandle;
  dm: _devicemodeA;
begin
  whd := findwindow('Shell_traywnd', nil);
  //ȡ��ǰ��ʾ������
  EnumDisplaySettings(nil, $FFFFFFFF, dm);
  cw := dm.dmDisplayFrequency;
  result := False;
  j := 0;
  while EnumDisplaySettings(nil, j, dm) do
  begin
    if dm.dmpelswidth = Width then
    begin
      dm.dmDisplayFrequency := cw;
      dm.dmfields := {dm_BitsPerPel OR } dm_PelsWidth or dm_PelsHeight
      or dm_DisplayFrequency;
      result := ChangeDisplaySettings(dm, 1) = DISP_CHANGE_SUCCESSFUL
    end;
    inc(j)
  end;
  showwindow(whd, SW_SHOW)
end;

function SmallToBig(small: real): string;
var SmallMonth, BigMonth: string;
  wei1, qianwei1: string[2];
  qianwei, dianweizhi, qian: Integer;
begin
  {------- �޸Ĳ�����ֵ����ȷ -------}
  {С������λ�ã���Ҫ�Ļ�Ҳ���ԸĶ�-2ֵ}
  qianwei := -2;
  {ת���ɻ�����ʽ����Ҫ�Ļ�С�����Ӷ༸����}
  SmallMonth := formatfloat('0.00', small);
  {---------------------------------}
  dianweizhi := pos('.', SmallMonth); {С�����λ��}
  {ѭ��Сд���ҵ�ÿһλ����Сд���ұ�λ�õ����}
  for qian := Length(SmallMonth) downto 1 do
  begin
    {��������Ĳ���С����ͼ���}
    if qian <> dianweizhi then
    begin
      {λ���ϵ���ת���ɴ�д}
      case StrToInt(Copy(SmallMonth, qian, 1)) of
        1: wei1 := 'Ҽ'; 2: wei1 := '��';
        3: wei1 := '��'; 4: wei1 := '��';
        5: wei1 := '��'; 6: wei1 := '½';
        7: wei1 := '��'; 8: wei1 := '��';
        9: wei1 := '��'; 0: wei1 := '��'
      end;
      {�жϴ�дλ�ã����Լ�������real���͵����ֵ}
      case qianwei of
        -3: qianwei1 := '��';
        -2: qianwei1 := '��';
        -1: qianwei1 := '��';
        0: qianwei1 := 'Ԫ';
        1: qianwei1 := 'ʰ';
        2: qianwei1 := '��';
        3: qianwei1 := 'ǧ';
        4: qianwei1 := '��';
        5: qianwei1 := 'ʰ';
        6: qianwei1 := '��';
        7: qianwei1 := 'ǧ';
        8: qianwei1 := '��';
        9: qianwei1 := 'ʮ';
        10: qianwei1 := '��';
        11: qianwei1 := 'ǧ'
      end;
      inc(qianwei);
      BigMonth := wei1 + qianwei1 + BigMonth {��ϳɴ�д���}
    end
  end;
  SmallToBig := BigMonth
end;

function SelectFolder(const h: THandle; const DlgTitle: string): string;
var
  bi: TBrowseInfo;
  PathIdList: PItemIdList;
  strPath: string;
begin
  strPath := stringOfChar(' ', 512);
  bi.hwndOwner := h;
  bi.pidlRoot := nil;
  bi.pszDisplayName := nil;
  bi.lpszTitle := pchar(DlgTitle);
  bi.ulFlags := BIF_ReturnOnlyFsDirs;
  bi.lpfn := nil;
  bi.lParam := 0;
  bi.iImage := 0;
  result := '';
  PathIdList := SHBrowseForFolder(bi);
  if PathIdList <> nil then
    if SHGetPathFromIdList(PathIdList, pchar(strPath)) then
      result := trim(strPath)
end;

function GetCurrentDriveType(DriveNumber: pchar): Boolean;
var
  DriveType: word; //�������������ͱ�����
begin
  DriveType := Windows.GetDriveType(DriveNumber);
  if DriveType = DRIVE_FIXED then
    result := True
  else
    result := False;
end;

function GetSystemLogicalDrivesInfo: string;
var
  LocalDrives: set of 0..25;
  DriveNumber: Integer;
  Drives: string;
begin
  Drives := '';
  Dword(LocalDrives) := Windows.GetLogicalDrives;
  for DriveNumber := 0 to 25 do
  begin
    if (DriveNumber in LocalDrives)
      and (GetCurrentDriveType(pchar(Chr(DriveNumber + ord('A')) + ':\'))) then
      Drives := Drives + Chr(DriveNumber + ord('A')) + ':\';
  end;
  result := Drives;
end;

function WomExecOutPro(const filename: string; ExeType: Boolean): Boolean; //ִ���ⲿ����ExeType:�Ƿ�ȴ�ִ�н���,TrueΪһֱ�ȴ�
var
  sInfo: TStartupInfo;
  pInfo: TProcessInformation;
  TmpDWORD: Dword;
begin
  FillChar(sInfo, SizeOf(sInfo), #0);
  sInfo.cb := SizeOf(sInfo);
  sInfo.dwFlags := STARTF_USESHOWWINDOW;
  sInfo.wShowWindow := SW_NORMAL;
  try
    CreateProcess(nil, pchar(filename), nil, nil, False, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, sInfo, pInfo);
    if ExeType = False then
      result := True
    else
    begin
      waitforsingleobject(pInfo.hProcess, INFINITE);
      GetExitCodeProcess(pInfo.hProcess, TmpDWORD);
      CloseHandle(pInfo.hProcess);
      CloseHandle(pInfo.hThread);
      result := True;
    end;
  except
    result := False;
    Exit;
  end;
end;

end.

