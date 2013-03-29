unit PrepareUtil;

interface

uses SysUtils,
  StdCtrls, DB,

  RzCmboBx, Classes;

type
  //Ԥ�ñ������
  TPrepareUtil = class
  private
  public
    //ѭ����ӷ�����λ,�ջ���λ�����������
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
    //������һ�κ�ĳ��ţ�������������λ���ջ���λд��Ԥ�ñ�
    class procedure prepareInfo(Car, faHuo, shouHuo, goods, spec: string);
    class procedure prepareBackupInfo(backup1, backup2, backup3, backup4, backup5: string);
    //��ȡ�������������(����)����
    class function getCarCheat(carNo: string): Double;
    class function getCarTare(carNo: string): Double;
    //���³�����Ԥ��Ƥ��
    class function updateCarTare(carNo, tare: string): Boolean;
    //���ݴ���ȡ������λ
    class function getFaHuoByCode(code: string): string;
    //���ݴ���ȡ�ջ���λ
    class function getShouHuoByCode(code: string): string;
    //���ݴ���ȡ����
    class function getGoodsByCode(code: string): string;
    //���ݴ���ȡ���
    class function getSpecByCode(code: string): string;
    //���ݴ���ȡ����1
    class function getBackup1ByCode(code: string): string;
    //���ݴ���ȡ����2
    class function getBackup2ByCode(code: string): string;
    //���ݴ���ȡ����3
    class function getBackup3ByCode(code: string): string;
    //���ݴ���ȡ����4
    class function getBackup4ByCode(code: string): string;
    //���ݴ���ȡ����5
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
    SQL.Add('Select ����1 from ����1 order by ����1');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����1').AsString <> '' then
          sl.Add(FieldByName('����1').AsString);
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
    SQL.Add('Select ����2 from ����2 order by ����2');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����2').AsString <> '' then
          sl.Add(FieldByName('����2').AsString);
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
    SQL.Add('Select ����3 from ����3 order by ����3');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����3').AsString <> '' then
          sl.Add(FieldByName('����3').AsString);
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
    SQL.Add('Select ����4 from ����4 order by ����4');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����4').AsString <> '' then
          sl.Add(FieldByName('����4').AsString);
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
    SQL.Add('Select ����5 from ����5 order by ����5');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����5').AsString <> '' then
          sl.Add(FieldByName('����5').AsString);
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
    SQL.Add('Select ���� from ���� order by ����');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����').AsString <> '' then
          sl.Add(FieldByName('����').AsString);
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
    SQL.Add('Select ������λ from ������λ order by ������λ');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('������λ').AsString <> '' then
          sl.Add(FieldByName('������λ').AsString);
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
    SQL.Add('Select ���� from ���� order by ����');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����').AsString <> '' then
          sl.Add(FieldByName('����').AsString);
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
    SQL.Add('Select �ջ���λ from �ջ���λ order by �ջ���λ');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('�ջ���λ').AsString <> '' then
          sl.Add(FieldByName('�ջ���λ').AsString);
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
    SQL.Add('Select distinct ��� from ���');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('���').AsString <> '' then
          sl.Add(FieldByName('���').AsString);
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
    SQL.Add('Select distinct ���� from ������Ϣ order by ����');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('����').AsString <> '' then
          sl.Add(FieldByName('����').AsString);
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
    SQL.Text := 'select ����1 from ����1 where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����1').AsString;
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
    SQL.Text := 'select ����2 from ����2 where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����2').AsString;
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
    SQL.Text := 'select ����3 from ����3 where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����3').AsString;
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
    SQL.Text := 'select ����4 from ����4 where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����4').AsString;
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
    SQL.Text := 'select ����5 from ����5 where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����5').AsString;
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
    SQL.Text := 'select ���� from ���� where ����=:car';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('����').AsString, 0);
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
    SQL.Text := 'select Ƥ�� from ���� where ����=:car';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('Ƥ��').AsString, 0);
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
    SQL.Text := 'select ������λ from ������λ where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('������λ').AsString;
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
    SQL.Text := 'select ���� from ���� where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('����').AsString;
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
    SQL.Text := 'select �ջ���λ from �ջ���λ where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('�ջ���λ').AsString;
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
    SQL.Text := 'select ��� from ��� where ����=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('���').AsString;
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
      SQL.Add('select ����1 from ����1 where ����1=:backup1');
      Parameters.ParamByName('backup1').Value := backup1;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����1(����1) values(:backup1)');
        Parameters.ParamByName('backup1').Value := backup1;
        ExecSQL
      end
    end;
    if backup2 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����2 from ����2 where ����2=:backup2');
      Parameters.ParamByName('backup2').Value := backup2;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����2(����2) values(:backup2)');
        Parameters.ParamByName('backup2').Value := backup2;
        ExecSQL
      end
    end;
    if backup3 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����3 from ����3 where ����3=:backup3');
      Parameters.ParamByName('backup3').Value := backup3;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����3(����3) values(:backup3)');
        Parameters.ParamByName('backup3').Value := backup3;
        ExecSQL
      end
    end;
    if backup4 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����4 from ����4 where ����4=:backup4');
      Parameters.ParamByName('backup4').Value := backup4;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����4(����4) values(:backup4)');
        Parameters.ParamByName('backup4').Value := backup4;
        ExecSQL
      end
    end;
    if backup5 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ����5 from ����5 where ����5=:backup5');
      Parameters.ParamByName('backup5').Value := backup5;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����5(����5) values(:backup5)');
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
      SQL.Add('select ���� from ���� where ����=:car');
      Parameters.ParamByName('car').Value := car;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����(����) values(:car)');
        Parameters.ParamByName('car').Value := car;
        ExecSQL
      end
    end;
    if faHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ������λ from ������λ where ������λ=:fahuo');
      Parameters.ParamByName('faHuo').Value := faHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ������λ(������λ) values(:fahuo)');
        Parameters.ParamByName('fahuo').Value := faHuo;
        ExecSQL
      end
    end;
    if shouHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select �ջ���λ from �ջ���λ where �ջ���λ=:shouhuo');
      Parameters.ParamByName('shouhuo').Value := shouHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into �ջ���λ(�ջ���λ) values(:shouhuo)');
        Parameters.ParamByName('shouhuo').Value := shouHuo;
        ExecSQL
      end
    end;
    if goods <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ���� from ���� where ����=:goods');
      Parameters.ParamByName('goods').Value := goods;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into ����(����) values(:goods)');
        Parameters.ParamByName('goods').Value := goods;
        ExecSQL
      end
    end;
    if spec <> '' then
    begin
      Close;
      SQL.Text := 'select ��� from ��� where ���=:spec';
      Parameters.ParamByName('spec').Value := spec;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Text := 'insert into ���(���) values(:spec)';
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
    SQL.Text := 'update ���� set Ƥ�� = :tare where ����=:carNo';
    Parameters.ParamByName('tare').Value := StrToFloatDef(tare, 0);
    Parameters.ParamByName('carNo').Value := carNo;
    ExecSQL;
  end;
  Result := True;
end;

end.
