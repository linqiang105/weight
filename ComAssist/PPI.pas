unit PPI;

interface

uses
  Windows;

//S7-200 PPI��
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
    property Addr: integer read FAddr write SetAddr; //PLC��ַ
    //���������ͣ�0��S����1��SM����2��I����3��Q����4��M����5��V��
    property DataType: integer read FDataType write SetDataType;
    //���ݳ��ȣ�0���ֽڣ�1���֣�2��˫��
    property DataMode: integer read FDataMode write SetDataMode;
    property DataAddr: integer read FDataAddr write SetDataAddr; // ���ݵ�ַ
    property DataLen: integer read FDataLen write SetDataLen; // ���ݳ���
    property DataValue: DWord read FDataValue write SetDataValue; //Ҫд�������ֵ
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
  str_write[7] := chr($7C); //7cΪǿ��

  str_write[8] := chr($32);
  str_write[9] := chr($07); //ǿ��ʱΪ07,��֪Ϊ��
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);

  str_write[13] := chr($14); //��λΪ1,��λΪ0A

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
    str_write[41] := chr($01) //v�洢��
  else
    str_write[41] := chr($00); //����
  case DataType of
    0: str_write[42] := chr($04); //S ��
    1: str_write[42] := chr($05); //SM ��
    2: str_write[42] := chr($06); //AI ��
    3: str_write[42] := chr($07); //AQ ��
    4: str_write[42] := chr($1E); //C ��
    5: str_write[42] := chr($81); //I ��
    6: str_write[42] := chr($82); //Q ��
    7: str_write[42] := chr($83); //M ��
    8: str_write[42] := chr($84); //V ��
    9: str_write[42] := chr($1F); //T ��
  end;

  str_write[43] := chr((DataAddr * 8 + Datalen) shr 16 and $FF);
  str_write[44] := chr((DataAddr * 8 + Datalen) shr 8 and $FF);
  str_write[45] := chr((DataAddr * 8 + Datalen) and $FF);

  str_write[46] := chr(01); //��λ��01,��λ��00

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
  str_write[1] := chr($68); //��ʼ�����
  str_write[2] := chr($1B); //���ĳ���
  str_write[3] := chr($1B); //�ظ����ĳ���
  str_write[4] := chr($68); //��ʼ�����

  str_write[5] := chr(Addr); //PLC��ַ
  str_write[6] := chr($00); //�������ַ
  str_write[7] := chr($6C); //7cΪǿ��

  str_write[8] := chr($32);
  str_write[9] := chr($01);
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);
  str_write[13] := chr($00);
  str_write[14] := chr($00);
  //�����Kռλ�ֹ�����ָ�������Kռ�õ��ֹ������c�����K�������P���L��=4+�����K��*10,
  //�磺һ�l�����r��4+10=0E(H)��ͬ�r�xM,V,Q������ͬ�Ĕ����K�r��4+3*10=22(H)��
  str_write[15] := chr($0E);
  str_write[16] := chr($00);
  str_write[17] := chr($00);

  str_write[18] := chr($04); //04��05д
  str_write[19] := chr($01); //��һλ

  str_write[20] := chr($12);
  str_write[21] := chr($0A);
  str_write[22] := chr($10);

  str_write[23] := chr($02); //�������������ֽ�Ϊ��λ

  str_write[24] := chr($00);
  case DataMode of
    0: str_write[25] := chr(DataLen); //��ȡ����������
    1: str_write[25] := chr(DataLen * 2); //��ȡ����������
    2: str_write[25] := chr(DataLen * 4); //��ȡ����������
  end;

  str_write[26] := chr($00);
  if DataType = 8 then
    str_write[27] := chr($01) //v�洢��
  else
    str_write[27] := chr($00); //����
  case DataType of
    0: str_write[28] := chr($04); //S ��
    1: str_write[28] := chr($05); //SM ��
    2: str_write[28] := chr($06); //AI ��
    3: str_write[28] := chr($07); //AQ ��
    4: str_write[28] := chr($1E); //C ��
    5: str_write[28] := chr($81); //I ��
    6: str_write[28] := chr($82); //Q ��
    7: str_write[28] := chr($83); //M ��
    8: str_write[28] := chr($84); //V ��
    9: str_write[28] := chr($1F); //T ��
  end;

  str_write[29] := chr($00);
  //���ݵ�ַ,����λ����ʾ
  str_write[30] := chr(DataAddr * 8 and $FF00 shr 8);
  str_write[31] := chr(DataAddr * 8 and $00FF);

  Temp_FCS := 0;
  for i := 5 to 31 do
    Temp_FCS := Temp_FCS + Ord(str_write[i]);

  str_write[32] := chr(Temp_FCS mod 256);
  str_write[33] := chr($16); //���������
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
  str_write[7] := chr($7C); //7cΪǿ��

  str_write[8] := chr($32);
  str_write[9] := chr($07); //ǿ��ʱΪ07,��֪Ϊ��
  str_write[10] := chr($00);
  str_write[11] := chr($00);
  str_write[12] := chr($00);

  str_write[13] := chr($0A); //��λΪ1,��λΪ0A

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
    str_write[41] := chr($01) //v�洢��
  else
    str_write[41] := chr($00); //����
  case DataType of
    0: str_write[42] := chr($04); //S ��
    1: str_write[42] := chr($05); //SM ��
    2: str_write[42] := chr($06); //AI ��
    3: str_write[42] := chr($07); //AQ ��
    4: str_write[42] := chr($1E); //C ��
    5: str_write[42] := chr($81); //I ��
    6: str_write[42] := chr($82); //Q ��
    7: str_write[42] := chr($83); //M ��
    8: str_write[42] := chr($84); //V ��
    9: str_write[42] := chr($1F); //T ��
  end;

  str_write[43] := chr((DataAddr * 8 + Datalen) shr 16 and $FF);
  str_write[44] := chr((DataAddr * 8 + Datalen) shr 8 and $FF);
  str_write[45] := chr((DataAddr * 8 + Datalen) and $FF);

  str_write[46] := chr(00); //��λ��01,��λ��00

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
  str_write[7] := chr($7C); //7cΪǿ��

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
  str_write[7] := chr($7C); //7cΪǿ��

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
  str_write[7] := chr($6C); //7cΪǿ��

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
    0: str_write[17] := chr($05); //05���ֽ�
    1: str_write[17] := chr($06); //06����
    2: str_write[17] := chr($08); //08��˫��
    3: str_write[17] := chr($05); //05Ҳ��λ
  end;

  str_write[18] := chr($05); //04��;05д
  str_write[19] := chr($01); //дһ����

  str_write[20] := chr($12);
  str_write[21] := chr($0A);
  str_write[22] := chr($10);

  //*****************************************8
  if DataMode = 3 then //дλ��01
    str_write[23] := chr($01)
  else
    str_write[23] := chr($02);

  str_write[24] := chr($00);
  case DataMode of
    0: str_write[25] := chr($01); //д�ֽ�
    1: str_write[25] := chr($02); //д��
    2: str_write[25] := chr($04); //д˫��
    3: str_write[25] := chr($01); //дλ
  end;

  str_write[26] := chr($00);

  if DataType = 8 then
    str_write[27] := chr($01) //v�洢��
  else
    str_write[27] := chr($00); //����
  case DataType of
    0: str_write[28] := chr($04); //S ��
    1: str_write[28] := chr($05); //SM ��
    2: str_write[28] := chr($06); //AI ��
    3: str_write[28] := chr($07); //AQ ��
    4: str_write[28] := chr($1E); //C ��
    5: str_write[28] := chr($81); //I ��
    6: str_write[28] := chr($82); //Q ��
    7: str_write[28] := chr($83); //M ��
    8: str_write[28] := chr($84); //V ��
    9: str_write[28] := chr($1F); //T ��
  end;

  //���ݵ�ַ,����λ����ʾ,һ����λ�͹�
  if DataMode <> 3 then //�������дλ,����ƫ�Ƶ�ַ����
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
    str_write[33] := chr($04) //04Ϊд��������03д��λ
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

