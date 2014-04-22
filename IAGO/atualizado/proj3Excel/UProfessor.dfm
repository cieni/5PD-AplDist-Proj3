object frmProfessor: TfrmProfessor
  Left = 0
  Top = 0
  Caption = 'Professores'
  ClientHeight = 413
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
  object Label2: TLabel
    Left = 22
    Top = 31
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
  object edNome: TEdit
    Left = 90
    Top = 32
    Width = 271
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 136
    Top = 80
    Width = 121
    Height = 30
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object lbProfessores: TListBox
    Left = 8
    Top = 116
    Width = 425
    Height = 293
    ItemHeight = 13
    TabOrder = 2
  end
end
