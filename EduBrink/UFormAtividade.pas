unit UFormAtividade;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,System.Math,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.Filter.Effects, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormAtividade = class(TForm)
    TxtCategoria: TText;
    ImgFigura: TImage;
    TxtParabens: TText;
    GridPanelLayout1: TGridPanelLayout;
    Rectangle1: TRectangle;
    BtnOpcao1: TButton;
    Rectangle2: TRectangle;
    BtnOpcao2: TButton;
    Rectangle3: TRectangle;
    BtnOpcao3: TButton;
    Rectangle4: TRectangle;
    BtnOpcao4: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldTag: TLinkPropertyToField;
    BtnJogarDenovo: TButton;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    Rectangle5: TRectangle;
    procedure FormShow(Sender: TObject);
    procedure BtnOpcao1Click(Sender: TObject);
    procedure BtnOpcao2Click(Sender: TObject);
    procedure BtnOpcao3Click(Sender: TObject);
    procedure BtnOpcao4Click(Sender: TObject);
    procedure BtnJogarDenovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Escolhido:integer;
    procedure TestarSelecao(id:integer);
    { Public declarations }
  end;

var
  FormAtividade: TFormAtividade;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses UDMPrincipal;

procedure TFormAtividade.BtnJogarDenovoClick(Sender: TObject);
begin

  DMPrincipal.QueryImagem.Close;
  DMPrincipal.QueryImagem.Open;
  TxtParabens.Visible := false;
  DMPrincipal.QueryImagem.Filtered := false;

  FormShow(self);

end;

procedure TFormAtividade.BtnOpcao1Click(Sender: TObject);
begin

  TestarSelecao(BtnOpcao1.Tag);

end;

procedure TFormAtividade.BtnOpcao2Click(Sender: TObject);
begin

  TestarSelecao(BtnOpcao2.Tag);

end;

procedure TFormAtividade.BtnOpcao3Click(Sender: TObject);
begin

  TestarSelecao(BtnOpcao3.Tag);

end;

procedure TFormAtividade.BtnOpcao4Click(Sender: TObject);
begin

  TestarSelecao(BtnOpcao4.Tag);

end;

procedure TFormAtividade.FormShow(Sender: TObject);
Var
  registros: array[1..4] of integer;
  i:integer;

begin

  i:=1;
  with DMPrincipal do
  begin
    QueryImagem.First;
    while not queryimagem.Eof do
    Begin
      case i of
        1:Begin
            BtnOpcao1.Text := QueryImagemNome.Text;
            BtnOpcao1.Tag := QueryImagemid.AsInteger;
          End;
        2:Begin
            BtnOpcao2.Text := QueryImagemNome.Text;
            BtnOpcao2.Tag := QueryImagemid.AsInteger;
          End;
        3:Begin
            BtnOpcao3.Text := QueryImagemNome.Text;
            BtnOpcao3.Tag := QueryImagemid.AsInteger;
          End;
        4:Begin
            BtnOpcao4.Text := QueryImagemNome.Text;
            BtnOpcao4.Tag := QueryImagemid.AsInteger;
          End;
      end;

      registros[i] := QueryImagemid.AsInteger;
      inc(i);
      QueryImagem.Next;
    End;
    Escolhido := RandomFrom(registros);
    QueryImagem.Filtered := false;
    QueryImagem.Filter := 'id = ' + IntToStr(Escolhido);
    QueryImagem.Filtered := true;
  end;

end;

procedure TFormAtividade.TestarSelecao(id: integer);
begin
  if id = Escolhido then
    TxtParabens.Visible := true
  else
  Begin
    beep;
    TxtParabens.Visible := False;
  End;

end;

end.
