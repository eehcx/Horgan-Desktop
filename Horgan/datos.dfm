object M: TM
  OldCreateOrder = False
  Left = 192
  Top = 117
  Height = 237
  Width = 327
  object conexion: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=horgan;Data Source=.;Initia' +
      'l File Name="";Server SPN=""'
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 40
  end
  object Consulta: TADOQuery
    Connection = conexion
    Parameters = <>
    Left = 112
    Top = 16
  end
  object Busqueda: TADOQuery
    Connection = conexion
    Parameters = <>
    Left = 168
    Top = 16
  end
  object DatosConsulta: TDataSource
    DataSet = Consulta
    Left = 104
    Top = 96
  end
  object DatosBusqueda: TDataSource
    DataSet = Busqueda
    Left = 184
    Top = 96
  end
end
