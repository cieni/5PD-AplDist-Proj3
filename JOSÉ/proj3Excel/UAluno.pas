unit UAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDataModule;

type
  TfrmAluno = class(TForm)
    lblRA: TLabel;
    lblNome: TLabel;
    edRA: TEdit;
    edNome: TEdit;
    btnIncluir: TButton;
    lbAlunos: TListBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
        procedure atualizarLista;
  public
    { Public declarations }
  end;

var
  frmAluno: TfrmAluno;

implementation

{$R *.dfm}

procedure TfrmAluno.AtualizarLista();
var
nome, ra : String;
begin
  lbAlunos.Clear;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DAluno order by RA');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    ra:=DM.ADOBD.FieldByName('RA').AsString;
    nome:=DM.ADOBD.FieldByName('nome').AsString;
    lbAlunos.Items.Add(ra+' - '+nome);
    DM.ADOBD.Next;
  End;
end;

procedure TfrmAluno.btnIncluirClick(Sender: TObject);
begin
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('select * from DAluno where ra='+quotedStr(edRa.text));
  Dm.ADOBD.Open;
  if not(DM.ADOBD.Eof) then
    showMessage('Aluno com tal RA já existe')
  else
  begin
    DM.ADOBD.SQL.Clear;
    DM.ADOBD.SQL.Add('insert into DAluno values('+quotedStr(edRa.Text)+','+quotedStr(edNome.Text)+')');
    Dm.ADOBD.execSQL;
    showMessage('Aluno incluído com sucesso');
    atualizarLista;
  end;
end;

procedure TfrmAluno.FormCreate(Sender: TObject);
begin
atualizarLista;
end;

end.
