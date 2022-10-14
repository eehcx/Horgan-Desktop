unit createEspacios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TformCreateEspacios = class(TForm)
    L_Txt: TLabel;
    EditEspacios: TEdit;
    ComboCategory: TComboBox;
    btnCrear: TPanel;
    ComboCategory2: TComboBox;
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
  formCreateEspacios: TformCreateEspacios;
     valor:String;

implementation

uses datos, login, inicio;

{$R *.dfm}

procedure TformCreateEspacios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    EditEspacios.Clear;
    EditEspacios.Text:='Nombra tu Espacio de Trabajo';
    ComboCategory.Clear;
    ComboCategory.Text:='  Selecciona una categoría';
    ComboCategory2.Clear;
end;

procedure TformCreateEspacios.btnCrearMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    btnCrear.Color:=clSilver;
    btnCrear.Font.Color:=clBlack;
end;

procedure TformCreateEspacios.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btnCrear.Color:= clBtnFace;
btnCrear.Font.Color:=clGray;
end;

procedure TformCreateEspacios.ComboCategoryKeyPress(Sender: TObject;
  var Key: Char);
begin
Key:=#0;
end;

procedure TformCreateEspacios.FormShow(Sender: TObject);
begin
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios IdUsuario where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);
    


    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Categorias  nombre where IdUsuario=' + QuotedStr(valor) + 'order by IdCategoria desc');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        ComboCategory.Items.Add(M.Consulta.FieldByName('nombre').AsString);
        ComboCategory2.Items.Add(M.Consulta.FieldByName('IdCategoria').AsString);
        M.Consulta.Next;
    End;
end;

procedure TformCreateEspacios.btnCrearClick(Sender: TObject);
var
   txt: String;
   txt1: String;
begin
    EditEspacios.Text:=Trim(EditEspacios.Text);
    If Length (EditEspacios.Text)=0 Then Begin
        Application.MessageBox('Ingresa un nombre para poder seguir','Espacio de Trabajo',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    If Length (EditEspacios.Text)>50 Then Begin
        Application.MessageBox('Ingresa un nombre valido','Espacio de Trabajo',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt1:= 'Nombra tu Espacio de Trabajo';
    If EditEspacios.Text=txt1 Then Begin
        Application.MessageBox('Ingresa un nombre valido','Espacio de Trabajo',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt:= '  Selecciona una categoría';
    If ComboCategory.Text=txt Then Begin
        Application.MessageBox('Ingresa una categoría valida','Espacio de Trabajo',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    {Registrar datos}
    M.Consulta.Sql.Clear;
    M.Consulta.Sql.Add('insert into EspacioTrabajo(IdUsuario, IdCategoria, tituloEspacio)values  ('+
    QuotedStr(valor) + ',' + ComboCategory2.Items[ComboCategory.ItemIndex] + ',' + QuotedStr(EditEspacios.Text) + ')');
    M.Consulta.ExecSQL;

    Application.MessageBox('Espacio de Trabajo creado correctamente','Espacio de Trabajo',Mb_IconInformation + Mb_Ok);
    Close;

    EditEspacios.Clear;
    EditEspacios.Text:='Nombra tu Espacio de Trabajo';
    ComboCategory.Clear;
    ComboCategory.Text:='  Selecciona una categoría';
    ComboCategory2.Clear;

    {VALORES POR INICIAR}
    formInicio.memo.clear;
    formInicio.L_Texto.Visible:=True;
    formInicio.Espacio1.Visible:=True;
    formInicio.Espacio1.Enabled:=True;
    formInicio.Espacio2.Visible:=True;
    formInicio.Espacio2.Enabled:=True;
    formInicio.Espacio3.Visible:=True;
    formInicio.Espacio3.Enabled:=True;
    formInicio.Espacio4.Visible:=True;
    formInicio.Espacio4.Enabled:=True;
    formInicio.bar1.Visible:=True;
    formInicio.bar4.Visible:=True;

    {REINICIAR VALORES}
   //Agregar ultimos 4 espacio creados
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select top 4 tituloEspacio, IdEspacio  from EspacioTrabajo where IdUsuario='
    + QuotedStr(valor) + ' order by IdEspacio desc');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        formInicio.memo.Lines.Add(M.Consulta.FieldByName('tituloEspacio').AsString);
        M.Consulta.Next;
    End;

    //Mostrar espacios
    If formInicio.memo.Lines.Count=0 Then Begin
        formInicio.L_Texto.Visible:=False;
        formInicio.Espacio1.Visible:=False;
        formInicio.Espacio1.Enabled:=False;
        formInicio.Espacio2.Visible:=False;
        formInicio.Espacio2.Enabled:=False;
        formInicio.Espacio3.Visible:=False;
        formInicio.Espacio3.Enabled:=False;
        formInicio.Espacio4.Visible:=False;
        formInicio.Espacio4.Enabled:=False;
        formInicio.bar1.Visible:=False;
        formInicio.bar4.Visible:=False;
    End;
    If formInicio.memo.Lines.Count=1 Then Begin
        formInicio.Espacio2.Visible:=False;
        formInicio.Espacio2.Enabled:=False;
        formInicio.Espacio3.Visible:=False;
        formInicio.Espacio3.Enabled:=False;
        formInicio.Espacio4.Visible:=False;
        formInicio.Espacio4.Enabled:=False;
    End;
    If formInicio.memo.Lines.Count=2 Then Begin
        formInicio.Espacio3.Visible:=False;
        formInicio.Espacio3.Enabled:=False;
        formInicio.Espacio4.Visible:=False;
        formInicio.Espacio4.Enabled:=False;
    End;
    If formInicio.memo.Lines.Count=3 Then Begin
        formInicio.Espacio4.Visible:=False;
        formInicio.Espacio4.Enabled:=False;
    End;
    If formInicio.memo.Lines.Count=4 Then Begin
        formInicio.btnMore.Visible:=True;
    End;


    formInicio.Espacio1.Caption:= '  ' + formInicio.memo.Lines[0];
    formInicio.Espacio2.Caption:= '  ' + formInicio.memo.Lines[1];
    formInicio.Espacio3.Caption:= '  ' + formInicio.memo.Lines[2];
    formInicio.Espacio4.Caption:= '  ' + formInicio.memo.Lines[3];
end;

end.
