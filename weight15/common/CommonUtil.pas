unit CommonUtil;

interface

uses DBGridEh, DBGridEhImpExp, SysUtils, Dialogs, Windows, ShlObj, IniFiles,
  XMLIntf, XMLDoc, DB, StrUtils, Forms, DateUtils, Math,
  IdCoder, IdCoderMIME, IdHashMessageDigest, Classes,
  ZLibEx, ComObj, Variants;

type

  TCol = record
    field: string;
    showField: string;
  end;

  TDBCommonUtil = class
  private
  public
    //查询用户是否有权限
    class function HasAuthority(Authority: string): boolean;
    //统计记录数，今日记录及今日净重及实重
    class function getStaticInfo(var count: Integer; var todayCount: integer; var todayNet: Double; var todayReal: Double): boolean;
    //显示本月记录
    class function showToMonthRecord(): boolean; overload;
    class function showToMonthRecord(types: Integer): Boolean; overload;
    //显示本日记录
    class function showTodayRecord(): Boolean; overload;
    class function showTodayRecord(types: Integer): Boolean; overload;
    //显示本周记录
    class function showToWeekRecord(types: Integer): Boolean;
    //显示本季记录
    class function showToSeasonRecord(types: Integer): Boolean;
    //显示本年记录
    class function showToYearRecord(types: Integer): Boolean;
    //显示历史记录 , 0为显示所有历史记录，1为显示历史毛重，2为显示历史空重
    class function showHistoryRecord(t: Integer = 0): Boolean;
    //记录日志
    class procedure AddLog(content: string);
    //删除今天之外的历史记录
    class procedure DelHistory;
    //过空车时查找是否有过往皮重
    class function hasLastTare(car: string; var tareGlideNo: string): Boolean;
    //如果选是,就更新该皮重
    class procedure updateLastTare(tareGlideNo: string; Tare: string);
    //过重车时查找是否有过往毛重
    class function hasLastGross(car: string; var grossGlideNo: string): Boolean;
    //如果选是,就更新该毛重
    class procedure updateLastGross(grossGlideNo: string; Gross: string);
    //预览磅单的时候,先查询第一台记录
    class procedure getFirstRecord();
    //清空称重信息表,称重照片表,后台记录表,日志表
    class function clearWeightInfo(): Boolean;
    class function clearUserInfo(): Boolean;
    class function clearCar(): Boolean;
    class function clearFaHuo(): Boolean;
    class function clearShouHuo(): Boolean;
    class function clearGoods(): Boolean;
    class function clearSpec(): Boolean;
    class function clearBackup1(): Boolean;
    class function clearBackup2(): Boolean;
    class function clearBackup3(): Boolean;
    class function clearBackup4(): Boolean;
    class function clearBackup5(): Boolean;
    class function clearBackRecord(): Boolean;
    class function clearLog(): Boolean;
    class function clearTao(): Boolean;
    //取当前称重记录数
    class function getRecordCount(): Integer;
    //取最大流水号
    class function getMaxGlideNo(): string;
    //是否存在表
    class function TableExists(tn: string): boolean;
    class function ImportExcel(f: string): Boolean;
  end;

  TCommonUtil = class
  private
  public
    class function getIni(): TIniFile;
    class function getDesignIni(): TIniFile;
    class function exportExcel(DBGrid: TDBGridEh): boolean; //导出Excel
    class function saveFile(dir: string = ''; desc: string = ''; ext: string = ''): string;
    class function SelectFolder(const h: THandle; const DlgTitle: string): string; //选择路径
    class procedure ExitWin32Sys(iFlags: Integer); //关机过程
    class procedure XMLExport0(); //将所有称重记录导出成XML文件
    class procedure XMLExport1();
    class function TransferGlideNo(source: integer; n: integer = 6): string; //将数字转为流水号
    //小写转成大写 --- 金额
    class function small2big(sourcemoney: currency): string;
    //只是阿拉伯数字转大写
    class function Num2CNum(dblArabic: double): string;
    class function HexStrToBin(s: string): string;
    class function BinToHexStr(s: string): string;
    //输出XML
    class function getXmlData(glideNo: string): string;
    //封装打开文件,保存文件的对话框
    class function openFileDialog(ext, filter: string; initialDir: string = ''): string;
    class function saveFileDialog(ext, filter: string; initialDir: string = ''): string;
    //编码
    class function md5(s: string): string;
    class function base64(s: string): string;
    class function deBase64(s: string): string;
    class function compressAndBase64(s: string): string;
    class function deBase64AndDecompress(s: string): string;
    class function modbusAsciiCheck(const str: string): string;
    class function modbusFloatValue(const str: string): Double;
    //打印机退纸
    class function printerBack(step: Double = 0): Boolean;
  end;

  //报表类
  TReportUtil = class
  private
  public
     //打印磅单
    class function printTicket(glideNo: string; preview: Boolean = False): Boolean;
    //设计磅单
    class function designTicket(format: string): Boolean;
    class function designReport(format: string): Boolean;
    class function DayReport(): Boolean; //日报表
    class function printStatReport(format: string): Boolean; //打印统计报表
    class function designStatReport(format: string): Boolean;
  end;

implementation

uses QueryDM, Main, TicketSel, WeightRecord, DataQuery;

class procedure TDBCommonUtil.AddLog(content: string);
begin
  with QueryDataModule.ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into 日志(修改人,时间,日志) values(:user,:time,:content)');
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Parameters.ParamByName('time').Value :=
      FormatDateTime('yyyy-mm-dd hh:nn:ss', now);
    Parameters.ParamByName('content').Value := Content;
    ExecSQL;
  end;
end;

class procedure TDBCommonUtil.DelHistory;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 称重信息 where (净重=0)'
      + 'and ((毛重时间<:today1) or (空重时间<:today2))';
    Parameters.ParamByName('today1').Value := StartOfTheDay(Date());
    Parameters.ParamByName('today2').Value := StartOfTheDay(Date());
    ExecSQL;
  end;
end;

class procedure TDBCommonUtil.getFirstRecord;
begin
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Text := 'select top 1 * from 称重信息';
    Open;
  end;
end;

class function TDBCommonUtil.getStaticInfo(var count, todayCount: integer;
  var todayNet, todayReal: Double): boolean;
begin
  with QueryDataModule.ADOQueryPrintCombineTicket do
  begin
    count := 0;
    todayCount := 0;
    todayNet := 0;
    todayReal := 0;

    Close;
    SQL.Clear;
    SQL.Add('select count(序号) as count1 from 称重信息');
    Open;
    if not IsEmpty then
      count := FieldByName('count1').AsInteger;

    SQL.Clear;
    SQL.Add('Select count(序号) as 记录数,sum(净重) as 总净重,'
      + 'sum(实重) as 总实重 From 称重信息 Where (毛重时间 between :grossDate1 and :grossDate2) '
      + 'Or (空重时间 between :tareDate1 and :tareDate2)');
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
    if FieldByName('记录数').AsInteger <> 0 then
      todayCount := FieldByName('记录数').AsInteger;
    if FieldByName('总净重').AsFloat <> 0 then
      todayNet := FieldByName('总净重').AsFloat;
    if FieldByName('总实重').AsFloat <> 0 then
      todayReal := FieldByName('总实重').AsFloat;
  end;
  Result := True;
end;

class function TDBCommonUtil.HasAuthority(Authority: string): boolean;
begin
  result := false;
  with QueryDataModule.ADOQueryUser do
  begin
    Close;
    SQL.Text := 'select ' + Authority + ' from 用户信息 where 用户名=:user';
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Open;
    if not IsEmpty then
    begin
      result := FieldByName(Authority).AsBoolean;
    end
  end;
end;

{ TCommon }

class function TCommonUtil.exportExcel(DBGrid: TDBGridEh): boolean;
var
  ExpClass: TDBGridEhExportClass;
  sd: TSaveDialog;
  Ext: string;
begin
  sd := TSaveDialog.Create(nil);
  try
    sd.FileName := '';
    sd.Filter :=
      'Excel文件(*.xls)|*.xls|文本文件(*.txt)|*.txt|通讯录(*.csv)|*.csv|网页(*.htm)|*.htm';
    sd.Title := '保存到...';
    if sd.Execute then
    begin
      case sd.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsXLS;
            Ext := 'xls';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsText;
            Ext := 'txt';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
      else
        begin
          ExpClass := nil;
          Ext := '';
        end;
      end;

      if ExpClass <> nil then
      begin
        if UpperCase(Copy(sd.FileName, Length(sd.FileName) - 2, 3)) <>
          UpperCase(Ext) then
          sd.FileName := sd.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, DBGrid, sd.FileName, True);
      end;
    end;
  finally
    sd.Free;
    result := true;
  end;
end;

function GetSysTypes(): boolean; //判定windows系统类型
var
  Ver: TOSVersionInfo;
begin
  result := false;
  Ver.dwOSVersionInfoSize := Sizeof(TOSVersionInfo);
  if GetVersionEx(Ver) then
    if Ver.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
      result := true
    else
      result := false
end;

function SetPrivilege(sPrivilegeName: AnsiString; bEnable: boolean): boolean; //设置权限
var
  TPPrev, TP: TTokenPrivileges;
  Token: THandle;
  dwRetLen: DWord;
begin
  result := false;
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or
    TOKEN_QUERY, Token);
  TP.PrivilegeCount := 1;
  if LookupPrivilegeValue(nil, PAnsiChar(sPrivilegeName), TP.Privileges[0].LUID) then
  begin
    if bEnable then
      TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      TP.Privileges[0].Attributes := 0;
    dwRetLen := 0;
    result := AdjustTokenPrivileges(Token, false, TP, Sizeof(TPPrev), TPPrev, dwRetLen)
  end;
  CloseHandle(Token)
end;

class procedure TCommonUtil.ExitWin32Sys(iFlags: Integer); //关机过程
begin
  if GetSysTypes then
    ExitWindowsEx(iFlags, 0)
  else if SetPrivilege('SeShutdownPrivilege', true) then
    if not ExitWindowsEx(iFlags, 0) then
      SetPrivilege('SeShutdownPrivilege', false)
end;

class function TCommonUtil.SelectFolder(const h: THandle; const DlgTitle: string): string;
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
      result := Trim(strPath)
end;

class function TDBCommonUtil.hasLastGross(car: string;
  var grossGlideNo: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 流水号 from 称重信息 where (车号=:car) and (毛重<>0) and (空重=0)';
    Parameters.ParamByName('car').Value := car;
    Open;
    if not IsEmpty then
    begin
      grossGlideNo := FieldByName('流水号').AsString;
      result := True;
    end
    else
      result := False;
  end;
end;

class function TDBCommonUtil.hasLastTare(car: string;
  var tareGlideNo: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 流水号 from 称重信息 where (车号=:car) and (毛重=0) and (空重<>0)';
    Parameters.ParamByName('car').Value := car;
    Open;
    if not IsEmpty then
    begin
      tareGlideNo := FieldByName('流水号').AsString;
      result := True;
    end
    else
      result := False;
  end;
end;

class function TDBCommonUtil.showHistoryRecord(t: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    if t = 0 then
      SQL.Add(' where 毛重=0 or 空重=0')
    else if t = 1 then
      sql.Add(' where 毛重=0 and 空重<>0')
    else if t = 2 then
      sql.Add(' where 空重=0 and 毛重<>0');
    Open;
  end;
  Result := True;
end;

class function TDBCommonUtil.showTodayRecord: Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'Select * From 称重信息 where (毛重时间 between :grossDate1 and :grossDate2) '
      + 'Or (空重时间 between :tareDate1 and :tareDate2) Order by 流水号 desc';
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
  end;
  Result := True;
end;

class function TDBCommonUtil.showToMonthRecord: boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 where ( 毛重时间 >= :grossdate) or '
      + '(空重时间>=:taredate)');
    Parameters.ParamByName('grossdate').Value := FormatDateTime('yyyy-mm-01 00:00:00',
      Date);
    Parameters.ParamByName('taredate').Value := FormatDateTime('yyyy-mm-01 00:00:00',
      Date);
    Open;
  end;
  Result := True;
end;

class function TCommonUtil.getIni: TiniFile;
begin
  Result := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
end;

class procedure TCommonUtil.XMLExport0;
var
  strXML: string;
  XMLDoc: TXMLDocument;
  node: IXMLNode;
begin
  strXML := ExtractFilePath(ParamStr(0)) + '\export.xml';
  if FileExists(strXML) then //如果已经存在导出的文件就删除
    DeleteFile(PChar(strXML));
  //重新创建该文件
  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.Active := true;
    XMLDoc.Version := '1.0';
    XMLDoc.Encoding := 'UTF-8';
    XMLDoc.AddChild('ATW');
    XMLDoc.SaveToFile(strXML);
  finally
    XMLDoc.Free
  end;
  //增加节点
  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.FileName := strXML;
    XMLDoc.Active := true;
    with QueryDataModule.ADOQueryPrintCombineTicket do
    begin //查询所有的记录后导出
      Close;
      SQL.Clear;
      SQL.Add('select * from 称重信息');
      Open;
      if not IsEmpty then //不为空记录就导出XML
      begin
        first;
        while not Eof do
        begin
          node := XMLDoc.CreateNode('WeightData');
          node.AttributeNodes.Add(XMLDoc.CreateNode('id', ntAttribute));
          node.SetAttribute('id', FieldByName('流水号').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('car', ntAttribute));
          node.SetAttribute('car', FieldByName('车号').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('oper', ntAttribute));
          node.SetAttribute('oper', FieldByName('操作员').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('FaHuo', ntAttribute));
          node.SetAttribute('FaHuo', FieldByName('发货单位').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('ShouHuo', ntAttribute));
          node.SetAttribute('ShouHuo', FieldByName('收货单位').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Goods', ntAttribute));
          node.SetAttribute('Goods', FieldByName('货名').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Spec', ntAttribute));
          node.SetAttribute('Spec', FieldByName('规格').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Gross', ntAttribute));
          node.SetAttribute('Gross', FieldByName('毛重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Tare', ntAttribute));
          node.SetAttribute('Tare', FieldByName('空重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Net', ntAttribute));
          node.SetAttribute('Net', FieldByName('净重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Bundle', ntAttribute));
          node.SetAttribute('Bundle', FieldByName('扣重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Real', ntAttribute));
          node.SetAttribute('Real', FieldByName('实重').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('price', ntAttribute));
          node.SetAttribute('price', FieldByName('单价').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('sum', ntAttribute));
          node.SetAttribute('sum', FieldByName('金额').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('weightman', ntAttribute));
          node.SetAttribute('weightman', FieldByName('过磅员').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('GrossTime', ntAttribute));
          node.SetAttribute('GrossTime', FieldByName('毛重时间').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('EmptyTime', ntAttribute));
          node.SetAttribute('EmptyTime', FieldByName('空重时间').AsString);
          node.AttributeNodes.Add(XMLDoc.CreateNode('Remark', ntAttribute));
          node.SetAttribute('Remark', FieldByName('备注').AsString);
          XMLDoc.DocumentElement.ChildNodes.Add(node);
          XMLDoc.SaveToFile(strXML);
          Next;
        end
      end
    end;
  finally
    XMLDoc.Free;
  end;
end;

class procedure TCommonUtil.XMLExport1;
var
  strXML: string;
  XMLDoc: TXMLDocument;
  node, node2: IXMLNode;
begin
  strXML := ExtractFilePath(ParamStr(0)) + '\export.xml';
  if FileExists(strXML) then //如果已经存在导出的文件就删除
    DeleteFile(PChar(strXML));
  //重新创建该文件
  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.Active := true;
    XMLDoc.Version := '1.0';
    XMLDoc.Encoding := 'UTF-8';
    XMLDoc.AddChild('ATW');
    XMLDoc.SaveToFile(strXML);
  finally
    XMLDoc.Free
  end;

  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.FileName := strXML;
    XMLDoc.Active := true;
    with QueryDataModule.ADOQueryPrintCombineTicket do
    begin //查询所有的记录后导出
      Close;
      SQL.Clear;
      SQL.Add('select * from 称重信息');
      Open;
      if not IsEmpty then //不为空记录就导出XML
      begin
        first;
        while not Eof do
        begin
          node := XMLDoc.CreateNode('WeightData');
          node2 := node.AddChild('id');
          node2.Text := FieldByName('流水号').AsString;
          node2 := node.AddChild('car');
          node2.Text := FieldByName('车号').AsString;
          node2 := node.AddChild('oper');
          node2.Text := FieldByName('操作员').AsString;
          node2 := node.AddChild('FaHuo');
          node2.Text := FieldByName('发货单位').AsString;
          node2 := node.AddChild('ShouHuo');
          node2.Text := FieldByName('收货单位').AsString;
          node2 := node.AddChild('Goods');
          node2.Text := FieldByName('货名').AsString;
          node2 := node.AddChild('Spec');
          node2.Text := FieldByName('规格').AsString;
          node2 := node.AddChild('Gross');
          node2.Text := FieldByName('毛重').AsString;
          node2 := node.AddChild('Tare');
          node2.Text := FieldByName('空重').AsString;
          node2 := node.AddChild('Net');
          node2.Text := FieldByName('净重').AsString;
          node2 := node.AddChild('Bundle');
          node2.Text := FieldByName('扣重').AsString;
          node2 := node.AddChild('Real');
          node2.Text := FieldByName('实重').AsString;
          node2 := node.AddChild('price');
          node2.Text := FieldByName('单价').AsString;
          node2 := node.AddChild('sum');
          node2.Text := FieldByName('金额').AsString;
          node2 := node.AddChild('weightman');
          node2.Text := FieldByName('过磅员').AsString;
          node2 := node.AddChild('GrossTime');
          node2.Text := FieldByName('毛重时间').AsString;
          node2 := node.AddChild('EmptyTime');
          node2.Text := FieldByName('空重时间').AsString;
          node2 := node.AddChild('Remark');
          node2.Text := FieldByName('备注').AsString;
          XMLDoc.DocumentElement.ChildNodes.Add(node);
          XMLDoc.SaveToFile(strXML);
          Next;
        end
      end
    end;
  finally
    XMLDoc.Free;
  end;
end;

class function TDBCommonUtil.showToMonthRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (空重时间 between :tareStartDate and :tareEndDate))');
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := StartOfTheMonth(Date);
    Parameters.ParamByName('grossEndDate').Value := EndOfTheMonth(Date);
    Parameters.ParamByName('tareStartDate').Value := StartOfTheMonth(Date);
    Parameters.ParamByName('tareEndDate').Value := EndOfTheMonth(Date);
    Open;
  end;
  Result := True;
end;

class function TDBCommonUtil.showToSeasonRecord(types: Integer): Boolean;
var
  y, m: Word;
  T1, T2: TDateTime;
begin
  y := YearOf(Now);
  m := MonthOf(Now);
  Dec(m, (m - 1) mod 3);
  T1 := DateOf(StartOfAMonth(y, m));
  T2 := DateOf(EndOfAMonth(y, m + 2));

  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (空重时间 between :tareStartDate and :tareEndDate))');
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := T1;
    Parameters.ParamByName('grossEndDate').Value := T2;
    Parameters.ParamByName('tareStartDate').Value := T1;
    Parameters.ParamByName('tareEndDate').Value := T2;
    Open;
  end;
  Result := True;
end;

class function TDBCommonUtil.showToWeekRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间  between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (空重时间 between :tareStartDate and :tareEndDate))');
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := StartOfTheWeek(Date);
    Parameters.ParamByName('grossEndDate').Value := EndOfTheWeek(Date);
    Parameters.ParamByName('tareStartDate').Value := StartOfTheWeek(Date);
    Parameters.ParamByName('tareEndDate').Value := EndOfTheWeek(Date);
    Open;
  end;
  Result := True;
end;

class function TDBCommonUtil.showToYearRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossStartDate and :grossEndDate)');
    SQL.Add(' or (空重时间 between :tareStartDate and :tareEndDate))');
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossStartDate').Value := StartOfTheYear(Date);
    Parameters.ParamByName('grossEndDate').Value := EndOfTheYear(Date);
    Parameters.ParamByName('tareStartDate').Value := StartOfTheYear(Date);
    Parameters.ParamByName('tareEndDate').Value := EndOfTheYear(Date);
    Open;
  end;
  Result := True;
end;

class procedure TDBCommonUtil.updateLastGross(grossGlideNo: string; Gross: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 称重信息 set 毛重=:gross,'
      + '毛重时间=:gross_time where 流水号=:glideNo';
    Parameters.ParamByName('gross').Value := StrToFloatDef(Gross, 0);
    Parameters.ParamByName('gross_time').Value := Now;
    Parameters.ParamByName('glideNo').Value := grossGlideNo;
    ExecSQL;
  end;
end;

class procedure TDBCommonUtil.updateLastTare(tareGlideNo: string; Tare: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 称重信息 set 空重=:tare,'
      + '空重时间=:tare_time where 流水号=:glideNo';
    Parameters.ParamByName('tare').Value := StrToFloatDef(Tare, 0);
    Parameters.ParamByName('tare_time').Value := Now;
    Parameters.ParamByName('glideNo').Value := tareGlideNo;
    ExecSQL;
  end;
end;

class function TDBCommonUtil.showTodayRecord(types: Integer): Boolean;
begin
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息');
    SQL.Add(' where ((毛重时间 between :grossDate1 and :grossDate2)');
    SQL.Add(' or (空重时间 between :tareDate1 and :tareDate2))');
    if types = 0 then
      SQL.Add(' and (净重=0)')
    else if types = 1 then
      SQL.Add(' and (净重<>0)');
    SQL.Add(' order by 流水号 desc');
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
  end;
  Result := True;
end;

class function TDBCommonUtil.getRecordCount: Integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select count(*) as c from 称重信息';
    Open;
    if not IsEmpty then
      Result := FieldByName('c').AsInteger
    else
      Result := 0;
  end;
end;

class function TDBCommonUtil.getMaxGlideNo: string;
var temp, tmp: string;
begin
  if MainForm.systemConfig.glideNoRule = 0 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Max(流水号) As GlideNo from 称重信息 where len(流水号)=6');
      Open;
      temp := FieldByName('GlideNo').AsString;
    end;
    if temp = '' then
      Result := TCommonUtil.TransferGlideNo(1)
    else
      Result := TCommonUtil.TransferGlideNo(StrToIntDef(temp, 0) + 1);
  end
  else
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Max(流水号) As gn from 称重信息 where 流水号 like :glideNo');
      Parameters.ParamByName('glideNo').Value := FormatDateTime('yyyymmdd', Date) + '%';
      Open;
      if not IsEmpty then
      begin
        temp := FieldByName('gn').AsString;
        if temp = '' then
          Result := FormatDateTime('yyyymmdd', Date) + '0001'
        else
        begin
          tmp := RightStr(temp, 4);
          Result := FormatDateTime('yyyymmdd', Date)
            + TCommonUtil.TransferGlideNo(StrToIntDef(tmp, 0) + 1, 4);
        end;
      end
      else
        Result := FormatDateTime('yyyymmdd', Date) + '0001';
    end;
  end;
end;

{ TReportUtil }

class function TReportUtil.DayReport: Boolean;
begin
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Text := 'Select * From 称重信息 where (毛重时间 between :grossDate1 and :grossDate2) '
      + 'Or (空重时间 between :tareDate1 and :tareDate2) Order by 货名';
    Parameters.ParamByName('grossDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('grossDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Parameters.ParamByName('tareDate1').Value := FormatDateTime('yyyy-mm-dd 00:00:00', Date);
    Parameters.ParamByName('tareDate2').Value := FormatDateTime('yyyy-mm-dd 23:59:59', Date);
    Open;
  end;
  QueryDataModule.frxReportReport.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Report\日报表.fr3');
  QueryDataModule.frxReportReport.ShowReport();
  Result := True;
end;

class function TCommonUtil.TransferGlideNo(source, n: integer): string;
var i: integer;
  temp: string;
begin
  temp := IntToStr(source);
  result := temp;
  for i := 1 to n - Length(temp) do
    result := '0' + result;
end;

class function TCommonUtil.small2big(sourcemoney: currency): string;
var
  strsourcemoney, strobjectmoney: string;
  //strsourcemoney   保存未转换的小写字符串
  //strobjectmoney   保存已转换的大写字符串
  thiswei, thispos: string[2];
  //thiswei为当前位的大写，thispos为当前位的人民币单位
  iwei, pospoint: Integer;
  //iwei为当前位置，pospoint为小数点的位置
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //将浮点数转换成指定格式字符串
  if Length(strsourcemoney) > 15 then //超过千亿元
  begin
    ShowMessage('请输入正确的数字，不要超过千亿（15位整数）');
    Exit;
  end;
  pospoint := Pos('.', strsourcemoney); //小数点位置
  for iwei := Length(strsourcemoney) downto 1 do //例如：500.8 = 5 X=4
  begin
    case pospoint - iwei of //小数点位置 - 总长度 ＝ 最后一位单位
      -3: thispos := '厘';
      -2: thispos := '分';
      -1: thispos := '角';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //小数点位置大于零
          thispos := '元';
      2: thispos := '拾';
      3: thispos := '佰';
      4: thispos := '千';
      5: thispos := '万';
      6: thispos := '拾';
      7: thispos := '佰';
      8: thispos := '千';
      9: thispos := '亿';
      10: thispos := '十';
      11: thispos := '佰';
      12: thispos := '千';
    end;
    case strsourcemoney[iwei] of //当前数字转换成人民币汉字
      '.': Continue;
      '1': thiswei := '壹';
      '2': thiswei := '贰';
      '3': thiswei := '叁';
      '4': thiswei := '肆';
      '5': thiswei := '伍';
      '6': thiswei := '陆';
      '7': thiswei := '柒';
      '8': thiswei := '捌';
      '9': thiswei := '玖';
      '0':
        begin
          thiswei := '';
          if iwei < Length(strsourcemoney) then //不是第一位的时候
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //当前一位数不是零，即5005 为五千零五。并且 前一位不是. ，即 5.05 为五元五分
              thiswei := '零';
          if (thispos <> '亿') and (thispos <> '万') and (thispos <> '元') then
            thispos := '' //单位是十，百、仟   的，为0，则不显示单位。
          else
            thiswei := ''; //若单位为亿、万、元，则前一位0，不显示'零'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //组合成大写金额
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '亿万', '亿'); //去掉'亿万'中的'万'
  if ansicontainsstr(strobjectmoney, '分') then
    small2big := strobjectmoney
  else
  begin
    //strobjectmoney := strobjectmoney + '整';
    small2big := strobjectmoney;
  end;
end;

class function TCommonUtil.Num2CNum(dblArabic: double): string;
const
  _ChineseNumeric = '零壹贰叁肆伍陆柒捌玖';
var
  sArabic: string;
  sIntArabic: string;
  iPosOfDecimalPoint: integer;
  i: integer;
  iDigit: integer;
  iSection: integer;
  sSectionArabic: string;
  sSection: string;
  bInZero: boolean;
  bMinus: boolean;

  (* 将字串反向, 例如: 传入 '1234', 传回 '4321' *)
  function ConvertStr(const sBeConvert: string): string;
  var
    x: integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      //AppendStr(Result, sBeConvert[x]);
      Result := Result + sBeConvert[x];
  end; { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* 将数字转成阿拉伯数字字串 *)
{$IFDEF __Debug}
  ShowMessage('FloatToStr(dblArabic): ' + sArabic);
{$ENDIF}
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* 取得小数点的位置 *)
{$IFDEF __Debug}
  ShowMessage('Pos(''.'', sArabic) ' + IntToStr(iPosOfDecimalPoint));
{$ENDIF}

  (* 先处理整数的部分 *)
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  (* 从个位数起以每四位数为一小节 *)
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
      (* 以下的 i 控制: 个十百千位四个位数 *)
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := Ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
              (* 1. 避免 '零' 的重覆出现 *)
              (* 2. 个位数的 0 不必转成 '零' *)
        if (not bInZero) and (i <> 1) then sSection := '零' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2: sSection := '拾' + sSection;
          3: sSection := '佰' + sSection;
          4: sSection := '仟' + sSection;
        end;
        sSection := Copy(_ChineseNumeric, 2 * iDigit + 1, 2) +
          sSection;
        bInZero := False;
      end;
    end;

      (* 加上该小节的位数 *)
    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 2) <> '零') then
        Result := '零' + Result;
    end
    else
    begin
      case iSection of
        0: Result := sSection;
        1: Result := sSection + '万' + Result;
        2: Result := sSection + '亿' + Result;
        3: Result := sSection + '兆' + Result;
      end;
    end;
{$IFDEF __Debug}
    ShowMessage('sSection: ' + sSection);
    ShowMessage('Result: ' + Result);
{$ENDIF}
  end;

  (* 处理小数点右边的部分 *)
  if iPosOfDecimalPoint > 0 then
  begin
    //AppendStr(Result, '点');
    Result := Result + '点';
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;

{$IFDEF __Debug}
  ShowMessage('Result before 其他例外处理: ' + Result);
{$ENDIF}
  (* 其他例外状况的处理 *)
  if Length(Result) = 0 then Result := '零';
  if Copy(Result, 1, 4) = '一十' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '点' then Result := '零' + Result;

  (* 是否为负数 *)
  if bMinus then Result := '负' + Result;
{$IFDEF __Debug}
  ShowMessage('Result before Exit: ' + Result);
{$ENDIF}
end;

class function TCommonUtil.getDesignIni: TIniFile;
begin
  Result := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\design.ini');
end;

class function TReportUtil.designReport(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReportReport.LoadFromFile(format);
  QueryDataModule.frxReportReport.DesignReport();
end;

class function TReportUtil.designStatReport(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReport2.LoadFromFile(format);
  QueryDataModule.frxReport2.DesignReport();
end;

class function TReportUtil.designTicket(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReport1.LoadFromFile(format);
  QueryDataModule.frxReport1.DesignReport();
end;

class function TReportUtil.printStatReport(format: string): Boolean;
begin
  if not FileExists(format) then
    Exit;
  QueryDataModule.frxReport2.LoadFromFile(format);
  QueryDataModule.frxReport2.ShowProgress := True;
  QueryDataModule.frxReport2.PrintOptions.Printer :=
    TCommonUtil.getIni.ReadString('system_set', 'printer', 'Default');
  QueryDataModule.frxReport2.ShowReport();
end;

class function TReportUtil.printTicket(glideNo: string;
  preview: Boolean): Boolean;
var format, shouHuo: string;
begin
  if glideNo = '' then
  begin
    MessageDlg('请输入磅单流水号!', mtWarning, [mbOK], 0);
    Exit;
  end;
  with QueryDataModule.ADOQueryPrintTicket do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 称重信息 where 流水号=:num');
    Parameters.ParamByName('num').Value := Trim(glideNo);
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('不存在这条磅单!', mtError, [mbOK], 0);
      Exit
    end;
    if MainForm.systemConfig.selectTicketBeforePrint then
    begin
      Application.CreateForm(TTicketSelForm, TicketSelForm);
      try
        TicketSelForm.ShowModal;
        format := ExtractFilePath(ParamStr(0)) + '\Ticket\'
          + TicketSelForm.LBTicket.Items[TicketSelForm.LBTicket.ItemIndex] + '.fr3';
      finally
        TicketSelForm.Free;
      end;
    end
    else
    begin
      format := TCommonUtil.getIni.ReadString('系统设置',
        '磅单格式', ExtractFilePath(ParamStr(0)) + '\Ticket\标准填充.fr3');
    end;
    if FileExists(format) then
      QueryDataModule.frxReport1.LoadFromFile(format, true)
    else
    begin
      MessageDlg('磅单打印格式文件未找到,无法进行打印！请重新设置打印格式文件！', mtWarning, [mbOK], 0);
      Exit
    end;
    //先退纸
    TCommonUtil.printerBack(MainForm.systemConfig.printerBackRow);
    if preview then
    begin
      QueryDataModule.frxReport1.ShowReport(True)
    end
    else
    begin
      QueryDataModule.frxReport1.PrintOptions.Printer :=
        TCommonUtil.getIni.ReadString('system_set', 'printer', 'Default');
      QueryDataModule.frxReport1.PrintOptions.ShowDialog := False;
      QueryDataModule.frxReport1.PrepareReport(True);
      QueryDataModule.frxReport1.Print;
    end;
  end;
end;

class function TCommonUtil.BinToHexStr(s: string): string;
var i: integer;
  temp, r: string;
begin
  i := 1;
  r := '';
  while i < Length(s) do
  begin
    temp := Copy(s, i, 4);
    if temp = '0000' then
      r := r + '0'
    else if temp = '0000' then
      r := r + '1'
    else if temp = '0000' then
      r := r + '2'
    else if temp = '0000' then
      r := r + '3'
    else if temp = '0000' then
      r := r + '4'
    else if temp = '0000' then
      r := r + '5'
    else if temp = '0000' then
      r := r + '6'
    else if temp = '0000' then
      r := r + '7'
    else if temp = '0000' then
      r := r + '8'
    else if temp = '0000' then
      r := r + '9'
    else if temp = '0000' then
      r := r + 'A'
    else if temp = '0000' then
      r := r + 'B'
    else if temp = '0000' then
      r := r + 'C'
    else if temp = '0000' then
      r := r + 'D'
    else if temp = '0000' then
      r := r + 'E'
    else if temp = '0000' then
      r := r + 'F';
    i := i + 4;
  end;
  Result := r;
end;

class function TCommonUtil.HexStrToBin(s: string): string;
var i: integer;
  temp: string;
begin
  temp := '';
  for i := 1 to Length(s) do
  begin
    if s[i] = '0' then
      temp := temp + '0000'
    else if s[i] = '1' then
      temp := temp + '0001'
    else if s[i] = '2' then
      temp := temp + '0010'
    else if s[i] = '3' then
      temp := temp + '0011'
    else if s[i] = '4' then
      temp := temp + '0100'
    else if s[i] = '5' then
      temp := temp + '0101'
    else if s[i] = '6' then
      temp := temp + '0110'
    else if s[i] = '7' then
      temp := temp + '0111'
    else if s[i] = '8' then
      temp := temp + '1000'
    else if s[i] = '9' then
      temp := temp + '1001'
    else if UpperCase(s[i]) = 'A' then
      temp := temp + '1010'
    else if UpperCase(s[i]) = 'B' then
      temp := temp + '1011'
    else if UpperCase(s[i]) = 'C' then
      temp := temp + '1100'
    else if UpperCase(s[i]) = 'D' then
      temp := temp + '1101'
    else if UpperCase(s[i]) = 'E' then
      temp := temp + '1110'
    else if UpperCase(s[i]) = 'F' then
      temp := temp + '1111';
  end;
  Result := temp;
end;
 
class function TCommonUtil.getXmlData(glideNo: string): string;
var XMLDoc: TXMLDocument;
  node: IXMLNode;
  i: integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 流水号=:glideNo';
    Parameters.ParamByName('glideNo').Value := glideNo;
    Open;
    if not IsEmpty then
    begin
      XMLDoc := TXMLDocument.Create(nil);
      try
        XMLDoc.Active := true;
        XMLDoc.Version := '1.0';
        XMLDoc.Encoding := 'GBK';
        XMLDoc.AddChild('ATW');

        node := XMLDoc.CreateNode('WeightData');
        node.AttributeNodes.Add(XMLDoc.CreateNode('id', ntAttribute));
        node.SetAttribute('id', FieldByName('流水号').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('car', ntAttribute));
        node.SetAttribute('car', FieldByName('车号').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('oper', ntAttribute));
        node.SetAttribute('oper', FieldByName('操作员').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('FaHuo', ntAttribute));
        node.SetAttribute('faHuo', FieldByName('发货单位').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('ShouHuo', ntAttribute));
        node.SetAttribute('shouHuo', FieldByName('收货单位').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Goods', ntAttribute));
        node.SetAttribute('goods', FieldByName('货名').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Spec', ntAttribute));
        node.SetAttribute('spec', FieldByName('规格').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Gross', ntAttribute));
        node.SetAttribute('gross', FieldByName('毛重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Tare', ntAttribute));
        node.SetAttribute('tare', FieldByName('空重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Net', ntAttribute));
        node.SetAttribute('net', FieldByName('净重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Bundle', ntAttribute));
        node.SetAttribute('bundle', FieldByName('扣重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Real', ntAttribute));
        node.SetAttribute('real', FieldByName('实重').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('price', ntAttribute));
        node.SetAttribute('price', FieldByName('单价').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('sum', ntAttribute));
        node.SetAttribute('sum', FieldByName('金额').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('weightman', ntAttribute));
        node.SetAttribute('weightman', FieldByName('过磅员').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('GrossTime', ntAttribute));
        node.SetAttribute('grossTime', FieldByName('毛重时间').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('EmptyTime', ntAttribute));
        node.SetAttribute('tareTime', FieldByName('空重时间').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('Remark', ntAttribute));
        node.SetAttribute('remark', FieldByName('备注').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup1', ntAttribute));
        node.SetAttribute('backup1', FieldByName('备用1').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup2', ntAttribute));
        node.SetAttribute('backup2', FieldByName('备用2').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup3', ntAttribute));
        node.SetAttribute('backup3', FieldByName('备用3').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup4', ntAttribute));
        node.SetAttribute('backup4', FieldByName('备用4').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup5', ntAttribute));
        node.SetAttribute('backup5', FieldByName('备用5').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup6', ntAttribute));
        node.SetAttribute('backup6', FieldByName('备用6').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup7', ntAttribute));
        node.SetAttribute('backup7', FieldByName('备用7').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup8', ntAttribute));
        node.SetAttribute('backup8', FieldByName('备用8').AsString);
        node.AttributeNodes.Add(XMLDoc.CreateNode('backup9', ntAttribute));
        node.SetAttribute('backup9', FieldByName('备用9').AsString);
        XMLDoc.DocumentElement.ChildNodes.Add(node);
        for i := 0 to XMLDoc.XML.Count - 1 do
        begin
          Result := Result + XMLDoc.XML.Strings[i];
        end;
      finally
        //XMLDoc.Free;
      end;
    end;
  end;
end;

class function TCommonUtil.saveFile(dir, desc, ext: string): string;
var od: TSaveDialog;
begin
  od := TSaveDialog.Create(nil);
  try
    od.InitialDir := dir;
    od.Filter := desc + '(*.' + Ext + ')|*.' + ext;
    od.FileName := '';
    if od.Execute then
    begin
      Result := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

class function TCommonUtil.base64(s: string): string;
var
  encode: TIdEncoderMIME;
begin
  encode := TIdEncoderMIME.Create(nil);
  try
    result := encode.EncodeString(s);
  finally
    encode.Free;
  end;
end;

class function TCommonUtil.compressAndBase64(s: string): string;
begin
  Result := base64(ZCompressStr(s));
end;

class function TCommonUtil.deBase64(s: string): string;
var
  decode: TIdDecoderMIME;
begin
  if Length(s) mod 2 <> 0 then //字符串长度是2的倍数才能解码
  begin
    result := '';
    exit;
  end;
  decode := TIdDecoderMIME.Create(nil);
  try
    result := decode.DecodeString(s);
  finally
    decode.Free;
  end;
end;

class function TCommonUtil.deBase64AndDecompress(s: string): string;
begin
  Result := ZDeCompressStr(DeBase64(s));
end;

class function TCommonUtil.md5(s: string): string;
var
  md5: TIdHashMessageDigest5;
begin
  md5 := TIdHashMessageDigest5.Create;
  try
    result := md5.AsHex(md5.HashValue(s));
  finally
    md5.Free;
  end;
end;

class function TCommonUtil.openFileDialog(ext, filter,
  initialDir: string): string;
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  try
    od.DefaultExt := ext;
    od.FileName := '';
    od.Filter := filter;
    if initialDir = '' then
      od.InitialDir := ExtractFilePath(ParamStr(0))
    else
      od.InitialDir := initialDir;
    if od.Execute then
      Result := od.FileName;
  finally
    od.Free;
  end;
end;

class function TCommonUtil.saveFileDialog(ext, filter,
  initialDir: string): string;
var sd: TSaveDialog;
begin
  sd := TSaveDialog.Create(nil);
  try
    sd.DefaultExt := ext;
    sd.FileName := '';
    sd.Filter := filter;
    if initialDir = '' then
      sd.InitialDir := ExtractFilePath(ParamStr(0))
    else
      sd.InitialDir := initialDir;
    sd.Options := sd.Options + [ofOverwritePrompt];
    if sd.Execute then
    begin
      Result := sd.FileName;
    end;
  finally
    sd.Free;
  end;
end;

class function TDBCommonUtil.clearBackRecord: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_back_record';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearBackup1: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用1';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearBackup2: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用2';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearBackup3: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用3';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearBackup4: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用4';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearBackup5: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 备用5';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearCar: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 车号';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearFaHuo: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 发货单位';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearGoods: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 货名';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearLog: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 日志';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearShouHuo: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 收货单位';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearSpec: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 规格';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearTao: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from 套表';
    ExecSQL;
  end;
end;

class function TDBCommonUtil.clearUserInfo: Boolean;
begin
  with QueryDataModule.DBConnection do
  begin
    BeginTrans;
    try
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'delete from 用户信息';
        ExecSQL;

        SQL.Clear;
        SQL.Add('INSERT INTO 用户信息 (用户名, 密码, 打印报表, '
          + '修改磅单, 用户管理, 数据备份, 数据维护, 预置维护, 数据导出, '
          + '仪表设置, 打印磅单, 手工重量, 数库设置, 系统设置, 管理员) '
          + 'VALUES (''管理员'', ''202cb962ac59075b964b07152d234b70'', '
          + '1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)');
        SQL.Add('INSERT INTO 用户信息 (用户名, 密码, 打印报表, '
          + '修改磅单, 用户管理, 数据备份, 数据维护, 预置维护, 数据导出, '
          + '仪表设置, 打印磅单, 手工重量, 数库设置, 系统设置, 管理员) '
          + 'VALUES (''过磅员'', ''202cb962ac59075b964b07152d234b70'', '
          + '1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
        ExecSQL;
      end;
      CommitTrans;
    except
      RollbackTrans;
    end;
  end;
end;

class function TDBCommonUtil.clearWeightInfo: Boolean;
begin
  with QueryDataModule.DBConnection do
  begin
    BeginTrans;
    try
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Text := 'delete from 称重信息 where 流水号<>''''';
        ExecSQL;

        SQL.Text := 'delete from tbl_weight_img';
        ExecSQL;
      end;
      CommitTrans;
    except
      RollbackTrans;
    end;
  end;
end;

class function TDBCommonUtil.TableExists(tn: string): boolean;
var
  i: Integer;
  TableNames: TStringList;
begin
  TableNames := TStringList.Create;
  try
    result := false;
    with QueryDataModule do
    begin
      DBConnection.GetTableNames(TableNames);
      for i := 0 to TableNames.count - 1 do
        if TableNames.Strings[i] = tn then
        begin
          result := True;
          break;
        end;
    end;
  finally
    TableNames.Free;
  end;
end;

class function TDBCommonUtil.ImportExcel(f: string): Boolean;
var excelApp: Variant;
  i, rowCount: Integer;
  w: TWeightRecord;
  tmp: string;
begin
  excelApp := CreateOleObject('Excel.Application');
  try
    excelApp.Visible := False;
    excelApp.WorkBooks.Open(f);
    excelApp.WorkSheets[1].Activate;
    rowCount := excelApp.WorkSheets[1].UsedRange.Rows.Count;
    if excelApp.WorkSheets[1].UsedRange.Columns.Count < 29 then
    begin
      Application.MessageBox('Excel表列数不足,无法导入!', '错误', MB_OK +
        MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
      Result := False;
      Exit;
    end;
    w := TWeightRecord.Create;
    try
      for i := 2 to rowCount do
      begin
        w.glideNo := ''; //excelApp.Cells[i, 1].Value;
        w.carNo := LeftStr(VarToStr(excelApp.Cells[i, 2].Value), 50);
        w.oper := LeftStr(VarToStr(excelApp.Cells[i, 3].Value), 50);
        w.faHuo := LeftStr(VarToStr(excelApp.Cells[i, 4].Value), 50);
        w.shouHuo := LeftStr(VarToStr(excelApp.Cells[i, 5].Value), 50);
        w.goods := LeftStr(VarToStr(excelApp.Cells[i, 6].Value), 50);
        w.spec := LeftStr(VarToStr(excelApp.Cells[i, 7].Value), 50);
        w.gross := StrToFloatDef(excelApp.Cells[i, 8].Value, 0);
        w.tare := StrToFloatDef(excelApp.Cells[i, 9].Value, 0);
        w.net := StrToFloatDef(excelApp.Cells[i, 10].Value, 0);
        w.bundle := StrToFloatDef(excelApp.Cells[i, 11].Value, 0);
        w.real := StrToFloatDef(excelApp.Cells[i, 12].Value, 0);
        w.price := StrToFloatDef(excelApp.Cells[i, 13].Value, 0);
        w.sum := StrToFloatDef(excelApp.Cells[i, 14].Value, 0);
        w.cost := StrToFloatDef(excelApp.Cells[i, 15].Value, 0);
        w.scaleMan := LeftStr(VarToStr(excelApp.Cells[i, 16].Value), 50);

        tmp := VarToStr(excelApp.Cells[i, 17].Value);
        if tmp <> '' then
          w.grossTime := StrToDateTime(tmp);

        tmp := VarToStr(excelApp.Cells[i, 18].Value);
        if tmp <> '' then
          w.tareTime := StrToDateTime(tmp);

        w.memo := LeftStr(VarToStr(excelApp.Cells[i, 19].Value), 50);
        w.upload := excelApp.Cells[i, 20].Value;
        w.backup1 := LeftStr(VarToStr(excelApp.Cells[i, 21].Value), 50);
        w.backup2 := LeftStr(VarToStr(excelApp.Cells[i, 22].Value), 50);
        w.backup3 := LeftStr(VarToStr(excelApp.Cells[i, 23].Value), 50);
        w.backup4 := LeftStr(VarToStr(excelApp.Cells[i, 24].Value), 50);
        w.backup5 := LeftStr(VarToStr(excelApp.Cells[i, 25].Value), 50);
        w.backup6 := StrToFloatDef(excelApp.Cells[i, 26].Value, 0);
        w.backup7 := StrToFloatDef(excelApp.Cells[i, 27].Value, 0);
        w.backup8 := StrToFloatDef(excelApp.Cells[i, 28].Value, 0);
        w.backup9 := StrToFloatDef(excelApp.Cells[i, 29].Value, 0);
        TWeightUtil.save(w);
        DataQueryForm.ProgressBar1.StepIt;
        Application.ProcessMessages;
      end;
    finally
      w.Free;
    end;
  finally
    ExcelApp.WorkBooks.Close; //关闭工作簿
    ExcelApp.Quit; //退出 Excel
    ExcelApp := Unassigned; //释放excel进程
  end;
end;

class function TCommonUtil.modbusAsciiCheck(const str: string): string;
var s: string;
  i, r: Integer;
begin
  s := '';
  for i := 1 to Length(str) do
  begin
    if str[i] in ['0'..'9', 'A'..'F', 'a'..'f'] then
      s := s + str[i];
  end;
  i := 1;
  r := 0;
  while i < Length(s) do
  begin
    r := r + StrToInt('$' + Copy(s, i, 2));
    i := i + 2;
  end;
  Result := str + RightStr(IntToHex((not r) + 1, 2), 2);
end;

class function TCommonUtil.modbusFloatValue(const str: string): Double;
var positive, zhishu: Integer;
  weishu: Double;
  tmp: Integer;
begin
  tmp := StrToInt('$' + str);
  positive := tmp and $80000000 shr 31;
  zhishu := tmp and $7F800000 shr 23 - 127;
  weishu := tmp and $007FFFFF / Power(2, 23) + 1;
  if positive = 0 then
    Result := weishu * Power(2, zhishu)
  else
    Result := 0 - weishu * Power(2, zhishu);
end;

class function TCommonUtil.printerBack(step: Double): Boolean;
var
  lpt: TextFile;
  inch, i: Integer;
begin
  //厘米转为英寸
  inch := Trunc(step / 2.54 * 180);
  if inch <= 0 then
    Exit;
  AssignFile(lpt, 'LPT1');
  for i := 0 to inch div 255 do
  begin
    inch := inch - i * 255;
    ReWrite(lpt);
    //进纸Esc+J+n,退纸Esc+j+n
    Write(lpt, #27#106 + Chr(inch));
  end;
  CloseFile(lpt);
end;

end.

