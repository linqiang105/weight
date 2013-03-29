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
    SQL.Add('select ���� from �û���Ϣ where �û���=:user');
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Open;
    OldPassword := FieldByName('����').AsString;
    if UpperCase(TCommonUtil.md5(EdtOld.Text)) <> UpperCase(OldPassword) then
    begin
      MessageDlg('�����벻��ȷ', mtWarning, [mbOK], 0);
      EdtOld.Clear;
      Exit
    end;
    if EdtNew.Text = '' then
    begin
      MessageDlg('���벻��Ϊ��', mtWarning, [mbOK], 0);
      EdtNew.SetFocus;
      Exit
    end
    else if EdtNew.Text <> EdtRenew.Text then
    begin
      MessageDlg('�������������벻һ��,����������!', mtWarning, [mbOK], 0);
      EdtNew.Clear;
      EdtRenew.Clear;
      Exit
    end;
    NewPassword := UpperCase(TCommonUtil.Md5(EdtNew.Text));
    SQL.Clear;
    SQL.Add('update �û���Ϣ set ����=:newpass where �û���=:user');
    Parameters.ParamByName('newpass').Value := NewPassword;
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    ExecSQL;
    MessageDlg('�����޸ĳɹ�', mtInformation, [mbOK], 0);
    Self.Close
  end
end;

end.
