unit Voice;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls;

type
  TVoiceForm = class(TForm)
    MemoVoiceList: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VoiceForm: TVoiceForm;

implementation



{$R *.dfm}

procedure TVoiceForm.FormShow(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt') then
    Exit;
  MemoVoiceList.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
end;

end.

