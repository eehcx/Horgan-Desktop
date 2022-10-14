unit createTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzEdit, Mask, ExtCtrls;

type
  TformCreateTask = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnAdd: TPanel;
    EditTarea: TRzEdit;
    ComboCategories: TComboBox;
    ComboCategories2: TComboBox;
    PContainer2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DateFinal: TRzDateTimeEdit;
    DateInicio: TRzDateTimeEdit;
    memoDescripcion: TRzMemo;
    btnAgregar: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCreateTask: TformCreateTask;
        valor: String;

implementation

uses datos, login, workspace;

{$R *.dfm}

procedure TformCreateTask.FormShow(Sender: TObject);
begin
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Usuarios IdUsuario where nickName=' + QuotedStr(formLogin.EditUser.Text));
    M.Consulta.Open;
    valor:= (M.Consulta.FieldByName('IdUsuario').AsString);
    


    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Categorias  nombre where IdUsuario=' + QuotedStr(valor) + 'order by IdCategoria desc');
    M.Consulta.Open;

    While not M.Consulta.Eof do begin
        ComboCategories.Items.Add(M.Consulta.FieldByName('nombre').AsString);
        ComboCategories2.Items.Add(M.Consulta.FieldByName('IdCategoria').AsString);
        M.Consulta.Next;
    End;
    ComboCategories.ItemIndex:=0;
end;

procedure TformCreateTask.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DateInicio.Clear;
    DateFinal.Clear;
    Edit1.Clear;
    Edit2.Clear;
    memoDescripcion.Clear;
end;

procedure TformCreateTask.btnAddClick(Sender: TObject);
var
   txt: String;
begin
    EditTarea.Text:=Trim(EditTarea.Text);
    If Length (EditTarea.Text)=0 Then Begin
        Application.MessageBox('Ingresa un nombre de Tarea para seguir','Tareas',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    txt:= 'Nombra tu Tarea';
    If EditTarea.Text=txt Then Begin
        Application.MessageBox('Ingresa un nombre valido','Tareas',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    PContainer2.Visible:=True;
end;

procedure TformCreateTask.btnAgregarClick(Sender: TObject);
var
   anho1,anho2,mes1,mes2,dia1,dia2: word;
   Present1,Present2: TDateTime;
begin
    DateInicio.Text:=Trim(DateInicio.Text);
    If Length (DateInicio.Text)=0 Then Begin
        Application.MessageBox('Ingresa una fecha de Inicio','Tareas',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    DateFinal.Text:=Trim(DateFinal.Text);
    If Length (DateFinal.Text)=0 Then Begin
        Application.MessageBox('Ingresa una fecha Final','Tareas',Mb_IconWarning + Mb_Ok);
        Exit;
    End;
    {Fecha Inicio}
    Present1:=DateInicio.Date;
    DecodeDate( Present1, anho1, mes1, dia1 );
    Edit1.Text:=IntToStr(anho1)+'-'+IntToStr(mes1)+'-'+IntToStr(dia1);
    {Fecha Final}
    Present2:=DateFinal.Date;
    DecodeDate( Present2, anho2, mes2, dia2 );
    Edit2.Text:=IntToStr(anho2)+'-'+IntToStr(mes2)+'-'+IntToStr(dia2);

    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('insert into Tareas (IdCategoria, IdEspacio, nombreTarea, fechaInicio, fechaFin, descripcion, estado) values'
                       +' (' + ComboCategories2.Items[ComboCategories.ItemIndex] + ','
                       + formEspacios.ComboEspacio2.Items[formEspacios.ComboEspacios.ItemIndex] + ','
                       + QuotedStr(EditTarea.Text) + ',' + QuotedStr(Edit1.Text) +','
                       + QuotedStr(Edit2.Text) + ',' + QuotedStr(memoDescripcion.Text) + ',1)');
    M.Consulta.ExecSQL;
    Application.MessageBox('Tarea creada correctamente','Tareas',Mb_IconInformation + Mb_Ok);
    Close;
end;

end.
