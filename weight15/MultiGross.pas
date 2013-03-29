unit MultiGross;

interface

uses
  SysUtils, Classes, Controls, Forms, Windows,
  DBGridEh, IniFiles, GridsEh;

type
  TMultiGrossForm = class(TForm)
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    UpdateRecNo: string;
  end;

var
  MultiGrossForm: TMultiGrossForm;

implementation

uses QueryDM;

{$R *.dfm}

procedure TMultiGrossForm.FormShow(Sender: TObject);
var i: Integer;
  myini: TIniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    DBGridEh1.DataSource := QueryDataModule.DSMultiGross;
    for i := 0 to DBGridEh1.FieldCount - 1 do
      DBGridEh1.Columns[i].Width := 80;
    DBGridEh1.FieldColumns['序号'].Visible := myini.ReadBool('显示', '序号', false);
    DBGridEh1.FieldColumns['流水号'].Visible := myini.ReadBool('显示', '流水号', true);
    DBGridEh1.FieldColumns['车号'].Visible := myini.ReadBool('显示', '车号', true);
    DBGridEh1.FieldColumns['操作员'].Visible := myini.ReadBool('显示', '操作员', true);
    DBGridEh1.FieldColumns['发货单位'].Visible := myini.ReadBool('显示', '发货单位', true);
    DBGridEh1.FieldColumns['收货单位'].Visible := myini.ReadBool('显示', '收货单位', true);
    DBGridEh1.FieldColumns['货名'].Visible := myini.ReadBool('显示', '货名', true);
    DBGridEh1.FieldColumns['规格'].Visible := myini.ReadBool('显示', '规格', true);
    DBGridEh1.FieldColumns['毛重'].Visible := myini.ReadBool('显示', '毛重', true);
    DBGridEh1.FieldColumns['空重'].Visible := myini.ReadBool('显示', '空重', true);
    DBGridEh1.FieldColumns['净重'].Visible := myini.ReadBool('显示', '净重', true);
    DBGridEh1.FieldColumns['扣重'].Visible := myini.ReadBool('显示', '扣重', true);
    DBGridEh1.FieldColumns['实重'].Visible := myini.ReadBool('显示', '实重', true);
    DBGridEh1.FieldColumns['单价'].Visible := myini.ReadBool('显示', '单价', true);
    DBGridEh1.FieldColumns['金额'].Visible := myini.ReadBool('显示', '金额', true);
    DBGridEh1.FieldColumns['过磅员'].Visible := myini.ReadBool('显示', '过磅员', true);
    DBGridEh1.FieldColumns['毛重时间'].Visible := myini.ReadBool('显示', '毛重时间', true);
    DBGridEh1.FieldColumns['空重时间'].Visible := myini.ReadBool('显示', '空重时间', true);
    DBGridEh1.FieldColumns['备注'].Visible := myini.ReadBool('显示', '备注', true);
  finally
    myini.Free;
  end;
end;

procedure TMultiGrossForm.DBGridEh1DblClick(Sender: TObject);
begin
  UpdateRecNo := DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString;
  Close;
end;

procedure TMultiGrossForm.FormCloseQuery(Sender: TObject;
  var CanClose: boolean);
begin
  if UpdateRecNo = '' then
  begin
    MessageBox(0, '请双击选择一条记录以补全当前信息!', '提示', MB_OK + 
      MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);    
    CanClose := false;
  end;
end;

end.
