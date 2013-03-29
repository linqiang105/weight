unit DBClear;

interface

uses
  Classes, Controls, Forms, Dialogs, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DB, ADODB, Comobj, SysUtils,
  Variants, Waiting;

type
  TDBClearForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RBAl: TRadioButton;
    RBPart: TRadioButton;
    StartDate: TDateTimePicker;
    EndDate: TDateTimePicker;
    SaveDialog1: TSaveDialog;
    EdtExport: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    CBClearData: TCheckBox;
    BtnOK: TBitBtn;
    BtnCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure RBAlClick(Sender: TObject);
    procedure RBPartClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBClearDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DatatoXls(QueryData: TADOQuery; StrSaveFile: string;
      FormName: TWaitingForm): boolean;
    function DataOutput(QueryData: TADOQuery; SqlStr, SaveStr: string;
      CheckFlag: boolean; FormName: TWaitingForm; partCheck: Boolean): boolean;
  end;

var
  DBClearForm: TDBClearForm;

implementation

uses QueryDM;

{$R *.dfm}

function TDBClearForm.DatatoXls(QueryData: TADOQuery; StrSaveFile: string;
  FormName: TWaitingForm): boolean;
var
  XLApp: Variant;
  Sheet: Variant;
  i, j: Integer;
begin
  if QueryData.IsEmpty then
  begin
    MessageDlg('没有任何数据,无需进行数据库清理!', mtInformation, [mbOK], 0);
    BtnOK.Enabled := true;
    BtnCancel.Enabled := true;
    Abort
  end;
  try
    try
      if VarIsEmpty(XLApp) then
        XLApp := CreateOleObject('Excel.Application');
      XLApp.WorkBooks.Add(-4167);
      XLApp.WorkBooks[1].WorkSheets[1].Name := '称重信息';
      Sheet := XLApp.WorkBooks[1].WorkSheets['称重信息'];
      j := 1;
    except
      MessageDlg('无法调用Mircorsoft Excel! ' + Chr(13) + Chr(10)
        + '请检查是否安装了Mircorsoft Excel!', mtWarning, [mbOK], 0);
      Abort
    end;
    with QueryData do
    begin
      FormName.Label2.Caption := StrSaveFile + '.xls';
      FormName.Gauge1.MaxValue := RecordCount + 2;
      FormName.Show;
      for i := 0 to FieldCount - 1 do
        Sheet.Cells[j, i + 1] := Fields[i].FieldName;
      inc(j);
      first;
      FormName.Repaint;
      while not Eof do
      begin
        for i := 0 to FieldCount - 1 do
          Sheet.Cells[j, i + 1] := Trim(Fields[i].AsString);
        inc(j);
        FormName.Repaint;
        Next
      end
    end;
    XLApp.ActiveWorkBook.SaveAs(StrSaveFile);
    Application.ProcessMessages;
    XLApp.Application.Quit;
    result := true
  except
    result := false
  end
end;

function TDBClearForm.DataOutput(QueryData: TADOQuery;
  SqlStr, SaveStr: string; CheckFlag: boolean; FormName: TWaitingForm; partCheck: Boolean): boolean;
begin
  try
    with QueryData do
    begin
      Close;
      SQL.Text := 'select * ' + SqlStr;
      if partCheck then
      begin
        Parameters.ParamByName('startDate').Value := FormatDateTime('yyyy-mm-dd 00:00:00', StartDate.Date);
        Parameters.ParamByName('endDate').Value := FormatDateTime('yyyy-mm-dd 23:59:59', EndDate.Date);
      end;
      Open
    end;
    if DatatoXls(QueryData, SaveStr, FormName) then
    begin
      if CheckFlag then
      begin
        with QueryData do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete ' + SqlStr);
          ExecSQL
        end
      end;
      result := true;
      FormName.Repaint
    end
    else
      result := false;
  finally
    BtnOK.Enabled := true;
    BtnCancel.Enabled := true;
    WaitingForm.Close
  end;
end;

procedure TDBClearForm.BitBtn1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    EdtExport.Text := SaveDialog1.FileName;
    if ExtractFileExt(EdtExport.Text) <> '.xls' then
      EdtExport.Text := EdtExport.Text + '.xls';
  end;
end;

procedure TDBClearForm.RBAlClick(Sender: TObject);
begin
  StartDate.Enabled := false;
  EndDate.Enabled := false;
end;

procedure TDBClearForm.RBPartClick(Sender: TObject);
begin
  StartDate.Enabled := true;
  EndDate.Enabled := true;
end;

procedure TDBClearForm.BtnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TDBClearForm.BtnOKClick(Sender: TObject);
var
  SqlStr: string;
begin
  if EdtExport.Text <> '' then
  begin
    SqlStr := 'From 称重信息';
    if RBPart.Checked then
    begin
      SqlStr := SqlStr + ' Where (毛重时间 between :startDate and :endDate) '
        + 'or (空重时间 between :startDate and :endDate)';
    end;
    Application.CreateForm(TWaitingForm, WaitingForm);
    BtnOK.Enabled := false;
    BtnCancel.Enabled := false;
    if DataOutput(QueryDataModule.WeightMaintainQuery, SqlStr, EdtExport.Text, CBClearData.Checked, WaitingForm, RBPart.Checked) then
    begin
      MessageDlg('数据导出成功！' + Char(13) + '导出文件为"' + EdtExport.Text + '"', mtWarning, [mbOK], 0);
      Close
    end
    else
      MessageDlg('数据导出失败！', mtWarning, [mbOK], 0);

  end
  else
  begin
    MessageDlg('数据导出路径没有选择,无法进行导出！', mtWarning, [mbOK], 0);
    BtnOK.Enabled := true;
    BtnCancel.Enabled := true;
  end;
end;

procedure TDBClearForm.FormShow(Sender: TObject);
begin
  BtnOK.Enabled := true;
  BtnCancel.Enabled := true;
  StartDate.Date := Date;
  EndDate.Date := Date;
end;

procedure TDBClearForm.CBClearDataClick(Sender: TObject);
begin
  if CBClearData.Checked then
  begin
    if MessageDlg('选择该选项后在导出数据时将会删除数据库中的相应记录！'
      + Char(13) + '确定要选择吗?', mtWarning, [mbOK, mbCancel], 0) = mrOk then
      CBClearData.Checked := true
  end
  else
    CBClearData.Checked := false
end;

end.
