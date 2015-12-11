object Form2: TForm2
  Left = 297
  Top = 232
  Width = 397
  Height = 121
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 88
    Top = 27
    Width = 65
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Red'
    Items.Strings = (
      'Red'
      'Blue')
  end
end
