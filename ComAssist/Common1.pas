unit Common1;

interface

uses
  Windows, SysUtils, TLHelp32, ShlObj;

function FindProcess(AFileName: string): Boolean; //寻找进程
procedure EndProcess(AFileName: string); //终止进程
function SetScreenMode(Width: Integer): Boolean; //改变分辩率
function SmallToBig(small: real): string; //小写转大写
function SelectFolder(const h: THandle; const DlgTitle: string): string; //返回路径
function GetSystemLogicalDrivesInfo(): string; //获取系统盘符

implementation



function FindProcess(AFileName: string): Boolean;
var
  hSnapshot: THandle; //用于获得进程列表
  lppe: TProcessEntry32; //用于查找进程
  Found: Boolean; //用于判断进程遍历是否完成
  KillHandle: THandle; //用于杀死进程
begin
  result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0); //获得系统进程列表
  lppe.dwSize := SizeOf(TProcessEntry32); //在调用Process32First API之前，需要初始化lppe记录的大小
  Found := Process32First(hSnapshot, lppe); //将进程列表的第一个进程信息读入ppe记录中
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName))
      or (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      {if MsShow('发现打开Excel,是否将其关闭?',2)=6 then
      begin
      //由于我的操作系统是xp，所以在调用TerminateProcess API之前
      //我必须先获得关闭进程的权限,如果操作系统是NT以下可以直接中止进程
      KillHandle := OpenProcess(PROCESS_TERMINATE, False, lppe.th32ProcessID);
      TerminateProcess(KillHandle, 0);//强制关闭进程
      CloseHandle(KillHandle);
      end;}
      result := True
    end;
    Found := Process32Next(hSnapshot, lppe) //将进程列表的下一个进程信息读入lppe记录中
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
  //取当前显示器设置
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
  {------- 修改参数令值更精确 -------}
  {小数点后的位置，需要的话也可以改动-2值}
  qianwei := -2;
  {转换成货币形式，需要的话小数点后加多几个零}
  SmallMonth := formatfloat('0.00', small);
  {---------------------------------}
  dianweizhi := pos('.', SmallMonth); {小数点的位置}
  {循环小写货币的每一位，从小写的右边位置到左边}
  for qian := Length(SmallMonth) downto 1 do
  begin
    {如果读到的不是小数点就继续}
    if qian <> dianweizhi then
    begin
      {位置上的数转换成大写}
      case StrToInt(Copy(SmallMonth, qian, 1)) of
        1: wei1 := '壹'; 2: wei1 := '贰';
        3: wei1 := '叁'; 4: wei1 := '肆';
        5: wei1 := '伍'; 6: wei1 := '陆';
        7: wei1 := '柒'; 8: wei1 := '捌';
        9: wei1 := '玖'; 0: wei1 := '零'
      end;
      {判断大写位置，可以继续增大到real类型的最大值}
      case qianwei of
        -3: qianwei1 := '厘';
        -2: qianwei1 := '分';
        -1: qianwei1 := '角';
        0: qianwei1 := '元';
        1: qianwei1 := '拾';
        2: qianwei1 := '佰';
        3: qianwei1 := '千';
        4: qianwei1 := '万';
        5: qianwei1 := '拾';
        6: qianwei1 := '佰';
        7: qianwei1 := '千';
        8: qianwei1 := '亿';
        9: qianwei1 := '十';
        10: qianwei1 := '佰';
        11: qianwei1 := '千'
      end;
      inc(qianwei);
      BigMonth := wei1 + qianwei1 + BigMonth {组合成大写金额}
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
  DriveType: word; //定义驱动器类型变量。
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

function WomExecOutPro(const filename: string; ExeType: Boolean): Boolean; //执行外部程序。ExeType:是否等待执行结束,True为一直等待
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

