unit createLibro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, ExtCtrls, StdCtrls;

type
  TformCreateBook = class(TForm)
    L_Txt: TLabel;
    EditLibros: TEdit;
    ComboCategory: TComboBox;
    btnCrear: TPanel;
    ComboCategory2: TComboBox;
    RzPageControl1: TRzPageControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCrearMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ComboCategoryKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCrearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCreateBook: TformCreateBook;
        valor:String;

implementation

uses datos, login, workspace;

{$R *.dfm}

procedure TformCreateBook.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    EditLibros.Clear;
    EditLibros.Text:='Nombra tu libro';
    ComboCategory.Clear;
    ComboCategory.Text:='  Selecciona una categoría';
    ComboCategory2.Clear;
end;

procedure TformCreateBook.btnCrearMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    btnCrear.Color:=clSilver;
    btnCrear.Font.Color:=clBlack;
end;

procedure TformCreateBook.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    btnCrear.Color:= clBtnFace;
    btnCrear.Font.Color:=clGray;
end;

procedure TformCreateBook.ComboCategoryKeyPress(Sender: TObject;
  var Key: Char);
begin
Key:=#0;
end;

procedure TformCreateBook.FormShow(Sender: TObject);
begin
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios IdUsuario where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);
    


    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Categorias  nombre where IdUsuario=' + QuotedStr(valor) + 'order by nombre');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        ComboCategory.Items.Add(M.Consulta.FieldByName('nombre').AsString);
        ComboCategory2.Items.Add(M.Consulta.FieldByName('IdCategoria').AsString);
        M.Consulta.Next;
    End;
end;

procedure TformCreateBook.btnCrearClick(Sender: TObject);
var
   txt: String;
   txt1: String;
begin
    EditLibros.Text:=Trim(EditLibros.Text);
    If Length (EditLibros.Text)=0 Then Begin
        Application.MessageBox('Ingresa un nombre para poder seguir','Libro',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    If Length (EditLibros.Text)>50 Then Begin
        Application.MessageBox('Ingresa un nombre valido','Libro',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt1:= 'Nombra tu libro';
    If EditLibros.Text=txt1 Then Begin
        Application.MessageBox('Ingresa un nombre valido','Libro',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt:= '  Selecciona una categoría';
    If ComboCategory.Text=txt Then Begin
        Application.MessageBox('Ingresa una categoría valida','Libro',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    {Registrar datos}
    M.Consulta.Sql.Clear;
    M.Consulta.Sql.Add('insert into Libros(IdCategoria, IdEspacio,  tituloLibro)values  ('+
    ComboCategory2.Items[ComboCategory.ItemIndex] + ','
    + formEspacios.ComboEspacio2.Items[formEspacios.ComboEspacios.ItemIndex] +
    ',' + QuotedStr(EditLibros.Text) + ')');
    M.Consulta.ExecSQL;

    Application.MessageBox('Libro creado correctamente','Libro',Mb_IconInformation + Mb_Ok);
    Close;

    EditLibros.Clear;
    EditLibros.Text:='Nombra tu libro';
    ComboCategory.Clear;
    ComboCategory.Text:='  Selecciona una categoría';
    ComboCategory2.Clear;
end;

end.
