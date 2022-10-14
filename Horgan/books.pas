unit books;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, RzPanel, RzButton, StdCtrls, RzCmboBx,
  GraphicEx, ExtCtrls, RzEdit, RzLstBox, Mask;

type
  TformLibros = class(TForm)
    VistaPaginas: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    RzEdit2: TRzEdit;
    btnDelete: TPanel;
    btnMostrar: TPanel;
    RzListBoxPages: TRzListBox;
    btnAgregarPagina: TPanel;
    Panel1: TPanel;
    memoPages: TRzMemo;
    RzEditTituloPage: TRzEdit;
    Panel2: TPanel;
    Image2: TImage;
    PLibro: TPanel;
    ComboLibros: TRzComboBox;
    btnRefrescar: TPanel;
    btnNewBook: TPanel;
    btnAdd: TImage;
    ComboLibros2: TComboBox;
    RzListBoxPages2: TRzListBox;
    RzToolbar1: TRzToolbar;
    btnNew: TRzToolButton;
    btnOpen: TRzToolButton;
    btnSave: TRzToolButton;
    RzSpacer1: TRzSpacer;
    btnCut: TRzToolButton;
    btnCopy: TRzToolButton;
    btnPaste: TRzToolButton;
    btnSelectAll: TRzToolButton;
    RzSpacer2: TRzSpacer;
    btnBold: TRzToolButton;
    btnItalic: TRzToolButton;
    btnUnderline: TRzToolButton;
    btnFont: TRzToolButton;
    ImageList1: TImageList;
    Fuente: TFontDialog;
    ColorDialog1: TColorDialog;
    PopupMenuLibros: TPopupMenu;
    Guardar2: TMenuItem;
    CrearLibro1: TMenuItem;
    CrearPgina1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnAgregarPaginaClick(Sender: TObject);
    procedure Guardar2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLibros: TformLibros;

implementation

uses datos, workspace, createLibro, createPaginas, mantenedor;

{$R *.dfm}

procedure TformLibros.FormShow(Sender: TObject);
begin
    {MOSTRAR LIBROS}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Libros tituloLibro where IdEspacio='
    + formEspacios.ComboEspacio2.Items[formEspacios.ComboEspacios.ItemIndex]
    + 'order by IdLibro desc');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        ComboLibros.Items.Add(M.Consulta.FieldByName('tituloLibro').AsString);
        ComboLibros2.Items.Add(M.Consulta.FieldByName('IdLibro').AsString);
        M.Consulta.Next;
    End;
    ComboLibros.ItemIndex:=0;


    If ComboLibros.Items.Count=0 Then Begin
        formCreateBook.ShowModal;
            M.Consulta.SQL.Clear;
            M.Consulta.SQL.Add('select * from Libros tituloLibro where IdEspacio='
            + formEspacios.ComboEspacio2.Items[formEspacios.ComboEspacios.ItemIndex]
            + 'order by IdLibro desc');
            M.Consulta.Open;

            While not M.Consulta.Eof do begin
                ComboLibros.Items.Add(M.Consulta.FieldByName('tituloLibro').AsString);
                ComboLibros2.Items.Add(M.Consulta.FieldByName('IdLibro').AsString);
                M.Consulta.Next;
            End;
            ComboLibros.ItemIndex:=0;
    End;
end;

procedure TformLibros.btnRefrescarClick(Sender: TObject);
begin
    RzListBoxPages.Clear;
    RzListBoxPages2.Clear;
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Paginas  paginaTitulo where IdLibro='
    + ComboLibros2.Items[ComboLibros.ItemIndex]
    + 'order by IdPagina');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        RzListBoxPages.Items.Add(M.Consulta.FieldByName('paginaTitulo').AsString);
        RzListBoxPages2.Items.Add(M.Consulta.FieldByName('IdPagina').AsString);
        M.Consulta.Next;
    End;
    If RzListBoxPages.Items.Count=0 then begin
        formCreatePages.ShowModal;
    End;
    RzListBoxPages.ItemIndex:=0;
    RzEditTituloPage.Text:= M.Consulta.FieldByName('paginaTitulo').AsString;
    memoPages.Text:= M.Consulta.FieldByName('contenido').AsString;
end;

procedure TformLibros.KeyPress(Sender: TObject; var Key: Char);
begin
 Key:=#0;
end;

procedure TformLibros.btnAddClick(Sender: TObject);
begin
    formCreateBook.ShowModal;
end;

procedure TformLibros.btnAgregarPaginaClick(Sender: TObject);
begin
    formCreatePages.ShowModal;
    formCreatePages.Position:=poDesktopCenter;
end;

procedure TformLibros.Guardar2Click(Sender: TObject);
begin
    RzEditTituloPage.Text:=Trim(RzEditTituloPage.Text);
    If Length (RzEditTituloPage.Text)=0 Then Begin
        Application.MessageBox('Tu página no tiene descripción principal','Páginas',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    {Actualizar Datos}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('update Paginas set ' +
                        'paginaTitulo='+ QuotedStr(RzEditTituloPage.Text) +','+
                        'contenido='+ QuotedStr(memoPages.Text) +
                        ' where IdPagina=' + RzListBoxPages2.Items[RzListBoxPages.ItemIndex]);
    M.Consulta.ExecSQL;
    Application.MessageBox('Haz actualizado tu página','Páginas',Mb_IconInformation + Mb_Ok);
end;

procedure TformLibros.btnSaveClick(Sender: TObject);
begin
    RzEditTituloPage.Text:=Trim(RzEditTituloPage.Text);
    If Length (RzEditTituloPage.Text)=0 Then Begin
        Application.MessageBox('Tu página no tiene descripción principal','Páginas',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    {Actualizar Datos}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('update Paginas set ' +
                        'paginaTitulo='+ QuotedStr(RzEditTituloPage.Text) +','+
                        'contenido='+ QuotedStr(memoPages.Text) +
                        ' where IdPagina=' + RzListBoxPages2.Items[RzListBoxPages.ItemIndex]);
    M.Consulta.ExecSQL;
    Application.MessageBox('Haz actualizado tu página','Páginas',Mb_IconInformation + Mb_Ok);
end;

procedure TformLibros.btnMostrarClick(Sender: TObject);
begin
//
end;

procedure TformLibros.btnDeleteClick(Sender: TObject);
begin
//
end;

end.
