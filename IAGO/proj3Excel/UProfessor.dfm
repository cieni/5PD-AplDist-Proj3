object frmProfessor: TfrmProfessor
  Left = 0
  Top = 0
  Caption = 'Professores'
  ClientHeight = 429
  ClientWidth = 437
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
    Left = 11
    Top = 15
    Width = 73
    Height = 31
    Caption = 'C'#243'digo :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 32
    Font.Name = 'Shonar Bangla'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 22
    Top = 71
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
  object edCodigo: TEdit
    Left = 90
    Top = 8
    Width = 97
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    MaxLength = 3
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
  object lbProfessores: TListBox
    Left = 10
    Top = 168
    Width = 415
    Height = 257
    ItemHeight = 13
    TabOrder = 3
  end
end
