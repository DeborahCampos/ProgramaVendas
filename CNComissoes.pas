unit CNComissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmConsultaComissoes = class(TForm)
    Label1: TLabel;
    cmbVendedor: TComboBox;
    Label2: TLabel;
    edtData1: TDateTimePicker;
    Label3: TLabel;
    edtData2: TDateTimePicker;
    btnVerificar: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtSalBruto: TEdit;
    edtSalLiquido: TEdit;
    edtComissao: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaComissoes: TfrmConsultaComissoes;

implementation
{$R *.dfm}

uses CLVendedor;

procedure TfrmConsultaComissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    action := caFree;
end;

procedure TfrmConsultaComissoes.FormCreate(Sender: TObject);
var
    lstVendedores : TList;
    oVendedor : TVendedor;
    iAux : integer;

begin
     lstVendedores := TVendedor.obterListaVendedoresAtivos;

     for iAux := 0 to lstVendedores.Count - 1 do
     begin
        oVendedor := lstVendedores[iAux];
        cmbVendedor.AddItem(oVendedor.Nome, oVendedor);
     end;
end;

procedure TfrmConsultaComissoes.btnVerificarClick(Sender: TObject);
var
    oVendedor : TVendedor;
    rSalLiq, rSalBruto, rComissao: real;

begin
   if (cmbVendedor.Text <> '') and (edtData1.Date <> 0) and
      (edtData2.Date <> 0) then

      begin
        oVendedor := (cmbVendedor.Items.Objects[cmbVendedor.ItemIndex] as TVendedor);

        rSalBruto := oVendedor.SalarioBruto;
        rSalLiq := oVendedor.CalcularSalarioLiquido(edtData1.DateTime, edtData2.DateTime);
        rComissao := rSalLiq - rSalBruto;
        edtSalBruto.Text := FloatToStr(rSalBruto);
        edtComissao.Text := FloatToStr(rComissao);
        edtSalLiquido.Text := FloatToStr(rSalLiq);
      end;
end;

end.
