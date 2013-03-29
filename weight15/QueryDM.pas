unit QueryDM;

interface

uses
  SysUtils, Classes, ADODB, DB, Dialogs, 
  frxDesgn, frxClass, frxDBSet, frxBarcode, StrUtils,
  frxExportXLS;

type
  TQueryDataModule = class(TDataModule)
    DBConnection: TADOConnection;
    WeightMaintainDS: TDataSource;
    DataSourceUserShow: TDataSource;
    ADOQueryUser: TADOQuery;
    PrepareMaintainQuery: TADOQuery;
    PrepareMaintainDS: TDataSource;
    ADOQExec: TADOQuery;
    WeightMaintainQuery: TADOQuery;
    ADOQueryPrintTicket: TADOQuery;
    ADOQueryPrintCombineTicket: TADOQuery;
    StatisticsDS: TDataSource;
    StatisticsQuery: TADOQuery;
    ADOQLog: TADOQuery;
    ADOQMultiGross: TADOQuery;
    DSMultiGross: TDataSource;
    DSLog: TDataSource;
    ADOQBackRecord: TADOQuery;
    DSBackRecord: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDBDatasetReport: TfrxDBDataset;
    frxReportReport: TfrxReport;
    ADOQCard: TADOQuery;
    DSCard: TDataSource;
    DSTao: TDataSource;
    ADOQTao: TADOQuery;
    ADODataSet1: TADODataSet;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    DSChart: TDataSource;
    ADOQChart: TADOQuery;
    procedure ADOQueryUserBeforePost(DataSet: TDataSet);
    procedure ADOQueryUserAfterPost(DataSet: TDataSet);
    procedure ADOQueryUserAfterEdit(DataSet: TDataSet);
    procedure ADOQueryUserBeforeDelete(DataSet: TDataSet);
    procedure WeightMaintainQueryBeforePost(DataSet: TDataSet);
    procedure WeightMaintainQueryBeforeEdit(DataSet: TDataSet);
    procedure WeightMaintainQueryAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function frxReportReportUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure WeightMaintainQueryBeforeDelete(DataSet: TDataSet);
  private
    ChangeName: boolean;
    XuHao: string;
    Car, FaHuo, ShouHuo, Goods, Spec, Mao, Kong, Jing, Kou, Shi, Dangjia, Jinger: string;
    { Private declarations }
  public
    { Public declarations }
    ConnectFlag: Boolean; 
  end;

var
  QueryDataModule: TQueryDataModule;

implementation

uses Main;

{$R *.dfm}

function MoneyToCn(sourcemoney: Double): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  //thisweiΪ��ǰλ�Ĵ�д��thisposΪ��ǰλ������ҵ�λ
  iwei, pospoint: Integer;
  //iweiΪ��ǰλ�ã�pospointΪС�����λ��
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
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
      -3: thispos := '��';
      -2: thispos := '��';
      -1: thispos := '��';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //С����λ�ô�����
          thispos := 'Ԫ';
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
      '.': Continue;
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
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //��ǰһλ�������㣬��5005 Ϊ��ǧ���塣���� ǰһλ����. ���� 5.05 Ϊ��Ԫ���
              thiswei := '��';
          if (thispos <> '��') and (thispos <> '��') and (thispos <> 'Ԫ') then
            thispos := '' //��λ��ʮ���١�Ǫ   �ģ�Ϊ0������ʾ��λ��
          else
            thiswei := ''; //����λΪ�ڡ���Ԫ����ǰһλ0������ʾ'��'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //��ϳɴ�д���
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '����', '��'); //ȥ��'����'�е�'��'
  if ansicontainsstr(strobjectmoney, '��') then
    Result := strobjectmoney
  else
  begin
    Result := strobjectmoney;
  end;
end;


function Num2CNum(dblArabic: double): string;
const
  _ChineseNumeric = '��Ҽ��������½��ƾ�';
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
  (* ���ִ�����, ����: ���� '1234', ���� '4321' *)
  function ConvertStr(const sBeConvert: string): string;
  var
    x: integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      Result := Result + sBeConvert[x];
  end;
  { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* ������ת�ɰ����������ִ� *)
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* ȡ��С�����λ�� *)

  (* �ȴ��������Ĳ��� *)
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  (* �Ӹ�λ������ÿ��λ��ΪһС�� *)
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
      (* ���µ� i ����: ��ʮ��ǧλ�ĸ�λ�� *)
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := Ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
              (* 1. ���� '��' ���ظ����� *)
              (* 2. ��λ���� 0 ����ת�� '��' *)
        if (not bInZero) and (i <> 1) then sSection := '��' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2: sSection := 'ʰ' + sSection;
          3: sSection := '��' + sSection;
          4: sSection := 'Ǫ' + sSection;
        end;
        sSection := Copy(_ChineseNumeric, 2 * iDigit + 1, 2) +
          sSection;
        bInZero := False;
      end;
    end;

      (* ���ϸ�С�ڵ�λ�� *)
    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 2) <> '��') then
        Result := '��' + Result;
    end
    else
    begin
      case iSection of
        0: Result := sSection;
        1: Result := sSection + '��' + Result;
        2: Result := sSection + '��' + Result;
        3: Result := sSection + '��' + Result;
      end;
    end;
  end;

  (* ����С�����ұߵĲ��� *)
  if iPosOfDecimalPoint > 0 then
  begin
    Result := Result + '��';
    //AppendStr(Result, '��');
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;
  (* ��������״���Ĵ��� *)
  if Length(Result) = 0 then Result := '��';
  if Copy(Result, 1, 4) = 'һʮ' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '��' then Result := '��' + Result;

  (* �Ƿ�Ϊ���� *)
  if bMinus then Result := '��' + Result;
end;

procedure TQueryDataModule.ADOQueryUserBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('����Ա').AsBoolean then
  begin
    DataSet.Edit;
    DataSet['�û�����'] := true;
  end;
end;

procedure TQueryDataModule.ADOQueryUserAfterPost(DataSet: TDataSet);
begin
  if ChangeName then
  begin
    MainForm.CurrentUser := DataSet.FieldByName('�û���').AsString;
  end;
end;

procedure TQueryDataModule.ADOQueryUserAfterEdit(DataSet: TDataSet);
begin
  if (MainForm.CurrentUser = DataSet.FieldByName('�û���').AsString) then
    ChangeName := true
  else
    ChangeName := false;
end;

procedure TQueryDataModule.ADOQueryUserBeforeDelete(DataSet: TDataSet);
begin
  if DataSet.FieldByName('����Ա').AsBoolean then
  begin
    MessageDlg('����ɾ������Ա!', mtWarning, [mbOK, mbCancel], 0);
    Abort;
  end;
end;

procedure TQueryDataModule.WeightMaintainQueryBeforePost(
  DataSet: TDataSet);
var gross, tare, buckle, price: Double;
  net, actual, sum: Double;
begin
  if MainForm.PanelMain.Visible then
  begin
    gross := DataSet.FieldByName('ë��').AsFloat;
    tare := DataSet.FieldByName('����').AsFloat;
    buckle := DataSet.FieldByName('����').AsFloat;
    price := DataSet.FieldByName('����').AsFloat;
    DataSet.Edit;
    if gross - tare > 0 then
    begin
      if (gross = 0) or (tare = 0) then
        DataSet['����'] := 0
      else
        DataSet['����'] := gross - tare;
      DataSet['ʵ��'] := gross - tare - buckle;
      DataSet['���'] := (gross - tare - buckle) * price;
      net := DataSet['����'];
      actual := DataSet['ʵ��'];
      sum := DataSet['���'];
    end
  end
end;

procedure TQueryDataModule.WeightMaintainQueryBeforeEdit(
  DataSet: TDataSet);
begin
  XuHao := DataSet.FieldByName('��ˮ��').AsString;
  Car := DataSet.FieldByName('����').AsString;
  FaHuo := DataSet.FieldByName('������λ').AsString;
  ShouHuo := DataSet.FieldByName('�ջ���λ').AsString;
  Goods := DataSet.FieldByName('����').AsString;
  Spec := DataSet.FieldByName('���').AsString;
  Mao := DataSet.FieldByName('ë��').AsString;
  Kong := DataSet.FieldByName('����').AsString;
  Jing := DataSet.FieldByName('����').AsString;
  Kou := DataSet.FieldByName('����').AsString;
  Shi := DataSet.FieldByName('ʵ��').AsString;
  Dangjia := DataSet.FieldByName('����').AsString;
  Jinger := DataSet.FieldByName('���').AsString;
end;

procedure TQueryDataModule.WeightMaintainQueryAfterPost(DataSet: TDataSet);
var Log: string;
begin
  Log := '��ˮ��Ϊ' + XuHao + '�ļ�¼:';
  if Car <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Car + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if FaHuo <> DataSet.FieldByName('������λ').AsString then
    Log := Log + '������λ�� ' + FaHuo + ' �޸�Ϊ '
      + DataSet.FieldByName('������λ').AsString + ',';
  if ShouHuo <> DataSet.FieldByName('�ջ���λ').AsString then
    Log := Log + '�ջ���λ�� ' + ShouHuo + ' �޸�Ϊ '
      + DataSet.FieldByName('�ջ���λ').AsString + ',';
  if Goods <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Goods + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Spec <> DataSet.FieldByName('���').AsString then
    Log := Log + '����� ' + Spec + ' �޸�Ϊ '
      + DataSet.FieldByName('���').AsString + ',';
  if Mao <> DataSet.FieldByName('ë��').AsString then
    Log := Log + 'ë���� ' + Mao + ' �޸�Ϊ '
      + DataSet.FieldByName('ë��').AsString + ',';
  if Kong <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Kong + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Jing <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Jing + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Kou <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Kou + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Shi <> DataSet.FieldByName('ʵ��').AsString then
    Log := Log + 'ʵ���� ' + Shi + ' �޸�Ϊ '
      + DataSet.FieldByName('ʵ��').AsString + ',';
  if Dangjia <> DataSet.FieldByName('����').AsString then
    Log := Log + '������ ' + Dangjia + ' �޸�Ϊ '
      + DataSet.FieldByName('����').AsString + ',';
  if Jinger <> DataSet.FieldByName('���').AsString then
    Log := Log + '����� ' + Jinger + ' �޸�Ϊ '
      + DataSet.FieldByName('���').AsString;

  with ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into ��־(�޸���,ʱ��,��־) values(:user,:time,:content)');
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Parameters.ParamByName('time').Value := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    Parameters.ParamByName('content').Value := Log;
    ExecSQL
  end;
end;

procedure TQueryDataModule.DataModuleCreate(Sender: TObject);
var FileName: string;
begin
  FileName := ExtractFilePath(ParamStr(0)) + '\Database\Database.mdb';
  ConnectFlag := true;
  if FileExists(FileName) then
  begin
    try
      with QueryDataModule.DBConnection do
      begin
        Close;
        ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
          + FileName + ';Persist Security Info=False;Jet OLEDB:Database Password=DTL83973118';
        Open
      end;
    except
      ConnectFlag := false;
    end
  end
  else
  begin
    ConnectFlag := false;
  end;

  frxReport1.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '����Ҵ�д���ת������');
  frxReport1.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '��������д���ת������');
  frxReportReport.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '����Ҵ�д���ת������');
  frxReportReport.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '��������д���ת������');
end;

function TQueryDataModule.frxReport1UserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

function TQueryDataModule.frxReportReportUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

procedure TQueryDataModule.WeightMaintainQueryBeforeDelete(
  DataSet: TDataSet);
begin
  with ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into ��־(�޸���,ʱ��,��־) values(:user,:time,:content)');
    Parameters.ParamByName('user').value := MainForm.CurrentUser;
    Parameters.ParamByName('time').value := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    Parameters.ParamByName('content').value := '��ˮ��Ϊ' + DataSet.FieldByName('��ˮ��').AsString + '�ļ�¼��ɾ��';
    ExecSQL
  end;
end;

end.

