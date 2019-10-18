unit CDVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IDGlobal;

type
  TfrmCadastroVendedores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    edtSalBruto: TEdit;
    btnGravar: TButton;
    btnCancelar: TButton;
    edtPercentualComissao: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtMatriculaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtSalBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSalBrutoExit(Sender: TObject);
    procedure edtPercentualComissaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVendedores: TfrmCadastroVendedores;

implementation 
{$R *.dfm}

uses
  CLVendedor;

var oVendedor : TVendedor;

procedure TfrmCadastroVendedores.btnCancelarClick(Sender: TObject);
begin
    close;
end;

procedure TfrmCadastroVendedores.edtMatriculaChange(Sender: TObject);
begin
    if Length(edtMatricula.Text) <> 4 then
    begin
      edtNome.Clear;
      edtSalBruto.Clear;
      edtPercentualComissao.Clear;
      oVendedor.Clear;
    end
    else
      begin
         if oVendedor.Busca(edtMatricula.Text) then
          begin
            edtNome.Text := oVendedor.Nome;
            edtSalBruto.Text := FloatToStr(oVendedor.SalarioBruto);
            edtPercentualComissao.Text := FloatToStr(oVendedor.PercentualComissao);
          end;
      end;
end;

procedure TfrmCadastroVendedores.FormCreate(Sender: TObject);
begin
    oVendedor := TVendedor.Create;
end;

procedure TfrmCadastroVendedores.FormDestroy(Sender: TObject);
begin
    oVendedor.Free;
end;

procedure TfrmCadastroVendedores.btnGravarClick(Sender: TObject);
begin
   if (edtMatricula.Text <> '')and
      (edtNome.Text <> '') and
      (edtSalBruto.Text <> '') and
      (edtPercentualComissao.Text <> '') then
      begin
         oVendedor.Matricula := edtMatricula.Text;
         oVendedor.Nome := edtNome.Text;
         oVendedor.SalarioBruto := StrTOFloat(edtSalBruto.Text);
         oVendedor.PercentualComissao := StrTOfloat(edtPercentualComissao.Text);

         if oVendedor.Grava then
         begin
           edtMatricula.Clear;
           edtNome.Clear;
           edtSalBruto.Clear;
           edtPercentualComissao.Clear;
           edtMatricula.SetFocus;
           oVendedor.Clear;
         end
           else
             edtNome.SetFocus;
           end
         else
         begin
            ShowMessage('Campos inválidos');
         end;
end;

procedure TfrmCadastroVendedores.edtSalBrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (IsNumeric(Key) or (Key = TAB) or
           (Key = ',') or (Key = BACKSPACE)) THEN
           Key := #0;
end;

procedure TfrmCadastroVendedores.edtSalBrutoExit(Sender: TObject);
begin
   if edtSalBruto.Text <> '' then
   begin
     try
       StrToFloat(edtSalBruto.Text);
     except
        begin
          ShowMessage('Valor Inválido');
          edtSalBruto.SetFocus;
        end;
     end
  end;
end;
 
procedure TfrmCadastroVendedores.edtPercentualComissaoExit(
  Sender: TObject);
begin
   if edtPercentualComissao.Text <> '' then
   begin
     try
       StrToFloat(edtPercentualComissao.Text);
     except
       begin
         ShowMessage('Valor Inválido');
         edtPercentualComissao.SetFocus;
       end;
     end
   end; 
end;

procedure TfrmCadastroVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
