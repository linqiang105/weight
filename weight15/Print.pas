unit Print;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons;

type
  TPreviewSetForm = class(TForm)
    EdtGlideNo: TEdit;
    BitBtnPreview: TBitBtn;
    BitBtnPrint: TBitBtn;
    BitBtnMod: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    procedure BitBtnPreviewClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtnModClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    format: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewSetForm: TPreviewSetForm;

implementation

uses CommonUtil;

{$R *.dfm}

procedure TPreviewSetForm.BitBtnPreviewClick(Sender: TObject);
begin
  TReportUtil.printTicket(EdtGlideNo.Text, True);
end;

procedure TPreviewSetForm.BitBtn4Click(Sender: TObject);
begin
  Close
end;

procedure TPreviewSetForm.BitBtnModClick(Sender: TObject);
begin
  TReportUtil.designTicket(format);
end;

procedure TPreviewSetForm.BitBtnPrintClick(Sender: TObject);
begin
  TReportUtil.printTicket(EdtGlideNo.Text);
end;

procedure TPreviewSetForm.FormCreate(Sender: TObject);
begin
  format := TCommonUtil.getIni.ReadString('ϵͳ����', '������ʽ',
    ExtractFilePath(ParamStr(0)) + '\Ticket\��׼���.fr3');
end;

end.
