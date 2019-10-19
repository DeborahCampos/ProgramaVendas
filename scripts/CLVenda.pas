unit CLVenda;

interface

uses
 Classes, CLVendedor;

type
 TVenda = class
 protected
   FID : integer;
   FNumero : integer;
   FData : TDateTime;
   FValor : real;
   FVendedor : TVendedor;

   procedure SetNumero(iNumero : integer);
   procedure SetValor(rValor : real);
 public
   constructor Create;
   destructor Destroy; override;
   function Busca(iNumero: integer): boolean;
   function Grava : boolean;
   procedure Clear;

   class function ObterTotalVendas(dataRef1, dataRef2 : TDateTime;
idVendedor : integer) : TList;
   property ID : integer read FID;
   property Numero : integer read FNumero write SetNumero;
   property DataVenda : TDateTime read FData write FData;
   property Valor : real read FValor write SetValor;
   property Vendedor : TVendedor read FVendedor write FVendedor;
 end;

implementation
{TVenda}

uses
  DMVenda, DB;
  
function TVenda.Busca(iNumero: integer): boolean;
var iId : integer;
begin
    if dtmVenda.Busca(iNumero, Self, iId) then
        begin
           result := true;
           FID := iID;
        end
        else
                result := false;
end;

procedure TVenda.Clear;
begin
   FID := 0;
   FNumero := 0;
   FData := 0;
   FValor := 0;
   FVendedor.Clear;
end;

constructor TVenda.Create;
begin
   FVendedor := TVendedor.Create;
end;

destructor TVenda.Destroy;
begin
   FVendedor.Free;
   inherited;
end;

function TVenda.Grava: boolean;
begin
   result := dtmVenda.Grava(Self);
end;

class function TVenda.ObterTotalVendas(dataRef1, dataRef2: TDateTime;
idVendedor: integer): TList;
var lstVendas : TList;
    oVenda : TVenda;
  begin
      lstVendas := TList.Create;
      dtmVenda.ObterTotalVendas(dataRef1, dataRef2, idVendedor);
      with dtmVenda.qryAcesso do
      begin
        if RecordCount <> 0 then
        begin
         First;
         while not eof do
           begin
                oVenda := TVenda.Create;
                oVenda.Numero := FieldByName('Numero').AsInteger;
                oVenda.DataVenda := FieldByName('Data').AsDateTime;
                oVenda.Valor := FieldByName('Valor').AsFloat;
                oVenda.Vendedor.BuscaMatricula(FieldByName('IDVendedor').AsInteger);
                oVenda.FID := FieldByName('idvenda').AsInteger;
                lstVendas.Add(oVenda);
                Next;
           end;
        end;
      end;
      Result := lstVendas;
end;

procedure TVenda.SetNumero(iNumero: integer);
begin
   if iNumero >= 0 then
   FNumero := iNumero
   else
        FNumero := 0;
end;

procedure TVenda.SetValor(rValor: real);
begin
   if rValor >= 0 then
   FValor := rValor
   else
      FValor := 0;
end; 

end.
