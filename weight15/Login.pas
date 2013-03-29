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
    EnterTime: Integer; //����ȫ�ֱ��������û��������ʱ�������˳�
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
    SQL.Add('select �û��� from �û���Ϣ order by �û���');
    Open;
    if not IsEmpty then
    begin
      First;
      CBUser.Items.Clear;
      while not Eof do
      begin
        CBUser.Items.Add(FieldByName('�û���').AsString);
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
      SQL.Add('select ���� from �û���Ϣ where �û���=:user');
      Parameters.ParamByName('user').Value := CBUser.Text;
      Open;
      if UpperCase(FieldByName('����').AsString) = UpperCase(TCommonUtil.Md5(EdtPass.Text)) then
      begin
        Self.Close;
        MainForm.CurrentUser := CBUser.Text;
      end
      else
      begin
        if EnterTime < 1 then
          MessageDlg('�û����������д�����ȷ���룡', mtError, [mbOK], 0);
        inc(EnterTime); //��Ϣ���һ�Σ����Զ���1
        if EnterTime = 2 then
          MessageDlg('�û����������������һ�Σ������˳���', mtError, [mbOK], 0);
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
  if MessageBox(0, '�˲��������������û�������Ϊ"123",��ȷ��Ҫ��ô����?',
    '��ʾ', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES
    then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'update �û���Ϣ set ����=:p';
      Parameters.ParamByName('p').Value := TCommonUtil.md5('123');
      ExecSQL;
    end;
  end;
end;

end.

