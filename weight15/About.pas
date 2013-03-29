unit About;

interface

uses
  Windows, Classes, Controls, Forms, ExtCtrls, StdCtrls,
  Gauges, CnAACtrls, CnAAFont;

type
  TAboutForm = class(TForm)
    Label2: TLabel;
    Timer1: TTimer;
    Gauge1: TGauge;
    Panel1: TPanel;
    CnAAScrollText1: TCnAAScrollText;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.Timer1Timer(Sender: TObject);
var MemInfo: TMemoryStatus; //���ϵͳ�ڴ���Ϣ�ļ�¼���͡�
begin
  GlobalMemoryStatus(MemInfo); //��ȡϵͳ�ڴ�����
  Gauge1.Progress := MemInfo.dwMemoryLoad;
  if Gauge1.Progress > 80 then
    Gauge1.ForeColor := $0000FF
end;

procedure TAboutForm.FormShow(Sender: TObject);
var MemInfo: TMemoryStatus; //���ϵͳ�ڴ���Ϣ�ļ�¼���͡�
begin
  GlobalMemoryStatus(MemInfo); //��ȡϵͳ�ڴ�����
  Gauge1.Progress := MemInfo.dwMemoryLoad
end;

end.
