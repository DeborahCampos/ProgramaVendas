object frmConsultaComissoes: TfrmConsultaComissoes
  Left = 324
  Top = 237
  Width = 979
  Height = 563
  Caption = 'Consulta Comiss'#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 48
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  object Label2: TLabel
    Left = 72
    Top = 96
    Width = 229
    Height = 13
    Caption = 'Data Inicial e Final de refer'#234'ncia do Faturamento'
  end
  object Label3: TLabel
    Left = 200
    Top = 184
    Width = 6
    Height = 13
    Caption = #224
  end
  object Label4: TLabel
    Left = 64
    Top = 360
    Width = 60
    Height = 13
    Caption = 'Salario Bruto'
  end
  object Label5: TLabel
    Left = 64
    Top = 408
    Width = 69
    Height = 13
    Caption = 'Sal'#225'rio Liquido'
  end
  object Label6: TLabel
    Left = 64
    Top = 456
    Width = 45
    Height = 13
    Caption = 'Comiss'#227'o'
  end
  object cmbVendedor: TComboBox
    Left = 168
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object edtData1: TDateTimePicker
    Left = 64
    Top = 176
    Width = 113
    Height = 29
    Date = 43754.649376435180000000
    Time = 43754.649376435180000000
    TabOrder = 1
  end
  object edtData2: TDateTimePicker
    Left = 240
    Top = 176
    Width = 113
    Height = 29
    Date = 43754.649787256950000000
    Time = 43754.649787256950000000
    TabOrder = 2
  end
  object btnVerificar: TButton
    Left = 144
    Top = 248
    Width = 105
    Height = 41
    Caption = 'Verificar'
    TabOrder = 3
    OnClick = btnVerificarClick
  end
  object edtSalBruto: TEdit
    Left = 176
    Top = 352
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object edtSalLiquido: TEdit
    Left = 184
    Top = 400
    Width = 137
    Height = 21
    TabOrder = 5
  end
  object edtComissao: TEdit
    Left = 184
    Top = 456
    Width = 137
    Height = 21
    TabOrder = 6
  end
end
