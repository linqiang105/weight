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
      compactFlag: boolean): boolean; //压缩数据库,覆盖源文件
    function ExtractStr(str: string): string;
  end;
var
  DBMaintainForm: TDBMaintainForm;

implementation

uses QueryDM, Main, CommonUtil;

{$R *.dfm}

function TDBMaintainForm.BackupDatabase(srcFileName, destFileName, dbPassWord: string; compactFlag: boolean): boolean; //压缩数据库,覆盖源文件
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
var
  DB: OleVariant;
begin
  if compactFlag then
  try
    DB := CreateOleObject('JRO.JetEngine'); //建立OLE对象,函数结束OLE对象超过作用域自动释放
    OleCheck(DB.CompactDatabase(format(SConnectionString, [srcFileName, dbPassWord]), format(SConnectionString, [destFileName, dbPassWord]))); //压缩数据库
    result := true;
  except
    result := false //压缩失败
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
  path := TCommonUtil.SelectFolder(Handle, '请选择备份路径:  ');
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
          myini.WriteString('数据库', '备份地址', Label3.Caption);
          MessageDlg('数据库备份成功！' + Char(13) + '备份文件为"'
            + destFileName + '"', mtInformation, [mbOK], 0);
          myini.Writeinteger('数据库', '备份类型', 1);
          MainForm.systemConfig.backupType := 1;
        end
        else
          MessageDlg('数据库备份失败！', mtWarning, [mbOK], 0);
        QueryDataModule.DBConnection.Open
      end
      else if RBEveryHour.Checked then
      begin
        myini.Writeinteger('数据库', '备份类型', 2);
        myini.WriteString('数据库', '备份地址', Label3.Caption);
        myini.WriteBool('数据库', '压缩', CheckBox2.Checked);
        MessageDlg('数据库备份设置成功！从现在开始每个小时将会自动备份一次！',
          mtInformation, [mbOK], 0);
        MainForm.systemConfig.backupType := 2;
      end
      else
      begin
        myini.Writeinteger('数据库', '备份类型', 3);
        myini.WriteString('数据库', '备份地址', Label3.Caption);
        myini.WriteBool('数据库', '压缩', CheckBox2.Checked);
        MessageDlg('数据库备份设置成功！每次程序结束时将会进行自动备份！',
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
    MessageDlg('数据库备份路径没有选择,无法进行备份！', mtWarning, [mbOK], 0)
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
      MessageDlg('数据库恢复成功！', mtInformation, [mbOK], 0)
    else
      MessageDlg('数据库恢复失败！', mtWarning, [mbOK], 0);
    QueryDataModule.DBConnection.Open;
    Close
  end
  else
    MessageDlg('数据库恢复路径没有选择,无法进行恢复！', mtWarning, [mbOK], 0)
end;

procedure TDBMaintainForm.FormShow(Sender: TObject);
var myini: TIniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    Label3.Caption := myini.ReadString('数据库', '备份地址', 'D:\');
    Edit2.Text := myini.ReadString('数据库', '备份地址', 'D:\');
    case myini.ReadInteger('数据库', '备份类型', 3) of
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
