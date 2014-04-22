object frmTurma: TfrmTurma
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Turmas'
  ClientHeight = 329
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCurso: TLabel
    Left = 8
    Top = 11
    Width = 32
    Height = 13
    Caption = 'Curso:'
  end
  object lblDisciplina: TLabel
    Left = 247
    Top = 11
    Width = 47
    Height = 13
    Caption = 'Disciplina:'
  end
  object lblProfessor: TLabel
    Left = 101
    Top = 38
    Width = 50
    Height = 13
    Caption = 'Professor:'
  end
  object lblPeriodo: TLabel
    Left = 8
    Top = 38
    Width = 40
    Height = 13
    Caption = 'Per'#237'odo:'
  end
  object btnIncluir: TButton
    Left = 428
    Top = 33
    Width = 61
    Height = 25
    Caption = 'incluir'
    TabOrder = 4
    OnClick = btnIncluirClick
  end
  object lbTurmas: TListBox
    Left = 8
    Top = 64
    Width = 481
    Height = 257
    ItemHeight = 13
    TabOrder = 5
  end
  object cbProfessor: TComboBox
    Left = 157
    Top = 35
    Width = 265
    Height = 21
    TabOrder = 3
  end
  object cbCurso: TComboBox
    Left = 46
    Top = 8
    Width = 195
    Height = 21
    TabOrder = 0
  end
  object cbDisciplina: TComboBox
    Left = 300
    Top = 8
    Width = 189
    Height = 21
    TabOrder = 1
  end
  object sePeriodo: TSpinEdit
    Left = 54
    Top = 35
    Width = 41
    Height = 22
    MaxValue = 40
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
end
