unit UserPurview;

interface

uses
  Classes, Controls, Forms, StdCtrls,
  ExtCtrls, DBGridEh, Dialogs, GridsEh;

type
  TUserPurviewForm = class(TForm)
    BtnAdd: TButton;
    BtnMod: TButton;
    BtnCancel: TButton;
    BtnDel: TButton;
    BtnRefresh: TButton;
    Label1: TLabel;
    BtnSave: TButton;
    DBGridEhUser: TDBGridEh;
    PTop: TPanel;
    PFunc: TPanel;
    PUser: TPanel;
    PAttrib: TPanel;
    CBUser: TCheckBox;
    CBDataMaintain: TCheckBox;
    CBDBSet: TCheckBox;
    CBDataExport: TCheckBox;
    CBDataBack: TCheckBox;
    CBPremain: TCheckBox;
    CBManual: TCheckBox;
    CBMeterSet: TCheckBox;
    CBSysSet: TCheckBox;
    CBPrintTicket: TCheckBox;
    CBPrintReport: TCheckBox;
    CBModifyTicket: TCheckBox;
    EdtPass: TEdit;
    GBLegal: TGroupBox;
    Label2: TLabel;
    EdtUser: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEhUserCellClick(Column: TColumnEh);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnModClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure EdtPassChange(Sender: TObject);
  private
    { Private declarations }
    User: string; //��������û�
    InsertOrModify: boolean; //Ϊ0ʱ�������,Ϊ1ʱ�����޸�
    Admin: boolean; //�ǹ���Ա
    PasswordHasChanged: boolean; //�����Ƿ��޸Ĺ�
  public
    { Public declarations }
    //flagΪ0,��Ϊ��ʼδ������޸�״̬ʱ�ĸ���ť״̬;
    //Ϊ1��Ϊ���������޸�״̬��ĸ�����ť��״̬
    procedure SetBtnStatus(Flag: boolean);
  end;

var
  UserPurviewForm: TUserPurviewForm;

implementation

uses QueryDM, Main, CommonUtil;
{$R *.dfm}

procedure TUserPurviewForm.SetBtnStatus(Flag: boolean);
begin
  BtnAdd.Enabled := not Flag;
  BtnMod.Enabled := not Flag;
  BtnSave.Enabled := Flag;
  BtnCancel.Enabled := Flag;
  EdtUser.Enabled := Flag;
  EdtPass.Enabled := Flag;
  GBLegal.Enabled := Flag;
  DBGridEhUser.Enabled := not Flag;
end;

procedure TUserPurviewForm.FormShow(Sender: TObject);
begin
  with QueryDataModule.ADOQueryUser do
  begin
    Close;
    SQL.Text := 'select * from �û���Ϣ';
    Open;
    RecordSet.Properties.Get_Item('Update Criteria').Value := 0
  end;
  DBGridEhUser.DataSource := QueryDataModule.DataSourceUserShow;
  PasswordHasChanged := false; //Ĭ��û�б��޸Ĺ�
end;

procedure TUserPurviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBGridEhUser.DataSource := nil;
end;

procedure TUserPurviewForm.DBGridEhUserCellClick(Column: TColumnEh);
begin
  with QueryDataModule.ADOQueryUser do
  begin
    User := FieldByName('�û���').AsString;
    EdtUser.Text := User;
    //EdtPass.Text := '123456'; //FieldByName('����').AsString;
    CBUser.Checked := FieldByName('�û�����').AsBoolean;
    CBDataMaintain.Checked := FieldByName('����ά��').AsBoolean;
    CBDBSet.Checked := FieldByName('��������').AsBoolean;
    CBDataExport.Checked := FieldByName('���ݵ���').AsBoolean;
    CBDataBack.Checked := FieldByName('���ݱ���').AsBoolean;
    CBPremain.Checked := FieldByName('Ԥ��ά��').AsBoolean;
    CBManual.Checked := FieldByName('�ֹ�����').AsBoolean;
    CBMeterSet.Checked := FieldByName('�Ǳ�����').AsBoolean;
    CBSysSet.Checked := FieldByName('ϵͳ����').AsBoolean;
    CBPrintTicket.Checked := FieldByName('��ӡ����').AsBoolean;
    CBPrintReport.Checked := FieldByName('��ӡ����').AsBoolean;
    CBModifyTicket.Checked := FieldByName('�޸İ���').AsBoolean;
    Admin := FieldByName('����Ա').AsBoolean
  end
end;

procedure TUserPurviewForm.BtnAddClick(Sender: TObject);
begin
  SetBtnStatus(true);

  EdtUser.Clear; //�������û���������
  EdtPass.Clear;

  CBDataBack.Checked := false; //����ѡȨ��
  CBDataExport.Checked := false;
  CBDataMaintain.Checked := false;
  CBDBSet.Checked := false;
  CBManual.Checked := false;
  CBMeterSet.Checked := false;
  CBModifyTicket.Checked := false;
  CBPremain.Checked := false;
  CBPrintReport.Checked := false;
  CBPrintTicket.Checked := false;
  CBSysSet.Checked := false;
  CBUser.Checked := false;

  EdtUser.SetFocus;
  InsertOrModify := false; //����״̬
end;

procedure TUserPurviewForm.BtnModClick(Sender: TObject);
begin
  SetBtnStatus(true);
  EdtUser.SetFocus;
  InsertOrModify := true; //�޸�״̬
end;

procedure TUserPurviewForm.BtnCancelClick(Sender: TObject);
begin
  SetBtnStatus(false);
end;

procedure TUserPurviewForm.BtnSaveClick(Sender: TObject);
begin
  //�������ݿ���޸�
  if InsertOrModify then //�޸�״̬
  begin
    if EdtUser.Text = '' then
      Exit;
    with QueryDataModule.ADOQueryUser do
    begin
      Edit;
      FieldByName('�û���').AsString := EdtUser.Text;
      //if PasswordHasChanged then //���޸Ĺ�����
      //  FieldByName('����').AsString := Transfer(EdtPass.Text);
      FieldByName('�û�����').AsBoolean := CBUser.Checked;
      FieldByName('����ά��').AsBoolean := CBDataMaintain.Checked;
      FieldByName('��������').AsBoolean := CBDBSet.Checked;
      FieldByName('���ݵ���').AsBoolean := CBDataExport.Checked;
      FieldByName('���ݱ���').AsBoolean := CBDataBack.Checked;
      FieldByName('Ԥ��ά��').AsBoolean := CBPremain.Checked;
      FieldByName('�ֹ�����').AsBoolean := CBManual.Checked;
      FieldByName('�Ǳ�����').AsBoolean := CBMeterSet.Checked;
      FieldByName('ϵͳ����').AsBoolean := CBSysSet.Checked;
      FieldByName('��ӡ����').AsBoolean := CBPrintTicket.Checked;
      FieldByName('��ӡ����').AsBoolean := CBPrintReport.Checked;
      FieldByName('�޸İ���').AsBoolean := CBModifyTicket.Checked;
      if Admin then //�ǹ���Ա�Ļ�,���û�����Ȩ��Ϊ��
        FieldByName('�û�����').AsBoolean := true;
      Post;
      if User = MainForm.CurrentUser then //�޸ĵ��û��ǵ�ǰ���û�,���������ϵ��û���ҲҪ����
        MainForm.CurrentUser := EdtUser.Text;
    end
  end
  else
  begin //����״̬
    if EdtUser.Text = '' then
      Exit;
    with QueryDataModule.ADOQueryUser do
    begin
      Insert;
      FieldByName('�û���').AsString := EdtUser.Text;
      FieldByName('����').AsString := TCommonUtil.Md5(EdtPass.Text);
      FieldByName('�û�����').AsBoolean := CBUser.Checked;
      FieldByName('����ά��').AsBoolean := CBDataMaintain.Checked;
      FieldByName('��������').AsBoolean := CBDBSet.Checked;
      FieldByName('���ݵ���').AsBoolean := CBDataExport.Checked;
      FieldByName('���ݱ���').AsBoolean := CBDataBack.Checked;
      FieldByName('Ԥ��ά��').AsBoolean := CBPremain.Checked;
      FieldByName('�ֹ�����').AsBoolean := CBManual.Checked;
      FieldByName('�Ǳ�����').AsBoolean := CBMeterSet.Checked;
      FieldByName('ϵͳ����').AsBoolean := CBSysSet.Checked;
      FieldByName('��ӡ����').AsBoolean := CBPrintTicket.Checked;
      FieldByName('��ӡ����').AsBoolean := CBPrintReport.Checked;
      FieldByName('�޸İ���').AsBoolean := CBModifyTicket.Checked;
      Post;
    end
  end;
  SetBtnStatus(false);
end;

procedure TUserPurviewForm.BtnDelClick(Sender: TObject);
begin
  if (EdtUser.Text = '') or Admin then //�ǹ���Ա����ɾ��
    Exit;
  if MessageDlg('��ȷ��Ҫɾ��������¼ ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    DBGridEhUser.DataSource.DataSet.Delete;
end;

procedure TUserPurviewForm.BtnRefreshClick(Sender: TObject);
begin
  DBGridEhUser.DataSource.DataSet.Refresh;
end;

procedure TUserPurviewForm.EdtPassChange(Sender: TObject);
begin
  PasswordHasChanged := true;
end;

end.
