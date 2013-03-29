unit Lunar2;

interface

uses
  Windows, SysUtils;
const
  START_YEAR = 1901;
  END_YEAR = 2050;

  //返回iYear年iMonth月的天数 1年1月 --- 65535年12月

function MonthDays(iYear, iMonth: word): word;

//返回阴历iLunarYer年阴历iLunarMonth月的天数，如果iLunarMonth为闰月，
//高字为第二个iLunarMonth月的天数，否则高字为0 1901年1月---2050年12月
function LunarMonthDays(iLunarYear, iLunarMonth: word): Longword;

//返回阴历iLunarYear年的总天数 1901年1月---2050年12月
function LunarYearDays(iLunarYear: word): word;

//返回阴历iLunarYear年的闰月月份，如没有返回0 1901年1月---2050年12月
function GetLeapMonth(iLunarYear: word): word;

//把iYear年格式化成天干记年法表示的字符串
procedure FormatLunarYear(iYear: word; var pBuffer: string); overload;
function FormatLunarYear(iYear: word): string; overload;

//把iMonth格式化成中文字符串
procedure FormatMonth(iMonth: word; var pBuffer: string; bLunar: Boolean = True); overload;
function FormatMonth(iMonth: word; bLunar: Boolean = True): string; overload;

//把iDay格式化成中文字符串
procedure FormatLunarDay(iDay: word; var pBuffer: string); overload;
function FormatLunarDay(iDay: word): string; overload;

//计算公历两个日期间相差的天数 1年1月1日 --- 65535年12月31日
function CalcDateDiff(iEndYear, iEndMonth, iEndDay: word; iStartYear: word = START_YEAR; iStartMonth: word = 1; iStartDay: word = 1): Longword; overload;
function CalcDateDiff(EndDate, StartDate: TDateTime): Longword; overload;

//计算公历iYear年iMonth月iDay日对应的阴历日期,返回对应的阴历节气 0-24
//1901年1月1日---2050年12月31日

function GetLunarHolDay(InDate: TDateTime): string; overload;
function GetLunarHolDay(iYear, iMonth, iDay: word): string; overload;

//private function--------------------------------------

//计算从1901年1月1日过iSpanDays天后的阴历日期
procedure l_CalcLunarDate(var iYear, iMonth, iDay: word; iSpanDays: Longword);

//计算公历iYear年iMonth月iDay日对应的节气 0-24，0表不是节气
function l_GetLunarHolDay(iYear, iMonth, iDay: word): word;

implementation

var
  //数组gLunarDay存入阴历1901年到2100年每年中的月天数信息，
  //阴历每月只能是29或30天，一年用12（或13）个二进制位表示，对应位为1表30天，否则为29天
  gLunarMonthDay: array[0..149] of word = (
    //测试数据只有1901.1.1 --2050.12.31
    $4AE0, $A570, $5268, $D260, $D950, $6AA8, $56A0, $9AD0, $4AE8, $4AE0, //1910
    $A4D8, $A4D0, $D250, $D548, $B550, $56A0, $96D0, $95B0, $49B8, $49B0, //1920
    $A4B0, $B258, $6A50, $6D40, $ADA8, $2B60, $9570, $4978, $4970, $64B0, //1930
    $D4A0, $EA50, $6D48, $5AD0, $2B60, $9370, $92E0, $C968, $C950, $D4A0, //1940
    $DA50, $B550, $56A0, $AAD8, $25D0, $92D0, $C958, $A950, $B4A8, $6CA0, //1950
    $B550, $55A8, $4DA0, $A5B0, $52B8, $52B0, $A950, $E950, $6AA0, $AD50, //1960
    $AB50, $4B60, $A570, $A570, $5260, $E930, $D950, $5AA8, $56A0, $96D0, //1970
    $4AE8, $4AD0, $A4D0, $D268, $D250, $D528, $B540, $B6A0, $96D0, $95B0, //1980
    $49B0, $A4B8, $A4B0, $B258, $6A50, $6D40, $ADA0, $AB60, $9370, $4978, //1990
    $4970, $64B0, $6A50, $EA50, $6B28, $5AC0, $AB60, $9368, $92E0, $C960, //2000
    $D4A8, $D4A0, $DA50, $5AA8, $56A0, $AAD8, $25D0, $92D0, $C958, $A950, //2010
    $B4A0, $B550, $B550, $55A8, $4BA0, $A5B0, $52B8, $52B0, $A930, $74A8, //2020
    $6AA0, $AD50, $4DA8, $4B60, $9570, $A4E0, $D260, $E930, $D530, $5AA0, //2030
    $6B50, $96D0, $4AE8, $4AD0, $A4D0, $D258, $D250, $D520, $DAA0, $B5A0, //2040
    $56D0, $4AD8, $49B0, $A4B8, $A4B0, $AA50, $B528, $6D20, $ADA0, $55B0); //2050

  //数组gLanarMonth存放阴历1901年到2050年闰月的月份，如没有则为0，每字节存两年
  gLunarMonth: array[0..74] of byte = (
    $00, $50, $04, $00, $20, //1910
    $60, $05, $00, $20, $70, //1920
    $05, $00, $40, $02, $06, //1930
    $00, $50, $03, $07, $00, //1940
    $60, $04, $00, $20, $70, //1950
    $05, $00, $30, $80, $06, //1960
    $00, $40, $03, $07, $00, //1970
    $50, $04, $08, $00, $60, //1980
    $04, $0A, $00, $60, $05, //1990
    $00, $30, $80, $05, $00, //2000
    $40, $02, $07, $00, $50, //2010
    $04, $09, $00, $60, $04, //2020
    $00, $20, $60, $05, $00, //2030
    $30, $B0, $06, $00, $50, //2040
    $02, $07, $00, $50, $03); //2050

  //数组gLanarHoliDay存放每年的二十四节气对应的阳历日期
  //每年的二十四节气对应的阳历日期几乎固定，平均分布于十二个月中
  // 1月 2月 3月 4月 5月 6月
  //小寒 大寒 立春 雨水 惊蛰 春分 清明 谷雨 立夏 小满 芒种 夏至
  // 7月 8月 9月 10月 11月 12月
  //小暑 大暑 立秋 处暑 白露 秋分 寒露 霜降 立冬 小雪 大雪 冬至
  {*********************************************************************************
   节气无任何确定规律,所以只好存表,要节省空间,所以....
  **********************************************************************************}
  //数据格式说明:
  //如1901年的节气为
  // 1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月
  // 6, 21, 4, 19, 6, 21, 5, 21, 6,22, 6,22, 8, 23, 8, 24, 8, 24, 8, 24, 8, 23, 8, 22
  // 9, 6, 11,4, 9, 6, 10,6, 9,7, 9,7, 7, 8, 7, 9, 7, 9, 7, 9, 7, 8, 7, 15
  //上面第一行数据为每月节气对应日期,15减去每月第一个节气,每月第二个节气减去15得第二行
  // 这样每月两个节气对应数据都小于16,每月用一个字节存放,高位存放第一个节气数据,低位存放
  //第二个节气的数据,可得下表
  gLunarHolDay: array[0..1799] of byte = (
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1901
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, //1902
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, //1903
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, //1904
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1905
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1906
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, //1907
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1908
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1909
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1910
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, //1911
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1912
    $95, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1913
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, //1914
    $96, $A5, $97, $96, $97, $87, $79, $79, $69, $69, $78, $78, //1915
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1916
    $95, $B4, $96, $A6, $96, $97, $78, $79, $78, $69, $78, $87, //1917
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $77, //1918
    $96, $A5, $97, $96, $97, $87, $79, $79, $69, $69, $78, $78, //1919
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1920
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $87, //1921
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $77, //1922
    $96, $A4, $96, $96, $97, $87, $79, $79, $69, $69, $78, $78, //1923
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1924
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $87, //1925
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1926
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, //1927
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1928
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1929
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1930
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, //1931
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1932
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1933
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1934
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1935
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1936
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1937
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1938
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1939
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1940
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1941
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1942
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1943
    $96, $A5, $96, $A5, $A6, $96, $88, $78, $78, $78, $87, $87, //1944
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1945
    $95, $B4, $96, $A6, $97, $97, $78, $79, $78, $69, $78, $77, //1946
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, //1947
    $96, $A5, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1948
    $A5, $B4, $96, $A5, $96, $97, $88, $79, $78, $79, $77, $87, //1949
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $77, //1950
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, //1951
    $96, $A5, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1952
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1953
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $68, $78, $87, //1954
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1955
    $96, $A5, $A5, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1956
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1957
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1958
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1959
    $96, $A4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1960
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1961
    $96, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1962
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1963
    $96, $A4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1964
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1965
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1966
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1967
    $96, $A4, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1968
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1969
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1970
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1971
    $96, $A4, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1972
    $A5, $B5, $96, $A5, $A6, $96, $88, $78, $78, $78, $87, $87, //1973
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1974
    $96, $B4, $96, $A6, $97, $97, $78, $79, $78, $69, $78, $77, //1975
    $96, $A4, $A5, $B5, $A6, $A6, $88, $89, $88, $78, $87, $87, //1976
    $A5, $B4, $96, $A5, $96, $96, $88, $88, $78, $78, $87, $87, //1977
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, //1978
    $96, $B4, $96, $A6, $96, $97, $78, $79, $78, $69, $78, $77, //1979
    $96, $A4, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1980
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $77, $87, //1981
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1982
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $77, //1983
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //1984
    $A5, $B4, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1985
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1986
    $95, $B4, $96, $A5, $96, $97, $88, $79, $78, $69, $78, $87, //1987
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //1988
    $A5, $B4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1989
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, //1990
    $95, $B4, $96, $A5, $86, $97, $88, $78, $78, $69, $78, $87, //1991
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //1992
    $A5, $B3, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1993
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1994
    $95, $B4, $96, $A5, $96, $97, $88, $76, $78, $69, $78, $87, //1995
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //1996
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1997
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1998
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1999
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2000
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2001
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //2002
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //2003
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2004
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2005
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2006
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //2007
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $87, $78, $87, $86, //2008
    $A5, $B3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2009
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2010
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, //2011
    $96, $B4, $A5, $B5, $A5, $A6, $87, $88, $87, $78, $87, $86, //2012
    $A5, $B3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //2013
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2014
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //2015
    $95, $B4, $A5, $B4, $A5, $A6, $87, $88, $87, $78, $87, $86, //2016
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //2017
    $A5, $B4, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2018
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, //2019
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $86, //2020
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2021
    $A5, $B4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //2022
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, //2023
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2024
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2025
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2026
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //2027
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2028
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2029
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2030
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //2031
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2032
    $A5, $C3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $86, //2033
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $78, $88, $78, $87, $87, //2034
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2035
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2036
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2037
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2038
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2039
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2040
    $A5, $C3, $A5, $B5, $A5, $A6, $87, $88, $87, $78, $87, $86, //2041
    $A5, $B3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2042
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2043
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $88, $87, $96, //2044
    $A5, $C3, $A5, $B4, $A5, $A6, $87, $88, $87, $78, $87, $86, //2045
    $A5, $B3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //2046
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2047
    $95, $B4, $A5, $B4, $A5, $A5, $97, $87, $87, $88, $86, $96, //2048
    $A4, $C3, $A5, $A5, $A5, $A6, $97, $87, $87, $78, $87, $86, //2049
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $78, $78, $87, $87); //2050


function IsLeapYear(AYear: Integer): Boolean;
begin
  result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function MonthDays(iYear, iMonth: word): word;
begin
  case iMonth of
    1, 3, 5, 7, 8, 10, 12: result := 31;
    4, 6, 9, 11: result := 30;
    2: //如果是闰年
      if IsLeapYear(iYear) then
        result := 29
      else
        result := 28
    else
      result := 0;
  end;
end;

function GetLeapMonth(iLunarYear: word): word;
var
  Flag: byte;
begin
  Flag := gLunarMonth[(iLunarYear - START_YEAR) div 2];
  if (iLunarYear - START_YEAR) mod 2 = 0 then
    result := Flag shr 4
  else
    result := Flag and $0F;
end;

function LunarMonthDays(iLunarYear, iLunarMonth: word): Longword;
var
  Height, Low: word;
  iBit: Integer;
begin
  if iLunarYear < START_YEAR then
  begin
    result := 30;
    Exit;
  end;
  Height := 0;
  Low := 29;
  iBit := 16 - iLunarMonth;
  if (iLunarMonth > GetLeapMonth(iLunarYear)) and (GetLeapMonth(iLunarYear) > 0) then
    Dec(iBit);
  if (gLunarMonthDay[iLunarYear - START_YEAR] and (1 shl iBit)) > 0 then
    inc(Low);
  if iLunarMonth = GetLeapMonth(iLunarYear) then
    if (gLunarMonthDay[iLunarYear - START_YEAR] and (1 shl (iBit - 1))) > 0 then
      Height := 30
    else
      Height := 29;
  //Result := MakeLong(Low, Height);
end;

function LunarYearDays(iLunarYear: word): word;
var
  Days, i: word;
  tmp: Longword;
begin
  Days := 0;
  for i := 1 to 12 do
  begin
    tmp := LunarMonthDays(iLunarYear, i);
    Days := Days + HiWord(tmp);
    Days := Days + LoWord(tmp);
  end;
  result := Days;
end;

procedure FormatLunarYear(iYear: word; var pBuffer: string);
var
  szText1, szText2, szText3: string;
begin
  szText1 := '甲乙丙丁戊己庚辛壬癸';
  szText2 := '子丑寅卯辰巳午未申酉戌亥';
  szText3 := '鼠牛虎免龙蛇马羊猴鸡狗猪';
  pBuffer := Copy(szText1, ((iYear - 4) mod 10) * 2 + 1, 2);
  pBuffer := pBuffer + Copy(szText2, ((iYear - 4) mod 12) * 2 + 1, 2);
  pBuffer := pBuffer + ' ';
  pBuffer := pBuffer + Copy(szText3, ((iYear - 4) mod 12) * 2 + 1, 2);
  pBuffer := pBuffer + '年';
end;

function FormatLunarYear(iYear: word): string;
var
  pBuffer: string;
begin
  FormatLunarYear(iYear, pBuffer);
  result := pBuffer;
end;

procedure FormatMonth(iMonth: word; var pBuffer: string; bLunar: Boolean);
var
  szText: string;
begin
  if (not bLunar) and (iMonth = 1) then
  begin
    pBuffer := ' 一月';
    Exit;
  end;
  szText := '正二三四五六七八九十';
  if iMonth <= 10 then
  begin
    pBuffer := ' ';
    pBuffer := pBuffer + Copy(szText, (iMonth - 1) * 2 + 1, 2);
    pBuffer := pBuffer + '月';
    Exit;
  end;
  if iMonth = 11 then
    pBuffer := '十一'
  else
    pBuffer := '十二';
  pBuffer := pBuffer + '月';
end;

function FormatMonth(iMonth: word; bLunar: Boolean): string;
var
  pBuffer: string;
begin
  FormatMonth(iMonth, pBuffer, bLunar);
  result := pBuffer;
end;

procedure FormatLunarDay(iDay: word; var pBuffer: string);
var
  szText1, szText2: string;
begin
  szText1 := '初十廿三';
  szText2 := '一二三四五六七八九十';
  if (iDay <> 20) and (iDay <> 30) then
  begin
    pBuffer := Copy(szText1, ((iDay - 1) div 10) * 2 + 1, 2);
    pBuffer := pBuffer + Copy(szText2, ((iDay - 1) mod 10) * 2 + 1, 2);
  end
  else
  begin
    pBuffer := Copy(szText1, (iDay div 10) * 2 + 1, 2);
    pBuffer := pBuffer + '十';
  end;
end;

function FormatLunarDay(iDay: word): string;
var
  pBuffer: string;
begin
  FormatLunarDay(iDay, pBuffer);
  result := pBuffer;
end;

function CalcDateDiff(iEndYear, iEndMonth, iEndDay: word; iStartYear: word; iStartMonth: word; iStartDay: word): Longword;
begin
  result := Trunc(EncodeDate(iEndYear, iEndMonth, iEndDay) - EncodeDate(iStartYear, iStartMonth, iStartDay));
end;

function CalcDateDiff(EndDate, StartDate: TDateTime): Longword;
begin
  result := Trunc(EndDate - StartDate);
end;

procedure l_CalcLunarDate(var iYear, iMonth, iDay: word; iSpanDays: Longword);
var
  tmp: Longword;
begin
  //阳历1901年2月19日为阴历1901年正月初一
  //阳历1901年1月1日到2月19日共有49天
  if iSpanDays < 49 then
  begin
    iYear := START_YEAR - 1;
    if iSpanDays < 19 then
    begin
      iMonth := 11;
      iDay := 11 + word(iSpanDays);
    end
    else
    begin
      iMonth := 12;
      iDay := word(iSpanDays) - 18;
    end;
    Exit;
  end;
  //下面从阴历1901年正月初一算起
  iSpanDays := iSpanDays - 49;
  iYear := START_YEAR;
  iMonth := 1;
  iDay := 1;
  //计算年
  tmp := LunarYearDays(iYear);
  while iSpanDays >= tmp do
  begin
    iSpanDays := iSpanDays - tmp;
    inc(iYear);
    tmp := LunarYearDays(iYear);
  end;
  //计算月
  tmp := LoWord(LunarMonthDays(iYear, iMonth));
  while iSpanDays >= tmp do
  begin
    iSpanDays := iSpanDays - tmp;
    if iMonth = GetLeapMonth(iYear) then
    begin
      tmp := HiWord(LunarMonthDays(iYear, iMonth));
      if iSpanDays < tmp then
        break;
      iSpanDays := iSpanDays - tmp;
    end;
    inc(iMonth);
    tmp := LoWord(LunarMonthDays(iYear, iMonth));
  end;
  //计算日
  iDay := iDay + word(iSpanDays);
end;

function l_GetLunarHolDay(iYear, iMonth, iDay: word): word;
var
  Flag: byte;
  Day: word;
begin
  Flag := gLunarHolDay[(iYear - START_YEAR) * 12 + iMonth - 1];
  if iDay < 15 then
    Day := 15 - ((Flag shr 4) and $0F)
  else
    Day := (Flag and $0F) + 15;
  if iDay = Day then
    if iDay > 15 then
      result := (iMonth - 1) * 2 + 2
    else
      result := (iMonth - 1) * 2 + 1
  else
    result := 0;
end;

function GetLunarHolDay(InDate: TDateTime): string;
var
  i, iYear, iMonth, iDay: word;
begin
  DecodeDate(InDate, iYear, iMonth, iDay);
  i := l_GetLunarHolDay(iYear, iMonth, iDay);
  case i of
    1: result := '小 寒';
    2: result := '大 寒';
    3: result := '立 春';
    4: result := '雨 水';
    5: result := '惊 蛰';
    6: result := '春 分';
    7: result := '清 明';
    8: result := '谷 雨';
    9: result := '立 夏';
    10: result := '小 满';
    11: result := '芒 种';
    12: result := '夏 至';
    13: result := '小 暑';
    14: result := '大 暑';
    15: result := '立 秋';
    16: result := '处 暑';
    17: result := '白 露';
    18: result := '秋 分';
    19: result := '寒 露';
    20: result := '霜 降';
    21: result := '立 冬';
    22: result := '小 雪';
    23: result := '大 雪';
    24: result := '冬 至';
  else
    l_CalcLunarDate(iYear, iMonth, iDay, CalcDateDiff(InDate, EncodeDate(START_YEAR, 1, 1)));
    result := trim(FormatMonth(iMonth) + FormatLunarDay(iDay));
  end;
end;

function GetLunarHolDay(iYear, iMonth, iDay: word): string;
begin
  result := GetLunarHolDay(EncodeDate(iYear, iMonth, iDay));
end;
end.
