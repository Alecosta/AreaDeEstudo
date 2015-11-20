program PAtterns;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  Singletn in 'Singletn.pas',
  Adapter in 'Adapter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
