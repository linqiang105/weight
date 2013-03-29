unit WeightRecord;

interface

uses SysUtils, Variants, Dialogs;

type
  TWeightRecord = class
  private
  public
    id: Integer;
    glideNo: string;
    carNo: string;
    oper: string;
    faHuo: string;
    shouHuo: string;
    goods: string;
    spec: string;
    gross: Double;
    tare: Double;
    net: Double;
    bundle: Double;
    real: Double;
    price: Double;
    sum: Double;
    cost: Double;
    scaleMan: string;
    grossTime: TDateTime;
    tareTime: TDateTime;
    memo: string;
    upload: Boolean;
    backup1: string;
    backup2: string;
    backup3: string;
    backup4: string;
    backup5: string;
    backup6: Double;
    backup7: Double;
    backup8: Double;
    backup9: Double;
  end;

  TWeightUtil = class
  private
  public
    class function save(var w: TWeightRecord): Boolean; //������ؼ�¼
  end;

implementation

uses
  QueryDM, CommonUtil;

{ TWeightUtil }

class function TWeightUtil.save(var w: TWeightRecord): Boolean;
var sqlStr: string;
begin
  if w.glideNo = '' then
  begin
    sqlStr := 'insert into ������Ϣ(��ˮ��,����,����Ա,������λ,�ջ���λ,'
      + '����,���,ë��,����,����,����,ʵ��,����,���,������,����Ա,';
    sqlStr := sqlStr + 'ë��ʱ��,����ʱ��,��ע,';
    sqlStr := sqlStr + '����1,����2,����3,����4,����5,����6,����7,����8,����9)';

    sqlStr := sqlStr + ' values(:glideno,:car,:oper,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:cost,:scaleMan,';
    sqlstr := sqlstr + ':grosstime,:taretime,';
    sqlstr := sqlstr + ':memo,:backup1,:backup2,:backup3,:backup4,:backup5,:backup6,'
      + ':backup7,:backup8,:backup9)';
    w.glideNo := TDBCommonUtil.getMaxGlideNo;
  end
  else
  begin
    sqlStr := 'update ������Ϣ set ��ˮ��=:glideno,����=:car,����Ա=:oper,'
      + '������λ=:fahuo,�ջ���λ=:shouhuo,����=:goods,���=:spec,'
      + 'ë��=:gross,����=:tare,����=:net,����=:bundle,ʵ��=:real,'
      + '����=:price,���=:sum,������=:cost,����Ա=:scaleMan,'
      + 'ë��ʱ��=:grosstime,����ʱ��=:taretime,��ע=:memo,'
      + '����1=:backup1,����2=:backup2,����3=:backup3,����4=:backup4,'
      + '����5=:backup5,����6=:backup6,����7=:backup7,����8=:backup8,����9=:backup9 where ���=:id';
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := sqlStr;
    if w.id <> 0 then
      Parameters.ParamByName('id').Value := w.id;
    Parameters.ParamByName('glideno').Value := w.glideNo;
    Parameters.ParamByName('car').Value := w.carNo;
    Parameters.ParamByName('oper').Value := w.oper;
    Parameters.ParamByName('fahuo').Value := w.faHuo;
    Parameters.ParamByName('shouhuo').Value := w.shouHuo;
    Parameters.ParamByName('goods').Value := w.goods;
    Parameters.ParamByName('spec').Value := w.spec;
    Parameters.ParamByName('gross').Value := w.gross;
    Parameters.ParamByName('tare').Value := w.tare;
    Parameters.ParamByName('net').Value := w.net;
    Parameters.ParamByName('bundle').Value := w.bundle;
    Parameters.ParamByName('real').Value := w.real;
    Parameters.ParamByName('price').Value := w.price;
    Parameters.ParamByName('sum').Value := w.sum;
    Parameters.ParamByName('cost').Value := w.cost;
    Parameters.ParamByName('scaleMan').Value := w.scaleMan;

    if (w.gross <> 0) and (w.tare <> 0) then
    begin
      Parameters.ParamByName('grosstime').Value := w.grossTime;
      Parameters.ParamByName('taretime').Value := w.tareTime;
    end
    else if (w.gross <> 0) then
    begin
      Parameters.ParamByName('grosstime').Value := w.grossTime;
      Parameters.ParamByName('taretime').Value := null;
    end
    else if (w.tare <> 0) then
    begin
      Parameters.ParamByName('grosstime').Value := null;
      Parameters.ParamByName('taretime').Value := w.tareTime;
    end;
    Parameters.ParamByName('memo').Value := w.memo;
    Parameters.ParamByName('backup1').Value := w.backup1;
    Parameters.ParamByName('backup2').Value := w.backup2;
    Parameters.ParamByName('backup3').Value := w.backup3;
    Parameters.ParamByName('backup4').Value := w.backup4;
    Parameters.ParamByName('backup5').Value := w.backup5;
    Parameters.ParamByName('backup6').Value := w.backup6;
    Parameters.ParamByName('backup7').Value := w.backup7;
    Parameters.ParamByName('backup8').Value := w.backup8;
    Parameters.ParamByName('backup9').Value := w.backup9;

    try
      ExecSQL;
      Result := True;
    except on e: Exception do
      begin
        MessageDlg(PChar(Format('���ݱ���ʧ��!%s', [e.Message])), mtError, [mbOK], 0);
        Result := False;
      end;
    end;
  end;
end;

end.
