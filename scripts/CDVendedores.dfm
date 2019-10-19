object frmCadastroVendedores: TfrmCadastroVendedores
  Left = 312
  Top = 232
  Width = 979
  Height = 563
  Caption = 'Cadastro de Vendedores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 45
    Height = 13
    Caption = 'Matr'#237'cula'
  end
  object Label2: TLabel
    Left = 32
    Top = 104
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 32
    Top = 152
    Width = 60
    Height = 13
    Caption = 'Sal'#225'rio Bruto'
  end
  object Label4: TLabel
    Left = 32
    Top = 208
    Width = 73
    Height = 13
    Caption = 'Perc. Comissao'
  end
  object edtMatricula: TEdit
    Left = 128
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtMatriculaChange
  end
  object edtNome: TEdit
    Left = 128
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtSalBruto: TEdit
    Left = 136
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 2
    OnExit = edtSalBrutoExit
    OnKeyPress = edtSalBrutoKeyPress
  end
  object edtPercentualComissao: TEdit
    Left = 144
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 3
    OnExit = edtPercentualComissaoExit
  end
  object btnGravar: TButton
    Left = 40
    Top = 296
    Width = 97
    Height = 33
    Caption = 'Atualizar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 192
    Top = 296
    Width = 105
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
