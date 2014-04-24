unit USelecionaTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ComObj,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TStr = class
  public
    str: String;
    constructor criar(s: String);
  end;

  TfrmSelecionaTurma = class(TForm)
    lblProfessor: TLabel;
    lblCurso: TLabel;
    lblTurma: TLabel;
    cbCurso: TComboBox;
    cbProfessor: TComboBox;
    lsbTurma: TListBox;
    btnGerar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure cbProfessorChange(Sender: TObject);
  private
    procedure popularProfessores;
    procedure popularTurmas;
    procedure popularCursos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaTurma: TfrmSelecionaTurma;

implementation

{$R *.dfm}

uses UDataModule;

procedure TfrmSelecionaTurma.popularProfessores;
begin
  cbProfessor.Items.Clear;

  with DM.ADOBD do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM DProfessor ORDER BY nome');
    Open;

    while not Eof do
    begin
      cbProfessor.Items.AddObject(FieldByName('nome').AsString,
        TStr.criar(FieldByName('codigo').AsString));
      Next;
    end;
    Close;
  end;
end;

function pegarNomeAluno(ra: string): String;
begin
  DM.ADOAux.SQL.Clear;
  DM.ADOAux.SQL.Add('select nome from DAluno where ra=' + quotedStr(ra));
  DM.ADOAux.Open;
  if not(DM.ADOAux.Eof) then
  Begin
    result := DM.ADOAux.FieldByName('nome').AsString;
  End
  else
    result := '';
end;

function pegarNomeBD(tabela, codigo: String): String;
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
  DM.ADOAux.Close;

end;

procedure TfrmSelecionaTurma.popularCursos;
begin
  cbCurso.Items.Clear;

  with DM.ADOBD do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM DCurso ORDER BY nome');
    Open;

    while not Eof do
    begin
      cbCurso.Items.AddObject(FieldByName('codigo').AsString + ' ' +
        FieldByName('nome').AsString,
        TStr.criar(FieldByName('codigo').AsString));
      Next;
    end;
    Close;
  end;

end;

procedure TfrmSelecionaTurma.popularTurmas;
begin
  lsbTurma.Items.Clear;

  if (cbCurso.ItemIndex >= 0) and (cbProfessor.ItemIndex >= 0) then
  begin
    with DM.ADOAux do
    begin
      SQL.Clear;
      SQL.Add('SELECT t.codigoTurma cod, periodo, d.nome disciplina FROM DTurma t INNER JOIN DDisciplina d ON t.codigoDisciplina = d.codigo WHERE codigoProfessor = '
        + quotedStr((cbProfessor.Items.Objects[cbProfessor.ItemIndex] as TStr)
        .str) + ' AND codigoCurso = ' +
        quotedStr((cbCurso.Items.Objects[cbCurso.ItemIndex] as TStr).str) +
        ' ORDER BY periodo, disciplina');
      Open;

      while not Eof do
      begin
        lsbTurma.Items.AddObject(FieldByName('periodo').AsString +
          'º Período - ' + FieldByName('disciplina').AsString,
          TStr.criar(FieldByName('cod').AsString));
        Next;
      end;
      Close;
    end;
  end;

end;

procedure TfrmSelecionaTurma.btnGerarClick(Sender: TObject);
var
  vData, vExcel: Variant;
  I: Integer;
begin
  if lsbTurma.ItemIndex >= 0 then
  begin
    vExcel := CreateOLEObject('Excel.Application');
    vExcel.WorkBooks.Add;
    vExcel.Visible := True;

    // células congeladas
    vExcel.Range['C8'].Activate;
    vExcel.Application.ActiveWindow.FreezePanes := True;

    // células giradas
    vExcel.Range['C5:AX5'].Font.Size := 9;
    vExcel.Range['C5:AX7'].Orientation := 90;
    vExcel.Range['C5:AX7'].HorizontalAlignment := 3;

    // largura das colunas
    vExcel.Columns['A'].ColumnWidth := 5.86;
    vExcel.Columns['AY'].ColumnWidth := 5.86;
    vExcel.Columns['B'].ColumnWidth := 46.29;
    vExcel.Columns['C:AX'].ColumnWidth := 1.57;
    vExcel.Columns['AZ:BC'].ColumnWidth := 3.57;
    vExcel.Columns['BD:BD'].ColumnWidth := 4.71;
    vExcel.Columns['BE:BE'].ColumnWidth := 4.14;

    // borda
    vExcel.Range['C6:BE7'].Borders.LineStyle := -4118;
    vExcel.Range['C6:BE7'].Borders.ColorIndex := 0;

    // altura das linhas
    vExcel.Rows['1:5'].RowHeight := 12.75;
    vExcel.Rows['6'].RowHeight := 11.25;
    vExcel.Rows['7'].RowHeight := 9.75;

    // textos estáticos
    vData := vExcel.Range['K1'];
    vData.Font.Bold := True;
    vData.Value := 'Colégio Técnico de Campinas';

    vData := vExcel.Range['B5'];
    vData.Font.Bold := True;
    vData.Value := 'Aulas Previstas: ';

    vData := vExcel.Range['B6'];
    vData.Font.Bold := True;
    vData.Value := 'Aulas Dadas: ';

    vData := vExcel.Range['J3'];
    vData.Font.Bold := True;
    vData.Value := 'Curríc:';

    vData := vExcel.Range['AA4'];
    vData.Font.Bold := True;
    vData.Value := 'Professor:';

    vData := vExcel.Range['AM3'];
    vData.Font.Bold := True;
    vData.Value := 'Per:';

    vData := vExcel.Range['A4:BE4'];
    //vData.Borders.LineStyle := 1;   // borda contínua
    vData.Borders[8].LineStyle := 1;    // borda todas: sem cor
    vData.Borders[8].ColorIndex := 0;    // borda todas: sem cor
    vData.Borders[9].LineStyle := 1;    // borda todas: sem cor
    vData.Borders[9].ColorIndex := 0;    // borda todas: sem cor
    //vData.Borders[8].ColorIndex := 0;   // borda topo       \__ preto
    //vData.Borders[9].ColorIndex := 0;   // borda baixo      /

    // mesclagem de células
    vExcel.Range['AP3:AY3'].MergeCells := True;

    vExcel.Range['N3:Q3'].MergeCells := True;
    vExcel.Range['N3:Q3'].Cells.HorizontalAlignment := 3;
    vExcel.Range['N3'].Value := '2014';

    vExcel.Range['C6', 'C7'].MergeCells := True;
    vExcel.Range['D6', 'D7'].MergeCells := True;
    vExcel.Range['E6', 'E7'].MergeCells := True;
    vExcel.Range['F6', 'F7'].MergeCells := True;
    vExcel.Range['G6', 'G7'].MergeCells := True;
    vExcel.Range['H6', 'H7'].MergeCells := True;
    vExcel.Range['I6', 'I7'].MergeCells := True;
    vExcel.Range['J6', 'J7'].MergeCells := True;
    vExcel.Range['K6', 'K7'].MergeCells := True;
    vExcel.Range['L6', 'L7'].MergeCells := True;
    vExcel.Range['M6', 'M7'].MergeCells := True;
    vExcel.Range['N6', 'N7'].MergeCells := True;
    vExcel.Range['O6', 'O7'].MergeCells := True;
    vExcel.Range['P6', 'P7'].MergeCells := True;
    vExcel.Range['Q6', 'Q7'].MergeCells := True;
    vExcel.Range['R6', 'R7'].MergeCells := True;
    vExcel.Range['S6', 'S7'].MergeCells := True;
    vExcel.Range['T6', 'T7'].MergeCells := True;
    vExcel.Range['U6', 'U7'].MergeCells := True;
    vExcel.Range['V6', 'V7'].MergeCells := True;
    vExcel.Range['W6', 'W7'].MergeCells := True;
    vExcel.Range['X6', 'X7'].MergeCells := True;
    vExcel.Range['Y6', 'Y7'].MergeCells := True;
    vExcel.Range['Z6', 'Z7'].MergeCells := True;
    vExcel.Range['AA6', 'AA7'].MergeCells := True;
    vExcel.Range['AB6', 'AB7'].MergeCells := True;
    vExcel.Range['AC6', 'AC7'].MergeCells := True;
    vExcel.Range['AD6', 'AD7'].MergeCells := True;
    vExcel.Range['AE6', 'AE7'].MergeCells := True;
    vExcel.Range['AF6', 'AF7'].MergeCells := True;
    vExcel.Range['AG6', 'AG7'].MergeCells := True;
    vExcel.Range['AH6', 'AH7'].MergeCells := True;
    vExcel.Range['AI6', 'AI7'].MergeCells := True;
    vExcel.Range['AJ6', 'AJ7'].MergeCells := True;
    vExcel.Range['AK6', 'AK7'].MergeCells := True;
    vExcel.Range['AL6', 'AL7'].MergeCells := True;
    vExcel.Range['AM6', 'AM7'].MergeCells := True;
    vExcel.Range['AN6', 'AN7'].MergeCells := True;
    vExcel.Range['AO6', 'AO7'].MergeCells := True;
    vExcel.Range['AP6', 'AP7'].MergeCells := True;
    vExcel.Range['AQ6', 'AQ7'].MergeCells := True;
    vExcel.Range['AR6', 'AR7'].MergeCells := True;
    vExcel.Range['AS6', 'AS7'].MergeCells := True;
    vExcel.Range['AT6', 'AT7'].MergeCells := True;
    vExcel.Range['AU6', 'AU7'].MergeCells := True;
    vExcel.Range['AV6', 'AV7'].MergeCells := True;
    vExcel.Range['AW6', 'AW7'].MergeCells := True;
    vExcel.Range['AX6', 'AX7'].MergeCells := True;
    vExcel.Range['AY6', 'AY7'].MergeCells := True;
    vExcel.Range['AZ6', 'AZ7'].MergeCells := True;
    vExcel.Range['BA6', 'BA7'].MergeCells := True;
    vExcel.Range['BB6', 'BB7'].MergeCells := True;
    vExcel.Range['BC6', 'BC7'].MergeCells := True;
    vExcel.Range['BD6', 'BD7'].MergeCells := True;
    vExcel.Range['BE6', 'BE7'].MergeCells := True;

    vExcel.Range['AZ5:BC5'].MergeCells := True;
    vData := vExcel.Range['AZ5'];
    vData.Value := 'Avaliações';
    vData.Font.Bold := True;
    vData.Cells.HorizontalAlignment := 3;

    vData := vExcel.Range['AY6'];
    vData.Value := 'RA';
    vData.Font.Bold := True;
    vData.Cells.HorizontalAlignment := 3;
    vData.Cells.VerticalAlignment := 1;
    vData.Font.Size := 12;

    vData := vExcel.Range['BD6'];
    vData.Value := 'Média';
    vData.Cells.HorizontalAlignment := 3;
    vData.Cells.VerticalAlignment := 2;
    vData.Font.Size := 8;

    vData := vExcel.Range['BE6'];
    vData.Value := 'Freq Parc';
    vData.Cells.HorizontalAlignment := 3;
    vData.Cells.VerticalAlignment := 2;
    vData.WrapText := True;
    vData.Font.Size := 8;

    for I := 1 to 48 do
    begin
      vExcel.Cells[5, I + 2].Value := I; // linha, coluna
    end;

    with DM.ADOBD do
    begin
      SQL.Clear;
      SQL.Add('SELECT codigoCurso, codigoProfessor, codigoDisciplina disc, periodo FROM DTurma WHERE codigoTurma = '
        + quotedStr((lsbTurma.Items.Objects[lsbTurma.ItemIndex] as TStr)
        .str) + ' ');
      Open;

      while not Eof do
      begin
        vExcel.Range['B3'].Value := FieldByName('codigoCurso').AsString + ' - '
          + pegarNomeBD('DCurso', FieldByName('codigoCurso').AsString);

        vExcel.Range['B4'].Font.Bold := True;
        vExcel.Range['B4'].Value := FieldByName('disc').AsString + ' - ' +
          pegarNomeBD('DDisciplina', FieldByName('disc').AsString);

        vExcel.Range['AP3'].NumberFormat := '@';
        vExcel.Range['AP3'].Font.Bold := True;
        vExcel.Range['AP3'].Value := FieldByName('periodo').AsString +
          ' / 2014';

        vExcel.Range['AG4'].Value := pegarNomeBD('DProfessor',
          FieldByName('codigoProfessor').AsString);

        Next;
      end;
      Close;

      SQL.Clear;
      SQL.Add('SELECT * FROM DDiario WHERE codigoTurma=' + (lsbTurma.Items.Objects[lsbTurma.ItemIndex] as TStr).str + ' ORDER BY RA');
      Open;

      I := 8;
      while not Eof do
      begin
        vExcel.Cells[I, 1].Value := FieldByName('RA').AsString;
        vExcel.Cells[I, 2].Value := pegarNomeAluno(FieldByName('RA').AsString);
        vExcel.Cells[I, 51].Value := FieldByName('RA').AsString;
        vExcel.Rows[I].RowHeight := 11.25;

        //vExcel.Range['BE' + IntToStr(I)].Formula := '=countif(C' + IntToStr(I) + ', AX' + IntToStr(I) + ';".")';

        if I mod 2 = 0 then
          vExcel.Range['A' + IntToStr(I), 'BE' + IntToStr(I)
            ].Interior.ColorIndex := 24;

        Inc(I);

        Next;
      end;

      I := I - 1;

      vData := vExcel.Range['A8', 'BE' + IntToStr(I)];
      vData.Font.Size := 10;
      vData.VerticalAlignment := 2;
      vData.Borders.LineStyle := -4118;
      vData.Borders.ColorIndex := 0;
    end;

    { for I := 1 to 30 do
      vExcel.Cells[I, 1].Interior.ColorIndex:=I; }

    { vData := varArrayOf(['cotuca', 'terça-feira', 'Até Breve', 'Soma']);
      vExcel.Range['A2:D2'].value := vData;
      vExcel.Range['D2'].Font.Color := clRed;

      vData := varArrayOf(['10', '20', '30', '=sum(A3:C3)']);
      vExcel.Range['A3:d3'].value := vData; }

    vExcel.Quit;
  end
  else
    ShowMessage('Selecione uma turma para prosseguir!');
end;

procedure TfrmSelecionaTurma.cbProfessorChange(Sender: TObject);
begin
  popularTurmas;
end;

procedure TfrmSelecionaTurma.FormCreate(Sender: TObject);
begin
  popularProfessores;
  popularCursos;
  popularTurmas;
end;

{ TStr }

constructor TStr.criar(s: String);
begin
  str := s;
end;

end.
