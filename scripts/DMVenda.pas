unit DMVenda;

interface

uses
  SysUtils, Classes, CLVenda, IBDatabase, DB, IBCustomDataSet, IBQuery,
Dialogs;

type
  TdtmVenda = class(TDataModule)
    IBConexao: TIBDatabase;
    IBTransaction: TIBTransaction;
    qryAcesso: TIBQuery;
  private
    { Private declarations }
  public
    function Grava(oVenda : TVenda) : Boolean;
    function Busca(iNum: integer; oVenda: TVenda; var Id: integer): boolean;
    procedure ObterTotalVendas(dataRef1, dataRef2:TDateTime; IdVendedor: integer);
  end;

var
  dtmVenda: TdtmVenda;

implementation
{$R *.dfm}
uses
  CLVendedor;

{TdtmVenda}

 function TdtmVenda.Busca(iNum: integer; oVenda: TVenda; var Id: integer): boolean;
 begin
    result := false;

    try
     if not IBConexao.Connected then
       begin
         IBConexao.Open;
         IBTransaction.StartTransaction;
       end;

       if qryAcesso.Active then
          qryAcesso.Close;

          qryAcesso.SQL.Clear;
          qryAcesso.SQL.Add('select ven."IDVenda", ven."IDVendedor", ven."Numero", ven."Data", ven."Valor"');
          qryAcesso.SQL.Add('from venda ven');
          qryAcesso.SQL.Add('where ven."Numero" = :num');
          qryAcesso.Params.ParamByName('num').Value := iNum; qryAcesso.Open;

          if qryAcesso.RecordCount <> 0 then
            begin
                result := True;
                oVenda.Numero := iNum;
                oVenda.DataVenda := qryAcesso.FieldByName('Data').AsDateTime;
                oVenda.Valor := qryAcesso.FieldByName('Valor').AsFloat;
                oVenda.Vendedor.BuscaMatricula(qryAcesso.FieldByName('IDVendedor').AsInteger);

                Id := qryAcesso.FieldByName('IDVenda').AsInteger;
            end;
    except
      on e: Exception do
        ShowMessage('Problemas no acesso ao banco de dados ' + #13 + e.Message);
    end;
end;

function TdtmVenda.Grava(oVenda: TVenda): Boolean;
begin
   Result := false;
   try
        if not IBConexao.Connected then
        begin
           IBConexao.Open;
           IBTransaction.StartTransaction;
        end;

        if qryAcesso.Active then
           qryAcesso.Close;
           qryAcesso.SQL.Clear;

        if oVenda.ID <> 0 then
        begin
           qryAcesso.SQL.Add('update venda ven');
           qryAcesso.SQL.Add('set ven."IDVendedor" = :prmVend,');
           qryAcesso.SQL.Add(' ven."Numero" = :prmNum,');
           qryAcesso.SQL.Add(' ven."Data" = :prmData,');
           qryAcesso.SQL.Add(' ven."Valor" = :prmValor');
           qryAcesso.SQL.Add('where (ven."IDVenda" = :prmId)');
           qryAcesso.Params.ParamByName('prmId').Value := oVenda.ID;
           qryAcesso.Params.ParamByName('prmVend').Value := oVenda.Vendedor.ID;
           qryAcesso.Params.ParamByName('prmNum').Value := oVenda.Numero;
           qryAcesso.Params.ParamByName('prmData').Value := oVenda.DataVenda;
           qryAcesso.Params.ParamByName('prmValor').Value := oVenda.Valor;
        end
        else
        begin
           qryAcesso.SQL.Add('insert into venda');
           qryAcesso.SQL.Add('("IDVendedor", "Numero", "Data", "Valor")');
           qryAcesso.SQL.Add('values');
           qryAcesso.SQL.Add('(:prmVend, :prmNum, :prmData, :prmValor)');

           qryAcesso.Params.ParamByName('prmVend').Value := oVenda.Vendedor.ID;
           qryAcesso.Params.ParamByName('prmNum').Value := oVenda.Numero;
           qryAcesso.Params.ParamByName('prmData').Value := oVenda.DataVenda;
           qryAcesso.Params.ParamByName('prmValor').Value := oVenda.Valor;
        end;
            qryAcesso.ExecSQL;
            IBTransaction.Commit;
            Result := True;
        except on e: exception do
                ShowMessage('Problemas no acesso ao banco de dados ' + #13 +
                e.Message);
        end;
end;

procedure TdtmVenda.ObterTotalVendas(dataRef1, dataRef2: TDateTime;
IdVendedor: integer);
begin
      try
          if not IBConexao.Connected then
          begin
                IBConexao.Open;
                IBTransaction.StartTransaction;
          end;
          if qryAcesso.Active then
             qryAcesso.Close;
             qryAcesso.SQL.Clear;
             qryAcesso.SQL.Add('select ven."IDVenda", ven."IDVendedor", ven."Numero", ven."Data", ven."Valor"');
             qryAcesso.SQL.Add('from venda ven');
             qryAcesso.SQL.Add('where ("IDVendedor" = :prmNum and ven."Data" between :prmData1 and :prmData2)');
             qryAcesso.Params.ParamByName('prmNum').Value := IdVendedor;
             qryAcesso.Params.ParamByName('prmData1').Value := dataRef1;
             qryAcesso.Params.ParamByName('prmData2').Value := dataRef2;
             qryAcesso.Open;

            except
                on e: exception do
                ShowMessage('Problemas no acesso ao banco de dados ' + #13 +
                e.Message);
            end;
        end;
end.
