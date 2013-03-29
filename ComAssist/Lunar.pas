unit Lunar;

interface

uses SysUtils;

type TCNDate = Cardinal;

function DecodeGregToCNDate(dtGreg: TDateTime): TCNDate;
function GetGregDateFromCN(cnYear, cnMonth, cnDay: word; bLeap: Boolean = False): TDateTime;
function GregDateToCNStr(dtGreg: TDateTime): string;
function isCNLeap(cnDate: TCNDate): Boolean;

implementation

const cstDateOrg: Integer = 32900; //公历1990-01-27的TDateTime表示 对应农历1990-01-01
const cstCNYearOrg = 1990;
const cstCNTable: array[cstCNYearOrg..cstCNYearOrg + 60] of word = (//   unsigned 16-bit
    24402, 3730, 3366, 13614, 2647, 35542, 858, 1749, //1997
    23401, 1865, 1683, 19099, 1323, 2651, 10926, 1386, //2005
    32213, 2980, 2889, 23891, 2709, 1325, 17757, 2741, //2013
    39850, 1490, 3493, 61098, 3402, 3221, 19102, 1366, //2021
    2773, 10970, 1746, 26469, 1829, 1611, 22103, 3243, //2029
    1370, 13678, 2902, 48978, 2898, 2853, 60715, 2635, //2037
    1195, 21179, 1453, 2922, 11690, 3474, 32421, 3365, //2045
    2645, 55901, 1206, 1461, 14038); //2050
  //建表方法：
  // 0101 111101010010     高四位是闰月位置,后12位表示大小月,大月30天,小月29天,
  //闰月一般算小月,但是有三个特例2017/06,2036/06,2047/05
  //对于特例则高四位的闰月位置表示法中的最高为设置为1 特殊处理用wLeapNormal变量
  // //2017/06 28330->61098 2036/06 27947->60715 2047/05 23133->55901

  //如果希望用汇编,这里有一条信息:农历不会滞后公历2个月.
  //将公历转换为农历
  //返回:12位年份+4位月份+5位日期

function DecodeGregToCNDate(dtGreg: TDateTime): TCNDate;
var
  iDayLeave: Integer;
  wYear, wMonth, wDay: word;
  i, j: Integer;
  wBigSmallDist, wLeap, wCount, wLeapShift: word;
label OK;
begin
  result := 0;
  iDayLeave := Trunc(dtGreg) - cstDateOrg;
  DecodeDate(IncMonth(dtGreg, -1), wYear, wMonth, wDay);
  if (iDayLeave < 0) or (iDayLeave > 22295) then
    Exit;
  //Raise Exception.Create('目前只能算1990-01-27以后的');
  //Raise Exception.Create('目前只能算2051-02-11以前的');
  for i := Low(cstCNTable) to High(cstCNTable) do
  begin
    wBigSmallDist := cstCNTable[i];
    wLeap := wBigSmallDist shr 12;
    if wLeap > 12 then
    begin
      wLeap := wLeap and 7;
      wLeapShift := 1;
    end
    else
      wLeapShift := 0;
    for j := 1 to 12 do
    begin
      wCount := (wBigSmallDist and 1) + 29;
      if j = wLeap then
        wCount := wCount - wLeapShift;
      if iDayLeave < wCount then
      begin
        result := (i shl 9) + (j shl 5) + iDayLeave + 1;
        Exit;
      end;
      iDayLeave := iDayLeave - wCount;
      if j = wLeap then
      begin
        wCount := 29 + wLeapShift;
        if iDayLeave < wCount then
        begin
          result := (i shl 9) + (j shl 5) + iDayLeave + 1 + (1 shl 21);
          Exit;
        end;
        iDayLeave := iDayLeave - wCount;
      end;
      wBigSmallDist := wBigSmallDist shr 1;
    end;
  end;
  //返回值:
  // 1位闰月标志 + 12位年份+4位月份+5位日期             (共22位)
end;

function isCNLeap(cnDate: TCNDate): Boolean;
begin
  result := (cnDate and $200000) <> 0;
end;

function GetGregDateFromCN(cnYear, cnMonth, cnDay: word; bLeap: Boolean = False): TDateTime;
var
  i, j: Integer;
  DayCount: Integer;
  wBigSmallDist, wLeap, wLeapShift: word;
begin
  // 0101 010010101111     高四位是闰月位置,后12位表示大小月,大月30天,小月29天,
  DayCount := 0;
  if (cnYear < 1990) or (cnYear > 2050) then
  begin
    result := 0;
    Exit;
  end;
  for i := cstCNYearOrg to cnYear - 1 do
  begin
    wBigSmallDist := cstCNTable[i];
    if (wBigSmallDist and $F000) <> 0 then
      DayCount := DayCount + 29;
    DayCount := DayCount + 12 * 29;
    for j := 1 to 12 do
    begin
      DayCount := DayCount + wBigSmallDist and 1;
      wBigSmallDist := wBigSmallDist shr 1;
    end;
  end;
  wBigSmallDist := cstCNTable[cnYear];
  wLeap := wBigSmallDist shr 12;
  if wLeap > 12 then
  begin
    wLeap := wLeap and 7;
    wLeapShift := 1; //大月在闰月.
  end
  else
    wLeapShift := 0;
  for j := 1 to cnMonth - 1 do
  begin
    DayCount := DayCount + (wBigSmallDist and 1) + 29;
    if j = wLeap then
      DayCount := DayCount + 29;
    wBigSmallDist := wBigSmallDist shr 1;
  end;
  if bLeap and (cnMonth = wLeap) then //是要闰月的吗?
    DayCount := DayCount + 30 - wLeapShift;
  result := cstDateOrg + DayCount + cnDay - 1;
end;

//将日期显示成农历字符串.

function GregDateToCNStr(dtGreg: TDateTime): string;
const hzNumber: array[0..10] of string = ('零', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
  function ConvertYMD(Number: word; YMD: word): string;
  var
    wTmp: word;
  begin
    result := '';
    if YMD = 1 then
    begin //年份
      while Number > 0 do
      begin
        result := hzNumber[Number mod 10] + result;
        Number := Number div 10;
      end;
      Exit;
    end;
    if Number <= 10 then
    begin //可只用1位
      if YMD = 2 then //月份
        result := hzNumber[Number]
      else //天
        result := '初' + hzNumber[Number];
      Exit;
    end;
    wTmp := Number mod 10; //个位
    if wTmp <> 0 then
      result := hzNumber[wTmp];
    wTmp := Number div 10; //十位
    result := '十' + result;
    if wTmp > 1 then
      result := hzNumber[wTmp] + result;
  end;
var
  cnYear, cnMonth, cnDay: word;
  cnDate: TCNDate;
  strLeap: string;
begin
  cnDate := DecodeGregToCNDate(dtGreg);
  if cnDate = 0 then
  begin
    result := '输入越界';
    Exit;
  end;
  cnDay := cnDate and $1F;
  cnMonth := (cnDate shr 5) and $F;
  cnYear := (cnDate shr 9) and $FFF;
  //测试第22位,为1表示闰月
  if isCNLeap(cnDate) then
    strLeap := '(闰)'
  else
    strLeap := '';
  result := ConvertYMD(cnYear, 1) + '年' + ConvertYMD(cnMonth, 2) + '月'
    + strLeap + ConvertYMD(cnDay, 3);
end;

end.
