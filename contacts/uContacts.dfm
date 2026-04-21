object frmContacts: TfrmContacts
  Left = 0
  Top = 0
  Caption = 'Delphi Contacts'
  ClientHeight = 438
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblTitle: TLabel
    Left = 34
    Top = 24
    Width = 84
    Height = 15
    Caption = 'Delphi Contacts'
  end
  object lblLastlName: TLabel
    Left = 34
    Top = 107
    Width = 56
    Height = 15
    Caption = 'Last Name'
  end
  object lblPhoneNumber: TLabel
    Left = 34
    Top = 141
    Width = 81
    Height = 15
    Caption = 'Phone Number'
  end
  object lblFirstName: TLabel
    Left = 34
    Top = 67
    Width = 57
    Height = 15
    Caption = 'First Name'
  end
  object edtLastName: TEdit
    Left = 128
    Top = 99
    Width = 143
    Height = 23
    TabOrder = 1
  end
  object edtPhoneNumber: TEdit
    Left = 128
    Top = 133
    Width = 143
    Height = 23
    TabOrder = 2
  end
  object btnAdd: TButton
    Left = 64
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 216
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object edtFirstName: TEdit
    Left = 128
    Top = 59
    Width = 143
    Height = 23
    TabOrder = 0
  end
  object lvContacts: TListView
    Left = 32
    Top = 176
    Width = 295
    Height = 193
    Columns = <
      item
        Caption = 'First Name'
      end
      item
        Caption = 'Last Name'
      end
      item
        Caption = 'Phone Number'
      end>
    TabOrder = 5
    ViewStyle = vsReport
  end
  object fdConnContacts: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=contacts.db')
    LoginPrompt = False
    Left = 312
    Top = 104
  end
  object fdQryContacts: TFDQuery
    Connection = fdConnContacts
    Left = 312
    Top = 48
  end
end
