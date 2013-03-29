unit InputWeight;

interface

uses
  Classes, Controls, Forms, StdCtrls, Buttons, SysUtils, Math;

type
  TInputWeightForm = class(TForm)
    RBGross: TRadioButton;
    RBTare: TRadioButton;
    EdtWeight: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure EdtWeightKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputWeightForm: TInputWeightForm;

implementation

uses Main;

{$R *.dfm}

procedure TInputWeightForm.EdtWeightKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '.', #8]) then
    Key := #0
end;

procedure TInputWeightForm.BitBtn1Click(Sender: TObject);
begin
  if EdtWeight.Text = '' then
    Exit;
  with MainForm do
  begin
    if RBGross.Checked then
      PGross.Caption := EdtWeight.Text
    else
      PTare.Caption := EdtWeight.Text;

    PNet.Caption := FloatToStr(StrToFloatDef(PGross.Caption, 0) - StrToFloatDef(PTare.Caption, 0));
    if (Trim(CBBundle.Text) <> '') then
    begin
      if systemConfig.useBundleRate then
        PReal.Caption := FloatToStr(RoundTo(StrToFloatDef(PNet.Caption, 0)
          * (1 - StrToFloatDef(CBBundle.Text, 0) / 100), 0 - systemConfig.sumPoint))
      else
        PReal.Caption := FloatToStr(StrToFloatDef(PNet.Caption, 0) - StrToFloatDef(CBBundle.Text, 0));
      if (Trim(CBPrice.Text) <> '') then
        PSum.Caption := FloatToStr(RoundTo(StrToFloatDef(PReal.Caption, 0)
          * StrToFloatDef(CBPrice.Text, 0), 0 - systemConfig.sumPoint))
    end
  end;

  MainForm.WeightType := ' ÷π§';
end;

procedure TInputWeightForm.BitBtn2Click(Sender: TObject);
begin
  Close
end;

procedure TInputWeightForm.FormShow(Sender: TObject);
begin
  EdtWeight.SetFocus;
end;

end.
