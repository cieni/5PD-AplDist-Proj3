object frmAluno: TfrmAluno
  Left = 0
  Top = 0
  Caption = 'Aluno'
  ClientHeight = 429
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 40
    Height = 31
    Caption = 'RA :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 32
    Font.Name = 'Shonar Bangla'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 64
    Width = 62
    Height = 31
    Caption = 'Nome :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 32
    Font.Name = 'Shonar Bangla'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edRA: TEdit
    Left = 90
    Top = 16
    Width = 97
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    MaxLength = 5
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
  end
  object edNome: TEdit
    Left = 90
    Top = 72
    Width = 271
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 136
    Top = 120
    Width = 121
    Height = 30
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object lbAlunos: TListBox
    Left = 10
    Top = 168
    Width = 415
    Height = 257
    ItemHeight = 13
    TabOrder = 3
  end
end
