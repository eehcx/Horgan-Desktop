unit createPaginas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TformCreatePages = class(TForm)
    L_Txt: TLabel;
    EditPages: TEdit;
    btnCrear: TPanel;
    procedure btnCrearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCreatePages: TformCreatePages;

implementation

uses datos, books;

{$R *.dfm}

procedure TformCreatePages.btnCrearClick(Sender: TObject);
var
   txt:String;
begin
    EditPages.Text:=Trim(EditPages.Text);
    If Length (EditPages.Text)=0 Then Begin
        Application.MessageBox('Ingresa un nombre para poder seguir','Nueva Página',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt:= 'Nombra tu página';
    If EditPages.Text=txt Then Begin
        Application.MessageBox('Ingresa un nombre valido','Nueva página',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('insert into Paginas (IdLibro, paginaTitulo) values ('
                        + formLibros.ComboLibros2.Items[formLibros.ComboLibros.ItemIndex] + ','
                        + QuotedStr(EditPages.Text)+')'
                        );
    M.Consulta.ExecSQL;
    formLibros.RzEditTituloPage.Text:=EditPages.Text;

    formLibros.RzListBoxPages.Clear;
    formLibros.RzListBoxPages2.Clear;
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Paginas paginaTitulo where IdLibro='
    + formLibros.ComboLibros2.Items[formLibros.ComboLibros.ItemIndex]
    + 'order by IdPagina');
    M.Consulta.Open;
    While not M.Consulta.Eof do begin
        formLibros.RzListBoxPages.Items.Add(M.Consulta.FieldByName('paginaTitulo').AsString);
        formLibros.RzListBoxPages2.Items.Add(M.Consulta.FieldByName('IdPagina').AsString);
        M.Consulta.Next;
    End;
    formLibros.RzListBoxPages.ItemIndex:=0;
    Application.MessageBox('Haz creado una pagina nueva','Páginas',Mb_IconWarning + Mb_Ok);
    Close;
end;

end.
