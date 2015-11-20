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
    procedure btnSingletonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Singletn;

{$R *.dfm}

procedure TForm1.btnSingletonClick(Sender: TObject);
var
  mmo1: TMemoSingleton;
  mmo2: TMemoSingleton;
begin

  mmo1 := TMemoSingleton.Create(Self);

  with mmo1 do
  begin
    Name := 'mmo1';
    Parent := Self;
    Left := 320;
    Top := 192;
    Width := 185;
    Height := 89;
    Lines.Clear;
    Lines.Add('mmo1');
    TabOrder := 1;
  end;

  mmo2 := TMemoSingleton.Create(Self);

  with mmo2 do
  begin
    Name := 'mmo2';
    Parent := Self;
    Left := 320;
    Top := 492;
    Width := 185;
    Height := 89;
    Lines.Clear;
    Lines.Add('mmo2');
    TabOrder := 1;
  end;

end;

end.
