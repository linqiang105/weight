unit Waiting;

interface

uses
  Classes, Controls, Forms, ExtCtrls, Gauges, StdCtrls;

type
  TWaitingForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Gauge1: TGauge;
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitingForm: TWaitingForm;

implementation

{$R *.dfm}

procedure TWaitingForm.FormShow(Sender: TObject);
begin
  Label3.Font.Color := $000000;
  Label3.Caption := '数据库导出中，请稍候......';
  Gauge1.Progress := 0
end;

procedure TWaitingForm.FormPaint(Sender: TObject);
begin
  Gauge1.Progress := Gauge1.Progress + 1
end;


end.
