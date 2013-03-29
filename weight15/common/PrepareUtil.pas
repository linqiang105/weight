unit PrepareUtil;

interface

uses SysUtils,
  StdCtrls, DB,

  RzCmboBx, Classes;

type
  //预置表操作类
  TPrepareUtil = class
  private
  public
    //循环添加发货单位,收货单位，货名，规格
    class procedure addCarStrings(sl: TStrings);
    class procedure addCar(cb: TComboBox); overload;
    class procedure addCar(cb: TRzComboBox); overload;

    class procedure addWeightCarStrings(sl: TStrings);
    class procedure addWeightCar(cb: TComboBox); overload;
    class procedure addWeightCar(cb: TRzComboBox); overload;

    class procedure addFaHuoStrings(sl: TStrings);
    class procedure addFaHuo(cb: TComboBox); overload;
    class procedure addFaHuo(cb: TRzComboBox); overload;

    class procedure addShouHuoStrings(sl: TStrings);
    class procedure addShouHuo(cb: TComboBox); overload;
    class procedure addShouHuo(cb: TRzComboBox); overload;

    class procedure addGoodsStrings(sl: TStrings);
    class procedure addGoods(cb: TComboBox); overload;
    class procedure addGoods(cb: TRzComboBox); overload;

    class procedure addSpecStrings(sl: TStrings);
    class procedure addSpec(cb: TComboBox); overload;
    class procedure addSpec(cb: TRzComboBox); overload;

    class procedure addBackup1Strings(sl: TStrings);
    class procedure addBackup1(cb: TComboBox); overload;
    class procedure addBackup1(cb: TRzComboBox); overload;

    class procedure addBackup2Strings(sl: TStrings);
    class procedure addBackup2(cb: TComboBox); overload;
    class procedure addBackup2(cb: TRzComboBox); overload;

    class procedure addBackup3Strings(sl: TStrings);
    class procedure addBackup3(cb: TComboBox); overload;
    class procedure addBackup3(cb: TRzComboBox); overload;

    class procedure addBackup4Strings(sl: TStrings);
    class procedure addBackup4(cb: TComboBox); overload;
    class procedure addBackup4(cb: TRzComboBox); overload;

    class procedure addBackup5Strings(sl: TStrings);
    class procedure addBackup5(cb: TComboBox); overload;
    class procedure addBackup5(cb: TRzComboBox); overload;
    //将输入一次后的车号，货名，发货单位，收货单位写入预置表
    class procedure prepareInfo(Car, faHuo, shouHuo, goods, spec: string);
    class procedure prepareBackupInfo(backup1, backup2, backup3, backup4, backup5: string);
    //获取这个车辆的修正(暗扣)重量
    class function getCarCheat(carNo: string): Double;
    class function getCarTare(carNo: string): Double;
    //更新车辆的预置皮重
    class function updateCarTare(carNo, tare: string): Boolean;
    //根据代码取发货单位
    class function getFaHuoByCode(code: string): string;
    //根据代码取收货单位
    class function getShouHuoByCode(code: string): string;
    //根据代码取货名
    class function getGoodsByCode(code: string): string;
    //根据代码取规格
    class function getSpecByCode(code: string): string;
    //根据代码取备用1
    class function getBackup1ByCode(code: string): string;
    //根据代码取备用2
    class function getBackup2ByCode(code: string): string;
    //根据代码取备用3
    class function getBackup3ByCode(code: string): string;
    //根据代码取备用4
    class function getBackup4ByCode(code: string): string;
    //根据代码取备用5
    class function getBackup5ByCode(code: string): string;
  end;

implementation

uses
  QueryDM;

{ TPrepareUtil }

class procedure TPrepareUtil.addBackup1(cb: TComboBox);
begin
  addBackup1Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup1(cb: TRzComboBox);
begin
  addBackup1Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup1Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用1 from 备用1 order by 备用1');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用1').AsString <> '' then
          sl.Add(FieldByName('备用1').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup2(cb: TComboBox);
begin
  addBackup2Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup2(cb: TRzComboBox);
begin
  addBackup2Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup2Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用2 from 备用2 order by 备用2');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用2').AsString <> '' then
          sl.Add(FieldByName('备用2').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup3(cb: TComboBox);
begin
  addBackup3Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup3(cb: TRzComboBox);
begin
  addBackup3Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup3Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用3 from 备用3 order by 备用3');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用3').AsString <> '' then
          sl.Add(FieldByName('备用3').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup4(cb: TRzComboBox);
begin
  addBackup4Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup4(cb: TComboBox);
begin
  addBackup4Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup4Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用4 from 备用4 order by 备用4');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用4').AsString <> '' then
          sl.Add(FieldByName('备用4').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup5(cb: TRzComboBox);
begin
  addBackup5Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup5(cb: TComboBox);
begin
  addBackup5Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup5Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用5 from 备用5 order by 备用5');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用5').AsString <> '' then
          sl.Add(FieldByName('备用5').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addCar(cb: TComboBox);
begin
  addCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addCar(cb: TRzComboBox);
begin
  addCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addCarStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 车号 from 车号 order by 车号');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('车号').AsString <> '' then
          sl.Add(FieldByName('车号').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addFaHuo(cb: TComboBox);
begin
  addFaHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addFaHuo(cb: TRzComboBox);
begin
  addFaHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addFaHuoStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 发货单位 from 发货单位 order by 发货单位');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('发货单位').AsString <> '' then
          sl.Add(FieldByName('发货单位').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addGoods(cb: TComboBox);
begin
  addGoodsStrings(cb.Items);
end;

class procedure TPrepareUtil.addGoods(cb: TRzComboBox);
begin
  addGoodsStrings(cb.Items);
end;

class procedure TPrepareUtil.addGoodsStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 货名 from 货名 order by 货名');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('货名').AsString <> '' then
          sl.Add(FieldByName('货名').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addShouHuo(cb: TRzComboBox);
begin
  addShouHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addShouHuo(cb: TComboBox);
begin
  addShouHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addShouHuoStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 收货单位 from 收货单位 order by 收货单位');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('收货单位').AsString <> '' then
          sl.Add(FieldByName('收货单位').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addSpec(cb: TComboBox);
begin
  addSpecStrings(cb.Items);
end;

class procedure TPrepareUtil.addSpec(cb: TRzComboBox);
begin
  addSpecStrings(cb.Items);
end;

class procedure TPrepareUtil.addSpecStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct 规格 from 规格');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('规格').AsString <> '' then
          sl.Add(FieldByName('规格').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addWeightCar(cb: TComboBox);
begin
  addWeightCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addWeightCar(cb: TRzComboBox);
begin
  addWeightCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addWeightCarStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct 车号 from 称重信息 order by 车号');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('车号').AsString <> '' then
          sl.Add(FieldByName('车号').AsString);
        Next
      end
    end
  end;
end;

class function TPrepareUtil.getBackup1ByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 备用1 from 备用1 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('备用1').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getBackup2ByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 备用2 from 备用2 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('备用2').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getBackup3ByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 备用3 from 备用3 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('备用3').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getBackup4ByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 备用4 from 备用4 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('备用4').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getBackup5ByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 备用5 from 备用5 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('备用5').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getCarCheat(carNo: string): Double;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 修正 from 车号 where 车号=:car';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('修正').AsString, 0);
    end
    else
    begin
      Result := 0;
    end;
  end;
end;

class function TPrepareUtil.getCarTare(carNo: string): Double;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 皮重 from 车号 where 车号=:car';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('皮重').AsString, 0);
    end
    else
    begin
      Result := 0;
    end;
  end;
end;

class function TPrepareUtil.getFaHuoByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 发货单位 from 发货单位 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('发货单位').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getGoodsByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 货名 from 货名 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('货名').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getShouHuoByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 收货单位 from 收货单位 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('收货单位').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getSpecByCode(code: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 规格 from 规格 where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('规格').AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class procedure TPrepareUtil.prepareBackupInfo(backup1, backup2, backup3,
  backup4, backup5: string);
begin
  with QueryDataModule.ADOQueryPrintCombineTicket do
  begin
    if backup1 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用1 from 备用1 where 备用1=:backup1');
      Parameters.ParamByName('backup1').Value := backup1;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用1(备用1) values(:backup1)');
        Parameters.ParamByName('backup1').Value := backup1;
        ExecSQL
      end
    end;
    if backup2 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用2 from 备用2 where 备用2=:backup2');
      Parameters.ParamByName('backup2').Value := backup2;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用2(备用2) values(:backup2)');
        Parameters.ParamByName('backup2').Value := backup2;
        ExecSQL
      end
    end;
    if backup3 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用3 from 备用3 where 备用3=:backup3');
      Parameters.ParamByName('backup3').Value := backup3;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用3(备用3) values(:backup3)');
        Parameters.ParamByName('backup3').Value := backup3;
        ExecSQL
      end
    end;
    if backup4 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用4 from 备用4 where 备用4=:backup4');
      Parameters.ParamByName('backup4').Value := backup4;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用4(备用4) values(:backup4)');
        Parameters.ParamByName('backup4').Value := backup4;
        ExecSQL
      end
    end;
    if backup5 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用5 from 备用5 where 备用5=:backup5');
      Parameters.ParamByName('backup5').Value := backup5;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用5(备用5) values(:backup5)');
        Parameters.ParamByName('backup5').Value := backup5;
        ExecSQL
      end
    end;
  end
end;

class procedure TPrepareUtil.prepareInfo(Car, faHuo, shouHuo, goods,
  spec: string);
begin
  with QueryDataModule.ADOQueryPrintCombineTicket do
  begin
    if car <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 车号 from 车号 where 车号=:car');
      Parameters.ParamByName('car').Value := car;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 车号(车号) values(:car)');
        Parameters.ParamByName('car').Value := car;
        ExecSQL
      end
    end;
    if faHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 发货单位 from 发货单位 where 发货单位=:fahuo');
      Parameters.ParamByName('faHuo').Value := faHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 发货单位(发货单位) values(:fahuo)');
        Parameters.ParamByName('fahuo').Value := faHuo;
        ExecSQL
      end
    end;
    if shouHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 收货单位 from 收货单位 where 收货单位=:shouhuo');
      Parameters.ParamByName('shouhuo').Value := shouHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 收货单位(收货单位) values(:shouhuo)');
        Parameters.ParamByName('shouhuo').Value := shouHuo;
        ExecSQL
      end
    end;
    if goods <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 货名 from 货名 where 货名=:goods');
      Parameters.ParamByName('goods').Value := goods;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 货名(货名) values(:goods)');
        Parameters.ParamByName('goods').Value := goods;
        ExecSQL
      end
    end;
    if spec <> '' then
    begin
      Close;
      SQL.Text := 'select 规格 from 规格 where 规格=:spec';
      Parameters.ParamByName('spec').Value := spec;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Text := 'insert into 规格(规格) values(:spec)';
        Parameters.ParamByName('spec').Value := spec;
        ExecSQL;
      end;
    end;
  end
end;

class function TPrepareUtil.updateCarTare(carNo, tare: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 车号 set 皮重 = :tare where 车号=:carNo';
    Parameters.ParamByName('tare').Value := StrToFloatDef(tare, 0);
    Parameters.ParamByName('carNo').Value := carNo;
    ExecSQL;
  end;
  Result := True;
end;

end.
