unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnSingleton: TButton;
    lbl1: TLabel;
    btnAdapter: TButton;
    lblCustomer: TLabel;
    edtCustomerID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtDOB: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    btnSingleton2: TButton;
    procedure btnSingletonClick(Sender: TObject);
    procedure btnAdapterClick(Sender: TObject);
    procedure btnSingleton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Singletn, Adapter;

{$R *.dfm}

procedure TForm1.btnSingletonClick(Sender: TObject);
var
  mmo1: TMemoSingleton;
begin

  mmo1 := TMemoSingleton.Create(Self);

  with mmo1 do
  begin
    Name := 'mmo1';
    Parent := Self;
    Left := 24;
    Top := 80;
    Width := 73;
    Height := 89;
    Lines.Clear;
    Lines.Add('mmo1');
    TabOrder := 1;
  end;
  
end;

procedure TForm1.btnAdapterClick(Sender: TObject);
var
  NewCustomer : TNewCustomer;
begin
  NewCustomer := GetCustomer(StrToInt(edtCustomerID.text));
  edtFirstName.Text := NewCustomer.FirstName;
  edtLastName.Text := NewCustomer.LastName;
  edtDOB.Text := FormatDateTime('dd/MM/yyyy',NewCustomer.DOB);
  edtFirstName.Text := NewCustomer.FirstName;
  FreeAndNil(NewCustomer);
end;

procedure TForm1.btnSingleton2Click(Sender: TObject);
var
  mmo2: TMemoSingleton;
begin


  mmo2 := TMemoSingleton.Create(Self);

  with mmo2 do
  begin
    Name := 'mmo2';
    Parent := Self;
    Left := 32;
    Top := 240;
    Width := 65;
    Height := 97;
    Lines.Clear;
    Lines.Add('mmo2');
    TabOrder := 1;
  end;

end;
end.
