object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  Height = 100
  Width = 213
  object UniConn: TUniConnection
    ProviderName = 'MySQL'
    Port = 2020
    Database = 'edubrink'
    Username = 'root'
    Server = 'ielb.no-ip.org'
    LoginPrompt = False
    Left = 48
    Top = 20
    EncryptedPassword = 'CEFFC6FFCFFFCBFF'
  end
  object QueryImagem: TUniQuery
    Connection = UniConn
    SQL.Strings = (
      'SELECT id,foto, upper(nome),categoria_id FROM imagem'
      'where categoria_id = :pCategoria'
      'order by rand() limit 4;')
    Left = 128
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCategoria'
        Value = nil
      end>
    object QueryImagemid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryImagemfoto: TBlobField
      FieldName = 'foto'
      Required = True
    end
    object QueryImagemNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 45
    end
    object QueryImagemCategoria_id: TLongWordField
      FieldName = 'Categoria_id'
      Required = True
    end
  end
end
