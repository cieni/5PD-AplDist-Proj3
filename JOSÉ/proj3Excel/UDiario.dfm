object frmDiarios: TfrmDiarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Di'#225'rio'
  ClientHeight = 361
  ClientWidth = 433
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
  object lblTurma: TLabel
    Left = 8
    Top = 11
    Width = 34
    Height = 13
    Caption = 'Turma:'
  end
  object lblAluno: TLabel
    Left = 8
    Top = 38
    Width = 31
    Height = 13
    Caption = 'Aluno:'
  end
  object btnIncluir: TButton
    Left = 361
    Top = 35
    Width = 65
    Height = 22
    Caption = 'incluir'
    TabOrder = 0
    OnClick = btnIncluirClick
  end
  object lbDiarios: TListBox
    Left = 8
    Top = 63
    Width = 418
    Height = 290
    ItemHeight = 13
    TabOrder = 1
  end
  object cbTurma: TComboBox
    Left = 48
    Top = 8
    Width = 378
    Height = 21
    TabOrder = 2
  end
  object cbAluno: TComboBox
    Left = 45
    Top = 35
    Width = 310
    Height = 21
    TabOrder = 3
  end
end
