unit BackRecord;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PrnDbgeh, DBGridEh, DBGridEhImpExp,
  ComCtrls, GridsEh;

type
  TBackRecordForm = class(TForm)
    DBGrid1: TDBGridEh;
    SaveDialog1: TSaveDialog;
    PrintDBGridEh1: TPrintDBGridEh;
    Panel1: TPanel;
    BtnPrint: TButton;
    BtnExport: TButton;
    DTP: TDateTimePicker;
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BackRecordForm: TBackRecordForm;

implementation

uses QueryDM;

{$R *.dfm}

procedure TBackRecordForm.BtnPrintClick(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGrid1;
  PrintDBGridEh1.Preview;
end;

procedure TBackRecordForm.BtnExportClick(Sender: TObject);
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

procedure TBackRecordForm.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := QueryDataModule.DSLog;
  with QueryDataModule.ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_back_record order by id desc');
    Open
  end
end;

procedure TBackRecordForm.DTPChange(Sender: TObject);
begin
  DBGrid1.DataSource := QueryDataModule.DSLog;
  with QueryDataModule.ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_back_record where (weight_time between :start and :end) order by id desc');
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-mm-dd 00:00:00', DTP.Date);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-mm-dd 23:59:59', DTP.Date);
    Open
  end
end;

end.
