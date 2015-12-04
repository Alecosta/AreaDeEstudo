unit UPrincipalAbstract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
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
var
  objeto : TOAbstractFactory;
begin
  {$Define corBLUE}

  {$IfDef corBLUE}
     objeto := TORedFactory.Create;
  {$EndIf}
  {$IfDef corRed}
     objeto := TOBlueFactory.Create;
  {$EndIf}
end;

end.
