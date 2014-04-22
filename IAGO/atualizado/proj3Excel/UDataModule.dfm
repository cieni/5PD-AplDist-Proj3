object DM: TDM
  OldCreateOrder = False
  Height = 173
  Width = 259
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=BD12175;Persist Security Info=True;' +
      'User ID=BD12175;Initial Catalog=BD12175;Data Source=REGULUS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object ADOBD: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 24
  end
  object ADOAux: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 144
    Top = 88
  end
end
