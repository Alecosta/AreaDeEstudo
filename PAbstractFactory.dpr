program PAbstractFactory;

uses
  Forms,
  UPrincipalAbstract in 'UPrincipalAbstract.pas' {Form2},
  AbstractFactory in 'AbstractFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
