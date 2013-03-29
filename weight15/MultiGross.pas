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
    DBGridEh1.FieldColumns['���'].Visible := myini.ReadBool('��ʾ', '���', false);
    DBGridEh1.FieldColumns['��ˮ��'].Visible := myini.ReadBool('��ʾ', '��ˮ��', true);
    DBGridEh1.FieldColumns['����'].Visible := myini.ReadBool('��ʾ', '����', true);
    DBGridEh1.FieldColumns['����Ա'].Visible := myini.ReadBool('��ʾ', '����Ա', true);
    DBGridEh1.FieldColumns['������λ'].Visible := myini.ReadBool('��ʾ', '������λ', true);
    DBGridEh1.FieldColumns['�ջ���λ'].Visible := myini.ReadBool('��ʾ', '�ջ���λ', true);
    DBGridEh1.FieldColumns['����'].Visible := myini.ReadBool('��ʾ', '����', true);
    DBGridEh1.FieldColumns['���'].Visible := myini.ReadBool('��ʾ', '���', true);
    DBGridEh1.FieldColumns['ë��'].Visible := myini.ReadBool('��ʾ', 'ë��', true);
    DBGridEh1.FieldColumns['����'].Visible := myini.ReadBool('��ʾ', '����', true);
    DBGridEh1.FieldColumns['����'].Visible := myini.ReadBool('��ʾ', '����', true);
    DBGridEh1.FieldColumns['����'].Visible := myini.ReadBool('��ʾ', '����', true);
    DBGridEh1.FieldColumns['ʵ��'].Visible := myini.ReadBool('��ʾ', 'ʵ��', true);
    DBGridEh1.FieldColumns['����'].Visible := myini.ReadBool('��ʾ', '����', true);
    DBGridEh1.FieldColumns['���'].Visible := myini.ReadBool('��ʾ', '���', true);
    DBGridEh1.FieldColumns['����Ա'].Visible := myini.ReadBool('��ʾ', '����Ա', true);
    DBGridEh1.FieldColumns['ë��ʱ��'].Visible := myini.ReadBool('��ʾ', 'ë��ʱ��', true);
    DBGridEh1.FieldColumns['����ʱ��'].Visible := myini.ReadBool('��ʾ', '����ʱ��', true);
    DBGridEh1.FieldColumns['��ע'].Visible := myini.ReadBool('��ʾ', '��ע', true);
  finally
    myini.Free;
  end;
end;

procedure TMultiGrossForm.DBGridEh1DblClick(Sender: TObject);
begin
  UpdateRecNo := DBGridEh1.DataSource.DataSet.FieldByName('��ˮ��').AsString;
  Close;
end;

procedure TMultiGrossForm.FormCloseQuery(Sender: TObject;
  var CanClose: boolean);
begin
  if UpdateRecNo = '' then
  begin
    MessageBox(0, '��˫��ѡ��һ����¼�Բ�ȫ��ǰ��Ϣ!', '��ʾ', MB_OK + 
      MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);    
    CanClose := false;
  end;
end;

end.
