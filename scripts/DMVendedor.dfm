object dtmVendedor: TdtmVendedor
  OldCreateOrder = False
  Left = 248
  Top = 391
  Height = 169
  Width = 231
  object IBConexao: TIBDatabase
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 24
  end
  object qryAcesso: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 160
    Top = 24
  end
  object IBTransaction: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 88
    Top = 24
  end
end
