unit ModifyPassword;

interface

uses
  Classes, Controls, Forms, StdCtrls, DB, SysUtils,
  ADODB, Buttons, Dialogs;

type
  TModifyPasswordForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdtOld: TEdit;
    EdtNew: TEdit;
    EdtRenew: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyPasswordForm: TModifyPasswordForm;

implementation

uses QueryDM, Main, CommonUtil;

{$R *.dfm}

procedure TModifyPasswordForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TModifyPasswordForm.FormShow(Sender: TObject);
begin
  Label1.Caption := Label1.Caption + MainForm.CurrentUser;
end;

procedure TModifyPasswordForm.BitBtn2Click(Sender: TObject);
var OldPassword, NewPassword: string;
begin
  with QueryDataModule.ADOQueryUser do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 密码 from 用户信息 where 用户名=:user');
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Open;
    OldPassword := FieldByName('密码').AsString;
    if UpperCase(TCommonUtil.md5(EdtOld.Text)) <> UpperCase(OldPassword) then
    begin
      MessageDlg('旧密码不正确', mtWarning, [mbOK], 0);
      EdtOld.Clear;
      Exit
    end;
    if EdtNew.Text = '' then
    begin
      MessageDlg('密码不能为空', mtWarning, [mbOK], 0);
      EdtNew.SetFocus;
      Exit
    end
    else if EdtNew.Text <> EdtRenew.Text then
    begin
      MessageDlg('两次新密码输入不一致,请重新输入!', mtWarning, [mbOK], 0);
      EdtNew.Clear;
      EdtRenew.Clear;
      Exit
    end;
    NewPassword := UpperCase(TCommonUtil.Md5(EdtNew.Text));
    SQL.Clear;
    SQL.Add('update 用户信息 set 密码=:newpass where 用户名=:user');
    Parameters.ParamByName('newpass').Value := NewPassword;
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    ExecSQL;
    MessageDlg('密码修改成功', mtInformation, [mbOK], 0);
    Self.Close
  end
end;

end.
