unit Meter;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, weight_TLB, SysUtils, StdVcl;

type
  TMeter = class(TAutoObject, IMeter)
  protected
    function getWeight: Double; safecall;
    function getRecordset(const glideNo: WideString): IDispatch; safecall;
    function getRecord(const glideNo: WideString): WideString; safecall;

  end;

implementation

uses ComServ, Main, QueryDM, CommonUtil;

function TMeter.getWeight: Double;
begin
  Result := StrToFloatDef(MainForm.getWeight, 0);
end;

function TMeter.getRecordset(const glideNo: WideString): IDispatch;
begin
  with QueryDataModule.adoDataSet1 do
  begin
    Close;
    CommandText := 'select * from 称重信息 where 流水号=:glideNo';
    Parameters.ParamByName('glideNo').Value := glideNo;
    Open;
    if not IsEmpty then
    begin
      Result := QueryDataModule.adoDataSet1.Recordset;
    end;
  end;
end;

function TMeter.getRecord(const glideNo: WideString): WideString;
begin
  result := TCommonUtil.getXmlData(glideNo);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TMeter, Class_Meter,
    ciMultiInstance, tmApartment);
end.
