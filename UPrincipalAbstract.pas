unit UPrincipalAbstract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses AbstractFactory;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
//var
//  objeto : TOAbstractFactory;
begin
  {$Define corBLUE}
//
//  {$IfDef corBLUE}
//     objeto := TORedFactory.Create;
//  {$EndIf}
//  {$IfDef corRed}
//     objeto := TOBlueFactory.Create;
//  {$EndIf}
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  objeto : TOAbstractFactory;
  meuEdit : TEdit;
begin

  objeto := TOAbstractFactory.GetTipoColor(tcBlue);

  meuEdit :=  objeto.CreateEdit(self );
  with  meuEdit do
  begin
    Parent := Form2;
    Name := 'Edit1';
    Left := 72;
    Top := 184 ;
    Width := 121;
    Height := 21 ;
    TabOrder := 1 ;
    Text := 'Edit1';
  end;
  
  sleep(500);

  meuEdit.Free;
  objeto.Free;

end;

end.
