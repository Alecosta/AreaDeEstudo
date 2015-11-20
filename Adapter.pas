unit Adapter;

interface

uses SysUtils, Classes;

type

  { The new class }
  TNewCustomer = class
  private
    FCustomerID: Longint;
    FFirstName: string;
    FLastName: string;
    FDOB: TDateTime;
  protected
    function GetCustomerID: Longint; virtual;
    function GetFirstName: string; virtual;
    function GetLastName: string; virtual;
    function GetDOB: TDateTime; virtual;
  public
    constructor Create(CustID: Longint); virtual;
    property CustomerID: Longint read GetCustomerID;
    property FirstName: string read GetFirstName;
    property LastName: string read GetLastName;
    property DOB: TDateTime read GetDOB;
  end;

  { An interface method }
  { Lets us hide details of TOldCustomer from the client }

function GetCustomer(CustomerID: Longint): TNewCustomer;

implementation

const
  Last_OldCustomer_At_Year_2000 = 15722;
  Last_OldCustomer_In_Database = 30000;

{ The new class }

constructor TNewCustomer.Create(CustID: Longint);
begin
  FCustomerID := CustID;
  FFirstName := 'A';
  FLastName := 'New_Customer';
  FDOB := Now;
end;

function TNewCustomer.GetCustomerID: Longint;
begin
  Result := FCustomerID;
end;

function TNewCustomer.GetFirstName: string;
begin
  Result := FFirstName;
end;

function TNewCustomer.GetLastName: string;
begin
  Result := FLastName;
end;

function TNewCustomer.GetDOB: TDateTime;
begin
  Result := FDOB;
end;

type
  { The old class }
  TOldDOB = record
    Day: 0..31;
    Month: 1..12;
    Year: 0..99;
  end;

  TOldCustomer = class
    FCustomerID: Integer;
    FName: string;
    FDOB: TOldDOB;
  public
    constructor Create(CustID: Integer);
    property CustomerID: Integer read FCustomerID;
    property Name: string read FName;
    property DOB: TOldDOB read FDOB;
  end;

constructor TOldCustomer.Create(CustID: Integer);
begin
  FCustomerID := CustomerID;
  FName := 'An Old_Customer';
  with FDOB do begin
    Day := 1;
    Month := 1;
    Year := 1;
  end;
end;

type
  { The Adapter class }
  TAdaptedCustomer = class(TNewCustomer)
  private
    FOldCustomer: TOldCustomer;
  protected
    function GetCustomerID: Longint; override;
    function GetFirstName: string; override;
    function GetLastName: string; override;
    function GetDOB: TDateTime; override;
  public
    constructor Create(CustID: Longint); override;
    destructor Destroy; override;
  end;

{ The Adapter class }

constructor TAdaptedCustomer.Create(CustID: Longint);
begin
  inherited Create(CustID);
  FOldCustomer := TOldCustomer.Create(CustID);
end;

destructor TAdaptedCustomer.Destroy;
begin
  FOldCustomer.Free;
  inherited Destroy;
end;

function TAdaptedCustomer.GetCustomerID: Longint;
begin
  Result := FOldCustomer.CustomerID;
end;

function TAdaptedCustomer.GetFirstName: string;
var
  SpacePos: integer;
begin
  SpacePos := Pos(' ', FOldCustomer.Name);
  if SpacePos = 0 then
    Result := ''
  else
    Result := Copy(FOldCustomer.Name,1,SpacePos-1);
end;

function TAdaptedCustomer.GetLastName: string;
var
  SpacePos: integer;
begin
  SpacePos := Pos(' ', FOldCustomer.Name);
  if SpacePos = 0 then
    Result := FOldCustomer.Name
  else
    Result := Copy(FOldCustomer.Name,SpacePos+1,255);
end;

function TAdaptedCustomer.GetDOB: TDateTime;
var
  FullYear: Word;
begin
  if CustomerID > Last_OldCustomer_At_Year_2000 then
    FullYear := 2000 + FOldCustomer.DOB.Year
  else
    FullYear := 1900 + FOldCustomer.DOB.Year;
  Result := EncodeDate(FullYear, FOldCustomer.DOB.Month, FOldCustomer.DOB.Day);
end;

function GetCustomer(CustomerID: Longint): TNewCustomer;
begin
  if CustomerID > Last_OldCustomer_In_Database then
    Result := TNewCustomer.Create(CustomerID)
  else
    Result := TAdaptedCustomer.Create(CustomerID) as TNewCustomer;
end;

end.

