object frmCurso: TfrmCurso
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Curso'
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
  object lblCodigo: TLabel
    Left = 8
    Top = 11
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblNome: TLabel
    Left = 127
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object edCodigo: TEdit
    Left = 51
    Top = 8
    Width = 70
    Height = 21
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 0
  end
  object edNome: TEdit
    Left = 164
    Top = 8
    Width = 226
    Height = 21
    MaxLength = 30
    TabOrder = 1
  end
  object btnIncluir: TButton
    Left = 396
    Top = 6
    Width = 61
    Height = 25
    Caption = 'incluir'
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object lbCursos: TListBox
    Left = 8
    Top = 35
    Width = 449
    Height = 254
    ItemHeight = 13
    TabOrder = 3
  end
end
