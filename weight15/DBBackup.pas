unit DBBackup;

interface

uses
  Windows, Classes, Controls, Forms, Dialogs, IniFiles,
  ExtCtrls, StdCtrls, Gauges, Comobj, SysUtils;

type
  TDBBackupForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Gauge1: TGauge;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBBackupForm: TDBBackupForm;
  backupFlag: boolean;
implementation

uses QueryDM;

{$R *.dfm}

function BackupDatabase(srcFileName, destFileName, dbPassWord: string; compactFlag: boolean): boolean; //ѹ�����ݿ�,����Դ�ļ�
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
var
  DB: OleVariant;
begin
  if compactFlag then
  try
    DB := CreateOleObject('JRO.JetEngine'); //����OLE����,��������OLE���󳬹��������Զ��ͷ�
    OleCheck(DB.CompactDatabase(format(SConnectionString, [srcFileName, dbPassWord]), format(SConnectionString, [destFileName, dbPassWord]))); //ѹ�����ݿ�
    result := true;
  except
    result := false; //ѹ��ʧ��
  end
  else
    result := CopyFile(pchar(srcFileName), pchar(destFileName), false);
end;

function ExtractStr(str: string): string;
var
  start, tool, Num: Integer;
begin
  start := Pos('Data Source=', str) + 12;
  tool := Pos(';Mode=', str);
  Num := tool - start;
  result := Copy(str, start, Num);
end;

procedure TDBBackupForm.FormShow(Sender: TObject);
var myini: TIniFile;
  srcFileName: string;
  compactFlag: boolean;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    Timer1.Enabled := true;
    Timer2.Enabled := false;
    backupFlag := false;
    Label2.Caption := '';
    Label3.Font.Color := $000000;
    Label3.Caption := '���ݿ��Զ������У����Ժ�......';
    Gauge1.Progress := 1;
    Label2.Caption := myini.ReadString('���ݿ�', '���ݵ�ַ', ExtractFilePath(ParamStr(0)) + '\Database\') + FormatDateTime('yyyy-MM-dd hh-mm-ss', Now) + '.mdb';
    srcFileName := ExtractStr(QueryDataModule.DBConnection.ConnectionString);
    compactFlag := myini.ReadBool('���ݿ�', 'ѹ��', true);
    if Label2.Caption <> '' then
    begin
      QueryDataModule.DBConnection.Close;
      if BackupDatabase(srcFileName, Label2.Caption, 'DTL83973118', compactFlag) then
        backupFlag := true
      else
        backupFlag := false;
      QueryDataModule.DBConnection.Open;
    end
    else
    begin
      MessageDlg('���ݿⱸ�ݵ�ַδ���ã��޷������Զ����ݣ�', mtWarning, [mbOK], 0);
      Close;
    end;
  finally
    myini.Free;
  end;
end;

procedure TDBBackupForm.Timer1Timer(Sender: TObject);
begin
  Gauge1.Progress := Gauge1.Progress + 1;
  if Gauge1.Progress = 100 then
  begin
    Timer2.Enabled := true;
    Timer1.Enabled := false;
    if backupFlag then
    begin
      Label3.Font.Color := $00FF00;
      Label3.Caption := '���ݿ��Զ����ݳɹ���';
    end
    else
    begin
      //Label3.Font.Color := $0000FF;
      //Label3.Caption := '���ݿ��Զ�����ʧ�ܣ�';
    end;
  end;
end;

procedure TDBBackupForm.Timer2Timer(Sender: TObject);
begin
  Close;
end;

end.
