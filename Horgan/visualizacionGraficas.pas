unit visualizacionGraficas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DbChart, StdCtrls;

type
  TformGraficos = class(TForm)
    btnAgregar: TPanel;
    Chart1: TChart;
    Series1: THorizBarSeries;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure btnAgregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formGraficos: TformGraficos;
        valor:String;

implementation

uses datos, login;

{$R *.dfm}

procedure TformGraficos.btnAgregarClick(Sender: TObject);
begin
    Chart1.Series[0].Clear;
    Chart1.Title.Text.Clear;
    Chart1.Title.Text.Add('Número de Espacios por cada Categoría');

    
    {Datos para Graficar}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select c.nombre as Categorias, count(*) as EspacioTrabajo '
                        + 'from Categorias as c, EspacioTrabajo as e '
                        + 'where e.IdUsuario=' + QuotedStr(valor) + ' and c.IdCategoria=e.IdCategoria group by c.nombre '
                        + 'order by count(*) desc');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        Chart1.Series[0].Add(M.Consulta.FieldByName('EspacioTrabajo').AsInteger,
                             M.Consulta.FieldByName('Categorias').AsString);
        M.Consulta.Next;
    End;
end;

procedure TformGraficos.FormShow(Sender: TObject);
begin
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios IdUsuario where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);
end;

end.
