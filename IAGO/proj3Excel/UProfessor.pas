unit UProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDataModule;

type
  TfrmProfessor = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    Button1: TButton;
    lbProfessores: TListBox;
    procedure Button1Click(Sender: TObject);
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

procedure TfrmProfessor.Button1Click(Sender: TObject);
begin
  DM.ADOBD.SQL.Clear;
  DM.ADOBD.SQL.Add('insert into DProfessor values('+quotedStr(edCodigo.Text)+','+quotedStr(edNome.Text)+')');
  Dm.ADOBD.execSQL;
  showMessage('Professor inclu�do com sucesso');
  atualizarLista;
end;

procedure TfrmProfessor.FormCreate(Sender: TObject);
begin
atualizarLista;
end;

end.
