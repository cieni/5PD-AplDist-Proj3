object frmProfessor: TfrmProfessor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Professores'
  ClientHeight = 297
  ClientWidth = 465
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
  object lblNome: TLabel
    Left = 8
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object edNome: TEdit
    Left = 45
    Top = 8
    Width = 345
    Height = 21
    MaxLength = 30
    TabOrder = 0
  end
  object btnIncluir: TButton
    Left = 396
    Top = 6
    Width = 61
    Height = 25
    Caption = 'incluir'
    TabOrder = 1
    OnClick = btnIncluirClick
  end
  object lbProfessores: TListBox
    Left = 8
    Top = 35
    Width = 449
    Height = 254
    ItemHeight = 13
    TabOrder = 2
  end
end
