object frmMenu: TfrmMenu
  Left = 192
  Top = 124
  Width = 979
  Height = 563
  Caption = 'frmMenu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 32
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Vendedor1: TMenuItem
        Caption = 'Vendedor'
        OnClick = Vendedor1Click
      end
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Consulta1: TMenuItem
      Caption = 'Consulta'
      object Vendedores1: TMenuItem
        Caption = 'Vendedores'
      end
      object Comisses1: TMenuItem
        Caption = 'Comiss'#245'es'
        OnClick = Comisses1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rio'
      object Emitir1: TMenuItem
        Caption = 'Emitir'
      end
      object EmitirFolhadePagamentodeComisses1: TMenuItem
        Caption = 'Emitir Folha de Pagamento de Comiss'#245'es'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
