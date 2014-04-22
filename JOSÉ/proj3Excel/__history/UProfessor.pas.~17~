unit UProfessor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDataModule;

type
  TfrmProfessor = class(TForm)
    lblNome: TLabel;
    edNome: TEdit;
    btnIncluir: TButton;
    lbProfessores: TListBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure atualizarLista;
  public
    { Public declarations }
  end;

var
  frmProfessor: TfrmProfessor;

implementation

{$R *.dfm}

procedure TfrmProfessor.atualizarLista;
var
codigo, nome : String;
begin
  lbProfessores.Clear;
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('Select * from DProfessor order by codigo');
  DM.ADOBD.Open;
  While not(DM.ADOBD.Eof) do
  Begin
    codigo:=DM.ADOBD.FieldByName('codigo').AsString;
    nome:=DM.ADOBD.FieldByName('nome').AsString;
    lbProfessores.Items.Add(codigo+' - '+nome);
    DM.ADOBD.Next;
  End;
end;

procedure TfrmProfessor.btnIncluirClick(Sender: TObject);
begin
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('insert into DProfessor values('+quotedStr(edNome.Text)+')');
  Dm.ADOBD.execSQL;
  showMessage('Professor incluído com sucesso');
  atualizarLista;
end;

procedure TfrmProfessor.FormCreate(Sender: TObject);
begin
atualizarLista;
end;

end.
