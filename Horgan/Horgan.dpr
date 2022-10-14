program Horgan;

uses
  Forms,
  login in 'login.pas' {formLogin},
  datos in 'datos.pas' {M: TDataModule},
  inicio in 'inicio.pas' {formInicio},
  registro in 'registro.pas' {formRegistro},
  mantenedor in 'mantenedor.pas' {formMantenedor},
  createEspacios in 'createEspacios.pas' {formCreateEspacios},
  workspace in 'workspace.pas' {formEspacios},
  books in 'books.pas' {formLibros},
  createLibro in 'createLibro.pas' {formCreateBook},
  createTareas in 'createTareas.pas' {formCreateTask},
  createPaginas in 'createPaginas.pas' {formCreatePages},
  categories in 'categories.pas' {formCategorias},
  task in 'task.pas' {formTareas},
  visualizacionGraficas in 'visualizacionGraficas.pas' {formGraficos},
  administration in 'D:\peyo-\ARCHIVOS BASE\Documents\Horgan\administration.pas' {formAdministrador};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TM, M);
  Application.CreateForm(TformInicio, formInicio);
  Application.CreateForm(TformRegistro, formRegistro);
  Application.CreateForm(TformMantenedor, formMantenedor);
  Application.CreateForm(TformCreateEspacios, formCreateEspacios);
  Application.CreateForm(TformEspacios, formEspacios);
  Application.CreateForm(TformLibros, formLibros);
  Application.CreateForm(TformCreateBook, formCreateBook);
  Application.CreateForm(TformCreateTask, formCreateTask);
  Application.CreateForm(TformCreatePages, formCreatePages);
  Application.CreateForm(TformCategorias, formCategorias);
  Application.CreateForm(TformTareas, formTareas);
  Application.CreateForm(TformGraficos, formGraficos);
  Application.CreateForm(TformAdministrador, formAdministrador);
  Application.Run;
end.
