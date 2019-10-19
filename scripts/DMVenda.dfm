object dtmVenda: TdtmVenda
  OldCreateOrder = False
  Left = 242
  Top = 433
  Height = 167
  Width = 221
  object IBConexao: TIBDatabase
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 16
    Top = 24
  end
  object IBTransaction: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 80
    Top = 24
  end
  object qryAcesso: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 24
  end
end
