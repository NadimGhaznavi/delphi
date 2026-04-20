object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Hello World'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblName: TLabel
    Left = 80
    Top = 312
    Width = 32
    Height = 15
    Caption = 'Name'
  end
  object rbgGender: TRadioGroup
    Left = 118
    Top = 233
    Width = 119
    Height = 73
    Caption = 'Gender'
    Items.Strings = (
      'Female'
      'Male')
    TabOrder = 2
  end
  object btnLaunch: TButton
    Left = 120
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Launch'
    TabOrder = 0
    OnClick = btnLaunchClick
  end
  object edtName: TEdit
    Left = 118
    Top = 309
    Width = 121
    Height = 23
    TabOrder = 1
  end
end
