unit DMVendedor;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, CLVendedor, Dialogs;

type
    TdtmVendedor = class(TDataModule)
    IBConexao: TIBDatabase;
    qryAcesso: TIBQuery;
    IBTransaction: TIBTransaction;
  private
    { Private declarations }
  public
    function Grava(oVendedor: TVendedor): boolean;
    function Busca(sMatricula: string; oVendedor: TVendedor;
    var Id: integer): boolean;
    function BuscaMatricula(iId: integer; oVendedor: TVendedor): Boolean;
    procedure obterVendedoresAtivos;
  end;

var
  dtmVendedor: TdtmVendedor;

implementation
{$R *.dfm}
{TdtmVendedor}

function TdtmVendedor.Busca(sMatricula: string; oVendedor: TVendedor;
var Id: integer): boolean;

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
        qryAcesso.SQL.Add('select ven."IDVendedor", ven."Matricula", ven."Nome", ven."SalarioBruto", ven."PercentualComissao"');
        qryAcesso.SQL.Add('from vendedor ven');
        qryAcesso.SQL.Add('where ven."Matricula" = :prmMat');

        qryAcesso.Params.ParamByName('prmMat').Value := sMatricula;

        qryAcesso.Open;

        if qryAcesso.RecordCount <> 0 then
        begin
          Result := true;
          oVendedor.Matricula := qryAcesso.FieldByName('Matricula').AsString;
          oVendedor.Nome := qryAcesso.FieldByName('Nome').AsString;
          oVendedor.SalarioBruto := qryAcesso.FieldByName('SalarioBruto').AsFloat;
          oVendedor.PercentualComissao := qryAcesso.FieldByName('PercentualComissao').AsFloat;

          Id := qryAcesso.FieldByName('IDVendedor').AsInteger;
        end;
        except on e:exception do
        ShowMessage('Problemas na conexão com a base de dados ' + #13 +e.Message);
        end
end;

function TdtmVendedor.BuscaMatricula(iId: integer; oVendedor: TVendedor): Boolean;
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
        qryAcesso.SQL.Add('select ven."IDVendedor", ven."Matricula", ven."Nome", ven."SalarioBruto", ven."PercentualComissao"');
        qryAcesso.SQL.Add('from vendedor ven');
        qryAcesso.SQL.Add('where ven."IDVendedor" = :prmId');
        qryAcesso.Params.ParamByName('prmId').Value := iId;
        qryAcesso.Open;
        if qryAcesso.RecordCount <> 0 then
        begin
          Result := true;
          oVendedor.Matricula := qryAcesso.FieldByName('Matricula').AsString;
          oVendedor.Nome := qryAcesso.FieldByName('Nome').AsString;
          oVendedor.SalarioBruto := qryAcesso.FieldByName('SalarioBruto').AsFloat;
          oVendedor.PercentualComissao := qryAcesso.FieldByName('PercentualComissao').AsFloat;
        end;
        except on e:exception do
           ShowMessage('Problemas na conexão com a base de dados ' + #13 +
           e.Message);
        end
end;

function TdtmVendedor.Grava(oVendedor: TVendedor): boolean;
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

        if oVendedor.ID <> 0 then
          begin
             qryAcesso.SQL.Add('update vendedor ven');
             qryAcesso.SQL.Add('set ven."Matricula" = :prmMat,');
             qryAcesso.SQL.Add(' ven."Nome" = :prmNome,');
             qryAcesso.SQL.Add(' ven."SalarioBruto" = :prmSal,');
             qryAcesso.SQL.Add(' ven."PercentualComissao" = :prmPerc');
             qryAcesso.SQL.Add('where ven."IDVendedor" = :prmId');
             qryAcesso.Params.ParamByName('prmId').Value := oVendedor.ID;
             qryAcesso.Params.ParamByName('prmMat').Value := oVendedor.Matricula;
             qryAcesso.Params.ParamByName('prmNome').Value := oVendedor.Nome;
             qryAcesso.Params.ParamByName('prmSal').Value := oVendedor.SalarioBruto;
             qryAcesso.Params.ParamByName('prmPerc').Value := oVendedor.PercentualComissao;
          end
          else
           begin
              qryAcesso.SQL.Add('insert into vendedor');
              qryAcesso.SQL.Add('("Matricula", "Nome", "PercentualComissao", "SalarioBruto")');
              qryAcesso.SQL.Add('values');
              qryAcesso.SQL.Add('(:prmMat, :prmNome, :prmPerc, :prmSal)');
              qryAcesso.Params.ParamByName('prmMat').Value := oVendedor.Matricula;
              qryAcesso.Params.ParamByName('prmNome').Value := oVendedor.Nome;
              qryAcesso.Params.ParamByName('prmPerc').Value := oVendedor.PercentualComissao;
              qryAcesso.Params.ParamByName('prmSal').Value := oVendedor.SalarioBruto;
           end;
           qryAcesso.ExecSQL;
           IBTransaction.Commit;
           result := true;
        except
          on e:exception do
          ShowMessage('Problemas no acesso ao banco de dados ' + #13 +e.Message);
        end;
end;

procedure TdtmVendedor.obterVendedoresAtivos;
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
         qryAcesso.SQL.Add('select ven."IDVendedor", ven."Matricula",ven."Nome", ven."SalarioBruto", ven."PercentualComissao"');
         qryAcesso.SQL.Add('from vendedor ven');
         qryAcesso.Open;

        except on e:exception do
           ShowMessage('Problemas na conexão com a base de dados ' + #13 +
           e.Message);
        end
end;

end.
