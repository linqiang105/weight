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
    User: string; //所点击的用户
    InsertOrModify: boolean; //为0时代表插入,为1时代表修改
    Admin: boolean; //是管理员
    PasswordHasChanged: boolean; //密码是否被修改过
  public
    { Public declarations }
    //flag为0,则为初始未插入或修改状态时的各按钮状态;
    //为1则为点击插入或修改状态后的各个按钮的状态
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
    SQL.Text := 'select * from 用户信息';
    Open;
    RecordSet.Properties.Get_Item('Update Criteria').Value := 0
  end;
  DBGridEhUser.DataSource := QueryDataModule.DataSourceUserShow;
  PasswordHasChanged := false; //默认没有被修改过
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
    User := FieldByName('用户名').AsString;
    EdtUser.Text := User;
    //EdtPass.Text := '123456'; //FieldByName('密码').AsString;
    CBUser.Checked := FieldByName('用户管理').AsBoolean;
    CBDataMaintain.Checked := FieldByName('数据维护').AsBoolean;
    CBDBSet.Checked := FieldByName('数库设置').AsBoolean;
    CBDataExport.Checked := FieldByName('数据导出').AsBoolean;
    CBDataBack.Checked := FieldByName('数据备份').AsBoolean;
    CBPremain.Checked := FieldByName('预置维护').AsBoolean;
    CBManual.Checked := FieldByName('手工重量').AsBoolean;
    CBMeterSet.Checked := FieldByName('仪表设置').AsBoolean;
    CBSysSet.Checked := FieldByName('系统设置').AsBoolean;
    CBPrintTicket.Checked := FieldByName('打印磅单').AsBoolean;
    CBPrintReport.Checked := FieldByName('打印报表').AsBoolean;
    CBModifyTicket.Checked := FieldByName('修改磅单').AsBoolean;
    Admin := FieldByName('管理员').AsBoolean
  end
end;

procedure TUserPurviewForm.BtnAddClick(Sender: TObject);
begin
  SetBtnStatus(true);

  EdtUser.Clear; //可以填用户名和密码
  EdtPass.Clear;

  CBDataBack.Checked := false; //可以选权限
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
  InsertOrModify := false; //插入状态
end;

procedure TUserPurviewForm.BtnModClick(Sender: TObject);
begin
  SetBtnStatus(true);
  EdtUser.SetFocus;
  InsertOrModify := true; //修改状态
end;

procedure TUserPurviewForm.BtnCancelClick(Sender: TObject);
begin
  SetBtnStatus(false);
end;

procedure TUserPurviewForm.BtnSaveClick(Sender: TObject);
begin
  //进行数据库的修改
  if InsertOrModify then //修改状态
  begin
    if EdtUser.Text = '' then
      Exit;
    with QueryDataModule.ADOQueryUser do
    begin
      Edit;
      FieldByName('用户名').AsString := EdtUser.Text;
      //if PasswordHasChanged then //有修改过密码
      //  FieldByName('密码').AsString := Transfer(EdtPass.Text);
      FieldByName('用户管理').AsBoolean := CBUser.Checked;
      FieldByName('数据维护').AsBoolean := CBDataMaintain.Checked;
      FieldByName('数库设置').AsBoolean := CBDBSet.Checked;
      FieldByName('数据导出').AsBoolean := CBDataExport.Checked;
      FieldByName('数据备份').AsBoolean := CBDataBack.Checked;
      FieldByName('预置维护').AsBoolean := CBPremain.Checked;
      FieldByName('手工重量').AsBoolean := CBManual.Checked;
      FieldByName('仪表设置').AsBoolean := CBMeterSet.Checked;
      FieldByName('系统设置').AsBoolean := CBSysSet.Checked;
      FieldByName('打印磅单').AsBoolean := CBPrintTicket.Checked;
      FieldByName('打印报表').AsBoolean := CBPrintReport.Checked;
      FieldByName('修改磅单').AsBoolean := CBModifyTicket.Checked;
      if Admin then //是管理员的话,则用户管理权限为真
        FieldByName('用户管理').AsBoolean := true;
      Post;
      if User = MainForm.CurrentUser then //修改的用户是当前的用户,则主界面上的用户名也要更改
        MainForm.CurrentUser := EdtUser.Text;
    end
  end
  else
  begin //插入状态
    if EdtUser.Text = '' then
      Exit;
    with QueryDataModule.ADOQueryUser do
    begin
      Insert;
      FieldByName('用户名').AsString := EdtUser.Text;
      FieldByName('密码').AsString := TCommonUtil.Md5(EdtPass.Text);
      FieldByName('用户管理').AsBoolean := CBUser.Checked;
      FieldByName('数据维护').AsBoolean := CBDataMaintain.Checked;
      FieldByName('数库设置').AsBoolean := CBDBSet.Checked;
      FieldByName('数据导出').AsBoolean := CBDataExport.Checked;
      FieldByName('数据备份').AsBoolean := CBDataBack.Checked;
      FieldByName('预置维护').AsBoolean := CBPremain.Checked;
      FieldByName('手工重量').AsBoolean := CBManual.Checked;
      FieldByName('仪表设置').AsBoolean := CBMeterSet.Checked;
      FieldByName('系统设置').AsBoolean := CBSysSet.Checked;
      FieldByName('打印磅单').AsBoolean := CBPrintTicket.Checked;
      FieldByName('打印报表').AsBoolean := CBPrintReport.Checked;
      FieldByName('修改磅单').AsBoolean := CBModifyTicket.Checked;
      Post;
    end
  end;
  SetBtnStatus(false);
end;

procedure TUserPurviewForm.BtnDelClick(Sender: TObject);
begin
  if (EdtUser.Text = '') or Admin then //是管理员则不能删除
    Exit;
  if MessageDlg('你确定要删除这条记录 ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
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
