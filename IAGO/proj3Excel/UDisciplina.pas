unit UDisciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDataModule;

type
  TfrmDisciplina = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    Button1: TButton;
    lbDisciplinas: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure atualizarLista;
  public
    { Public declarations }
  end;

var
  frmDisciplina: TfrmDisciplina;

implementation

{$R *.dfm}

procedure TfrmDisciplina.atualizarLista;
var
  codigo, nome: String;
begin
  lbDisciplinas.Clear;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DDisciplina order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    codigo := DM.ADOBD.FieldByName('codigo').AsString;
    nome := DM.ADOBD.FieldByName('nome').AsString;
    lbDisciplinas.Items.Add(codigo + ' - ' + nome);
    DM.ADOBD.Next;
  End;
end;

procedure TfrmDisciplina.Button1Click(Sender: TObject);
begin
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('insert into DDisciplina values(' + quotedStr(edCodigo.Text)
    + ',' + quotedStr(edNome.Text) + ')');
  DM.ADOBD.execSQL;
  showMessage('Disciplina inclu�da com sucesso');
  atualizarLista;
end;

procedure TfrmDisciplina.FormCreate(Sender: TObject);
begin
  atualizarLista;
end;

end.
