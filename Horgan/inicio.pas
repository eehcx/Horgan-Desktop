unit inicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GraphicEx, ExtCtrls;

type
  TformInicio = class(TForm)
    Menu: TPanel;
    logo: TPanel;
    horgan: TLabel;
    P_Menu: TPanel;
    Image1: TImage;
    memo: TMemo;
    MenuBar_Main: TPanel;
    bar1: TPanel;
    bar4: TPanel;
    bar2: TPanel;
    bar3: TPanel;
    bar5: TPanel;
    indice: TEdit;
    lblEspacios: TLabel;
    L_Texto: TLabel;
    btnMain: TPanel;
    btn1: TPanel;
    btn2: TPanel;
    Espacio2: TPanel;
    Espacio1: TPanel;
    Espacio3: TPanel;
    Espacio4: TPanel;
    btnMore: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MenuBar_MainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Espacio1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnMoreMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bar2Click(Sender: TObject);
    procedure bar1Click(Sender: TObject);
    procedure bar5Click(Sender: TObject);
    procedure bar4Click(Sender: TObject);
    procedure bar3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnMoreClick(Sender: TObject);
    procedure Espacio1Click(Sender: TObject);
    procedure Espacio2Click(Sender: TObject);
    procedure Espacio3Click(Sender: TObject);
    procedure Espacio4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formInicio: TformInicio;

implementation

uses datos, login, mantenedor, createEspacios, workspace, categories,
  administration;

{$R *.dfm}

procedure TformInicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= caFree;
Application.Terminate;
end;

procedure TformInicio.FormShow(Sender: TObject);
var
   valor: String;
begin
    //Seleccionar ID de usuario
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios IdUsuario where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);

    {ESPACIOS PARA WORKSPACE}

    //Agregar ultimos 4 espacio creados
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select top 4 tituloEspacio, IdEspacio  from EspacioTrabajo where IdUsuario='
    + QuotedStr(valor) + ' order by IdEspacio desc');
    M.Consulta.Open;

    memo.Clear;
    While not M.Consulta.Eof do begin
        memo.Lines.Add(M.Consulta.FieldByName('tituloEspacio').AsString);
        M.Consulta.Next;
    End;
    
    //Mostrar espacios
    If memo.Lines.Count=0 Then Begin
        L_Texto.Visible:=False;
        Espacio1.Visible:=False;
        Espacio1.Enabled:=False;
        Espacio2.Visible:=False;
        Espacio2.Enabled:=False;
        Espacio3.Visible:=False;
        Espacio3.Enabled:=False;
        Espacio4.Visible:=False;
        Espacio4.Enabled:=False;
        bar1.Visible:=False;
        bar4.Visible:=False;
    End;
    If memo.Lines.Count=1 Then Begin


        //Ocultar paneles
        Espacio2.Visible:=False;
        Espacio2.Enabled:=False;
        Espacio3.Visible:=False;
        Espacio3.Enabled:=False;
        Espacio4.Visible:=False;
        Espacio4.Enabled:=False;
    End;
    If memo.Lines.Count=2 Then Begin


        //Ocultar paneles
        Espacio3.Visible:=False;
        Espacio3.Enabled:=False;
        Espacio4.Visible:=False;
        Espacio4.Enabled:=False;
    End;
    If memo.Lines.Count=3 Then Begin

        //Ocultar paneles
        Espacio4.Visible:=False;
        Espacio4.Enabled:=False;
    End;
    If memo.Lines.Count=4 Then Begin
        btnMore.Visible:=True;
    End;


    Espacio1.Caption:= '  ' + memo.Lines[0];
    Espacio2.Caption:= '  ' + memo.Lines[1];
    Espacio3.Caption:= '  ' + memo.Lines[2];
    Espacio4.Caption:= '  ' + memo.Lines[3];
end;

procedure TformInicio.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  for x:=1 to 5 do begin
        TPanel(FindComponent('bar'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('bar'+IntToStr(x))).Font.Color:=clGray;
  end;
  for x:=1 to 4 do begin
        TPanel(FindComponent('Espacio'+IntToStr(x))).Color:=clWhite;
        TPanel(FindComponent('Espacio'+IntToStr(x))).Font.Color:=clBlack;
  end;
  for x:=1 to 2 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
  end;
  btnMore.Color:=clBtnFace;
  btnMore.Font.Color:=clGray;
end;

procedure TformInicio.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  for x:=1 to 5 do begin
        TPanel(FindComponent('bar'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('bar'+IntToStr(x))).Font.Color:=clGray;
  end;
end;

procedure TformInicio.btnMainMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  for x:=1 to 2 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
  end;
end;

procedure TformInicio.bar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  for x:=1 to 5 do begin
        TPanel(FindComponent('bar'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('bar'+IntToStr(x))).Font.Color:=clGray;
  end;

    TPanel(sender).Color:=clSilver;
    TPanel(sender).Font.Color:=clBlack;
end;

procedure TformInicio.MenuBar_MainMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  for x:=1 to 5 do begin
        TPanel(FindComponent('bar'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('bar'+IntToStr(x))).Font.Color:=clGray;
  end;
end;

procedure TformInicio.Espacio1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  for x:=1 to 4 do begin
        TPanel(FindComponent('Espacio'+IntToStr(x))).Color:=clWhite;
        TPanel(FindComponent('Espacio'+IntToStr(x))).Font.Color:=clBlack;
  end;

    TPanel(sender).Color:=RGB(221,106,49);
    TPanel(sender).Font.Color:=clWhite;
end;

procedure TformInicio.btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  for x:=1 to 2 do begin
        TPanel(FindComponent('btn'+IntToStr(x))).Color:=clBtnFace;
        TPanel(FindComponent('btn'+IntToStr(x))).Font.Color:=clGray;
  end;

    TPanel(sender).Color:=clSilver;
    TPanel(sender).Font.Color:=clBlack;
end;

procedure TformInicio.btnMoreMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
btnMore.Color:=clSilver;
btnMore.Font.Color:=clBlack;
end;

procedure TformInicio.bar2Click(Sender: TObject);
begin
    formMantenedor.ShowModal;
    formMantenedor.Position:=poMainFormCenter;
    //formMantenedor.RzPageControl1.ActivePage:= TabSheet1;
end;

procedure TformInicio.bar1Click(Sender: TObject);
begin
    indice.Text:=IntToStr(0);
    formEspacios.show;
    formInicio.Hide;

end;

procedure TformInicio.bar5Click(Sender: TObject);
begin
    formCreateEspacios.ShowModal;
    formCreateEspacios.Position:=poMainFormCenter;
end;

procedure TformInicio.bar4Click(Sender: TObject);
begin
//
end;

procedure TformInicio.bar3Click(Sender: TObject);
begin
    formCategorias.ShowModal;
    formCategorias.Position:=poMainFormCenter; 
end;

procedure TformInicio.btn1Click(Sender: TObject);
begin
    formCreateEspacios.ShowModal;
    formCreateEspacios.Position:=poMainFormCenter;
end;

procedure TformInicio.btn2Click(Sender: TObject);
begin
    formAdministrador.ShowModal;
    formAdministrador.Position:=poDesktopCenter;
end;

procedure TformInicio.btnMoreClick(Sender: TObject);
begin
//
end;

procedure TformInicio.Espacio1Click(Sender: TObject);
begin
    indice.Text:=IntToStr(0);
    formEspacios.show;
    formInicio.Hide;
end;

procedure TformInicio.Espacio2Click(Sender: TObject);
begin
    indice.Text:=IntToStr(1);
    formEspacios.show;
    formInicio.Hide;
end;

procedure TformInicio.Espacio3Click(Sender: TObject);
begin
    indice.Text:=IntToStr(2);
    formEspacios.show;
    formInicio.Hide;
end;

procedure TformInicio.Espacio4Click(Sender: TObject);
begin
    indice.Text:=IntToStr(2);
    formEspacios.show;
    formInicio.Hide;
end;

end.
