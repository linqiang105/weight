unit weight_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2013-01-09 18:01:53 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\福州奥特威\单机破解版\weight15\weight.tlb (1)
// LIBID: {1E1FBA24-419E-4E65-A7FA-1EC946CEB686}
// LCID: 0
// Helpfile: 
// HelpString: weight Library
// DepndLst: 
//   (1) v2.0 stdole, (F:\Windows\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  weightMajorVersion = 1;
  weightMinorVersion = 0;

  LIBID_weight: TGUID = '{1E1FBA24-419E-4E65-A7FA-1EC946CEB686}';

  IID_IMeter: TGUID = '{B0B79315-D9D0-43BF-A936-EF42B25AEF20}';
  CLASS_Meter: TGUID = '{3065115F-BA28-41FD-8545-890241ACD7E3}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMeter = interface;
  IMeterDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Meter = IMeter;


// *********************************************************************//
// Interface: IMeter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B0B79315-D9D0-43BF-A936-EF42B25AEF20}
// *********************************************************************//
  IMeter = interface(IDispatch)
    ['{B0B79315-D9D0-43BF-A936-EF42B25AEF20}']
    function getWeight: Double; safecall;
    function getRecordset(const glideNo: WideString): IDispatch; safecall;
    function getRecord(const glideNo: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMeterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B0B79315-D9D0-43BF-A936-EF42B25AEF20}
// *********************************************************************//
  IMeterDisp = dispinterface
    ['{B0B79315-D9D0-43BF-A936-EF42B25AEF20}']
    function getWeight: Double; dispid 201;
    function getRecordset(const glideNo: WideString): IDispatch; dispid 202;
    function getRecord(const glideNo: WideString): WideString; dispid 203;
  end;

// *********************************************************************//
// The Class CoMeter provides a Create and CreateRemote method to          
// create instances of the default interface IMeter exposed by              
// the CoClass Meter. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMeter = class
    class function Create: IMeter;
    class function CreateRemote(const MachineName: string): IMeter;
  end;

implementation

uses ComObj;

class function CoMeter.Create: IMeter;
begin
  Result := CreateComObject(CLASS_Meter) as IMeter;
end;

class function CoMeter.CreateRemote(const MachineName: string): IMeter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Meter) as IMeter;
end;

end.
