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
  //strsourcemoney   保存未转换的小写字符串
 //strobjectmoney   保存已转换的大写字符串
  thiswei, thispos: string[2];
  //thiswei为当前位的大写，thispos为当前位的人民币单位
  iwei, pospoint: Integer;
  //iwei为当前位置，pospoint为小数点的位置
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //StrSourceMoney := FloatToStr(SourceMoney);
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
      '.':
        begin
          thispos := '点';
          Continue;
        end;
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
          begin
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //当前一位数不是零，即5005 为五千零五。并且 前一位不是. ，即 5.05 为五元五分
              thiswei := '零';
          end;
          if (thispos <> '亿') and (thispos <> '万') and (thispos <> '元') then
            thispos := '' //单位是十，百、仟的，为0，则不显示单位。
          else
            thiswei := ''; //若单位为亿、万、元，则前一位0，不显示'零'
          //if (iwei = 1) and (StrSourceMoney[1] = '0') then
          //  thiswei := '零';
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //组合成大写金额
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '亿万', '亿'); //去掉'亿万'中的'万'
  if Copy(strobjectmoney, Length(strobjectmoney) - 1, 2) = '点' then
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
    if Copy(EdtAim.Text, i, 2) = '零' then
      sndWav := strwav[0]
    else if Copy(EdtAim.Text, i, 2) = '壹' then
      sndWav := strwav[1]
    else if Copy(EdtAim.Text, i, 2) = '贰' then
      sndWav := strwav[2]
    else if Copy(EdtAim.Text, i, 2) = '叁' then
      sndWav := strwav[3]
    else if Copy(EdtAim.Text, i, 2) = '肆' then
      sndWav := strwav[4]
    else if Copy(EdtAim.Text, i, 2) = '伍' then
      sndWav := strwav[5]
    else if Copy(EdtAim.Text, i, 2) = '陆' then
      sndWav := strwav[6]
    else if Copy(EdtAim.Text, i, 2) = '柒' then
      sndWav := strwav[7]
    else if Copy(EdtAim.Text, i, 2) = '捌' then
      sndWav := strwav[8]
    else if Copy(EdtAim.Text, i, 2) = '玖' then
      sndWav := strwav[9]
    else if Copy(EdtAim.Text, i, 2) = '拾' then
      sndWav := strwav[10]
    else if Copy(EdtAim.Text, i, 2) = '佰' then
      sndWav := strwav[11]
    else if Copy(EdtAim.Text, i, 2) = '千' then
      sndWav := strwav[12]
    else if Copy(EdtAim.Text, i, 2) = '万' then
      sndWav := strwav[13]
    else if Copy(EdtAim.Text, i, 2) = '亿' then
      sndWav := strwav[14]
    else if Copy(EdtAim.Text, i, 2) = '点' then
      sndWav := strwav[15];
    {else if Copy(EdtAim.Text, i, 2) = '元' then
      sndWav := strwav[16]
    else if Copy(EdtAim.Text, i, 2) = '角' then
      sndWav := strwav[17]
    else if Copy(EdtAim.Text, i, 2) = '分' then
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
