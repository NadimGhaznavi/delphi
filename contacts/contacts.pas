unit contacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

procedure TfrmContacts.btnAddClick(Sender: TObject);
var
  Contact: string;
begin
  if Trim(edtName.Text) = '' then
  begin
    ShowMessage('Enter a name');
    Exit;
  end;
end;

procedure TfrmContacts.btnDeleteClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := lstContacts.ItemIndex;

  if Index = -1 then
  begin
    ShowMessage('Select a contact to delete');
    Exit;
  end;

  FContacts.Delete(Index);
end;

procedure TfrmContacts.btnRefreshClick(Sender: TObject);
begin
  lstContacts.Items.Assign(FContacts);
end;

procedure TfrmContacts.FormDestroy(Sender: TObject);
begin
  FContacts.Free;
end;

procedure TfrmContacts.FormCreate(Sender: TObject);
begin
  FContacts := TStringList.Create;
end;

end.
