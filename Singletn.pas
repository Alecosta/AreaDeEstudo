unit Singletn;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,
  StdCtrls; {TMemo}

type
  TMemoSingleton = class(TMemo)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TCSingleton = class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TOSingleton = class(TObject)
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Global_CSingleton: TCSingleton;
  Global_MemoSingleton: TMemoSingleton;
  Global_OSingleton: TOSingleton;


procedure Register;

implementation

uses Windows;

procedure Register;
begin
  RegisterComponents('Design Patterns', [TCSingleton]);
end;

{ TCSingleton }

constructor TCSingleton.Create(AOwner: TComponent);
begin
  if Global_CSingleton <> nil then
    {NB could show a message or raise a different exception here}
    Abort
  else begin
    inherited Create(AOwner);
    Global_CSingleton := Self;
  end;
end;

destructor TCSingleton.Destroy;
begin
  if Global_CSingleton = Self then
    Global_CSingleton := nil;
  inherited Destroy;
end;

{ TOSingleton }

constructor TOSingleton.Create;
begin
  if Global_OSingleton <> nil then
    {NB could show a message or raise a different exception here}
    Abort
  else
    Global_OSingleton := Self;
end;

destructor TOSingleton.Destroy;
begin
  if Global_OSingleton = Self then
    Global_OSingleton := nil;
  inherited Destroy;
end;

procedure FreeGlobalObjects; far;
begin
  if Global_CSingleton <> nil then
    Global_CSingleton.Free;
  if Global_OSingleton <> nil then
    Global_OSingleton.Free;
end;

{ TMemoSingleton }

constructor TMemoSingleton.Create(AOwner: TComponent);
begin
  if Global_MemoSingleton <> nil then
  begin
    {NB could show a message or raise a different exception here}
    Raise Exception.Create('OOPs só pode ter um!!!');
  end
  else begin
    inherited Create(AOwner);
    Global_MemoSingleton := Self;
  end;
end;

destructor TMemoSingleton.Destroy;
begin
  if Global_MemoSingleton = Self then
    Global_MemoSingleton := nil;
  inherited Destroy;
end;

begin
  AddExitProc(FreeGlobalObjects);
end.

