object frmContacts: TfrmContacts
  Left = 0
  Top = 0
  Caption = 'Delphi Contacts'
  ClientHeight = 441
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lblTitle: TLabel
    Left = 66
    Top = 64
    Width = 84
    Height = 15
    Caption = 'Delphi Contacts'
  end
  object lblName: TLabel
    Left = 66
    Top = 99
    Width = 32
    Height = 15
    Caption = 'Name'
  end
  object lblPhoneNumber: TLabel
    Left = 66
    Top = 133
    Width = 81
    Height = 15
    Caption = 'Phone Number'
  end
  object edtName: TEdit
    Left = 160
    Top = 96
    Width = 143
    Height = 23
    TabOrder = 0
  end
  object edtPhoneNumber: TEdit
    Left = 160
    Top = 125
    Width = 143
    Height = 23
    TabOrder = 1
  end
  object btnAdd: TButton
    Left = 66
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 147
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnRefresh: TButton
    Left = 228
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 4
    OnClick = btnRefreshClick
  end
  object lstContacts: TListBox
    Left = 66
    Top = 168
    Width = 237
    Height = 186
    ItemHeight = 15
    TabOrder = 5
  end
  object fdConnContacts: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=contacts.db')
    LoginPrompt = False
    Left = 352
    Top = 272
  end
  object fdQryContacts: TFDQuery
    Connection = fdConnContacts
    Left = 352
    Top = 200
  end
end
