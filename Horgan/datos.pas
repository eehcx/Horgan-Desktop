unit datos;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TM = class(TDataModule)
    conexion: TADOConnection;
    Consulta: TADOQuery;
    Busqueda: TADOQuery;
    DatosConsulta: TDataSource;
    DatosBusqueda: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  M: TM;

implementation

{$R *.dfm}

end.
