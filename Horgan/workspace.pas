unit workspace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, RzCmboBx, GraphicEx, ExtCtrls, RzPanel,
  ComCtrls;

type
  TformEspacios = class(TForm)
    MenuBar2: TPanel;
    PContainer: TPanel;
    btn2: TPanel;
    btn1: TPanel;
    btn7: TPanel;
    btn6: TPanel;
    btn5: TPanel;
    btn4: TPanel;
    PTareasEspacio: TPanel;
    Panel2: TPanel;
    PCalendar: TPanel;
    MonthCalendar1: TMonthCalendar;
    btn3: TPanel;
    RzPanel1: TRzPanel;
    lblUsuario: TLabel;
    lblCorreoElectronico: TLabel;
    btnOcultarMenu: TImage;
    Pcontainer_main: TPanel;
    ToolBar: TPanel;
    btnMostrarMenu: TImage;
    btnAbrirEspacio: TPanel;
    btnRefresh: TImage;
    ComboEspacios: TRzComboBox;
    vista: TPanel;
    ComboEspacio2: TComboBox;
    ManuPrincipal: TMainMenu;
    Archivo1: TMenuItem;
    Nuevo1: TMenuItem;
    Workspace1: TMenuItem;
    Libro1: TMenuItem;
    area1: TMenuItem;
    Abrir1: TMenuItem;
    Guardar1: TMenuItem;
    Imprimir1: TMenuItem;
    Enviar1: TMenuItem;
    Salir1: TMenuItem;
    Edicin1: TMenuItem;
    Cortar1: TMenuItem;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    Rehacer1: TMenuItem;
    Eliminar1: TMenuItem;
    Vista1: TMenuItem;
    PantallaNormal1: TMenuItem;
    MinimizarPantalla1: TMenuItem;
    PantallaCompleta1: TMenuItem;
    Herramientas1: TMenuItem;
    Reportes1: TMenuItem;
    Graficacin1: TMenuItem;
    Configuracin1: TMenuItem;
    CompartirEspacios1: TMenuItem;
    Ayuda1: TMenuItem;
    SoporteTnico1: TMenuItem;
    PrivacidadySeguridad1: TMenuItem;
    EscribirunComentario1: TMenuItem;
    Acercade1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboEspaciosKeyPress(Sender: TObject; var Key: Char);
    procedure btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure vistaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PContainerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RzPanel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PCalendarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure Graficacin1Click(Sender: TObject);
    procedure btnOcultarMenuClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure area1Click(Sender: TObject);
    procedure PrivacidadySeguridad1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure btnMostrarMenuClick(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure PantallaNormal1Click(Sender: TObject);
    procedure MinimizarPantalla1Click(Sender: TObject);
    procedure PantallaCompleta1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEspacios: TformEspacios;

implementation

uses datos, login, inicio, books, createTareas, task,
  visualizacionGraficas, administration, mantenedor, createPaginas,
  createLibro;

{$R *.dfm}

procedure TformEspacios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:= caFree;
Application.Terminate;
end;

procedure TformEspacios.FormShow(Sender: TObject);
var
   valor:String;
begin
    {CONSULTAR USUARIO}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select IdUsuario,correo from Usuarios where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;

    lblUsuario.Caption:=formLogin.EditUser.Text + ' Horgan';
    lblCorreoElectronico.Caption:=(M.Consulta.FieldByName('correo').AsString);
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);

    {CONSULTAR ESPACIOS}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from EspacioTrabajo tituloEspacio where IdUsuario=' + QuotedStr(valor)
    + ' order by IdEspacio desc');
    M.Consulta.Open;
    While not M.Consulta.Eof do begin
        ComboEspacios.Items.Add(M.Consulta.FieldByName('tituloEspacio').AsString);
        ComboEspacio2.Items.Add(M.Consulta.FieldByName('IdEspacio').AsString);
        M.Consulta.Next;
    End;
    ComboEspacios.ItemIndex:=StrToInt(formInicio.indice.Text);

    {MOSTRAR LIBROS}
    vista.Visible:=false;
    formLibros.Close;
    vista.Visible:=True;
    btnRefresh.Visible:=True;
    formLibros := TformLibros.create(self);
    formLibros.parent := vista;
    formLibros.show;
    btn2.Enabled:=True;
    btn1.Enabled:=False;

    
    {MOSTRAR VALORES LIBROS}
    formLibros.RzListBoxPages.Clear;
    formLibros.RzListBoxPages2.Clear;
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Paginas  paginaTitulo where IdLibro='
    + formLibros.ComboLibros2.Items[formLibros.ComboLibros.ItemIndex]
    + 'order by IdPagina');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        formLibros.RzListBoxPages.Items.Add(M.Consulta.FieldByName('paginaTitulo').AsString);
        formLibros.RzListBoxPages2.Items.Add(M.Consulta.FieldByName('IdPagina').AsString);
        M.Consulta.Next;
    End;
    If formLibros.RzListBoxPages.Items.Count=0 then begin
        formCreatePages.ShowModal;
    End;
    formLibros.RzListBoxPages.ItemIndex:=0;
    formLibros.RzEditTituloPage.Text:= M.Consulta.FieldByName('paginaTitulo').AsString;
    formLibros.memoPages.Text:= M.Consulta.FieldByName('contenido').AsString;
end;

procedure TformEspacios.ComboEspaciosKeyPress(Sender: TObject;
  var Key: Char);
begin
Key:=#0;
end;

procedure TformEspacios.btn1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  for x:=1 to 7 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=cl3DLight;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
    end;

    TPanel(sender).Color:=RGB(221,106,49);
    TPanel(sender).Font.Color:=clWhite;
end;

procedure TformEspacios.vistaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  for x:=1 to 7 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=cl3DLight;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
    end;
end;

procedure TformEspacios.PContainerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  for x:=1 to 7 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=cl3DLight;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
    end;
end;

procedure TformEspacios.RzPanel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  for x:=1 to 7 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=cl3DLight;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
    end;
end;

procedure TformEspacios.PCalendarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  for x:=1 to 7 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=cl3DLight;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
    end;
end;

procedure TformEspacios.btn1Click(Sender: TObject);
begin
vista.Visible:=false;
formLibros.Close;
vista.Visible:=True;
btnRefresh.Visible:=True;
formLibros := TformLibros.create(self);
formLibros.parent := vista;
formLibros.show;
btn2.Enabled:=True;
btn1.Enabled:=False;
end;

procedure TformEspacios.btn7Click(Sender: TObject);
begin
    PTareasEspacio.Visible:=True;
end;

{BOTON REFRESH}
procedure TformEspacios.btnRefreshClick(Sender: TObject);
begin
    formLibros.ComboLibros.Clear;
    formLibros.ComboLibros2.Clear;
    vista.Visible:=false;
    formTareas.Close;
    formLibros.Close;
    
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select tituloLibro from Libros where IdEspacio='
    + ComboEspacio2.Items[ComboEspacios.ItemIndex]
    + ' order by IdLibro');
    vista.Visible:=True;
    M.Consulta.Open;
    formLibros.parent := vista;
    formLibros.show;

    While not M.Consulta.Eof do begin
        formLibros.ComboLibros.Items.Add(M.Consulta.FieldByName('tituloLibro').AsString);
        formLibros.ComboLibros2.Items.Add(M.Consulta.FieldByName('IdLibro').AsString);
        M.Consulta.Next;
    End;
    If formLibros.ComboLibros.Items.Count=0 then begin
        formCreateBook.ShowModal;
    End;
    {
    If ComboEspacios.Items[]
    formLibros.RzListBoxPages.Clear;
    formLibros.RzListBoxPages2.Clear;
    formLibros.RzEditTituloPage.Clear;
    formLibros.memoPages.Clear; }

end;

procedure TformEspacios.btn2Click(Sender: TObject);
begin
btnRefresh.Visible:=False;
vista.Visible:=false;
formLibros.Close;
formTareas.Close;
vista.Visible:=True;
formTareas := TformTareas.create(self);
formTareas.parent := vista;
formTareas.show;
btn2.Enabled:=False;
btn1.Enabled:=True;
end;

procedure TformEspacios.btn3Click(Sender: TObject);
begin
    formCreateTask.ShowModal;
    formCreateTask.Position:=poDesktopCenter;
end;

procedure TformEspacios.Graficacin1Click(Sender: TObject);
begin
    formGraficos.ShowModal;
    formGraficos.Position:=poDesktopCenter;
end;

procedure TformEspacios.btnOcultarMenuClick(Sender: TObject);
begin
    MenuBar2.Visible:=False;
    btnMostrarMenu.Visible:=True;
end;

procedure TformEspacios.btn5Click(Sender: TObject);
begin
    formAdministrador.ShowModal;
    formAdministrador.Position:=poDesktopCenter;
end;

procedure TformEspacios.area1Click(Sender: TObject);
begin
    formCreateTask.ShowModal;
    formCreateTask.Position:=poDesktopCenter;
end;

procedure TformEspacios.PrivacidadySeguridad1Click(Sender: TObject);
begin
    formMantenedor.ShowModal;
    formMantenedor.Position:=poDesktopCenter;
    //formMantenedor.RzPageControl1.Pages[TabSheet1].TabVisible := false;
end;

procedure TformEspacios.Salir1Click(Sender: TObject);
begin
    PTareasEspacio.Visible:=False;
    btnMostrarMenu.Visible:=False;
    btnRefresh.Visible:=False;
    MenuBar2.Visible:=True;
    btn1.Enabled:=True;
    formEspacios.Hide;
    vista.Visible:=false;
    formLibros.Close;
    formInicio.Visible:=True;
    ComboEspacio2.Clear;
    ComboEspacios.Clear;
end;

procedure TformEspacios.btnMostrarMenuClick(Sender: TObject);
begin
    MenuBar2.Visible:=True;
    btnMostrarMenu.Visible:=False;
end;

procedure TformEspacios.Guardar1Click(Sender: TObject);
begin
//
end;

procedure TformEspacios.PantallaNormal1Click(Sender: TObject);
begin
    formEspacios.BorderStyle:=bsSizeable;
    formEspacios.WindowState:=wsMaximized;
end;

procedure TformEspacios.MinimizarPantalla1Click(Sender: TObject);
begin
    formEspacios.BorderStyle:=bsSizeable;
    formEspacios.WindowState:=wsNormal;
    formEspacios.Position:=poDesktopCenter;
end;

procedure TformEspacios.PantallaCompleta1Click(Sender: TObject);
begin
    formEspacios.BorderStyle:=bsNone;
    formEspacios.WindowState:=wsMaximized;
end;

end.
