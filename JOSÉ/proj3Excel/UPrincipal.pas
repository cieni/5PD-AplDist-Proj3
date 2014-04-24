unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UAluno, UCurso, UDisciplina, UProfessor,
  UTurma, Vcl.Menus, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, ComObj, UDataModule;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Dirio1: TMenuItem;
    Sair1: TMenuItem;
    Aluno1: TMenuItem;
    Curso1: TMenuItem;
    Dirio2: TMenuItem;
    Disciplina1: TMenuItem;
    Professor1: TMenuItem;
    urma1: TMenuItem;
    procedure Aluno1Click(Sender: TObject);
    procedure Curso1Click(Sender: TObject);
    procedure Disciplina1Click(Sender: TObject);
    procedure Professor1Click(Sender: TObject);
    procedure urma1Click(Sender: TObject);
    procedure Dirio1Click(Sender: TObject);
    procedure Dirio2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UDiario, USelecionaTurma;

procedure TfrmPrincipal.Aluno1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAluno, frmAluno);
  frmAluno.Show;
end;

procedure TfrmPrincipal.Curso1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCurso, frmCurso);
  frmCurso.Show;
end;

function pegarNomeBD(tabela, codigo: String): String;
begin
  DM.ADOAux.SQL.Clear;
  DM.ADOAux.SQL.Add('SELECT * FROM ' + tabela + ' WHERE codigo=' + quotedStr(codigo));
  DM.ADOAux.Open;
  while not(DM.ADOAux.Eof) do
  Begin
    result := DM.ADOAux.FieldByName('nome').AsString;
    DM.ADOAux.Next;
  End;
  DM.ADOAux.Close;

end;

procedure TfrmPrincipal.Dirio1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSelecionaTurma, frmSelecionaTurma);
  frmSelecionaTurma.Show;
end;

procedure TfrmPrincipal.Dirio2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDiarios, frmDiarios);
  frmDiarios.Show;
end;

procedure TfrmPrincipal.Disciplina1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDisciplina, frmDisciplina);
  frmDisciplina.Show;
end;

procedure TfrmPrincipal.Professor1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmProfessor, frmProfessor);
  frmProfessor.Show;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.urma1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmTurma, frmTurma);
  frmTurma.Show;
end;

end.
