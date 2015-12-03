object Form1: TForm1
  Left = 0
  Top = 116
  Width = 529
  Height = 452
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
  object lblCustomer: TLabel
    Left = 120
    Top = 125
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label1: TLabel
    Left = 120
    Top = 149
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 120
    Top = 173
    Width = 59
    Height = 13
    Caption = 'Ultimo Nome'
  end
  object Label3: TLabel
    Left = 120
    Top = 197
    Width = 44
    Height = 13
    Caption = 'Cadastro'
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
    Caption = 'Adapter'
    TabOrder = 1
    OnClick = btnAdapterClick
  end
  object edtCustomerID: TEdit
    Left = 184
    Top = 121
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object edtFirstName: TEdit
    Left = 184
    Top = 145
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtLastName: TEdit
    Left = 184
    Top = 169
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edtDOB: TEdit
    Left = 184
    Top = 193
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 120
    Top = 72
    Width = 225
    Height = 21
    DragMode = dmAutomatic
    Enabled = False
    ReadOnly = True
    TabOrder = 6
    Text = 'Last OldCustomer At Year 2000 ---> 15722'
  end
  object Edit2: TEdit
    Left = 120
    Top = 91
    Width = 225
    Height = 21
    DragMode = dmAutomatic
    Enabled = False
    ReadOnly = True
    TabOrder = 7
    Text = 'Last OldCustomer In Database  ---> 30000'
  end
  object btnSingleton2: TButton
    Left = 24
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Singleton'
    TabOrder = 8
    OnClick = btnSingleton2Click
  end
end
