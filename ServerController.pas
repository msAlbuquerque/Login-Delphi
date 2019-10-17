unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  UserSessionUnit, IWApplication, IWAppForm, IW.Browser.Browser, 
  IW.HTTP.Request, IW.HTTP.Reply, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tserv = class(TIWServerControllerBase)
    FD: TFDConnection;
    query_login: TFDQuery;
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);

  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

  function UserSession: TIWUserSession;
  function serv: Tserv;

implementation

{$R *.dfm}

uses
  IWInit, IWGlobal;

function serv: Tserv;
begin
  Result := Tserv(GServerController);
end;



function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

{ TIWServerController }

procedure Tserv.IWServerControllerBaseNewSession(
  ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil, ASession);
end;

initialization
  Tserv.SetServerControllerClass;

end.

