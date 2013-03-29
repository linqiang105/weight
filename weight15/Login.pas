unit Login;

interface

uses
  Classes, Controls, Forms, Dialogs, DB, ADODB, StdCtrls, SysUtils,
  ExtCtrls, RzEdit, RzCmboBx, ActnList, Windows, Mask, jpeg;

type
  TLoginForm = class(TForm)
    ImgBack: TImage;
    CBUser: TRzComboBox;
    EdtPass: TRzEdit;
    lblLogin: TLabel;
    ActionList1: TActionList;
    AResetPass: TAction;
    procedure CBUserChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblLoginClick(Sender: TObject);
    procedure EdtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AResetPassExecute(Sender: TObject);
  private
    { Private declarations }
    EnterTime: Integer; //定义全局变量，当用户输错三次时，程序将退出
  public
    { Public declarations }
    procedure login();
  end;

var
  LoginForm: TLoginForm;

implementation

uses Main, QueryDM, CommonUtil;

{$R *.dfm}

procedure TLoginForm.CBUserChange(Sender: TObject);
begin
  EdtPass.Clear;
  EdtPass.SetFocus
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  with QueryDataModule.ADOQueryUser do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 用户名 from 用户信息 order by 用户名');
    Open;
    if not IsEmpty then
    begin
      First;
      CBUser.Items.Clear;
      while not Eof do
      begin
        CBUser.Items.Add(FieldByName('用户名').AsString);
        Next
      end
    end
  end;

  CBUser.Text := '';
  EdtPass.Clear;
  EnterTime := 0;
end;

procedure TLoginForm.lblLoginClick(Sender: TObject);
begin
  login;
end;

procedure TLoginForm.EdtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    login;
end;

procedure TLoginForm.login;
begin
  if CBUser.Text <> '' then
  begin
    with QueryDataModule.ADOQueryUser do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 密码 from 用户信息 where 用户名=:user');
      Parameters.ParamByName('user').Value := CBUser.Text;
      Open;
      if UpperCase(FieldByName('密码').AsString) = UpperCase(TCommonUtil.Md5(EdtPass.Text)) then
      begin
        Self.Close;
        MainForm.CurrentUser := CBUser.Text;
      end
      else
      begin
        if EnterTime < 1 then
          MessageDlg('用户名或密码有错，请正确输入！', mtError, [mbOK], 0);
        inc(EnterTime); //信息输错一次，将自动加1
        if EnterTime = 2 then
          MessageDlg('用户名或密码若再输错一次，程序将退出！', mtError, [mbOK], 0);
        if EnterTime = 3 then
          Application.Terminate;
        EdtPass.Clear;
        EdtPass.SetFocus;
      end
    end
  end
end;

procedure TLoginForm.AResetPassExecute(Sender: TObject);
begin
  if MessageBox(0, '此操作将重置所有用户的密码为"123",你确定要这么做吗?',
    '提示', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES
    then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'update 用户信息 set 密码=:p';
      Parameters.ParamByName('p').Value := TCommonUtil.md5('123');
      ExecSQL;
    end;
  end;
end;

end.

