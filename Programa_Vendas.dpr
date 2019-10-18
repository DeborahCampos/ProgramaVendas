program Programa_Vendas;

uses
  Forms,
  MenuPrincipal in 'MenuPrincipal.pas' {frmMenu},
  CDVendedores in 'CDVendedores.pas' {frmCadastroVendedores},
  CDVendas in 'CDVendas.pas' {frmCadastroVendas},
  CNComissoes in 'CNComissoes.pas' {frmConsultaComissoes},
  CLVendedor in 'CLVendedor.pas',
  CLVenda in 'CLVenda.pas',
  DMVendedor in 'DMVendedor.pas' {dtmVendedor: TDataModule},
  DMVenda in 'DMVenda.pas' {dtmVenda: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
