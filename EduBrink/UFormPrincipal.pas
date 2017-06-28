unit UFormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation, FMX.Effects, FMX.Objects;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    StyleBook1: TStyleBook;
    RctPersonagem: TRectangle;
    BtnPersonagem: TCornerButton;
    ShadowEffect1: TShadowEffect;
    RctCores: TRectangle;
    ShadowEffect2: TShadowEffect;
    BtnCores: TCornerButton;
    RctBrinquedo: TRectangle;
    ShadowEffect3: TShadowEffect;
    BtnBrinquedo: TCornerButton;
    RctMateriais: TRectangle;
    ShadowEffect4: TShadowEffect;
    BtnMateriasEscolares: TCornerButton;
    procedure BtnBrinquedoClick(Sender: TObject);
    procedure BtnPersonagemClick(Sender: TObject);
    procedure BtnCoresClick(Sender: TObject);
    procedure BtnMateriasEscolaresClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure AtualizaAtividade(id_categoria:integer;Categoria:String);
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}

uses UDMPrincipal, UFormAtividade;
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFormPrincipal.AtualizaAtividade(id_categoria:integer;Categoria:String);
begin

  with DMPrincipal do
  begin
    QueryImagem.Filtered := false;
    QueryImagem.Close;
    QueryImagem.ParamByName('pCategoria').Value := id_categoria;
    QueryImagem.Open;

    if not QueryImagem.IsEmpty then
    Begin
      if FormAtividade = nil then
        Application.CreateForm(TFormAtividade, FormAtividade);
      FormAtividade.TxtCategoria.Text := categoria;
      TFormAtividade.Create(self).Show;
    End;
  end;

end;

procedure TFormPrincipal.BtnBrinquedoClick(Sender: TObject);
begin

  AtualizaAtividade(1,BtnBrinquedo.Text);

end;

procedure TFormPrincipal.BtnCoresClick(Sender: TObject);
begin

  AtualizaAtividade(3,BtnCores.Text);

end;

procedure TFormPrincipal.BtnMateriasEscolaresClick(Sender: TObject);
begin

  AtualizaAtividade(4,BtnMateriasEscolares.Text);

end;

procedure TFormPrincipal.BtnPersonagemClick(Sender: TObject);
begin

  AtualizaAtividade(2,BtnPersonagem.Text);

end;

procedure TFormPrincipal.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if key = vkHardwareBack then
    Application.Terminate;

end;

end.
