unit mantenedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, ExtCtrls, StdCtrls, RzTabs;

type
  TformMantenedor = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    PInfoUser: TPanel;
    EditUsuario: TLabeledEdit;
    EditNombre: TLabeledEdit;
    EditCorreo: TLabeledEdit;
    btnActualizar: TPanel;
    editID: TEdit;
    btnSubir: TPanel;
    P_IMG: TPanel;
    img: TImage;
    EditRuta: TEdit;
    TabSheet2: TRzTabSheet;
    OpenPictureDialog1: TOpenPictureDialog;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    EditContrasenaActual: TLabeledEdit;
    btnConfirmacion: TPanel;
    EditIMG: TEdit;
    PActualizarContrasena: TPanel;
    LabeledEditActualizarContrasena: TLabeledEdit;
    btnActualizarContrasena: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnSubirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnConfirmacionClick(Sender: TObject);
    procedure btnActualizarContrasenaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMantenedor: TformMantenedor;

implementation

uses datos, login, inicio;

{$R *.dfm}

procedure TformMantenedor.FormShow(Sender: TObject);
var
   valor:String;
   ruta:String;
begin
    ruta:=ExtractFilePath(Application.ExeName);
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios IdUsuario where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);
    editID.Text:=valor;

    
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select nickName,nombreCompleto,correo,contrasena,fotoPerfil from Usuarios where IdUsuario=' + QuotedStr(valor));
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        EditUsuario.Text:=M.Consulta.FieldByName('nickName').AsString;
        EditNombre.Text:=M.Consulta.FieldByName('nombreCompleto').AsString;
        EditCorreo.Text:=M.Consulta.FieldByName('correo').AsString;
        //EditIMG.Text:=M.Consulta.FieldByName('fotoPerfil').AsString;
        M.Consulta.Next;
    End;

    If Length (M.Consulta.FieldByName('fotoPerfil').AsString)>0 Then Begin
        If FileExists(ExtractFilePath(Application.ExeName) + 'imagenes\' +
                        M.Consulta.FieldByName('fotoPerfil').AsString) Then Begin
           img.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagenes\' + M.Consulta.FieldByName('fotoPerfil').AsString);
        End;
    End;
end;

procedure TformMantenedor.btnSubirClick(Sender: TObject);
begin
    If OpenPictureDialog1.Execute Then begin
        img.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        EditRuta.Text:=OpenPictureDialog1.FileName;
    End;

    ForceDirectories(ExtractFilePath(Application.ExeName) + 'imagenes');
    If Length(EditRuta.Text)>0 Then Begin
        copyFile(PChar(EditRuta.Text), PChar(ExtractFilePath(Application.ExeName)
                + 'imagenes/usuario' + editID.Text + ExtractFileExt(EditRuta.Text)), False);
    End;
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('update Usuarios set fotoPerfil=' +
                        QuotedStr('usuario'+editID.Text+ExtractFileExt(EditRuta.Text)) +
                        ' where IdUsuario=' + editID.Text);
    M.Consulta.ExecSQL;


    //FormActivate(sender);
end;

procedure TformMantenedor.btnActualizarClick(Sender: TObject);
begin
    EditUsuario.Text:=Trim(EditUsuario.Text);
    If Length (EditUsuario.Text)=0 Then Begin
        Application.MessageBox('Ingresa un valor para poder seguir','Usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    EditNombre.Text:=Trim(EditNombre.Text);
    If Length (EditNombre.Text)=0 Then Begin
        Application.MessageBox('Ingresa un valor para poder seguir','Usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    EditCorreo.Text:=Trim(EditCorreo.Text);
    If Length (EditCorreo.Text)=0 Then Begin
        Application.MessageBox('Ingresa un valor para poder seguir','Usuario',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    {Actualizar Datos}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('update Usuarios set ' +
                        'nickName='+ QuotedStr(EditUsuario.Text) +','+
                        'nombreCompleto='+ QuotedStr(EditNombre.Text)+','+
                        'correo='+ QuotedStr(EditCorreo.Text) +
                        ' where IdUsuario=' + editID.Text);
    M.Consulta.ExecSQL;
    Application.MessageBox('Tus datos han sido actualizados','Datos del Usuario',Mb_IconInformation + Mb_Ok);
    
end;

procedure TformMantenedor.btnConfirmacionClick(Sender: TObject);
begin
    EditContrasenaActual.Text:=Trim(EditContrasenaActual.Text);
    If Length (EditContrasenaActual.Text)=0 Then Begin
        Application.MessageBox('Ingresa la contraseña de tu usuario','Contraseña',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    {Actualizar Contraseña}
    with M.Consulta do
      begin
        active:= false;
        Sql.Clear;
        Sql.Text:= 'select contrasena from Usuarios where contrasena = ' + QuotedStr(EditContrasenaActual.Text);
        active:= true;
      end;

    if M.Consulta.RecordCount <> 0 then begin
       LabeledEditActualizarContrasena.Enabled:=True;
       btnActualizarContrasena.Enabled:=True; 
    end
    else begin
        EditContrasenaActual.Clear;
        Application.MessageBox('Ingresa una contraseña valida','Atención',Mb_IconWarning + Mb_Ok);
        Exit;
    end;
    EditContrasenaActual.Enabled:=False;
    btnConfirmacion.Enabled:=False;
end;

procedure TformMantenedor.btnActualizarContrasenaClick(Sender: TObject);
begin
    LabeledEditActualizarContrasena.Text:=Trim(LabeledEditActualizarContrasena.Text);
    If Length (LabeledEditActualizarContrasena.Text)=0 Then Begin
        Application.MessageBox('Ingresa un valor para poder seguir','Usuario (contraseña)',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    {Actualizar Datos - Contraseña}
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('update Usuarios set ' +
                        'contrasena='+ QuotedStr(LabeledEditActualizarContrasena.Text) +
                        ' where IdUsuario=' + editID.Text);
    M.Consulta.ExecSQL;
    Application.MessageBox('Tus datos han sido actualizados','Datos del Usuario',Mb_IconInformation + Mb_Ok);
    EditContrasenaActual.Enabled:=True;
    btnConfirmacion.Enabled:=True;
    EditContrasenaActual.Clear;
    LabeledEditActualizarContrasena.Clear;
    LabeledEditActualizarContrasena.Enabled:=False;
    btnActualizarContrasena.Enabled:=False;   
end;

procedure TformMantenedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    EditContrasenaActual.Enabled:=True;
    btnConfirmacion.Enabled:=True;
    EditContrasenaActual.Clear;
    LabeledEditActualizarContrasena.Clear;
    LabeledEditActualizarContrasena.Enabled:=False;
    btnActualizarContrasena.Enabled:=False;
end;

end.
