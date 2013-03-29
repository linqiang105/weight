unit PrepareMaintain;

interface

uses
  Classes, Controls, Forms, ComCtrls, Dialogs, Windows,
  DBGridEh, Buttons, DBActns, ActnList, GridsEh, StdCtrls;

type
  TPrepareMaintainForm = class(TForm)
    PageControl1: TPageControl;
    TSCar: TTabSheet;
    TSFaHuo: TTabSheet;
    TSShouHuo: TTabSheet;
    TSGoods: TTabSheet;
    TSAll: TTabSheet;
    AppendBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    SaveBtn: TBitBtn;
    EditBtn: TBitBtn;
    CancelBtn: TBitBtn;
    RefreshBitBtn: TBitBtn;
    DBGridEh1: TDBGridEh;
    ActionListPreMaintain: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    TSSpec: TTabSheet;
    TSBackup1: TTabSheet;
    TSBackup2: TTabSheet;
    TSBackup3: TTabSheet;
    TSBackup4: TTabSheet;
    TSBackup5: TTabSheet;
    BitBtnExport: TBitBtn;
    BitBtnImport: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure TabSheetShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnImportClick(Sender: TObject);
    procedure BitBtnExportClick(Sender: TObject);
  private
    { Private declarations }
    showCaption: array[0..9] of string;
  public
    { Public declarations }
    toMainForm: Boolean;
  end;

var
  PrepareMaintainForm: TPrepareMaintainForm;

implementation

uses QueryDM, Main, PrepareUtil, CommonUtil;

{$R *.dfm}

procedure TPrepareMaintainForm.TabSheetShow(Sender: TObject);
var tn: string;
begin
  tn := showCaption[(Sender as TTabSheet).PageIndex];
  //ShowMessage(IntToStr((Sender as TTabSheet).PageIndex));
  if tn = '' then
    exit;
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select * from ' + tn;
    //如果是备用项目
    if (Sender as TTabSheet).PageIndex > 4 then
      SQL.Text := 'select 序号,' + tn + ' as [' + (Sender as TTabSheet).Caption + '] from ' + tn;
    Open;
    RecordSet.Properties.Get_Item('Update Criteria').Value := 0;
  end;
  Repaint;
end;

procedure TPrepareMaintainForm.FormShow(Sender: TObject);
begin
  DBGridEh1.DataSource := QueryDataModule.PrepareMaintainDS;
  //PageControl1.ActivePageIndex := 0;
  {TSBackup1.TabVisible := False;
  TSBackup2.TabVisible := False;
  TSBackup3.TabVisible := False;
  TSBackup4.TabVisible := False;
  TSBackup5.TabVisible := False;  }
  showCaption[0] := '车号';
  showCaption[1] := '发货单位';
  showCaption[2] := '收货单位';
  showCaption[3] := '货名';
  showCaption[4] := '规格';
  showCaption[5] := '备用1';
  showCaption[6] := '备用2';
  showCaption[7] := '备用3';
  showCaption[8] := '备用4';
  showCaption[9] := '备用5';
  TSCar.Caption := MainForm.systemConfig.carCaption;
  TSFaHuo.Caption := MainForm.systemConfig.faHuoCaption;
  TSShouHuo.Caption := MainForm.systemConfig.shouHuoCaption;
  TSGoods.Caption := MainForm.systemConfig.goodsCaption;
  TSSpec.Caption := MainForm.systemConfig.specCaption;
  TSBackup1.Caption := MainForm.systemConfig.backup1Caption;
  TSBackup2.Caption := MainForm.systemConfig.backup2Caption;
  TSBackup3.Caption := MainForm.systemConfig.backup3Caption;
  TSBackup4.Caption := MainForm.systemConfig.backup4Caption;
  TSBackup5.Caption := MainForm.systemConfig.backup5Caption;
end;

procedure TPrepareMaintainForm.DBGridEh1DblClick(Sender: TObject);
begin
  if MainForm.PanelMain.Visible and toMainForm then
  begin
    case PageControl1.ActivePageIndex of
      0: MainForm.CBCar.Text := DBGridEh1.DataSource.DataSet.FieldByName('车号').AsString;
      1: MainForm.CBFaHuo.Text := DBGridEh1.DataSource.DataSet.FieldByName('发货单位').AsString;
      2: MainForm.CBShouHuo.Text := DBGridEh1.DataSource.DataSet.FieldByName('收货单位').AsString;
      3: MainForm.CBGoods.Text := DBGridEh1.DataSource.DataSet.FieldByName('货名').AsString;
      4: MainForm.CBSpec.Text := DBGridEh1.DataSource.DataSet.FieldByName('规格').AsString;
      5: MainForm.CBBackup1.Text := DBGridEh1.DataSource.DataSet.FieldByName('备用1').AsString;
      6: MainForm.CBBackup2.Text := DBGridEh1.DataSource.DataSet.FieldByName('备用2').AsString;
      7: MainForm.CBBackup3.Text := DBGridEh1.DataSource.DataSet.FieldByName('备用3').AsString;
      8: MainForm.CBBackup4.Text := DBGridEh1.DataSource.DataSet.FieldByName('备用4').AsString;
      9: MainForm.CBBackup5.Text := DBGridEh1.DataSource.DataSet.FieldByName('备用5').AsString;
    end;
    Close;
  end;
end;

procedure TPrepareMaintainForm.FormCreate(Sender: TObject);
begin
  showCaption[0] := '车号';
  showCaption[1] := '发货单位';
  showCaption[2] := '收货单位';
  showCaption[3] := '货名';
  showCaption[4] := '规格';
  showCaption[5] := '备用1';
  showCaption[6] := '备用2';
  showCaption[7] := '备用3';
  showCaption[8] := '备用4';
  showCaption[9] := '备用5';
  TSCar.Caption := MainForm.systemConfig.carCaption;
  TSFaHuo.Caption := MainForm.systemConfig.faHuoCaption;
  TSShouHuo.Caption := MainForm.systemConfig.shouHuoCaption;
  TSGoods.Caption := MainForm.systemConfig.goodsCaption;
  TSSpec.Caption := MainForm.systemConfig.specCaption;
  TSBackup1.Caption := MainForm.systemConfig.backup1Caption;
  TSBackup2.Caption := MainForm.systemConfig.backup2Caption;
  TSBackup3.Caption := MainForm.systemConfig.backup3Caption;
  TSBackup4.Caption := MainForm.systemConfig.backup4Caption;
  TSBackup5.Caption := MainForm.systemConfig.backup5Caption;
end;

procedure TPrepareMaintainForm.BitBtnImportClick(Sender: TObject);
var od: TOpenDialog;
  sl: TStrings;
  i: integer;
begin
  od := TOpenDialog.Create(nil);
  try
    od.Filter := '文本文件(*.txt)|*.txt';
    od.FileName := '';
    if od.Execute then
    begin
      sl := TStringList.Create;
      try
        sl.LoadFromFile(od.FileName);
        for i := 0 to sl.Count - 1 do
        begin
          case PageControl1.ActivePageIndex of
            0: TPrepareUtil.prepareInfo(sl.Strings[i], '', '', '', '');
            1: TPrepareUtil.prepareInfo('', sl.Strings[i], '', '', '');
            2: TPrepareUtil.prepareInfo('', '', sl.Strings[i], '', '');
            3: TPrepareUtil.prepareInfo('', '', '', sl.Strings[i], '');
            4: TPrepareUtil.prepareInfo('', '', '', '', sl.Strings[i]);
            5: TPrepareUtil.prepareBackupInfo(sl.Strings[i], '', '', '', '');
            6: TPrepareUtil.prepareBackupInfo('', sl.Strings[i], '', '', '');
            7: TPrepareUtil.prepareBackupInfo('', '', sl.Strings[i], '', '');
            8: TPrepareUtil.prepareBackupInfo('', '', '', sl.Strings[i], '');
            9: TPrepareUtil.prepareBackupInfo('', '', '', '', sl.Strings[i]);
          end;
        end;
        Application.MessageBox('导入数据成功!', '提示', MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
      finally
        sl.Free;
      end;
    end;
  finally
    od.Free;
  end;
end;

procedure TPrepareMaintainForm.BitBtnExportClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEh1);
end;

end.
