unit UTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDataModule;

type
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
    cbPeriodo: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure atualizarLista;
    procedure atualizarComponentes;
    function  pegarNomeBD(tabela,codigo : String) : String;
  public
    { Public declarations }
  end;

var
  frmTurma: TfrmTurma;

implementation

{$R *.dfm}

procedure TfrmTurma.Button1Click(Sender: TObject);
var
codigo, periodo, curso, professor, disciplina : String;
begin
  codigo     := edCodigo.Text;
  periodo    := cbPeriodo.Text;
  curso      := cbCurso.Items.ValueFromIndex[cbCurso.ItemIndex];
  professor  := cbProfessor.Items.ValueFromIndex[cbProfessor.ItemIndex];
  disciplina := cbDisciplina.Items.ValueFromIndex[cbDisciplina.ItemIndex];
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('insert into DTurma values('+quotedStr(codigo)+','+quotedStr(curso)+','+quotedStr(disciplina)+
                          ','+quotedStr(professor)+','+quotedStr(periodo)+')');
  Dm.ADOBD.execSQL;
  showMessage('Turma incluída com sucesso');
  atualizarLista;
end;

procedure TfrmTurma.FormCreate(Sender: TObject);
begin
atualizarComponentes;
atualizarLista;
cbPeriodo.ItemIndex := 0;
cbProfessor.ItemIndex := 0;
cbCurso.ItemIndex := 0;
cbDisciplina.ItemIndex := 0;
end;



function TfrmTurma.pegarNomeBD(tabela,codigo : String) : String;
begin
  DM.ADOAux.SQL.Clear;
  DM.ADOAux.SQL.Add('Select * from '+tabela+' where codigo='+quotedStr(codigo));
  DM.ADOAux.Open;
  while not(DM.ADOAux.Eof) do
  Begin
     result := DM.ADOAux.FieldByName('codigo').AsString;
  End;
  
end;



procedure TfrmTurma.AtualizarComponentes;
var
 texto, codigo, nome : String;
 indice : Integer;
begin
  indice := 0;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DCurso order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
     codigo := DM.ADOBD.FieldByName('codigo').AsString;
     nome   := DM.ADOBD.FieldByName('nome').AsString;
     texto  := codigo+' - '+nome;
     cbCurso.Items.Add(texto);
     cbCurso.ItemIndex := indice;             //não me chinga zé (pog)
     cbCurso.Items.ValueFromIndex[indice] := codigo;
     inc(indice);
  End;

  indice := 0;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DProfessor order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
     codigo := DM.ADOBD.FieldByName('codigo').AsString;
     nome   := DM.ADOBD.FieldByName('nome').AsString;
     texto  := codigo+' - '+nome;
     cbProfessor.Items.Add(texto);
     cbProfessor.ItemIndex := indice;             //não me chinga zé
     cbProfessor.Items.ValueFromIndex[indice] := codigo;
     inc(indice);
  End;

  indice := 0;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DDisciplina order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
     codigo := DM.ADOBD.FieldByName('codigo').AsString;
     nome   := DM.ADOBD.FieldByName('nome').AsString;
     texto  := codigo+' - '+nome;
     cbDisciplina.Items.Add(texto);
     cbDisciplina.ItemIndex := indice;             //não me chinga zé
     cbDisciplina.Items.ValueFromIndex[indice] := codigo;
     inc(indice);
  End;
end;



procedure TfrmTurma.atualizarLista;
var
turma,periodo,curso,disciplina,professor,tudo : String;
begin
  lbTurmas.Clear;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DTurma order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    tudo := '';
    turma:=DM.ADOBD.FieldByName('codigoTurma').AsString;
    periodo := DM.ADOBD.FieldByName('periodo').AsString;
    curso:=DM.ADOBD.FieldByName('codigoCurso').AsString;
    curso := pegarNomeBD('DCurso',curso);
    disciplina:=DM.ADOBD.FieldByName('codigoDisciplina').AsString;
    disciplina := pegarNomeBD('DDisciplina',disciplina);
    professor:=DM.ADOBD.FieldByName('codigoProfessor').AsString;
    professor := pegarNomeBD('DProfessor',professor);

    tudo := turma+' - '+curso+' - '+disciplina+' - '+periodo+' - '+professor;
    lbTurmas.Items.Add(tudo);
    DM.ADOBD.Next;
  End;
end;

end.
