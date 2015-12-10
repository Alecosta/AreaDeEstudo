// fontes de consulta: http://balaiotecnologico.blogspot.com.br/2009/07/design-patterns-com-delphi-abstract.html

unit AbstractFactory;

interface
uses
 Classes,Buttons,StdCtrls,Graphics;

Type
  TTipoColor = (tcRed, tcBlue);
  TOAbstractFactory = class(TObject)
  public
    class function GetTipoColor(cTipo:TTipoColor):TOAbstractFactory;
    constructor Create;
    destructor Destroy; override;

    //abstract widget constructors
    function CreateSpeedButton(AOwner: TComponent): TSpeedButton; virtual; abstract;
    function CreateEdit(AOwner: TComponent): TEdit; virtual; abstract;
    function CreateLabel(AOwner: TComponent): TLabel; virtual; abstract;
  end;

  TORedFactory = class(TOAbstractFactory)
  public
    //concrete widget constructors
    function CreateSpeedButton(AOwner: TComponent): TSpeedButton; override;
    function CreateEdit(AOwner: TComponent): TEdit; override;
    function CreateLabel(AOwner: TComponent): TLabel; override;
  end;

  TOBlueFactory = class(TOAbstractFactory)
  public
    //concrete widget constructors
    function CreateSpeedButton(AOwner: TComponent): TSpeedButton; override;
    function CreateEdit(AOwner: TComponent): TEdit; override;
    function CreateLabel(AOwner: TComponent): TLabel; override;
  end;

implementation

{ TOAbstractFactory }

constructor TOAbstractFactory.Create;
begin
  inherited;
  //
end;

destructor TOAbstractFactory.Destroy;
begin
  //
  inherited;
end;

class function TOAbstractFactory.GetTipoColor(
  cTipo: TTipoColor): TOAbstractFactory;
begin
   result := nil;
   case cTipo of
     tcRed  : Result := TORedFactory.Create;
     tcBlue : Result := TOBlueFactory.Create;
   end;
end;

{ TORedFactory }

function TORedFactory.CreateEdit(AOwner: TComponent): TEdit;
begin

  result := TEdit.Create(AOwner);
  TEdit(result).color := clRed;

end;

function TORedFactory.CreateLabel(AOwner: TComponent): TLabel;
begin
  TLabel(AOwner).Color := clRed;
end;

function TORedFactory.CreateSpeedButton(AOwner: TComponent): TSpeedButton;
begin
  TSpeedButton(AOwner).Caption := 'R'+TSpeedButton(AOwner).Caption;
end;

{ TOBlueFactory }

function TOBlueFactory.CreateEdit(AOwner: TComponent): TEdit;
begin
  result := TEdit.Create(AOwner);
  TEdit(result).color := clBlue;
end;

function TOBlueFactory.CreateLabel(AOwner: TComponent): TLabel;
begin
  TLabel(AOwner).Color := clBlue;
end;

function TOBlueFactory.CreateSpeedButton(AOwner: TComponent): TSpeedButton;
begin
 TSpeedButton(AOwner).Caption := 'B'+TSpeedButton(AOwner).Caption;
end;

end.
