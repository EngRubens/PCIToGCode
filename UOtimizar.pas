unit UOtimizar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, Buttons, fpimage, ExtCtrls;

type

  { TFrmOtimizar }

    TFrmOtimizar = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    BtnOtimizar: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    UpDown1: TUpDown;
    procedure BtnOtimizarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmOtimizar: TFrmOtimizar;


implementation

{ TFrmOtimizar }

uses
  UPrincipal;

procedure Otimizar(Girar : string);
var
x    : integer;
y    : integer;
xi   : integer;
xf   : integer;
yi   : integer;
yf   : integer;
vxyi : boolean;
BR   : integer;
f    : integer;

Begin
 FrmPrincipal.ProgressBar1.Min := 0;
 FrmPrincipal.ProgressBar1.Max := tpox;
 FrmPrincipal.ProgressBar1.Step := 1;
 FrmPrincipal.image1.Hide;
 FrmPrincipal.image2.Hide;
 FrmPrincipal.Image2.Picture.Bitmap.Clear;
 FrmPrincipal.Image2.Canvas.Clear;
   for y := 0 to 10000 do
   begin
    for x := 0 to 10000 do
      begin
       pixel_IN[x, y] := ' ';
      end;
   end;
 f := 0;
 vxyi := false;
 // Procura pelo primeiro e ultimo pixel preto do eixo X
 for x := 0 to tpox do
 begin
  FrmPrincipal.ProgressBar1.Position := x;
  if (f > 10) then
  Begin
   Application.ProcessMessages;
   f := 0;
  end;
  f := f + 1;
  for y := 0 to tpoy do
  begin
   BR := Pixel_COR[x,y];
   if (BR < (OFator)) then
    Begin
     if not vxyi then
     Begin
      xi := x;
      vxyi := true;
     end
     else
      xf := x;
    end
    else
    Begin
    end;
   end;
 end;
 vxyi := false;
 // Procura pelo primeiro e o último pixel preto do eixo Y
 FrmPrincipal.ProgressBar1.Max:= tpoy;
 for y := 0 to tpoy do
 begin
  FrmPrincipal.ProgressBar1.Position := y;
  if (f > 10) then
  Begin
   Application.ProcessMessages;
   f := 0;
  end;
  f := f + 1;
  for x := 0 to tpox do
  begin
   BR := Pixel_COR[x,y];
   if (BR < (OFator)) then
    Begin
     if not vxyi then
     Begin
      yi := y;
      vxyi := true;
     end
     else
      yf := y;
    end;
   end;
 end;
 // Carrega o novo tamanho da imagem otimizada
 If girar = 'N' then
 Begin
  FrmPrincipal.Image2.Picture.Bitmap.Width := (xf - xi + FrmOtimizar.TrackBar1.Position * 2);
  If (FrmOtimizar.TrackBar1.Position > 0) then
  FrmPrincipal.Image2.Picture.Bitmap.Width := FrmPrincipal.Image2.Picture.Bitmap.Width + 2;
  tpx := FrmPrincipal.Image2.Picture.Bitmap.Width;
  FrmPrincipal.Image2.Picture.Bitmap.Height := (yf - yi + FrmOtimizar.TrackBar1.Position * 2);
  If (FrmOtimizar.TrackBar1.Position > 0) then
  FrmPrincipal.Image2.Picture.Bitmap.Height := FrmPrincipal.Image2.Picture.Bitmap.Height + 2;
  tpy := FrmPrincipal.Image2.Picture.Bitmap.Height;
 End
 Else
 Begin
  FrmPrincipal.Image2.Picture.Bitmap.Width := (yf - yi + FrmOtimizar.TrackBar1.Position * 2);
  tpx := (yf - yi);
  FrmPrincipal.Image2.Picture.Bitmap.Height := (xf - xi + FrmOtimizar.TrackBar1.Position * 2);
  tpy := (xf - xi);
 End;
 // Varre a imagem ponto a ponto transformando os pixels em preto ou branco.
 FrmPrincipal.ProgressBar1.Max:= tpx;
 for x := 0 to ((xf - xi) + FrmOtimizar.TrackBar1.Position * 2)do
 begin
  FrmPrincipal.ProgressBar1.Position := x;
  if (f > 10) then
  Begin
   Application.ProcessMessages;
   f := 0;
  end;
  f := f + 1;
  for y := 0 to ((yf - yi) + FrmOtimizar.TrackBar1.Position * 2) do
  begin
   if ((x < FrmOtimizar.TrackBar1.Position) or (y < FrmOtimizar.TrackBar1.Position) or (y > (yf - yi + FrmOtimizar.TrackBar1.Position)) or (x > (xf - xi + FrmOtimizar.TrackBar1.Position))) then
    BR := 6000000
   else
    BR := Pixel_COR[x + xi - FrmOtimizar.TrackBar1.Position,y - FrmOtimizar.TrackBar1.Position + yi];
   if ((x = 0) or (y = 0) or (y = (yf - yi + FrmOtimizar.TrackBar1.Position * 2)) or (x = (xf - xi + FrmOtimizar.TrackBar1.Position * 2))) then
    BR := 0;
   if (BR < (OFator)) then
   Begin
    // Verifica se tem que girar
    If girar = 'N' then
    Begin
     FrmPrincipal.image2.Canvas.Pixels[x,y] := CLblack;
     pixel_IN[x, y] := 'P';
    End
    Else
    Begin
     FrmPrincipal.image2.Canvas.Pixels[yf - y,(x - xi)] := CLblack;
     pixel_IN[(yf - y),(x - xi)] := 'P';
    End;
   End
   Else
   Begin
    // Verifica se tem que girar
    If girar = 'N' then
    Begin
     FrmPrincipal.image2.Canvas.Pixels[x,y] := CLWhite;
     pixel_IN[x, y] := 'B';
    End
    Else
    Begin
     FrmPrincipal.image2.Canvas.Pixels[yf - y,(x - xi)] := CLWhite;
     pixel_IN[(yf - y),(x - xi)] := 'B';
    End;
   End;
  end;
 end;
 FrmPrincipal.ProgressBar1.Position := 0;
 FrmPrincipal.image1.Show;
 FrmPrincipal.image2.Show;
end;

procedure TFrmOtimizar.FormShow(Sender: TObject);
var
 i:integer;
begin
  Edit1.Text := inttostr(updown1.Position);
  //FrmPrincipal.Notebook1.PageIndex := 1;
  FrmPrincipal.PageControl1.PageIndex := 1;
  // Ajuste da fonte dependendo do sistema operacional
  {$IFDEF LINUX}
  for i := 0 to ComponentCount-1 do // navega por todos os componentes
  begin
   // se o componente for uma label
   if (Components[i] is TLabel) then
    TLabel(Components[i]).Font.Name := 'Helvetica';
  end;
  {$ELSE}
  for i := 0 to ComponentCount-1 do // navega por todos os componentes
  begin
   // se o componente for uma label
   if (Components[i] is TLabel) then
     TLabel(Components[i]).Font.Name := 'Arial';
  end;
  {$ENDIF}
end;

procedure TFrmOtimizar.BtnOtimizarClick(Sender: TObject);
Begin
  OFator := UpDown1.Position * 8000;
  Otimizar('N');
  //FrmOtimizar.Close;
end;

procedure TFrmOtimizar.Edit1Change(Sender: TObject);
begin
     UpDown1.Position := StrToInt(Edit1.Text);
end;

procedure TFrmOtimizar.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
 Edit1.Text := inttostr(updown1.Position);
end;


initialization
  {$I UOtimizar.lrs}

end.

