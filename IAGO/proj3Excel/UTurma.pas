unit UTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDataModule,
  Vcl.Samples.Spin;

type
  TNumero = class
  public
    numero: string;
    constructor criar(num: string);

  end;

  TfrmTurma = class(TForm)
    Label1: TLabel;
    edCodigo: TEdit;
    Button1: TButton;
    lbTurmas: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbProfessor: TComboBox;
    cbCurso: TComboBox;
    cbDisciplina: TComboBox;
    Label5: TLabel;
    sePeriodo: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure atualizarLista;
    procedure atualizarComponentes;
    function pegarNomeBD(tabela, codigo: String): String;
  public
    { Public declarations }
  end;

var
  frmTurma: TfrmTurma;

implementation

{$R *.dfm}

procedure TfrmTurma.Button1Click(Sender: TObject);
var
  codigo, periodo, curso, professor, disciplina: String;
begin
  codigo := edCodigo.Text;
  periodo := sePeriodo.Text;
  curso := (cbCurso.Items.Objects[cbCurso.ItemIndex] as TNumero).numero;
  professor := (cbProfessor.Items.Objects[cbProfessor.ItemIndex] as TNumero).numero;
  disciplina := (cbDisciplina.Items.Objects[cbDisciplina.ItemIndex] as TNumero).numero;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('insert into DTurma values(' + quotedStr(codigo) + ',' +
    quotedStr(curso) + ',' + quotedStr(disciplina) + ',' + quotedStr(professor)
    + ',' + quotedStr(periodo) + ')');
  DM.ADOBD.execSQL;
  showMessage('Turma inclu�da com sucesso');
  atualizarLista;
end;

procedure TfrmTurma.FormCreate(Sender: TObject);
begin
  atualizarComponentes;
  atualizarLista;
  cbProfessor.ItemIndex := 0;
  cbCurso.ItemIndex := 0;
  cbDisciplina.ItemIndex := 0;
end;

function TfrmTurma.pegarNomeBD(tabela, codigo: String): String;
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

procedure TfrmTurma.atualizarComponentes;
var
  texto, codigo, nome: String;
begin
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DCurso order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    codigo := DM.ADOBD.FieldByName('codigo').AsString;
    nome := DM.ADOBD.FieldByName('nome').AsString;
    texto := codigo + ' - ' + nome;
    cbCurso.Items.AddObject(texto, TNumero.criar(codigo));
    DM.ADOBD.Next;
  End;

  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DProfessor order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    codigo := DM.ADOBD.FieldByName('codigo').AsString;
    nome := DM.ADOBD.FieldByName('nome').AsString;
    texto := codigo + ' - ' + nome;
    cbProfessor.Items.AddObject(texto, TNumero.criar(codigo));
    DM.ADOBD.Next;
  End;

  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DDisciplina order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    codigo := DM.ADOBD.FieldByName('codigo').AsString;
    nome := DM.ADOBD.FieldByName('nome').AsString;
    texto := codigo + ' - ' + nome;
    cbDisciplina.Items.AddObject(texto, TNumero.criar(codigo));
    DM.ADOBD.Next;
  End;
end;

procedure TfrmTurma.atualizarLista;
var
  turma, periodo, curso, disciplina, professor, tudo: String;
begin
  lbTurmas.Clear;
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
    lbTurmas.Items.Add(tudo);
    DM.ADOBD.Next;
  End;
end;

{ TNumero }

constructor TNumero.criar(num: String);
begin
  numero := num;
end;

end.
