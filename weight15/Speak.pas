unit Speak;

interface

uses
  Classes, SpeechLib_TLB, ActiveX;

type
  TSpeak = class(TThread)
  private
    { Private declarations }
    t: TSpVoice;
  public
    content: string;   
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TSpeak.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TSpeak }

procedure TSpeak.Execute;
begin
  { Place thread code here }
  CoInitialize(t);
  if t = nil then t := TSpVoice.Create(nil);
  //while True do
  //begin
  if Length(content) > 0 then
    t.Speak(content, 10);
  //end;
end;

end.

