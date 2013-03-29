program ComAssistant;

uses
  Forms,
  Windows,
  main in 'main.pas' {FrmMain},
  Common1 in 'Common1.pas',
  Lunar in 'Lunar.pas',
  Lunar2 in 'Lunar2.pas',
  UCRC16 in 'UCRC16.pas',
  ThirdPart in 'ThirdPart.pas' {ThirdPartForm},
  PPI in 'PPI.pas',
  LED680 in 'LED680.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '´®¿Úµ÷ÊÔÖúÊÖ';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TThirdPartForm, ThirdPartForm);
  Application.Run;
end.

