program PPrincipal;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UDataModule in 'UDataModule.pas' {DM: TDataModule},
  UCurso in 'UCurso.pas' {frmCurso},
  UDisciplina in 'UDisciplina.pas' {frmDisciplina},
  UProfessor in 'UProfessor.pas' {frmProfessor},
  UTurma in 'UTurma.pas' {frmTurma},
  USelecionaTurma in 'USelecionaTurma.pas' {frmSelecionaTurma},
  UDiario in 'UDiario.pas' {frmDiario},
  UAluno in 'UAluno.pas' {frmAluno};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cobalt XEMedia');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAluno, frmAluno);
  Application.Run;
end.
