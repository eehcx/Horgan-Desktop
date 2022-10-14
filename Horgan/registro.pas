unit registro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TformRegistro = class(TForm)
    L_txtSexo: TLabel;
    Image1: TImage;
    LE_usuario: TLabeledEdit;
    LE_nombre: TLabeledEdit;
    ComboSexo: TComboBox;
    LE_correo: TLabeledEdit;
    LE_contrasena: TLabeledEdit;
    btnSiguiente: TPanel;
    ComboSexo2: TComboBox;
    P_Categoria: TPanel;
    L_txt1: TLabel;
    btn1: TPanel;
    EditCategorias: TEdit;
    ListCategorias: TListBox;
    btn2: TPanel;
    ID: TMemo;
    procedure btnSiguienteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ComboSexoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRegistro: TformRegistro;

implementation

uses datos;

{$R *.dfm}

procedure TformRegistro.btnSiguienteMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btnSiguiente.Color:=RGB(113,160,178);
btnSiguiente.Font.Color:=clWhite;
end;

procedure TformRegistro.btn1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  for x:=1 to 2 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clBlack;
    end;
    TPanel(sender).Color:=RGB(113,160,178);
    TPanel(sender).Font.Color:=clWhite;
end;

procedure TformRegistro.ComboSexoKeyPress(Sender: TObject; var Key: Char);
begin
Key:=#0;
end;

procedure TformRegistro.btnSiguienteClick(Sender: TObject);
var
   txt: String;
begin
    LE_nombre.Text:=Trim(LE_nombre.Text);
    If Length (LE_nombre.Text)=0 Then Begin
        Application.MessageBox('Ingresa un nombre para poder seguir','Registro de usuario',Mb_IconWarning + Mb_Ok);
        Exit;
        //LE_nombre.SetFocus;
    End;
    LE_usuario.Text:=Trim(LE_usuario.Text);
    If Length (LE_usuario.Text)=0 Then Begin
        Application.MessageBox('Ingresa un usuario para poder seguir','Registro de usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    If Length (LE_usuario.Text)>10 Then Begin
        Application.MessageBox('Ingresa un usuario valido para poder seguir','Ingrese un usuario menor a 10',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    LE_correo.Text:=Trim(LE_correo.Text);
    If Length (LE_correo.Text)=0 Then Begin
        Application.MessageBox('Ingresa un usuario para poder seguir','Registro de usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    LE_contrasena.Text:=Trim(LE_contrasena.Text);
    If Length (LE_contrasena.Text)=0 Then Begin
        Application.MessageBox('Ingresa un usuario para poder seguir','Registro de usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt:= 'Selecciona un Sexo';
    If ComboSexo.Text=txt Then Begin
        Application.MessageBox('Ingresa un sexo valido','Registro de usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    {Registrar datos}
    M.Consulta.Sql.Clear;
    M.Consulta.Sql.Add('insert into Usuarios (nombreCompleto,nickName,correo,contrasena,sexo,estado) values ('+
                        QuotedStr(LE_nombre.Text) + ',' + QuotedStr(LE_usuario.Text) + ',' + QuotedStr(LE_correo.Text) + ',' + QuotedStr(LE_contrasena.Text) + ',' +
                        ComboSexo2.Items[ComboSexo.ItemIndex] + ',1)');
    M.Consulta.ExecSQL;

    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios where nickName='+QuotedStr(LE_usuario.Text));
    M.Consulta.Open;
    ID.Lines.Clear;
    ID.Lines.Add(M.Consulta.FieldByName('IdUsuario').AsString);
    M.Consulta.Next;
    //Lista.Items.Add(ID.Lines[0])
    P_Categoria.Visible:=True;
end;

procedure TformRegistro.btn1Click(Sender: TObject);
begin
    EditCategorias.Text:=Trim(EditCategorias.Text);
    If Length (EditCategorias.Text)=0 Then Begin
        Application.MessageBox('Ingresa una categoria','Categorias',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    If Length (EditCategorias.Text)>15 Then Begin
        Application.MessageBox('Las categorias deben contener menos texto','Categorias',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    ListCategorias.Items.Add(EditCategorias.Text);
    {Registrar Categorias}
    M.Consulta.Sql.Clear;
    M.Consulta.Sql.Add('insert into Categorias (IdUsuario,nombre) values (' + ID.Lines[0] + ','
                        + QuotedStr(EditCategorias.Text) + ')'
                        );
    M.Consulta.ExecSQL;

    EditCategorias.Clear;
end;

procedure TformRegistro.btn2Click(Sender: TObject);
begin
    Application.MessageBox('Gracias por registrarte, Acontinuación Inicia Sesión','Registro Terminado',Mb_IconInformation + Mb_Ok);
    formRegistro.Close;
end;

end.
