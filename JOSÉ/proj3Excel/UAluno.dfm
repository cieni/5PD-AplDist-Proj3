object frmAluno: TfrmAluno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Aluno'
  ClientHeight = 305
  ClientWidth = 481
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
  object lblRA: TLabel
    Left = 8
    Top = 11
    Width = 18
    Height = 13
    Caption = 'RA:'
  end
  object lblNome: TLabel
    Left = 111
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object edRA: TEdit
    Left = 32
    Top = 8
    Width = 73
    Height = 21
    MaxLength = 5
    NumbersOnly = True
    TabOrder = 0
  end
  object edNome: TEdit
    Left = 148
    Top = 8
    Width = 269
    Height = 21
    MaxLength = 30
    TabOrder = 1
  end
  object btnIncluir: TButton
    Left = 423
    Top = 6
    Width = 50
    Height = 25
    Caption = 'incluir'
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object lbAlunos: TListBox
    Left = 8
    Top = 35
    Width = 465
    Height = 262
    ItemHeight = 13
    TabOrder = 3
  end
end
