unit task;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, GraphicEx, StdCtrls;

type
  TformTareas = class(TForm)
    Image1: TImage;
    PContainerTask: TPanel;
    Label2: TLabel;
    ListBox1: TListBox;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    lblInicio: TLabel;
    lblFinal: TLabel;
    lblCategorias: TLabel;
    Memo1: TMemo;
    ComboTareas: TComboBox;
    Panel6: TPanel;
    lblFechaCreacion: TLabel;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Panel7: TPanel;
    ComboTareas2: TComboBox;
    procedure ComboTareasKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTareas: TformTareas;

implementation

uses createTareas, datos, workspace;

{$R *.dfm}

procedure TformTareas.ComboTareasKeyPress(Sender: TObject; var Key: Char);
begin
 Key:=#0;
end;

procedure TformTareas.FormShow(Sender: TObject);
begin
    M.Consulta.SQL.Clear;
    M.Consulta.SQL.Add('select * from Tareas nombreTarea where IdEspacio='
                        +formEspacios.ComboEspacio2.Items[formEspacios.ComboEspacios.ItemIndex]
                        +'order by IdTarea desc');
    M.Consulta.Open;
    While not M.Consulta.Eof do begin
        ComboTareas.Items.Add(M.Consulta.FieldByName('nombreTarea').AsString);
        ComboTareas2.Items.Add(M.Consulta.FieldByName('IdTarea').AsString);
        M.Consulta.Next;
    End;


    If ComboTareas.Items.Count=0 Then Begin
        formCreateTask.ShowModal;
            M.Consulta.SQL.Clear;
            M.Consulta.SQL.Add('select * from Tareas nombreTarea where IdEspacio='
            + formEspacios.ComboEspacio2.Items[formEspacios.ComboEspacios.ItemIndex]
            + 'order by IdTarea desc');
            M.Consulta.Open;

            While not M.Consulta.Eof do begin
                ComboTareas.Items.Add(M.Consulta.FieldByName('nombreTarea').AsString);
                ComboTareas2.Items.Add(M.Consulta.FieldByName('IdTarea').AsString);
                M.Consulta.Next;
            End;
    End;
end;

procedure TformTareas.Panel5Click(Sender: TObject);
begin
    formCreateTask.ShowModal;
    formCreateTask.Position:=poDesktopCenter;
end;

end.
