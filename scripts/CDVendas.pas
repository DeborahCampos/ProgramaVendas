unit CDVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IDGlobal;

type
  TfrmCadastroVendas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtValor: TEdit;
    edtNumero: TEdit;
    cmbVendedor: TComboBox;
    edtData: TDateTimePicker;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVendas: TfrmCadastroVendas;

implementation 
{$R *.dfm}

uses
  CLVenda, CLVendedor;

var
   oVenda: TVenda;

procedure TfrmCadastroVendas.btnCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadastroVendas.edtNumeroExit(Sender: TObject);
begin
    if edtNumero.Text = '' then
    begin
        edtData.Date := Date;
        edtValor.Clear;
        cmbVendedor.Text := '';
    end
      else
       begin
         if oVenda.Busca(StrTOInt(edtNumero.Text)) then
         begin
            edtData.Date := oVenda.DataVenda;
            edtValor.Text := FloatToStr(oVenda.Valor);
            cmbVendedor.Text := oVenda.Vendedor.Nome;
         end;
       end;
end;

procedure TfrmCadastroVendas.FormCreate(Sender: TObject);
var
   lstVendedores : TList;
   oVendedor : TVendedor;
   iAux: Integer;
begin
     oVenda := TVenda.Create;
     lstVendedores := TVendedor.obterListaVendedoresAtivos;
     for iAux := 0 to lstVendedores.Count - 1 do
     begin
        oVendedor := lstVendedores[iAux];
        cmbVendedor.AddItem(oVendedor.Nome, oVendedor);
     end;
end;

procedure TfrmCadastroVendas.FormDestroy(Sender: TObject);
begin
    oVenda.Free;
end;

procedure TfrmCadastroVendas.btnGravarClick(Sender: TObject);
begin
     if (edtNumero.Text <> '') and
         (edtData.Date <> 0 ) and
         (edtValor.Text <> '') and
         (cmbVendedor.Text <> '') then
     begin

        oVenda.Numero := StrToInt(edtNumero.Text);
        oVenda.DataVenda := edtData.Date;
        oVenda.Valor := StrTofloat(edtValor.Text);
        oVenda.Vendedor := (cmbVendedor.Items.Objects[cmbVendedor.ItemIndex] as TVendedor);
        if oVenda.Grava then
          begin
             edtNumero.Clear;
             edtData.Date := Date;
             edtValor.Clear;
             cmbVendedor.Text := '';
             edtNumero.SetFocus;
             oVenda.Clear;
     end
     else
       edtData.SetFocus;
     end
     else
       begin
          ShowMessage('Campos Inválidos');
       end;
end;

procedure TfrmCadastroVendas.edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (IsNumeric(Key) or (Key = TAB) or
           (Key = ',') or (Key = BACKSPACE)) THEN
            Key := #0;
end;   

procedure TfrmCadastroVendas.edtNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (IsNumeric(Key) or (Key = TAB) or
           (Key = ',') or (Key = BACKSPACE)) THEN
            Key := #0;
end;

procedure TfrmCadastroVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    action := caFree;
end;

end.
