unit AbstractFactory;

interface
uses
 Classes,Buttons,StdCtrls,Graphics;

Type
  TOAbstractFactory = class(TObject)
  public
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

{ TORedFactory }

function TORedFactory.CreateEdit(AOwner: TComponent): TEdit;
begin
  TEdit(AOwner).Color := clRed;
  result := TEdit(AOwner);
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
  TEdit(AOwner).Color := clBlue;
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
