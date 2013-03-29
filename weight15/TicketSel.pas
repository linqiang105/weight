unit TicketSel;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls;

type
  TTicketSelForm = class(TForm)
    LBTicket: TListBox;
    procedure FormShow(Sender: TObject);
    procedure LBTicketDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listTicket();
  end;

var
  TicketSelForm: TTicketSelForm;

implementation

{$R *.dfm}

procedure TTicketSelForm.listTicket;
var
  sr: TSearchRec;
begin
  LBTicket.Items.Clear;
  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Ticket\*.fr3', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Attr and faDirectory) = 0 then
        LBTicket.Items.Add(Copy(sr.Name, 1, Length(sr.Name) - 4));
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TTicketSelForm.FormShow(Sender: TObject);
begin
  listTicket;
end;

procedure TTicketSelForm.LBTicketDblClick(Sender: TObject);
begin
  Close;
end;

end.
