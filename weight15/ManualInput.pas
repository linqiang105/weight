unit ManualInput;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Windows,
  StdCtrls, Buttons, RzLabel, ExtCtrls, RzEdit, WeightRecord,
  ComCtrls, SysConfig, Math, DateUtils, RzCmboBx, Mask;

type
  TManualInputForm = class(TForm)
    PInput: TPanel;
    PCommon: TPanel;
    PCar: TPanel;
    SBCar: TSpeedButton;
    lblCar: TRzLabel;
    PFaHuo: TPanel;
    lblFaHuo: TRzLabel;
    PShouHuo: TPanel;
    lblShouHuo: TRzLabel;
    PGoods: TPanel;
    lblGoods: TRzLabel;
    PSpec: TPanel;
    lblSpec: TRzLabel;
    PBundle: TPanel;
    lblBundle: TRzLabel;
    PPrice: TPanel;
    lblPrice: TRzLabel;
    PCost: TPanel;
    lblCost: TRzLabel;
    PRemark: TPanel;
    lblRemark: TRzLabel;
    POther: TPanel;
    PBackup1: TPanel;
    lblBackup1: TRzLabel;
    PBackup2: TPanel;
    lblBackup2: TRzLabel;
    PBackup3: TPanel;
    lblBackup3: TRzLabel;
    PBackup4: TPanel;
    lblBackup4: TRzLabel;
    PBackup5: TPanel;
    lblBackup5: TRzLabel;
    PBackup6: TPanel;
    lblBackup6: TRzLabel;
    PBackup7: TPanel;
    lblBackup7: TRzLabel;
    PBackup8: TPanel;
    lblBackup8: TRzLabel;
    PBackup9: TPanel;
    lblBackup9: TRzLabel;
    lblGross: TRzLabel;
    lblTare: TRzLabel;
    lblNet: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    CBGross: TRzNumericEdit;
    CBTare: TRzNumericEdit;
    CBNet: TRzNumericEdit;
    DTPGrossDate: TDateTimePicker;
    DTPTareDate: TDateTimePicker;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    lblReal: TRzLabel;
    lblSum: TRzLabel;
    CBReal: TRzNumericEdit;
    CBSum: TRzNumericEdit;
    CBBundle: TRzNumericEdit;
    CBPrice: TRzNumericEdit;
    CBCost: TRzNumericEdit;
    DTPGrossTime: TDateTimePicker;
    DTPTareTime: TDateTimePicker;
    lblGlideNo: TLabel;
    CBCar: TRzComboBox;
    CBFaHuo: TRzComboBox;
    CBShouHuo: TRzComboBox;
    CBGoods: TRzComboBox;
    CBSpec: TRzComboBox;
    CBRemark: TRzComboBox;
    CBBackup1: TRzComboBox;
    CBBackup2: TRzComboBox;
    CBBackup3: TRzComboBox;
    CBBackup4: TRzComboBox;
    CBBackup5: TRzComboBox;
    CBBackup6: TRzNumericEdit;
    CBBackup7: TRzNumericEdit;
    CBBackup8: TRzNumericEdit;
    CBBackup9: TRzNumericEdit;
    procedure FormShow(Sender: TObject);
    procedure CBBundleChange(Sender: TObject);
    procedure CBPriceChange(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure SBCarClick(Sender: TObject);
  private
    { Private declarations }
    XuHao, Car, FaHuo, ShouHuo, Goods, Spec, Mao, Kong, Jing, Kou, Shi, Dangjia, Jinger: string;
  public
    { Public declarations }
    insertOrUpdate: Boolean;
    recordId: Integer;
    ini_w: TWeightRecord; //ԭ�ȵĹ�����¼
    systemConfig: TSysConfig;
    procedure loadFormDesign();
    procedure resizeForm();
    procedure changeWeight();
    procedure changePrice();
    procedure loadFormContent();
  end;

var
  ManualInputForm: TManualInputForm;

implementation

uses
  CommonUtil, Main, Car, PrepareUtil, DataQuery;

{$R *.dfm}

procedure TManualInputForm.changePrice;
begin
  CBSum.Value := RoundTo(CBPrice.Value * CBReal.Value, 0 - systemConfig.sumPoint);
end;

procedure TManualInputForm.changeWeight;
begin
  CBNet.Value := CBGross.Value - CBTare.Value;
  if MainForm.systemConfig.useBundleRate then
    CBReal.Value := RoundTo(CBNet.Value * (1 - CBBundle.Value / 100),
      0 - MainForm.systemConfig.sumPoint)
  else
    CBReal.Value := CBNet.Value - CBBundle.Value;
  if (CBGross.Value = 0) or (CBTare.Value = 0) then
  begin
    CBNet.Value := 0;
    CBReal.Value := 0;
  end;
end;

procedure TManualInputForm.FormShow(Sender: TObject);
begin
  TPrepareUtil.addCar(CBCar);
  TPrepareUtil.addFaHuo(CBFaHuo);
  TPrepareUtil.addShouHuo(CBShouHuo);
  TPrepareUtil.addGoods(CBGoods);
  TPrepareUtil.addSpec(CBSpec);
  TPrepareUtil.addBackup1(CBBackup1);
  TPrepareUtil.addBackup2(CBBackup2);
  TPrepareUtil.addBackup3(CBBackup3);
  TPrepareUtil.addBackup4(CBBackup4);
  TPrepareUtil.addBackup5(CBBackup5);

  DTPGrossDate.Date := Date;
  DTPGrossTime.Time := StartOfTheDay(Now);
  DTPTareDate.Date := Date;
  DTPTareTime.Time := EndOfTheDay(Now);

  if systemConfig = nil then systemConfig := TSysConfig.Create;

  TSysConfigUtil.loadConfig(systemConfig);
  loadFormDesign;
  resizeForm;

  if not insertOrUpdate then
    loadFormContent();
end;

procedure TManualInputForm.loadFormDesign;
begin
  PCar.Visible := systemConfig.carVisible;
  PFaHuo.Visible := systemConfig.faHuoVisible;
  PShouHuo.Visible := systemConfig.shouHuoVisible;
  PGoods.Visible := systemConfig.goodsVisible;
  PSpec.Visible := systemConfig.specVisible;
  PBundle.Visible := systemConfig.bundleVisible;
  PPrice.Visible := systemConfig.priceVisible;
  PCost.Visible := systemConfig.costVisible;
  PRemark.Visible := systemConfig.remarkVisible;

  PBackup1.Visible := systemConfig.backup1Visible;
  PBackup2.Visible := systemConfig.backup2Visible;
  PBackup3.Visible := systemConfig.backup3Visible;
  PBackup4.Visible := systemConfig.backup4Visible;
  PBackup5.Visible := systemConfig.backup5Visible;
  PBackup6.Visible := systemConfig.backup6Visible;
  PBackup7.Visible := systemConfig.backup7Visible;
  PBackup8.Visible := systemConfig.backup8Visible;
  PBackup9.Visible := systemConfig.backup9Visible;

  lblCar.Caption := systemConfig.carCaption;
  lblFaHuo.Caption := systemConfig.faHuoCaption;
  lblShouHuo.Caption := systemConfig.shouHuoCaption;
  lblGoods.Caption := systemConfig.goodsCaption;
  lblSpec.Caption := systemConfig.specCaption;
  lblBundle.Caption := systemConfig.bundleCaption;
  lblPrice.Caption := systemConfig.priceCaption;
  lblCost.Caption := systemConfig.costCaption;
  lblRemark.Caption := systemConfig.remarkCaption;

  lblGross.Caption := systemConfig.grossCaption;
  lblTare.Caption := systemConfig.tareCaption;
  lblNet.Caption := systemConfig.netCaption;
  lblReal.Caption := systemConfig.realCaption;
  lblSum.Caption := systemConfig.sumCaption;

  lblBackup1.Caption := systemConfig.backup1Caption;
  lblBackup2.Caption := systemConfig.backup2Caption;
  lblBackup3.Caption := systemConfig.backup3Caption;
  lblBackup4.Caption := systemConfig.backup4Caption;
  lblBackup5.Caption := systemConfig.backup5Caption;
  lblBackup6.Caption := systemConfig.backup6Caption;
  lblBackup7.Caption := systemConfig.backup7Caption;
  lblBackup8.Caption := systemConfig.backup8Caption;
  lblBackup9.Caption := systemConfig.backup9Caption;
end;

procedure TManualInputForm.resizeForm;
var w: integer;
  i, commonVisibleCount, otherVisibleCount: Integer;
begin
  //�����ߵ���������9,�Ͱѱ�����Ŀ�ŵ��������
  commonVisibleCount := 0;
  otherVisibleCount := 0;
  for i := 0 to PCommon.ControlCount - 1 do
  begin
    if PCommon.Controls[i].Visible then
      Inc(commonVisibleCount);
  end;
  for i := 0 to POther.ControlCount - 1 do
  begin
    if POther.Controls[i].Visible then
      Inc(otherVisibleCount);
  end;
  if otherVisibleCount <= (9 - commonVisibleCount) then
  begin
    PBackup1.Align := alBottom;
    PBackup1.Parent := PCommon;
    PBackup1.Align := alTop;
    PBackup2.Align := alBottom;
    PBackup2.Parent := PCommon;
    PBackup2.Align := alTop;
    PBackup3.Align := alBottom;
    PBackup3.Parent := PCommon;
    PBackup3.Align := alTop;
    PBackup4.Align := alBottom;
    PBackup4.Parent := PCommon;
    PBackup4.Align := alTop;
    PBackup5.Align := alBottom;
    PBackup5.Parent := PCommon;
    PBackup5.Align := alTop;
    PBackup6.Align := alBottom;
    PBackup6.Parent := PCommon;
    PBackup6.Align := alTop;
    PBackup7.Align := alBottom;
    PBackup7.Parent := PCommon;
    PBackup7.Align := alTop;
    PBackup8.Align := alBottom;
    PBackup8.Parent := PCommon;
    PBackup8.Align := alTop;
    PBackup9.Align := alBottom;
    PBackup9.Parent := PCommon;
    PBackup9.Align := alTop;

    POther.Visible := False;
  end
  else
  begin
    PBackup1.Align := alBottom;
    PBackup1.Parent := POther;
    PBackup1.Align := alTop;
    PBackup2.Align := alBottom;
    PBackup2.Parent := POther;
    PBackup2.Align := alTop;
    PBackup3.Align := alBottom;
    PBackup3.Parent := POther;
    PBackup3.Align := alTop;
    PBackup4.Align := alBottom;
    PBackup4.Parent := POther;
    PBackup4.Align := alTop;
    PBackup5.Align := alBottom;
    PBackup5.Parent := POther;
    PBackup5.Align := alTop;
    PBackup6.Align := alBottom;
    PBackup6.Parent := POther;
    PBackup6.Align := alTop;
    PBackup7.Align := alBottom;
    PBackup7.Parent := POther;
    PBackup7.Align := alTop;
    PBackup8.Align := alBottom;
    PBackup8.Parent := POther;
    PBackup8.Align := alTop;
    PBackup9.Align := alBottom;
    PBackup9.Parent := POther;
    PBackup9.Align := alTop;

    POther.Visible := True;
  end;

  if POther.Visible then
    PCommon.Width := PInput.Width div 2
  else
    PCommon.Width := PInput.Width;

  CBCar.Canvas.Lock;
  w := PCommon.Width - 100;
  CBCar.Width := w - 30;
  SBCar.Left := CBCar.Left + CBCar.Width + 10;
  CBFaHuo.Width := w;
  CBShouHuo.Width := w;
  CBGoods.Width := w;
  CBSpec.Width := w;
  CBBundle.Width := w;
  CBPrice.Width := w;
  CBCost.Width := w;
  CBRemark.Width := w;
  CBCar.Canvas.UnLock;

  w := PCommon.Width - 100;
  CBBackup1.Width := w;
  CBBackup2.Width := w;
  CBBackup3.Width := w;
  CBBackup4.Width := w;
  CBBackup5.Width := w;

  CBBackup6.Width := w;
  CBBackup7.Width := w;
  CBBackup8.Width := w;
  CBBackup9.Width := w;
end;

procedure TManualInputForm.CBBundleChange(Sender: TObject);
begin
  changeWeight;
end;

procedure TManualInputForm.CBPriceChange(Sender: TObject);
begin
  changePrice; 
end;

procedure TManualInputForm.BitBtnOKClick(Sender: TObject);
var w: TWeightRecord;
  log: string;
begin
  //û�г���,���ܱ���
  if CBCar.Text = '' then
    Exit;

  w := TWeightRecord.Create;
  try
    if insertOrUpdate then
    begin
      w.id := 0;
      w.glideNo := ''
    end
    else
    begin
      w.id := recordId;
      w.glideNo := lblGlideNo.Caption;
    end;
    w.carNo := CBCar.Text;
    w.oper := MainForm.currentUser;
    w.faHuo := CBFaHuo.Text;
    w.shouHuo := CBShouHuo.Text;
    w.goods := CBGoods.Text;
    w.spec := CBSpec.Text;
    w.gross := CBGross.Value;
    w.tare := CBTare.Value;
    w.net := CBNet.Value;
    w.bundle := CBBundle.Value;
    w.real := CBReal.Value;
    w.price := CBPrice.Value;
    w.sum := CBSum.Value;
    w.cost := CBCost.Value;
    w.scaleMan := '';
    w.grossTime := StrToDateTime(FormatDateTime('yyyy-MM-dd', DTPGrossDate.Date)
      + ' ' + FormatDateTime('HH:mm:ss', DTPGrossTime.Time));
    w.tareTime := StrToDateTime(FormatDateTime('yyyy-MM-dd', DTPTareDate.Date)
      + ' ' + FormatDateTime('HH:mm:ss', DTPTareTime.Time));
    w.memo := CBRemark.Text;
    w.upload := False;
    w.backup1 := CBBackup1.Text;
    w.backup2 := CBBackup2.Text;
    w.backup3 := CBBackup3.Text;
    w.backup4 := CBBackup4.Text;
    w.backup5 := CBBackup5.Text;
    w.backup6 := StrToFloatDef(CBBackup6.Text, 0);
    w.backup7 := StrToFloatDef(CBBackup7.Text, 0);
    w.backup8 := StrToFloatDef(CBBackup8.Text, 0);
    w.backup9 := StrToFloatDef(CBBackup9.Text, 0);
    if TWeightUtil.save(w) then
    begin
      if insertOrUpdate then
      begin
        TDBCommonUtil.AddLog('������¼:' + w.glideNo + ',' + w.carNo + ',' + FloatToStr(w.gross)
          + ',' + FloatToStr(w.tare) + ',' + FloatToStr(w.net));
      end
      else
      begin

        Log := '��ˮ��Ϊ' + lblGlideNo.Caption + '�ļ�¼:';
        if ini_w.carNo <> w.carNo then
          Log := Log + '������ ' + ini_w.carNo + ' �޸�Ϊ '
            + w.carNo + ',';
        if ini_w.faHuo <> w.faHuo then
          Log := Log + '������λ�� ' + ini_w.faHuo + ' �޸�Ϊ '
            + w.faHuo + ',';
        if ini_w.shouHuo <> w.shouHuo then
          Log := Log + '�ջ���λ�� ' + ini_w.shouHuo + ' �޸�Ϊ '
            + w.shouHuo + ',';
        if ini_w.goods <> w.goods then
          Log := Log + '������ ' + ini_w.goods + ' �޸�Ϊ '
            + w.goods + ',';
        if ini_w.spec <> w.spec then
          Log := Log + '����� ' + ini_w.spec + ' �޸�Ϊ '
            + w.spec + ',';
        if ini_w.gross <> w.gross then
          Log := Log + 'ë���� ' + FloatToStr(ini_w.gross) + ' �޸�Ϊ '
            + FloatToStr(w.gross) + ',';
        if ini_w.tare <> w.tare then
          Log := Log + 'Ƥ���� ' + FloatToStr(ini_w.tare) + ' �޸�Ϊ '
            + FloatToStr(w.tare) + ',';
        if ini_w.net <> w.net then
          Log := Log + '������ ' + FloatToStr(ini_w.net) + ' �޸�Ϊ '
            + FloatToStr(w.net) + ',';
        if ini_w.bundle <> w.bundle then
          Log := Log + '������ ' + FloatToStr(ini_w.bundle) + ' �޸�Ϊ '
            + FloatToStr(w.bundle) + ',';
        if ini_w.real <> w.real then
          Log := Log + 'ʵ���� ' + FloatToStr(ini_w.real) + ' �޸�Ϊ '
            + FloatToStr(w.real) + ',';
        if ini_w.price <> w.price then
          Log := Log + '������ ' + FloatToStr(ini_w.price) + ' �޸�Ϊ '
            + FloatToStr(w.price) + ',';
        if ini_w.sum <> w.sum then
          Log := Log + '����� ' + FloatToStr(ini_w.sum) + ' �޸�Ϊ '
            + FloatToStr(w.sum) + ',';

        TDBCommonUtil.AddLog('���ļ�¼:' + log);
      end;
      Application.MessageBox('���ݱ���ɹ�', '��ʾ', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end;
  finally
    w.Free;
  end;
end;

procedure TManualInputForm.SBCarClick(Sender: TObject);
begin
  CarForm.ShowModal;
  CBCar.Text := CarForm.LECar.Text;
end;

procedure TManualInputForm.loadFormContent;
begin
  with DataQueryForm.DBGridEhWeight.DataSource.DataSet do
  begin
    recordId := FieldByName('���').AsInteger;
    lblGlideNo.Caption := FieldByName('��ˮ��').AsString;
    CBCar.Text := FieldByName('����').AsString;
    CBFaHuo.Text := FieldByName('������λ').AsString;
    CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
    CBGoods.Text := FieldByName('����').AsString;
    CBSpec.Text := FieldByName('���').AsString;
    CBGross.Text := FieldByName('ë��').AsString;
    CBTare.Text := FieldByName('����').AsString;
    CBNet.Text := FieldByName('����').AsString;
    CBBundle.Text := FieldByName('����').AsString;
    CBReal.Text := FieldByName('ʵ��').AsString;
    CBPrice.Text := FieldByName('����').AsString;
    CBSum.Text := FieldByName('���').AsString;
    CBCost.Text := FieldByName('������').AsString;
    DTPGrossDate.Date := FieldByName('ë��ʱ��').AsDateTime;
    DTPGrossTime.Time := FieldByName('ë��ʱ��').AsDateTime;
    DTPTareDate.Date := FieldByName('����ʱ��').AsDateTime;
    DTPTareTime.Time := FieldByName('����ʱ��').AsDateTime;
    CBRemark.Text := FieldByName('��ע').AsString;
    CBBackup1.Text := FieldByName('����1').AsString;
    CBBackup2.Text := FieldByName('����2').AsString;
    CBBackup3.Text := FieldByName('����3').AsString;
    CBBackup4.Text := FieldByName('����4').AsString;
    CBBackup5.Text := FieldByName('����5').AsString;
    CBBackup6.Text := FieldByName('����6').AsString;
    CBBackup7.Text := FieldByName('����7').AsString;
    CBBackup8.Text := FieldByName('����8').AsString;
    CBBackup9.Text := FieldByName('����9').AsString;

    if ini_w = nil then ini_w := TWeightRecord.Create;

    ini_w.id := recordId;
    ini_w.glideNo := lblGlideNo.Caption;
    ini_w.carNo := CBCar.Text;
    ini_w.faHuo := CBFaHuo.Text;
    ini_w.shouHuo := CBShouHuo.Text;
    ini_w.goods := CBGoods.Text;
    ini_w.spec := CBSpec.Text;
    ini_w.gross := FieldByName('ë��').AsFloat;
    ini_w.tare := FieldByName('����').AsFloat;
    ini_w.net := FieldByName('����').AsFloat;
    ini_w.bundle := FieldByName('����').AsFloat;
    ini_w.real := FieldByName('ʵ��').AsFloat;
    ini_w.price := FieldByName('����').AsFloat;
    ini_w.sum := FieldByName('���').AsFloat;
    ini_w.cost := FieldByName('������').AsFloat;
    ini_w.grossTime := FieldByName('ë��ʱ��').AsDateTime;
    ini_w.tareTime := FieldByName('����ʱ��').AsDateTime;
    ini_w.memo := CBRemark.Text;
    ini_w.backup1 := CBBackup1.Text;
    ini_w.backup2 := CBBackup2.Text;
    ini_w.backup3 := CBBackup3.Text;
    ini_w.backup4 := CBBackup4.Text;
    ini_w.backup5 := CBBackup5.Text;
    ini_w.backup6 := CBBackup6.Value;
    ini_w.backup7 := CBBackup7.Value;
    ini_w.backup8 := CBBackup8.Value;
    ini_w.backup9 := CBBackup9.Value;

  end;
end;

end.

