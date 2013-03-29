unit DBMaintain;

interface

uses
  Windows, Classes, Controls, Forms, Dialogs, StdCtrls, Buttons,
  Comobj, ExtCtrls, SysUtils, StrUtils, IniFiles;

type
  TDBMaintainForm = class(TForm)
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BtnBack: TBitBtn;
    BtnRestore: TBitBtn;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    GroupBox1: TGroupBox;
    RBManual: TRadioButton;
    RBEveryEnd: TRadioButton;
    RBEveryHour: TRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnRestoreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure OpenDialog1Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function BackupDatabase(srcFileName, destFileName, dbPassWord: string;
      compactFlag: boolean): boolean; //ѹ�����ݿ�,����Դ�ļ�
    function ExtractStr(str: string): string;
  end;
var
  DBMaintainForm: TDBMaintainForm;

implementation

uses QueryDM, Main, CommonUtil;

{$R *.dfm}

function TDBMaintainForm.BackupDatabase(srcFileName, destFileName, dbPassWord: string; compactFlag: boolean): boolean; //ѹ�����ݿ�,����Դ�ļ�
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
    result := false //ѹ��ʧ��
  end
  else
    result := CopyFile(pchar(srcFileName), pchar(destFileName), false)
end;

function TDBMaintainForm.ExtractStr(str: string): string;
var
  start, tool, Num: Integer;
begin
  start := Pos('Data Source=', str) + 12;
  tool := Pos(';Mode=', str);
  Num := tool - start;
  result := Copy(str, start, Num)
end;

procedure TDBMaintainForm.BitBtn3Click(Sender: TObject);
var path: string;
begin
  path := TCommonUtil.SelectFolder(Handle, '��ѡ�񱸷�·��:  ');
  if path <> '' then
  begin
    if RightStr(path, 1) = '\' then
      Label3.Caption := path
    else
      Label3.Caption := path + '\'
  end
end;

procedure TDBMaintainForm.BitBtn5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit2.Text := OpenDialog1.FileName
end;

procedure TDBMaintainForm.BtnBackClick(Sender: TObject);
var myini: TiniFile;
  srcFileName, destFileName: string;
begin
  if Label3.Caption <> '' then
  begin
    myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
    try
      if RBManual.Checked then
      begin
        srcFileName := ExtractStr(QueryDataModule.DBConnection.ConnectionString);
        destFileName := Label3.Caption + FormatDateTime('yyyy-MM-dd hh-mm-ss', Now) + '.mdb';
        QueryDataModule.DBConnection.Close;
        if BackupDatabase(srcFileName, destFileName, 'DTL83973118',
          CheckBox2.Checked) then
        begin
          myini.WriteString('���ݿ�', '���ݵ�ַ', Label3.Caption);
          MessageDlg('���ݿⱸ�ݳɹ���' + Char(13) + '�����ļ�Ϊ"'
            + destFileName + '"', mtInformation, [mbOK], 0);
          myini.Writeinteger('���ݿ�', '��������', 1);
          MainForm.systemConfig.backupType := 1;
        end
        else
          MessageDlg('���ݿⱸ��ʧ�ܣ�', mtWarning, [mbOK], 0);
        QueryDataModule.DBConnection.Open
      end
      else if RBEveryHour.Checked then
      begin
        myini.Writeinteger('���ݿ�', '��������', 2);
        myini.WriteString('���ݿ�', '���ݵ�ַ', Label3.Caption);
        myini.WriteBool('���ݿ�', 'ѹ��', CheckBox2.Checked);
        MessageDlg('���ݿⱸ�����óɹ��������ڿ�ʼÿ��Сʱ�����Զ�����һ�Σ�',
          mtInformation, [mbOK], 0);
        MainForm.systemConfig.backupType := 2;
      end
      else
      begin
        myini.Writeinteger('���ݿ�', '��������', 3);
        myini.WriteString('���ݿ�', '���ݵ�ַ', Label3.Caption);
        myini.WriteBool('���ݿ�', 'ѹ��', CheckBox2.Checked);
        MessageDlg('���ݿⱸ�����óɹ���ÿ�γ������ʱ��������Զ����ݣ�',
          mtInformation, [mbOK], 0);
        MainForm.systemConfig.backupType := 3;
      end;
      MainForm.setAutoBackup(RBEveryHour.Checked);
    finally
      myini.Free;
    end;
    Close
  end
  else
    MessageDlg('���ݿⱸ��·��û��ѡ��,�޷����б��ݣ�', mtWarning, [mbOK], 0)
end;

procedure TDBMaintainForm.BtnRestoreClick(Sender: TObject);
var
  srcFileName, destFileName: string;
begin
  srcFileName := Edit2.Text;
  if (srcFileName <> '') and (FileExists(srcFileName)) then
  begin
    destFileName := ExtractStr(QueryDataModule.DBConnection.ConnectionString);
    QueryDataModule.DBConnection.Close;
    if CopyFile(pchar(srcFileName), pchar(destFileName), false) then
      MessageDlg('���ݿ�ָ��ɹ���', mtInformation, [mbOK], 0)
    else
      MessageDlg('���ݿ�ָ�ʧ�ܣ�', mtWarning, [mbOK], 0);
    QueryDataModule.DBConnection.Open;
    Close
  end
  else
    MessageDlg('���ݿ�ָ�·��û��ѡ��,�޷����лָ���', mtWarning, [mbOK], 0)
end;

procedure TDBMaintainForm.FormShow(Sender: TObject);
var myini: TIniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    Label3.Caption := myini.ReadString('���ݿ�', '���ݵ�ַ', 'D:\');
    Edit2.Text := myini.ReadString('���ݿ�', '���ݵ�ַ', 'D:\');
    case myini.ReadInteger('���ݿ�', '��������', 3) of
      1: RBManual.Checked := true;
      2: RBEveryHour.Checked := true;
      3: RBEveryEnd.Checked := true;
    else
      RBEveryEnd.Checked := true
    end;
  finally
    myini.Free;
  end;
end;

procedure TDBMaintainForm.BtnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TDBMaintainForm.OpenDialog1Show(Sender: TObject);
begin
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0)) + '\Bak'
end;

end.
