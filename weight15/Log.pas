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
    SQL.Add('select * from 日志 order by 序号 desc');
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
    MessageDlg('没有任何数据,不能进行数据导出!', mtWarning, [mbOK], 0);
    Exit
  end;
  SaveDialog1.Filter := 'Excel文件|*.xls|文本文件|*.txt';
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
      MessageDlg('数据导出成功！', mtInformation, [mbOK], 0);
    except
      MessageDlg('数据导出失败！', mtError, [mbOK], 0);
    end
  end
end;

end.
