unit PPI;

interface

uses
  Windows;

//S7-200 PPI类
type TPPI = class
  private
    str_write: string;
    Temp_FCS: integer;
    FAddr: integer;
    FDataType: integer;
    FDataLen: integer;
    FDataMode: integer;
    FDataAddr: integer;
    FDataValue: DWord;
    procedure SetAddr(const Value: integer);
    procedure SetDataAddr(const Value: integer);
    procedure SetDataLen(const Value: integer);
    procedure SetDataMode(const Value: integer);
    procedure SetDataType(const Value: integer);
    procedure SetDataValue(const Value: DWord);
  public
    function PLCLogin(): string;
    function PLCRun(): string;
    function PLCStop(): string;
    function PLCConfirm(): string;
    function PLCReadData(): string;
    function PLCWriteData(): string;
    function PLCEnforce(): string;
    function PLCReset(): string;
    property Addr: integer read FAddr write SetAddr; //PLC地址
    //数据区类型：0：S区；1：SM区；2：I区；3：Q区；4：M区；5：V区
    property DataType: integer read FDataType write SetDataType;
    //数据长度：0：字节；1：字：2：双字
    property DataMode: integer read FDataMode write SetDataMode;
    property DataAddr: integer read FDataAddr write SetDataAddr; // 数据地址
    property DataLen: integer read FDataLen write SetDataLen; // 数据长度
    property DataValue: DWord read FDataValue write SetDataValue; //要写入的数据值
  end;

implementation

{ TPPI }

function TPPI.PLCConfirm: string;
var i: integer;
begin
  SetLength(str_write, 6);
  str_write[1] := chr($10);
  str_write[2] := chr(Addr);
  str_write[3] := chr($00);
  str_write[4] := chr($5C);

  Temp_FCS := 0;
  for i := 2 to 4 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[5] := Chr(Temp_FCS mod 256);
  str_write[6] := chr($16);
  result := str_write;
end;

function TPPI.PLCEnforce: string;
var i: integer;
begin
  SetLength(str_write, 49);
  str_write[1] := chr($68);
  str_write[2] := chr($2B); //package len
  str_write[3] := chr($2B); //package len repeated
  str_write[4] := chr($68);
  str_write[5] := chr($02); //plc station no
  str_write[6] := chr($00); //pc default zero
  str_write[7] := chr($7C); //7c为强制

  str_write[8] := chr($32);
  str_write[9] := chr($07); //强制时为07,不知为何
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);

  str_write[13] := chr($14); //置位为1,复位为0A

  str_write[14] := chr($00);
  str_write[15] := chr($0C);
  str_write[16] := chr($00);
  str_write[17] := chr($12);
  str_write[18] := chr($00);
  str_write[19] := chr($01);
  str_write[20] := chr($12);
  str_write[21] := chr($08);
  str_write[22] := chr($12);
  str_write[23] := chr($48);
  str_write[24] := chr($0B);
  str_write[25] := chr($00);
  str_write[26] := chr($00);
  str_write[27] := chr($00);
  str_write[28] := chr($00);
  str_write[29] := chr($00);
  str_write[30] := chr($FF);
  str_write[31] := chr($09);
  str_write[32] := chr($00);
  str_write[33] := chr($0E);
  str_write[34] := chr($00);
  str_write[35] := chr($01);
  str_write[36] := Chr($10);
  str_write[37] := chr($01);
  str_write[38] := chr($00);
  str_write[39] := chr($01);
  str_write[40] := chr($00);

  if DataType = 8 then
    str_write[41] := chr($01) //v存储器
  else
    str_write[41] := chr($00); //其他
  case DataType of
    0: str_write[42] := chr($04); //S 区
    1: str_write[42] := chr($05); //SM 区
    2: str_write[42] := chr($06); //AI 区
    3: str_write[42] := chr($07); //AQ 区
    4: str_write[42] := chr($1E); //C 区
    5: str_write[42] := chr($81); //I 区
    6: str_write[42] := chr($82); //Q 区
    7: str_write[42] := chr($83); //M 区
    8: str_write[42] := chr($84); //V 区
    9: str_write[42] := chr($1F); //T 区
  end;

  str_write[43] := chr((DataAddr * 8 + Datalen) shr 16 and $FF);
  str_write[44] := chr((DataAddr * 8 + Datalen) shr 8 and $FF);
  str_write[45] := chr((DataAddr * 8 + Datalen) and $FF);

  str_write[46] := chr(01); //置位是01,复位是00

  str_write[47] := chr($00);

  Temp_FCS := 0;
  for i := 5 to 47 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[48] := Chr(Temp_FCS mod 256);
  str_write[49] := Chr($16);

  result := str_write;
end;

function TPPI.PLCLogin: string;
var i: integer;
begin
  SetLength(str_write, 6);
  str_write[1] := chr($10);
  str_write[2] := chr(Addr);
  str_write[3] := chr($00);
  str_write[4] := chr($49);

  Temp_FCS := 0;
  for i := 2 to 4 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[5] := Chr(Temp_FCS mod 256);
  str_write[6] := chr($16);
  result := str_write;
end;

function TPPI.PLCReadData: string;
var i: integer;
begin
  Setlength(str_write, 33);
  str_write[1] := chr($68); //开始定界符
  str_write[2] := chr($1B); //报文长度
  str_write[3] := chr($1B); //重复报文长度
  str_write[4] := chr($68); //开始定界符

  str_write[5] := chr(Addr); //PLC地址
  str_write[6] := chr($00); //计算机地址
  str_write[7] := chr($6C); //7c为强制

  str_write[8] := chr($32);
  str_write[9] := chr($01);
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);
  str_write[13] := chr($00);
  str_write[14] := chr($00);
  //數據塊占位字節，它指明數據塊占用的字節數。與數據塊數量有關，長度=4+數據塊數*10,
  //如：一條數據時為4+10=0E(H)；同時讀M,V,Q三個不同的數據塊時為4+3*10=22(H)。
  str_write[15] := chr($0E);
  str_write[16] := chr($00);
  str_write[17] := chr($00);

  str_write[18] := chr($04); //04读05写
  str_write[19] := chr($01); //读一位

  str_write[20] := chr($12);
  str_write[21] := chr($0A);
  str_write[22] := chr($10);

  str_write[23] := chr($02); //西门子总是以字节为单位

  str_write[24] := chr($00);
  case DataMode of
    0: str_write[25] := chr(DataLen); //读取数据区长度
    1: str_write[25] := chr(DataLen * 2); //读取数据区长度
    2: str_write[25] := chr(DataLen * 4); //读取数据区长度
  end;

  str_write[26] := chr($00);
  if DataType = 8 then
    str_write[27] := chr($01) //v存储器
  else
    str_write[27] := chr($00); //其他
  case DataType of
    0: str_write[28] := chr($04); //S 区
    1: str_write[28] := chr($05); //SM 区
    2: str_write[28] := chr($06); //AI 区
    3: str_write[28] := chr($07); //AQ 区
    4: str_write[28] := chr($1E); //C 区
    5: str_write[28] := chr($81); //I 区
    6: str_write[28] := chr($82); //Q 区
    7: str_write[28] := chr($83); //M 区
    8: str_write[28] := chr($84); //V 区
    9: str_write[28] := chr($1F); //T 区
  end;

  str_write[29] := chr($00);
  //数据地址,用两位来表示
  str_write[30] := chr(DataAddr * 8 and $FF00 shr 8);
  str_write[31] := chr(DataAddr * 8 and $00FF);

  Temp_FCS := 0;
  for i := 5 to 31 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[32] := chr(Temp_FCS mod 256);
  str_write[33] := chr($16); //结束定界符
  result := str_write;
end;

function TPPI.PLCReset: string;
var i: integer;
begin
  SetLength(str_write, 49);
  str_write[1] := chr($68);
  str_write[2] := chr($2B); //package len
  str_write[3] := chr($2B); //package len repeated
  str_write[4] := chr($68);
  str_write[5] := chr($02); //plc station no
  str_write[6] := chr($00); //pc default zero
  str_write[7] := chr($7C); //7c为强制

  str_write[8] := chr($32);
  str_write[9] := chr($07); //强制时为07,不知为何
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);

  str_write[13] := chr($0A); //置位为1,复位为0A

  str_write[14] := chr($00);
  str_write[15] := chr($0C);
  str_write[16] := chr($00);
  str_write[17] := chr($12);
  str_write[18] := chr($00);
  str_write[19] := chr($01);
  str_write[20] := chr($12);
  str_write[21] := chr($08);
  str_write[22] := chr($12);
  str_write[23] := chr($48);
  str_write[24] := chr($0B);
  str_write[25] := chr($00);
  str_write[26] := chr($00);
  str_write[27] := chr($00);
  str_write[28] := chr($00);
  str_write[29] := chr($00);
  str_write[30] := chr($FF);
  str_write[31] := chr($09);
  str_write[32] := chr($00);
  str_write[33] := chr($0E);
  str_write[34] := chr($00);
  str_write[35] := chr($01);
  str_write[36] := Chr($10);
  str_write[37] := chr($01);
  str_write[38] := chr($00);
  str_write[39] := chr($01);
  str_write[40] := chr($00);

  if DataType = 8 then
    str_write[41] := chr($01) //v存储器
  else
    str_write[41] := chr($00); //其他
  case DataType of
    0: str_write[42] := chr($04); //S 区
    1: str_write[42] := chr($05); //SM 区
    2: str_write[42] := chr($06); //AI 区
    3: str_write[42] := chr($07); //AQ 区
    4: str_write[42] := chr($1E); //C 区
    5: str_write[42] := chr($81); //I 区
    6: str_write[42] := chr($82); //Q 区
    7: str_write[42] := chr($83); //M 区
    8: str_write[42] := chr($84); //V 区
    9: str_write[42] := chr($1F); //T 区
  end;

  str_write[43] := chr((DataAddr * 8 + Datalen) shr 16 and $FF);
  str_write[44] := chr((DataAddr * 8 + Datalen) shr 8 and $FF);
  str_write[45] := chr((DataAddr * 8 + Datalen) and $FF);

  str_write[46] := chr(00); //置位是01,复位是00

  str_write[47] := chr($00);

  Temp_FCS := 0;
  for i := 5 to 47 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[48] := Chr(Temp_FCS mod 256);
  str_write[49] := Chr($16);

  result := str_write;
end;

function TPPI.PLCRun: string;
var i: integer;
begin
  Setlength(str_write, 39);
  str_write[1] := chr($68);
  str_write[2] := chr($21); //package len
  str_write[3] := chr($21); //package len repeated
  str_write[4] := chr($68);

  str_write[5] := chr(Addr); //plc station no
  str_write[6] := chr($00); //pc default zero
  str_write[7] := chr($7C); //7c为强制

  str_write[8] := chr($32);
  str_write[9] := chr($01);
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);
  str_write[13] := chr($00);
  str_write[14] := chr($00);
  str_write[15] := chr($14);
  str_write[16] := chr($00);
  str_write[17] := chr($00);

  str_write[18] := chr($28); //28:run;29:stop
  str_write[19] := chr($00);
  str_write[20] := chr($00);
  str_write[21] := chr($00);
  str_write[22] := chr($00);

  //*****************************************8
  str_write[23] := chr($00);
  str_write[24] := chr($00);
  str_write[25] := chr($FD);
  str_write[26] := chr($00);
  str_write[27] := chr($00);
  str_write[28] := chr($09);

  str_write[29] := chr($50);
  str_write[30] := chr($5F);
  str_write[31] := chr($50);

  str_write[32] := chr($52);
  str_write[33] := chr($4F);
  str_write[34] := chr($47);
  str_write[35] := chr($52);
  str_write[36] := chr($41);
  str_write[37] := chr($4D);

  Temp_FCS := 0;
  for i := 5 to 37 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[38] := chr(Temp_FCS mod 256);
  str_write[39] := chr($16);
  result := str_write;
end;

function TPPI.PLCStop: string;
var i: integer;
begin
  Setlength(str_write, 35);
  str_write[1] := chr($68);
  str_write[2] := chr($1D); //package len
  str_write[3] := chr($1D); //package len repeated
  str_write[4] := chr($68);

  str_write[5] := chr(Addr); //plc station no
  str_write[6] := chr($00); //pc default zero
  str_write[7] := chr($7C); //7c为强制

  str_write[8] := chr($32);
  str_write[9] := chr($01);
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);
  str_write[13] := chr($00);
  str_write[14] := chr($00);
  str_write[15] := chr($10);
  str_write[16] := chr($00);
  str_write[17] := chr($00);
  str_write[18] := chr($29); //28RUN,29STOP
  str_write[19] := chr($00);
  str_write[20] := chr($00);
  str_write[21] := chr($00);
  str_write[22] := chr($00);

  //*****************************************
  str_write[23] := chr($00);
  str_write[24] := chr($09);
  str_write[25] := chr($50);
  str_write[26] := chr($5F);
  str_write[27] := chr($50);
  str_write[28] := chr($52);
  str_write[29] := chr($4F);
  str_write[30] := chr($47);
  str_write[31] := chr($52);
  str_write[32] := chr($41);
  str_write[33] := chr($4D);

  Temp_FCS := 0;
  for i := 5 to 33 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[34] := chr(Temp_FCS mod 256);
  str_write[35] := chr($16);
  result := str_write;
end;

function TPPI.PLCWriteData: string;
var i: integer;
begin
  case DataMode of
    0: SetLength(str_write, 38);
    1: SetLength(str_write, 39);
    2: SetLength(str_write, 41);
    3: SetLength(str_write, 38);
  end;
  str_write[1] := chr($68);
  case DataMode of
    0: begin
        str_write[2] := chr($20); //package len
        str_write[3] := chr($20); //package len repeated
      end;
    1: begin
        str_write[2] := chr($21); //package len
        str_write[3] := chr($21); //package len repeated
      end;
    2: begin
        str_write[2] := chr($23); //package len
        str_write[3] := chr($23); //package len repeated
      end;
    3: begin
        str_write[2] := chr($20); //package len
        str_write[3] := chr($20); //package len repeated
      end;
  end;

  str_write[4] := chr($68);
  str_write[5] := chr(Addr); //plc station no
  str_write[6] := chr($00); //pc default zero
  str_write[7] := chr($6C); //7c为强制

  str_write[8] := chr($32);
  str_write[9] := chr($01);
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);
  str_write[13] := chr($00);
  str_write[14] := chr($00);
  str_write[15] := chr($0E);
  str_write[16] := chr($00);

  case DataMode of
    0: str_write[17] := chr($05); //05是字节
    1: str_write[17] := chr($06); //06是字
    2: str_write[17] := chr($08); //08是双字
    3: str_write[17] := chr($05); //05也是位
  end;

  str_write[18] := chr($05); //04读;05写
  str_write[19] := chr($01); //写一个区

  str_write[20] := chr($12);
  str_write[21] := chr($0A);
  str_write[22] := chr($10);

  //*****************************************8
  if DataMode = 3 then //写位是01
    str_write[23] := chr($01)
  else
    str_write[23] := chr($02);

  str_write[24] := chr($00);
  case DataMode of
    0: str_write[25] := chr($01); //写字节
    1: str_write[25] := chr($02); //写字
    2: str_write[25] := chr($04); //写双字
    3: str_write[25] := chr($01); //写位
  end;

  str_write[26] := chr($00);

  if DataType = 8 then
    str_write[27] := chr($01) //v存储器
  else
    str_write[27] := chr($00); //其他
  case DataType of
    0: str_write[28] := chr($04); //S 区
    1: str_write[28] := chr($05); //SM 区
    2: str_write[28] := chr($06); //AI 区
    3: str_write[28] := chr($07); //AQ 区
    4: str_write[28] := chr($1E); //C 区
    5: str_write[28] := chr($81); //I 区
    6: str_write[28] := chr($82); //Q 区
    7: str_write[28] := chr($83); //M 区
    8: str_write[28] := chr($84); //V 区
    9: str_write[28] := chr($1F); //T 区
  end;

  //数据地址,用三位来表示,一般两位就够
  if DataMode <> 3 then //如果不是写位,根据偏移地址来算
  begin
    str_write[29] := chr($00);
    str_write[30] := chr(DataAddr * 8 and $FF00 shr 8);
    str_write[31] := chr(DataAddr * 8 and $00FF);
  end
  else
  begin
    str_write[29] := chr((DataAddr * 8 + Datalen) shr 16 and $FF);
    str_write[30] := chr((DataAddr * 8 + Datalen) shr 8 and $FF);
    str_write[31] := chr((DataAddr * 8 + Datalen) and $FF);
  end;

  str_write[32] := chr($00);
  if DataMode <> 3 then
    str_write[33] := chr($04) //04为写入其他，03写入位
  else
    str_write[33] := chr($03);

  str_write[34] := chr($00);

  case DataMode of
    0: str_write[35] := chr($08); //01bit, 08byte, 10word, 20dword
    1: str_write[35] := chr($10); //01bit, 08byte, 10word, 20dword
    2: str_write[35] := chr($20); //01bit, 08byte, 10word, 20dword
    3: str_write[35] := chr($01); //01bit, 08byte, 10word, 20dword
  end;

  case DataMode of
    0: begin
        str_write[36] := Chr(DataValue); //data

        Temp_FCS := 0;
        for i := 5 to 36 do
          Temp_FCS := Temp_FCS + Ord(str_write[i]);

        str_write[37] := Chr(Temp_FCS mod 256);
        str_write[38] := Chr($16);
      end;
    1:
      begin
        str_write[36] := Chr(DataValue shr 8 and $FF); //data
        str_write[37] := Chr(DataValue and $FF);

        Temp_FCS := 0;
        for i := 5 to 37 do
          Temp_FCS := Temp_FCS + Ord(str_write[i]);

        str_write[38] := Chr(Temp_FCS mod 256);
        str_write[39] := Chr($16);
      end;
    2:
      begin
        str_write[36] := Chr(DataValue shr 24 and $FF); //data
        str_write[37] := Chr(DataValue shr 16 and $FF);
        str_write[38] := Chr(DataValue shr 8 and $FF);
        str_write[39] := Chr(DataValue and $FF);

        Temp_FCS := 0;
        for i := 5 to 39 do
          Temp_FCS := Temp_FCS + Ord(str_write[i]);

        str_write[40] := Chr(Temp_FCS mod 256);
        str_write[41] := Chr($16);
      end;
    3: begin
        str_write[36] := Chr(DataValue); //data

        Temp_FCS := 0;
        for i := 5 to 36 do
          Temp_FCS := Temp_FCS + Ord(str_write[i]);

        str_write[37] := Chr(Temp_FCS mod 256);
        str_write[38] := Chr($16);
      end;
  end;

  result := str_write;
end;

procedure TPPI.SetAddr(const Value: integer);
begin
  FAddr := Value;
end;

procedure TPPI.SetDataAddr(const Value: integer);
begin
  FDataAddr := Value;
end;

procedure TPPI.SetDataLen(const Value: integer);
begin
  FDataLen := Value;
end;

procedure TPPI.SetDataMode(const Value: integer);
begin
  FDataMode := Value;
end;

procedure TPPI.SetDataType(const Value: integer);
begin
  FDataType := Value;
end;

procedure TPPI.SetDataValue(const Value: DWord);
begin
  FDataValue := Value;
end;

end.

