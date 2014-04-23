unit UDiario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDataModule;

type
TNumero = class
  public
    numero: string;
    constructor criar(num: string);

  end;

  TfrmDiario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    lbDiarios: TListBox;
    cbTurma: TComboBox;
    cbAluno: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
    procedure atualizarLista;
    procedure atualizarComponentes;
    function pegarNomeAluno(ra : String) : String;
    function pegarNomeBD(tabela, codigo: String): String;
  public
    { Public declarations }
  end;

var
  frmDiario: TfrmDiario;

implementation

{$R *.dfm}

constructor TNumero.criar(num: String);
begin
  numero := num;
end;

procedure TfrmDiario.FormCreate(Sender: TObject);
begin
 atualizarComponentes;
 atualizarLista;
end;

function TfrmDiario.pegarNomeBD(tabela, codigo: String): String;
begin
  DM.ADOAux.SQL.Clear;
  DM.ADOAux.SQL.Add('Select * from ' + tabela + ' where codigo=' +
    quotedStr(codigo));
  DM.ADOAux.Open;
  while not(DM.ADOAux.Eof) do
  Begin
    result := DM.ADOAux.FieldByName('nome').AsString;
    DM.ADOAux.Next;
  End;

end;

procedure TfrmDiario.atualizarLista;
var
 codTurma, ra : String;
begin
  lbDiarios.Clear;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DDiario order by codigoTurma');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    codTurma := DM.ADOBD.FieldByName('codigoTurma').ToString;
    ra       := DM.ADOBD.FieldByName('ra').ToString;
    lbDiarios.Items.Add('Turma '+codTurma+' - '+pegarNomeAluno(ra));
    DM.ADOBD.Next;
  End;
end;

procedure TfrmDiario.atualizarComponentes;
var
 tudo, curso, periodo, turma, disciplina, professor : String;
begin
  cbTurma.Items.Clear;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DTurma order by codigoTurma');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    tudo := '';
    turma := DM.ADOBD.FieldByName('codigoTurma').AsString;
    periodo := DM.ADOBD.FieldByName('periodo').AsString;
    curso := DM.ADOBD.FieldByName('codigoCurso').AsString;
    curso := pegarNomeBD('DCurso', curso);
    disciplina := DM.ADOBD.FieldByName('codigoDisciplina').AsString;
    disciplina := pegarNomeBD('DDisciplina', disciplina);
    professor := DM.ADOBD.FieldByName('codigoProfessor').AsString;
    professor := pegarNomeBD('DProfessor', professor);

    tudo := 'Turma ' + turma + ' -Curso ' + curso + ' -Disciplina ' + disciplina + ' -Periodo ' + periodo
  + ' -Professor ' + professor;
    cbTurma.Items.Add(tudo);
    DM.ADOBD.Next;
  End;
end;

function TfrmDiario.pegarNomeAluno(ra: string) : String;
begin
   DM.ADOAux.SQL.Clear;
   DM.ADOAux.SQL.Add('select nome from DAluno where ra='+quotedStr(ra));
   DM.ADOAux.Open;
   if not(DM.ADOAux.Eof) then
   Begin
    result := DM.ADOAux.FieldByName('nome').ToString;
   End
   else
    result := '';
end;

end.
