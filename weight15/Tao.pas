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
    SQL.Text := 'select * from 套表 order by 车号';
    Open;
  end;
  DBGridEhTao.FieldColumns['车号'].Visible := MainForm.DBGridEh1.FieldColumns['车号'].Visible;
  DBGridEhTao.FieldColumns['发货单位'].Visible := MainForm.DBGridEh1.FieldColumns['发货单位'].Visible;
  DBGridEhTao.FieldColumns['收货单位'].Visible := MainForm.DBGridEh1.FieldColumns['收货单位'].Visible;
  DBGridEhTao.FieldColumns['货名'].Visible := MainForm.DBGridEh1.FieldColumns['货名'].Visible;
  DBGridEhTao.FieldColumns['规格'].Visible := MainForm.DBGridEh1.FieldColumns['规格'].Visible;

  TPrepareUtil.addCarStrings(DBGridEhTao.FieldColumns['车号'].PickList);
  TPrepareUtil.addFaHuoStrings(DBGridEhTao.FieldColumns['发货单位'].PickList);
  TPrepareUtil.addShouHuoStrings(DBGridEhTao.FieldColumns['收货单位'].PickList);
  TPrepareUtil.addGoodsStrings(DBGridEhTao.FieldColumns['货名'].PickList);
  TPrepareUtil.addSpecStrings(DBGridEhTao.FieldColumns['规格'].PickList);
end;

procedure TTaoForm.DBGridEhTaoDblClick(Sender: TObject);
begin
  with DBGridEhTao.DataSource.DataSet do
  begin
    MainForm.CBCar.Text := FieldByName('车号').AsString;
    MainForm.CBFaHuo.Text := FieldByName('发货单位').AsString;
    MainForm.CBShouHuo.Text := FieldByName('收货单位').AsString;
    MainForm.CBGoods.Text := FieldByName('货名').AsString;
    MainForm.CBSpec.Text := FieldByName('规格').AsString;
  end;
  Close;
end;

end.
