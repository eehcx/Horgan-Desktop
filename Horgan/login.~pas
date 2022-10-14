unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TformLogin = class(TForm)
    Panel4: TPanel;
    Label1: TLabel;
    EditUser: TLabeledEdit;
    EditContrasena: TLabeledEdit;
    btn1: TPanel;
    btn2: TPanel;
    btn3: TPanel;
    Image1: TImage;
    procedure btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

uses datos, inicio, registro;

{$R *.dfm}

procedure TformLogin.btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  for x:=1 to 3 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clBlack;
    end;
TPanel(sender).Color:=RGB(221,106,49);
TPanel(sender).Font.Color:=clWhite;
end;

procedure TformLogin.Panel4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  for x:=1 to 3 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clBlack;
    end;
end;

procedure TformLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= caFree;
end;

procedure TformLogin.btn1Click(Sender: TObject);
begin
    EditUser.Text:=Trim(EditUser.Text);
    If Length (EditUser.Text)=0 Then Begin
        Application.MessageBox('Ingresa un Usuario','Inicio de Sesión',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    EditContrasena.Text:=Trim(EditContrasena.Text);
    If Length (EditContrasena.Text)=0 Then Begin
        Application.MessageBox('Ingresa una Contraseña','Inicio de Sesión',Mb_IconWarning + Mb_Ok);
        Exit;
    End;

    {Autentificación Usuario}
    with M.Consulta do
      begin
        active:= false;
        Sql.Clear;
        Sql.Text:= 'select nickName, contrasena from Usuarios where nickName = ' + QuotedStr(EditUser.Text) + 'and contrasena = ' + QuotedStr(EditContrasena.Text) ;
        active:= true;
      end;

    if M.Consulta.RecordCount <> 0 then begin
        formLogin.Hide;
        formLogin.Visible:=False;
        formInicio.Show;

    end
    else begin
        EditUser.Clear;
        EditContrasena.Clear;
        Application.MessageBox('Ingresa un usuario/contraseña validos o Registrate','Atención',Mb_IconWarning + Mb_Ok);
        Exit;
    end;
end;

procedure TformLogin.btn2Click(Sender: TObject);
begin
    Close;
end;

procedure TformLogin.btn3Click(Sender: TObject);
begin
    formRegistro.Show;
end;

end.
