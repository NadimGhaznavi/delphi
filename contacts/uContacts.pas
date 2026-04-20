unit uContacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmContacts = class(TForm)
    edtName: TEdit;
    lblTitle: TLabel;
    lblName: TLabel;
    edtPhoneNumber: TEdit;
    lblPhoneNumber: TLabel;
    btnAdd: TButton;
    btnDelete: TButton;
    btnRefresh: TButton;
    lstContacts: TListBox;
    fdConnContacts: TFDConnection;
    fdQryContacts: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FContacts: TStringList;
  public
    { Public declarations }
  end;

var
  frmContacts: TfrmContacts;

implementation

{$R *.dfm}

procedure TfrmContacts.FormCreate(Sender: TObject);
begin
  FContacts := TStringList.Create;

  fdConnContacts.Connected := True;

  fdQryContacts.Connection := fdConnContacts;

  fdQryContacts.SQL.Text :=
    'CREATE TABLE IF NOT EXISTS contacts (' +
    'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    'name TEXT NOT NULL, ' +
    'phone TEXT NOT NULL)';

  fdQryContacts.ExecSQL;
end;

procedure TfrmContacts.btnAddClick(Sender: TObject);
var
  Contact: string;
begin
  if Trim(edtName.Text) = '' then
  begin
    ShowMessage('Enter a name');
    Exit;
  end;

  if Trim(edtPhoneNumber.Text) = '' then
  begin
    ShowMessage('Enter a phone number');
    Exit;
  end;

  fdQryContacts.SQL.Text :=
  'INSERT INTO contacts (name, phone) VALUES (:name, :phone)';

  fdQryContacts.ParamByName('name').AsString := Trim(edtName.Text);
  fdQryContacts.ParamByName('phone').AsString := Trim(edtPhoneNumber.Text);

  fdQryContacts.ExecSQL;

  edtName.Clear;
  edtPhoneNumber.Clear;
  edtName.SetFocus;
end;

procedure TfrmContacts.btnDeleteClick(Sender: TObject);
var
  Index: Integer;
  ContactText: string;
  SeparatorPos: Integer;
  NameText: string;
  PhoneText: string;
begin
  Index := lstContacts.ItemIndex;

  if Index = -1 then
  begin
    ShowMessage('Select a contact to delete');
    Exit;
  end;

  ContactText := lstContacts.Items[Index];
  SeparatorPos := Pos(' - ', ContactText);

  if SeparatorPos = 0 then
  begin
    ShowMessage('Invalid contact format');
    Exit;
  end;

  NameText := Copy(ContactText, 1, SeparatorPos - 1);
  PhoneText := Copy(ContactText, SeparatorPos + 3, Length(ContactText));

  fdQryContacts.SQL.Text :=
    'DELETE FROM contacts WHERE name = :name AND phone = :phone';

  fdQryContacts.ParamByName('name').AsString := NameText;
  fdQryContacts.ParamByName('phone').AsString := PhoneText;

  fdQryContacts.ExecSQL;
end;

procedure TfrmContacts.btnRefreshClick(Sender: TObject);
begin
  fdQryContacts.SQL.Text := 'SELECT name, phone FROM contacts';
  fdQryContacts.Open;

  lstContacts.Items.Clear;

  while not fdQryContacts.Eof do
  begin
    lstContacts.Items.Add(
      fdQryContacts.FieldByName('name').AsString + ' - ' +
      fdQryContacts.FieldByName('phone').AsString
    );
    fdQryContacts.Next;
  end;

  fdQryContacts.Close;
end;

procedure TfrmContacts.FormDestroy(Sender: TObject);
begin
  FContacts.Free;
end;

end.
