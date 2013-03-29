unit ReadWeight;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, mmsystem, Buttons;

type
  TReadWeightForm = class(TForm)
    GBChange: TGroupBox;
    EdtSource: TEdit;
    EdtAim: TEdit;
    BtnRead: TButton;
    BitBtnChange: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure BitBtnChangeClick(Sender: TObject);
    procedure EdtSourceKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSourceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtAimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  ReadWeightForm: TReadWeightForm;
  strwav: array[0..20] of string;
  sndWav: string;

implementation

{$R *.dfm}

function WeightRead(sourcemoney: currency): string;
var
  strsourcemoney, strobjectmoney: string;
  //strsourcemoney   ����δת����Сд�ַ���
 //strobjectmoney   ������ת���Ĵ�д�ַ���
  thiswei, thispos: string[2];
  //thisweiΪ��ǰλ�Ĵ�д��thisposΪ��ǰλ������ҵ�λ
  iwei, pospoint: Integer;
  //iweiΪ��ǰλ�ã�pospointΪС�����λ��
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //StrSourceMoney := FloatToStr(SourceMoney);
  //��������ת����ָ����ʽ�ַ���
  if Length(strsourcemoney) > 15 then //����ǧ��Ԫ
  begin
    ShowMessage('��������ȷ�����֣���Ҫ����ǧ�ڣ�15λ������');
    Exit;
  end;
  pospoint := Pos('.', strsourcemoney); //С����λ��
  for iwei := Length(strsourcemoney) downto 1 do //���磺500.8 = 5 X=4
  begin
    case pospoint - iwei of //С����λ�� - �ܳ��� �� ���һλ��λ
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
      '.':
        begin
          thispos := '��';
          Continue;
        end;
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
          begin
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //��ǰһλ�������㣬��5005 Ϊ��ǧ���塣���� ǰһλ����. ���� 5.05 Ϊ��Ԫ���
              thiswei := '��';
          end;
          if (thispos <> '��') and (thispos <> '��') and (thispos <> 'Ԫ') then
            thispos := '' //��λ��ʮ���١�Ǫ�ģ�Ϊ0������ʾ��λ��
          else
            thiswei := ''; //����λΪ�ڡ���Ԫ����ǰһλ0������ʾ'��'
          //if (iwei = 1) and (StrSourceMoney[1] = '0') then
          //  thiswei := '��';
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //��ϳɴ�д���
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '����', '��'); //ȥ��'����'�е�'��'
  if Copy(strobjectmoney, Length(strobjectmoney) - 1, 2) = '��' then
    strobjectmoney := Copy(strobjectmoney, 1, Length(strobjectmoney) - 2);
  WeightRead := strobjectmoney;
end;

procedure TReadWeightForm.FormCreate(Sender: TObject);
begin
  strwav[0] := 'NumberVoc\0.wav';
  strwav[1] := 'NumberVoc\1.wav';
  strwav[2] := 'NumberVoc\2.wav';
  strwav[3] := 'NumberVoc\3.wav';
  strwav[4] := 'NumberVoc\4.wav';
  strwav[5] := 'NumberVoc\5.wav';
  strwav[6] := 'NumberVoc\6.wav';
  strwav[7] := 'NumberVoc\7.wav';
  strwav[8] := 'NumberVoc\8.wav';
  strwav[9] := 'NumberVoc\9.wav';
  strwav[10] := 'NumberVoc\shi.wav';
  strwav[11] := 'NumberVoc\bai.wav';
  strwav[12] := 'NumberVoc\qian.wav';
  strwav[13] := 'NumberVoc\wan.wav';
  strwav[14] := 'NumberVoc\YYI.wav';
  strwav[15] := 'NumberVoc\dian.wav';
  strwav[16] := 'NumberVoc\yuan.wav';
  strwav[17] := 'NumberVoc\jiao.wav';
  strwav[18] := 'NumberVoc\fen.wav';
end;

procedure TReadWeightForm.BtnReadClick(Sender: TObject);
var i: Integer;
begin
  BitBtnChange.Click;
  i := 1;
  while i < (Length(EdtAim.Text)) do
  begin
    if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[0]
    else if Copy(EdtAim.Text, i, 2) = 'Ҽ' then
      sndWav := strwav[1]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[2]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[3]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[4]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[5]
    else if Copy(EdtAim.Text, i, 2) = '½' then
      sndWav := strwav[6]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[7]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[8]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[9]
    else if Copy(EdtAim.Text, i, 2) = 'ʰ' then
      sndWav := strwav[10]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[11]
    else if Copy(EdtAim.Text, i, 2) = 'ǧ' then
      sndWav := strwav[12]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[13]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[14]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[15];
    {else if Copy(EdtAim.Text, i, 2) = 'Ԫ' then
      sndWav := strwav[16]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[17]
    else if Copy(EdtAim.Text, i, 2) = '��' then
      sndWav := strwav[18];   }
    i := i + 2;
    sndPlaySound(pchar(sndWav), SND_SYNC);
  end;
end;

procedure TReadWeightForm.BitBtnChangeClick(Sender: TObject);
begin
  EdtAim.Text := WeightRead(StrToFloatDef(EdtSource.Text, 0));
end;

procedure TReadWeightForm.EdtSourceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, '.']) then
    Key := #0;
end;

procedure TReadWeightForm.EdtSourceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BitBtnChange.Click;
end;

procedure TReadWeightForm.EdtAimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BtnRead.Click;
end;

end.
