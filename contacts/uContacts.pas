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
  FireDAC.Phys.SQLiteWrapper.Stat, Vcl.ComCtrls;

type
  TfrmContacts = class(TForm)
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtPhoneNumber: TEdit;
    lblTitle: TLabel;
    lblFirstName: TLabel;
    lblLastlName: TLabel;
    lblPhoneNumber: TLabel;
    lvContacts: TListView;
    btnAdd: TButton;
    btnDelete: TButton;
    fdConnContacts: TFDConnection;
    fdQryContacts: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    procedure LoadContacts;
  public
    { Public declarations }
  end;

var
  frmContacts: TfrmContacts;

implementation

{$R *.dfm}

procedure TfrmContacts.FormCreate(Sender: TObject);
begin
  fdConnContacts.Connected := True;

  fdQryContacts.Connection := fdConnContacts;

  fdQryContacts.SQL.Text :=
    'CREATE TABLE IF NOT EXISTS contacts (' +
    'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    'first_name TEXT NOT NULL, ' +
    'last_name TEXT NOT NULL, ' +
    'phone TEXT NOT NULL)';

  try
    fdQryContacts.ExecSQL;
  except
    on E: Exception do
      ShowMessage('Database error: ' + E.Message);
  end;

  lvContacts.Column[0].Width := 90;
  lvContacts.Column[1].Width := 90;
  lvContacts.Column[2].Width := 120;


  LoadContacts;

end;

procedure TfrmContacts.btnAddClick(Sender: TObject);
begin
  if Trim(edtFirstName.Text) = '' then
  begin
    ShowMessage('Enter a first name');
    Exit;
  end;

  if Trim(edtLastName.Text) = '' then
  begin
    ShowMessage('Enter a last name');
    Exit;
  end;

  if Trim(edtPhoneNumber.Text) = '' then
  begin
    ShowMessage('Enter a phone number');
    Exit;
  end;

  fdQryContacts.SQL.Text :=
    'INSERT INTO contacts (first_name, last_name, phone) ' +
    'VALUES (:first_name, :last_name, :phone)';

  fdQryContacts.ParamByName('first_name').AsString := Trim(edtFirstName.Text);
  fdQryContacts.ParamByName('last_name').AsString := Trim(edtLastName.Text);
  fdQryContacts.ParamByName('phone').AsString := Trim(edtPhoneNumber.Text);

  try
    fdQryContacts.ExecSQL;
  except
    on E: Exception do
      ShowMessage('Database error: ' + E.Message);
  end;

  edtFirstName.Clear;
  edtLastName.Clear;
  edtPhoneNumber.Clear;
  edtFirstName.SetFocus;

  LoadContacts;
end;

procedure TfrmContacts.btnDeleteClick(Sender: TObject);
var
  Item: TListItem;
  FirstNameText: string;
  LastNameText: string;
  PhoneText: string;
begin
  Item := lvContacts.Selected;

  if Item = nil then
  begin
    ShowMessage('Select a contact to delete');
    Exit;
  end;

  if MessageDlg('Delete selected contact?', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
    Exit;


  FirstNameText := Item.Caption;
  LastNameText := Item.SubItems[0];
  PhoneText := Item.SubItems[1];

  fdQryContacts.SQL.Text :=
    'DELETE FROM contacts ' +
    'WHERE first_name = :first_name ' +
    'AND last_name = :last_name ' +
    'AND phone = :phone';

  fdQryContacts.ParamByName('first_name').AsString := FirstNameText;
  fdQryContacts.ParamByName('last_name').AsString := LastNameText;
  fdQryContacts.ParamByName('phone').AsString := PhoneText;

  try
    fdQryContacts.ExecSQL;
  except
    on E: Exception do
      ShowMessage('Database error: ' + E.Message);
  end;

  LoadContacts;
end;

procedure TfrmContacts.LoadContacts;
var
  Item: TListItem;
begin
  lvContacts.Items.BeginUpdate;
  try
    lvContacts.Items.Clear;

    try
      fdQryContacts.Close;
      fdQryContacts.SQL.Text :=
        'SELECT first_name, last_name, phone ' +
        'FROM contacts ORDER BY last_name, first_name';
      fdQryContacts.Open;

      while not fdQryContacts.Eof do
      begin
        Item := lvContacts.Items.Add;
        Item.Caption := fdQryContacts.FieldByName('first_name').AsString;
        Item.SubItems.Add(fdQryContacts.FieldByName('last_name').AsString);
        Item.SubItems.Add(fdQryContacts.FieldByName('phone').AsString);

        fdQryContacts.Next;
      end;

      fdQryContacts.Close;

    except
      on E: Exception do
        ShowMessage('Database error: ' + E.Message);
    end;

  finally
    lvContacts.Items.EndUpdate;
  end;

end;

end.
