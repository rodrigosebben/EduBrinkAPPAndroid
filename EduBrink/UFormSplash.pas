unit UFormSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.IOUtils, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, mysqluniprovider,
  FMX.Media;

type
  TFormSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PlayAudioA(ResourceID,NomeArquivo: string);

    { Public declarations }
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.fmx}

uses UFormPrincipal, UDMPrincipal;

procedure TFormSplash.FormShow(Sender: TObject);
begin
  PlayAudioA('1','Som_Splash.3gp');
end;

procedure TFormSplash.PlayAudioA(ResourceID,NomeArquivo: string);
var
  ResStream: TResourceStream;
  TmpFile: string;
begin

  ResStream := TResourceStream.Create(HInstance, ResourceID, RT_RCDATA);
  try

    TmpFile := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, NomeArquivo);

    //TPath.Combine(TPath.GetDocumentsPath, 'filename')  { Internal }
    //TPath.Combine(TPath.GetSharedDocumentsPath, 'filename')  { External }

    ResStream.Position := 0;
    ResStream.SaveToFile(TmpFile);

    MediaPlayer1.FileName := TmpFile;
    MediaPlayer1.Play;

  finally
    ResStream.Free;
  end;

end;

procedure TFormSplash.Timer1Timer(Sender: TObject);
begin
  if (Timer1.Interval = 2000) then
  begin
    try
      DMPrincipal.UniConn.Connected:= true;
    except
      timer1.Enabled := false;
      ShowMessage('Voce precisa estar conectado na internet para executar o jogo!');
      Application.Terminate;
    end;

    DMPrincipal.UniConn.Connected:= true;
    if FormPrincipal=nil then
      Application.CreateForm(TFormPrincipal,FormPrincipal);
    FormPrincipal.show;
    timer1.Enabled := false;
  end;

end;

end.
