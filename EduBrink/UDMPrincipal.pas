unit UDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, mysqluniprovider;

type
  TDMPrincipal = class(TDataModule)
    UniConn: TUniConnection;
    QueryImagem: TUniQuery;
    QueryImagemid: TLongWordField;
    QueryImagemfoto: TBlobField;
    QueryImagemNome: TStringField;
    QueryImagemCategoria_id: TLongWordField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
