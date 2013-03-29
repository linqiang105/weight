unit Log;

interface

uses
  Classes, Controls, Forms,
  Dialogs, StdCtrls, DBGridEh, ExtCtrls, PrnDbgeh, DBGridEhImpExp, GridsEh;

type
  TLogForm = class(TForm)
    DBGrid1: TDBGridEh;
    Panel1: TPanel;
    BtnPrint: TButton;
    BtnExport: TButton;
    PrintDBGridEh1: TPrintDBGridEh;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogForm: TLogForm;

implementation

uses QueryDM;

{$R *.dfm}

procedure TLogForm.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := QueryDataModule.DSLog;
  with QueryDataModule.ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from ��־ order by ��� desc');
    Open
  end
end;

procedure TLogForm.BtnPrintClick(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGrid1;
  PrintDBGridEh1.Preview;
end;

procedure TLogForm.BtnExportClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  FileName: string;
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    MessageDlg('û���κ�����,���ܽ������ݵ���!', mtWarning, [mbOK], 0);
    Exit
  end;
  SaveDialog1.Filter := 'Excel�ļ�|*.xls|�ı��ļ�|*.txt';
  if (SaveDialog1.Execute) and (SaveDialog1.FileName <> '') then
  begin
    case SaveDialog1.FilterIndex of
      1:
        begin
          ExpClass := TDBGridEhExportAsXLS;
          FileName := 'xls'
        end;
      2:
        begin
          ExpClass := TDBGridEhExportAsText;
          FileName := 'txt'
        end
    end;
    FileName := SaveDialog1.FileName + '.' + FileName;
    try
      SaveDBGridEhToExportFile(ExpClass, DBGrid1, FileName, true);
      MessageDlg('���ݵ����ɹ���', mtInformation, [mbOK], 0);
    except
      MessageDlg('���ݵ���ʧ�ܣ�', mtError, [mbOK], 0);
    end
  end
end;

end.
