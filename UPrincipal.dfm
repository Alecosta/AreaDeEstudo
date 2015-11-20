object Form1: TForm1
  Left = 0
  Top = 116
  Width = 686
  Height = 155
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 16
    Width = 332
    Height = 13
    Caption = 
      'estudo de Design Patterns a partir do site https://sourcemaking.' +
      'com/'
  end
  object btnSingleton: TButton
    Left = 24
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Singleton'
    TabOrder = 0
    OnClick = btnSingletonClick
  end
  object btnAdapter: TButton
    Left = 120
    Top = 40
    Width = 75
    Height = 25
    Caption = 'btnAdapter'
    TabOrder = 1
  end
end
