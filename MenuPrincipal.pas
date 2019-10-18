unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Vendedor1: TMenuItem;
    Vendas1: TMenuItem;
    Consulta1: TMenuItem;
    Vendedores1: TMenuItem;
    Comisses1: TMenuItem;
    Relatrios1: TMenuItem;
    Emitir1: TMenuItem;
    EmitirFolhadePagamentodeComisses1: TMenuItem;
    Sair1: TMenuItem;
    procedure Vendedor1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Comisses1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation
{$R *.dfm}

uses
 CDVendedores, CDVendas, CNComissoes;

procedure TfrmMenu.Vendedor1Click(Sender: TObject);
var
  formCadastro: TfrmCadastroVendedores;
begin
  formCadastro := TfrmCadastroVendedores.Create(Application);
  formCadastro.Show;
end;

procedure TfrmMenu.Vendas1Click(Sender: TObject);
var
  formCadastro: TfrmCadastroVendas;
begin
    formCadastro := TfrmCadastroVendas.Create(Application);
    formCadastro.Show;
end;

procedure TfrmMenu.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmMenu.Comisses1Click(Sender: TObject);
var
 formCadastro: TfrmConsultaComissoes;
begin
    formCadastro := TfrmConsultaComissoes.Create(Application);
    formCadastro.Show;
end;

end.
