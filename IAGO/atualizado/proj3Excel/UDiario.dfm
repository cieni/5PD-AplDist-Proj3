object frmDiario: TfrmDiario
  Left = 0
  Top = 0
  Caption = 'Di'#225'rio'
  ClientHeight = 473
  ClientWidth = 440
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
    Left = 30
    Top = 34
    Width = 72
    Height = 31
    Caption = 'Turma :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 32
    Font.Name = 'Shonar Bangla'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 41
    Top = 90
    Width = 64
    Height = 31
    Caption = 'Aluno :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 32
    Font.Name = 'Shonar Bangla'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 144
    Top = 160
    Width = 121
    Height = 30
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Shonar Bangla'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object lbDiarios: TListBox
    Left = 8
    Top = 208
    Width = 425
    Height = 257
    ItemHeight = 13
    TabOrder = 1
  end
  object cbTurma: TComboBox
    Left = 128
    Top = 40
    Width = 193
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object cbAluno: TComboBox
    Left = 128
    Top = 92
    Width = 193
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
