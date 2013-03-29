unit SelectOrder;

interface

uses
  Classes, Controls, Forms,
  StdCtrls, CommonUtil;

type
  TSelectOrderForm = class(TForm)
    LBCols: TListBox;
    procedure FormShow(Sender: TObject);
    procedure LBColsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    selCol: TCol;
    cols: array of TCol;
  end;

var
  SelectOrderForm: TSelectOrderForm;

implementation

uses
  Main;

{$R *.dfm}

procedure TSelectOrderForm.FormShow(Sender: TObject);
var i: integer;
  column: TCol;
begin
  SetLength(cols, MainForm.DBGridEh1.FieldCount);
  for i := 0 to MainForm.DBGridEh1.FieldCount - 1 do
  begin
    column.field := MainForm.DBGridEh1.Columns[i].FieldName;
    column.showField := MainForm.DBGridEh1.Columns[i].Title.Caption;
    cols[i] := column;
  end;
  LBCols.Items.Clear;
  for i := 0 to Length(cols) - 1 do
  begin
    LBCols.Items.Add(cols[i].showField);
  end;
end;

procedure TSelectOrderForm.LBColsDblClick(Sender: TObject);
begin
  if LBCols.ItemIndex <> -1 then
  begin
    selCol := cols[LBCols.ItemIndex];
    Close;
  end;
end;

end.
