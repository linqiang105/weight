unit Autoshut;

interface

uses
  Windows, Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TAutoShutForm = class(TForm)
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutoShutForm: TAutoShutForm;

implementation

uses Main, CommonUtil;
{$R *.dfm}

procedure TAutoShutForm.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position = 100 then
    BitBtn1.Click
  else
    ProgressBar1.Position := ProgressBar1.Position + 5
end;

procedure TAutoShutForm.BitBtn1Click(Sender: TObject);
begin
  TCommonUtil.ExitWin32Sys(EWX_POWEROFF)
end;

procedure TAutoShutForm.BitBtn2Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  MainForm.systemConfig.CloseTime := ''
end;

end.
