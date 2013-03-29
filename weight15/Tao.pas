unit Tao;

interface

uses
  Classes, Controls, Forms,
  DBGridEh, Menus, DBActns, ActnList, GridsEh;

type
  TTaoForm = class(TForm)
    DBGridEhTao: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    N4: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DBGridEhTaoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TaoForm: TTaoForm;

implementation

uses QueryDM, Main, PrepareUtil;

{$R *.dfm}

procedure TTaoForm.FormShow(Sender: TObject);
begin
  DBGridEhTao.PopupMenu := PopupMenu1;
  DataSetInsert1.DataSource := QueryDataModule.DSTao;
  DataSetDelete1.DataSource := QueryDataModule.DSTao;
  DataSetEdit1.DataSource := QueryDataModule.DSTao;
  DataSetPost1.DataSource := QueryDataModule.DSTao;
  DataSetCancel1.DataSource := QueryDataModule.DSTao;
  DataSetRefresh1.DataSource := QueryDataModule.DSTao;

  DBGridEhTao.DataSource := QueryDataModule.DSTao;
  with QueryDataModule.ADOQTao do
  begin
    Close;
    SQL.Text := 'select * from �ױ� order by ����';
    Open;
  end;
  DBGridEhTao.FieldColumns['����'].Visible := MainForm.DBGridEh1.FieldColumns['����'].Visible;
  DBGridEhTao.FieldColumns['������λ'].Visible := MainForm.DBGridEh1.FieldColumns['������λ'].Visible;
  DBGridEhTao.FieldColumns['�ջ���λ'].Visible := MainForm.DBGridEh1.FieldColumns['�ջ���λ'].Visible;
  DBGridEhTao.FieldColumns['����'].Visible := MainForm.DBGridEh1.FieldColumns['����'].Visible;
  DBGridEhTao.FieldColumns['���'].Visible := MainForm.DBGridEh1.FieldColumns['���'].Visible;

  TPrepareUtil.addCarStrings(DBGridEhTao.FieldColumns['����'].PickList);
  TPrepareUtil.addFaHuoStrings(DBGridEhTao.FieldColumns['������λ'].PickList);
  TPrepareUtil.addShouHuoStrings(DBGridEhTao.FieldColumns['�ջ���λ'].PickList);
  TPrepareUtil.addGoodsStrings(DBGridEhTao.FieldColumns['����'].PickList);
  TPrepareUtil.addSpecStrings(DBGridEhTao.FieldColumns['���'].PickList);
end;

procedure TTaoForm.DBGridEhTaoDblClick(Sender: TObject);
begin
  with DBGridEhTao.DataSource.DataSet do
  begin
    MainForm.CBCar.Text := FieldByName('����').AsString;
    MainForm.CBFaHuo.Text := FieldByName('������λ').AsString;
    MainForm.CBShouHuo.Text := FieldByName('�ջ���λ').AsString;
    MainForm.CBGoods.Text := FieldByName('����').AsString;
    MainForm.CBSpec.Text := FieldByName('���').AsString;
  end;
  Close;
end;

end.
