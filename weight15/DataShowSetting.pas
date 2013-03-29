unit DataShowSetting;

interface

uses
  Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls,
  DBGridEh, Spin, inifiles, SysUtils, Dialogs;

type
  TDataShowSettingForm = class(TForm)
    PBack: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    SEFrozenCol: TSpinEdit;
    LBVisibleCol: TListBox;
    LBValidCol: TListBox;
    SBHide: TSpeedButton;
    SBShow: TSpeedButton;
    PTool: TPanel;
    procedure FormShow(Sender: TObject);
    procedure LBValidColDblClick(Sender: TObject);
    procedure LBVisibleColDblClick(Sender: TObject);
    procedure SBHideClick(Sender: TObject);
    procedure SBShowClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    visibleFieldString, visibleTitleString: TStringList;
    notVisibleFieldString, notVisibleTitleString: TStringList;
  public
    { Public declarations }
    DBGridEh1: TDBGridEh;
    TableName: string;
    procedure ShowCol;
    procedure HideCol;
  end;

var
  DataShowSettingForm: TDataShowSettingForm;

implementation



{$R *.dfm}

procedure TDataShowSettingForm.FormShow(Sender: TObject);
var i: Integer;
  myini: Tinifile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    visibleFieldString.Clear;
    visibleTitleString.Clear;
    notVisibleFieldString.Clear;
    notVisibleTitleString.Clear;
    for i := 0 to DBGridEh1.FieldCount - 1 do
    begin
      if DBGridEh1.Columns[i].Visible then
      begin
        visibleFieldString.Add(DBGridEh1.Columns[i].FieldName);
        visibleTitleString.Add(DBGridEh1.Columns[i].Title.Caption);
        LBVisibleCol.Items.Add(DBGridEh1.Columns[i].Title.Caption)
      end
      else
      begin
        notVisibleFieldString.Add(DBGridEh1.Columns[i].FieldName);
        notVisibleTitleString.Add(DBGridEh1.Columns[i].Title.Caption);
        LBValidCol.Items.Add(DBGridEh1.Columns[i].Title.Caption);
      end
    end;
  finally
    myini.Free;
  end;
end;

procedure TDataShowSettingForm.HideCol;
begin
  if LBVisibleCol.ItemIndex <> -1 then
  begin
    LBValidCol.Items.Add(LBVisibleCol.Items.Strings[LBVisibleCol.ItemIndex]);
    notVisibleFieldString.Add(visibleFieldString.Strings[LBVisibleCol.ItemIndex]);
    notVisibleTitleString.Add(visibleTitleString.Strings[LBVisibleCol.ItemIndex]);

    visibleFieldString.Delete(LBVisibleCol.ItemIndex);
    visibleTitleString.Delete(LBVisibleCol.ItemIndex);
    LBVisibleCol.Items.Delete(LBVisibleCol.ItemIndex);

  end;
end;

procedure TDataShowSettingForm.ShowCol;
begin
  if LBValidCol.ItemIndex <> -1 then
  begin
    LBVisibleCol.Items.Add(LBValidCol.Items.Strings[LBValidCol.ItemIndex]);
    visibleFieldString.Add(notVisibleFieldString.Strings[LBValidCol.ItemIndex]);
    visibleTitleString.Add(notVisibleTitleString.Strings[LBValidCol.ItemIndex]);

    notVisibleFieldString.Delete(LBValidCol.ItemIndex);
    notVisibleTitleString.Delete(LBValidCol.ItemIndex);
    LBValidCol.Items.Delete(LBValidCol.ItemIndex);
  end
end;

procedure TDataShowSettingForm.LBValidColDblClick(Sender: TObject);
begin
  ShowCol;
end;

procedure TDataShowSettingForm.LBVisibleColDblClick(Sender: TObject);
begin
  HideCol;
end;

procedure TDataShowSettingForm.SBHideClick(Sender: TObject);
begin
  HideCol;
end;

procedure TDataShowSettingForm.SBShowClick(Sender: TObject);
begin
  ShowCol;
end;

procedure showStringList(sl: TStringList);
var i: Integer;
  s: string;
begin
  s := '';
  for i := 0 to sl.Count - 1 do
  begin
    s := s + sl.Strings[i] + ',';
  end;
  ShowMessage(s);
end;

procedure TDataShowSettingForm.BitBtnOKClick(Sender: TObject);
var i: Integer;
  myini: Tinifile;
begin
  {showStringList(visibleFieldString);
  showStringList(visibleTitleString);
  showStringList(notVisibleFieldString);
  showStringList(notVisibleTitleString); }

  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    for i := 0 to LBVisibleCol.Items.count - 1 do //在可见框内
    begin
      DBGridEh1.FieldColumns[visibleFieldString.Strings[i]].Visible := true;
      myini.WriteBool('显示', visibleFieldString.Strings[i], true);
    end;
    for i := 0 to LBValidCol.Items.count - 1 do //在可用框内
    begin
      DBGridEh1.FieldColumns[notVisibleFieldString.Strings[i]].Visible := false;
      myini.WriteBool('显示', notVisibleFieldString.Strings[i], false);
    end;
    try
      DBGridEh1.FrozenCols := SEFrozenCol.Value;
    except
      SEFrozenCol.Value := 0
    end;
    myini.Writeinteger('系统设置', '固定列', SEFrozenCol.Value);
  finally
    myini.Free;
  end;
  {for i := 0 to LBVisibleCol.Items.Count - 1 do
    MainForm.DBGridEh1.Columns.Items[i].FieldName := LBVisibleCol.Items.Strings[i]; }
end;

procedure TDataShowSettingForm.FormCreate(Sender: TObject);
begin
  visibleFieldString := TStringList.Create;
  visibleTitleString := TStringList.Create;
  notVisibleFieldString := TStringList.Create;
  notVisibleTitleString := TStringList.Create;
end;

end.
