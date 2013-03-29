unit TicketSet;

interface

uses
  SysUtils, Classes, Controls, Forms, ShellAPI,
  ExtCtrls, frxClass, frxPreview, StdCtrls, Menus, RzButton;

type
  TTicketSetForm = class(TForm)
    frxPreview1: TfrxPreview;
    LBTicket: TListBox;
    PMModify: TPopupMenu;
    NModifyTicket: TMenuItem;
    NSetDefault: TMenuItem;
    PTool: TPanel;
    NOpenDir: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtnSetDefault: TRzBitBtn;
    BitBtnModifyTicket: TRzBitBtn;
    lblTicket: TLabel;
    procedure FormShow(Sender: TObject);
    procedure LBTicketClick(Sender: TObject);
    procedure NSetDefaultClick(Sender: TObject);
    procedure NModifyTicketClick(Sender: TObject);
    procedure NOpenDirClick(Sender: TObject);
    procedure BitBtnSetDefaultClick(Sender: TObject);
    procedure BitBtnModifyTicketClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listTicket();
  end;

var
  TicketSetForm: TTicketSetForm;

implementation

uses
  QueryDM, CommonUtil;

{$R *.dfm}

procedure TTicketSetForm.FormShow(Sender: TObject);
begin
  listTicket();
  QueryDataModule.frxReport1.Preview := frxPreview1;
  frxPreview1.PopupMenu := PMModify;
  LBTicket.PopupMenu := PMModify;
  lblTicket.Caption := TCommonUtil.getIni.ReadString('系统设置', '磅单格式',
    ExtractFilePath(ParamStr(0)) + '\Ticket\标准填充.fr3');
end;

procedure TTicketSetForm.listTicket;
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

procedure TTicketSetForm.LBTicketClick(Sender: TObject);
begin
  TDBCommonUtil.getFirstRecord();
  QueryDataModule.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0))
    + 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3');
  QueryDataModule.frxReport1.PrepareReport();
end;

procedure TTicketSetForm.NSetDefaultClick(Sender: TObject);
var s: string;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    s := ExtractFilePath(ParamStr(0)) + 'Ticket\'
      + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
    TCommonUtil.getIni.WriteString('系统设置', '磅单格式', s);
    lblTicket.Caption := s;
  end;
end;

procedure TTicketSetForm.NModifyTicketClick(Sender: TObject);
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    TReportUtil.designTicket(ExtractFilePath(ParamStr(0))
      + 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3');
  end;
end;

procedure TTicketSetForm.NOpenDirClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'Explorer.exe',
    PChar(ExtractFilePath(ParamStr(0)) + 'Ticket\'), nil, 1);
end;

procedure TTicketSetForm.BitBtnSetDefaultClick(Sender: TObject);
var s: string;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    s := ExtractFilePath(ParamStr(0)) + 'Ticket\'
      + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
    TCommonUtil.getIni.WriteString('系统设置', '磅单格式', s);
    lblTicket.Caption := s;
  end;
end;

procedure TTicketSetForm.BitBtnModifyTicketClick(Sender: TObject);
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    TReportUtil.designTicket(ExtractFilePath(ParamStr(0))
      + 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3');
  end;
end;

end.
