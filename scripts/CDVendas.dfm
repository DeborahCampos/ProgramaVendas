object frmCadastroVendas: TfrmCadastroVendas
  Left = 303
  Top = 231
  Width = 979
  Height = 563
  Caption = 'Cadastro de Vendas'
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
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 32
    Top = 104
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label3: TLabel
    Left = 32
    Top = 152
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label4: TLabel
    Left = 32
    Top = 208
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  object edtValor: TEdit
    Left = 120
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = edtValorKeyPress
  end
  object edtNumero: TEdit
    Left = 112
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    OnExit = edtNumeroExit
    OnKeyPress = edtNumeroKeyPress
  end
  object cmbVendedor: TComboBox
    Left = 120
    Top = 208
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object edtData: TDateTimePicker
    Left = 112
    Top = 104
    Width = 186
    Height = 21
    Date = 43754.555968657410000000
    Time = 43754.555968657410000000
    TabOrder = 3
  end
  object btnGravar: TButton
    Left = 32
    Top = 304
    Width = 97
    Height = 41
    Caption = 'Atualizar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 216
    Top = 304
    Width = 97
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
