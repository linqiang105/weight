unit TareChart;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms,
  TeeProcs, TeEngine, Chart, ExtCtrls, Series, StdCtrls, ComCtrls, DBChart;

type
  TTareChartForm = class(TForm)
    Panel1: TPanel;
    CBCar: TComboBox;
    BtnQuery: TButton;
    BtnExport: TButton;
    DTPStart: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DBChartTare: TDBChart;
    SeriesTare: TFastLineSeries;
    procedure FormShow(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TareChartForm: TTareChartForm;

implementation

uses
  CommonUtil, DateUtils, QueryDM, PrepareUtil;

{$R *.dfm}

procedure TTareChartForm.FormShow(Sender: TObject);
begin
  TPrepareUtil.addWeightCar(CBCar);
  DTPStart.DateTime := StartOfTheMonth(Now);
  DTPEnd.DateTime := EndOfTheMonth(Now);
end;

procedure TTareChartForm.BtnExportClick(Sender: TObject);
var t: string;
begin
  t := TCommonUtil.saveFile('', '位图文件', 'bmp');
  if t <> '' then
    DBChartTare.SaveToBitmapFile(t);
end;

procedure TTareChartForm.BtnQueryClick(Sender: TObject);
var c: TChartSeries;
begin
  if CBCar.Text = '' then
    Exit;

  SeriesTare.DataSource := QueryDataModule.ADOQChart;
  SeriesTare.XLabelsSource := 'tareTime';
  SeriesTare.YValues.ValueSource := 'tare';

  DBChartTare.Title.Caption := CBCar.Text + ' '
    + FormatDateTime('yyyy-MM-dd', DTPStart.Date) + ' --- '
    + FormatDateTime('yyyy-MM-dd', DTPEnd.Date) + ' 皮重走势图';

  with QueryDataModule.ADOQChart do
  begin
    Close;
    SQL.Text := 'select 空重 as tare,Format(空重时间,''yyyy-MM-dd'') as tareTime from 称重信息 '
      + 'where (车号=:carNo) and (空重时间 between :start and :end)';
    Parameters.ParamByName('carNo').Value := CBCar.Text;
    Parameters.ParamByName('start').Value := DTPStart.DateTime;
    Parameters.ParamByName('end').Value := DTPEnd.DateTime;
    Open;
  end;
end;

end.

