unit UFuros;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls;

type

  { TFrmFuros }

  TFrmFuros = class(TForm)
    BtnCapturar: TButton;
    BtnGeraGCodeFuros: TButton;
    BtnIncluir: TButton;
    BtnExcluir: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    procedure BtnCapturarClick(Sender: TObject);
    procedure BtnGeraGCodeFurosClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmFuros: TFrmFuros;
  ZInic : array[0..1000] of integer;
  ZFim : array[0..1000] of integer;

implementation

{ TFrmFuros }

uses
  UPrincipal;

Procedure Limpa();
var
x  : integer;
y  : integer;
f  : Integer;
begin
 FrmPrincipal.ProgressBar1.Max := tpx;
 FrmPrincipal.ProgressBar1.Position := 0;
 FrmPrincipal.Image5.Picture.Bitmap.Canvas.Pen.Color:= $FFFFFF;
 FrmPrincipal.Image5.Picture.Bitmap.Canvas.Clear;
 FrmPrincipal.Image5.Picture.Bitmap.Width := tpx + 2;
 FrmPrincipal.Image5.Picture.Bitmap.Height := tpy + 2;
 FrmPrincipal.image5.Width := tpx + 2;
 FrmPrincipal.image5.Height := tpy + 2;
 FrmPrincipal.Image5.Hide;
 f := 0;
for x := 0 to tpx do
 Begin
  FrmPrincipal.ProgressBar1.Position := x;
  if (f > 20) then
  Begin
   Application.ProcessMessages;
   f := 0;
  end;
  f := f + 1;
  for y := 0 to tpy do
  Begin
   if pixel_OUT[x,y] = 'R' then
   Begin
    FrmPrincipal.image5.Canvas.Pixels[x,y] := $0000AF;
   End
   Else
   Begin
    FrmPrincipal.image5.Canvas.Pixels[x,y] := $FFFFFF;
   End;
  End;
 End;
  FrmPrincipal.ProgressBar1.Position := 0;
  FrmPrincipal.Image5.Show;
end;

function VirgPonto(valor:string):string;
var
i : integer;
begin
 if valor <> '' then
 begin
  for i := 0 to length(valor) do
  begin
   if valor[i] = '.' then
   begin
    valor[i]:= ',';
   end
   else
   if valor[i] = ',' then
   begin
    valor[i] := '.';
   end;
  end;
 end;
 result := valor;
end;

procedure TiraMarcaFuros();
var
ContaFuro : integer;
ContaLinha : integer;
arquivar : textfile;

begin
// Rotina para eliminar os contornos dos furos na fresagem
ContaLinha := 0;
ContaFuro := 1;
if FileExists('XYZCord.txt') then
  begin
   // Criar um novo arquivo
   assignfile(arquivar, 'XYZCordsf.txt');
   if not FileExists('XYZCordsf.txt') then
     Rewrite(arquivar)
   else
    erase(arquivar);
   rewrite(arquivar);
   // Criado o novo arquivo
   for ContaLinha := 0 to FrmPrincipal.Memo1.Lines.Count do
   Begin
    if ((Contalinha < ZInic[ContaFuro]) or (Contalinha >= ZFim[ContaFuro])) then
     Begin
      if (Contalinha = ZFim[ContaFuro]) then
       begin
        ContaFuro := ContaFuro + 1;
       end
      else
      begin
       if (Contalinha = ZFim[ContaFuro - 1] + 1)  then
        begin
         writeln(arquivar, 'Z = 3');
         writeln(arquivar, FrmPrincipal.Memo1.Lines.Strings[ContaLinha]);
         writeln(arquivar, 'Z = -1');
        end;
       // Grava linha no arquivo novo
       if (Contalinha <> ZInic[ContaFuro] - 2) then
        begin
         writeln(arquivar, FrmPrincipal.Memo1.Lines.Strings[ContaLinha]);
        end
       else
       begin
        writeln(arquivar, FrmPrincipal.Memo1.Lines.Strings[ContaLinha + 1]);
        writeln(arquivar, 'Z = -1');
       end;
      end;
     end;
   end;
  end;
  closefile(arquivar);
  // Fim da rotina para eliminar os contornos dos furos na fresagem
end;

procedure CapturaFuros();
var
p : integer;
x : real;
xmax : real;
xmin : real;
y : real;
ymax : real;
ymin : real;
z : real;
cx: integer;
cy: integer;
ux: integer;
uy: integer;
l : integer;
ContaFuro : integer;
ZInicial : integer;
ZFinal : integer;
ContaLinha : integer;
f : string;
foi : boolean;
Confirma : boolean;
linha : string;
GLinha : String;
arquivo : textfile;

begin
 if (tx = 0) or (ty = 0) then
  showmessage(Texto05)
 else
 begin
  ux := 0;
  uy := 0;
  x := 0;
  xmax := 0;
  xmin := 0;
  y := 0;
  ymax := 0;
  ymin := 0;
  //z := 0;
  l := 0;
  f := '';
  ContaFuro := 0;
  ContaLinha := 0;
  ZFinal := 0;
  Confirma := false;
  foi := false;
  Limpa();
  //FrmPrincipal.Notebook1.PageIndex := 7;
  FrmPrincipal.Image5.Hide;
  FrmPrincipal.memo3.Clear;
  FrmPrincipal.memo3.Append(Texto06);
  FrmPrincipal.memo3.Append(Texto07);
  FrmPrincipal.memo3.Append(Texto08 +  Imagem + ' )');
  FrmPrincipal.memo3.Append(Texto09 + PlacaX + ' Cm    Y = ' + PlacaY + ' Cm )');
  FrmPrincipal.memo3.Append(Texto10);
  FrmPrincipal.memo3.Append('G90');
  FrmPrincipal.memo3.Append('G21');
  FrmPrincipal.memo3.Append('M08');
  FrmPrincipal.memo3.Append('M03 S' + IntToStr(ZVS));
  FrmPrincipal.memo3.Append('M07');
  l := l + 1;
  GLinha := 'N' + inttostr(l) + ' G01 X' + copy(floattostr(x),0,4 + pos(',',floattostr(x))) + ' Y' + copy(floattostr(y),0,3 + pos(',',floattostr(y))) + ' Z' + floattostr(ZP) + f ;
  if FrmPrincipal.SMPonto.Checked then
   begin
    GLinha := VirgPonto(GLinha);
   end;
  FrmFuros.Edit1.Caption := '';
  FrmPrincipal.memo3.Append(GLinha);
  if FileExists('XYZCord.txt') then
  begin
  assignfile(arquivo,'XYZCord.txt');
   reset(arquivo);
   while (not EOF(arquivo)) do
   begin
    readln(arquivo,linha);
    // Contagem das linhas do arquivo
    ContaLinha :=  ContaLinha + 1;
    if (copy(linha,1,1) = 'X') then
    begin
     p := pos('|',linha);
     x := strtoint((copy(linha,5,p - 6)));
     y := strtoint((copy(linha,p + 5,length(linha) - (p + 4))));
     if not foi then
     Begin
      // Carrega o valor inicial das coordenadas em mm.
      xmax := x;
      ymax := y;
      xmin := x;
      ymin := y;
      foi := true;
     end;
     // Caso o valor de x ou y tenha se alterado, guarda a variação maxima e minima
     if (x > xmax) then xmax := x;
     if (y > ymax) then ymax := y;
     if (x < xmin) then xmin := x;
     if (y < ymin) then ymin := y;
    end;
    // Se a linha é da coordenada Z fechou um bloco continuo, então testa as
    // diferenças entre os maximos e minimos para ver se é maior do que seria um furo.
    //if (copy(linha,1,5) = 'Z = -') then
    if ((copy(linha,1,1) = 'Z') and (copy(linha,1,5) <> 'Z = -'))then
    begin
     // Guarda o número da última linha da coordenada Z
     ZInicial := ZFinal;
     // Guarda o número da linha atual da coordenada Z
     ZFinal := ContaLinha;
     foi := false;
     //Verifica se o valor da quantidade de pixels maximo é maior do que o minimo e se a diferença entre eles convertido para milimetros ("... / tx")
     // aplicando-se o fator de ajuste de tamanho do furo ("/ 5 * FrmFuros.TrackBar3.Position") é menór do que 2.
     if ((xmax >= xmin) and (((xmax - xmin) / tx / 5 * FrmFuros.TrackBar3.Position) < 2) and (ymax >= ymin) and (((ymax - ymin) / ty / 5 * FrmFuros.TrackBar3.Position) < 2) and (z > 0)) then
     begin
      // Encontra o ponto central do furo
      x := (xmin + ((xmax - xmin) / 2));
      y := (ymin + ((ymax - ymin) / 2));
      // Verifica se existe algum ponto em volta do xy com uma distancia menor que 2 mm
      Confirma := true;
      // Faz uma varredura em volta do furo a uma distancia que depende do fator de ajuste da relação entre o furo e a borda da trilha.
      for cx := round(x - (FrmFuros.TrackBar1.Position / 2)) to round(x + (FrmFuros.TrackBar1.Position / 2)) do
      Begin
       for cy := round(y - (FrmFuros.TrackBar1.Position / 2)) to round(y + (FrmFuros.TrackBar1.Position / 2)) do
       //if (Pixel_OUT[cx,tpy - cy] <> 'R') then image3.Canvas.Pixels[cx,tpy - cy] := clBlue;
       Begin

        if ((Pixel_OUT[cx,tpy - cy] <> 'B') and not
           (((cx > x - trunc(FrmFuros.TrackBar2.Position / 2)) and (cx < x + trunc(FrmFuros.TrackBar2.Position / 2))) and
           ((cy > y - trunc(FrmFuros.TrackBar2.Position / 2)) and (cy < y + trunc(FrmFuros.TrackBar2.Position / 2)))))  then


           // ------------------------------------------
        //   (((cx > x - trunc(FrmFuros.TrackBar2.Position / 2)) and (cx < x + trunc(FrmFuros.TrackBar2.Position / 2))) and
        //    ((cy > y - trunc(FrmFuros.TrackBar2.Position / 2)) and (cy < y + trunc(FrmFuros.TrackBar2.Position / 2)))) and not
        //   (((cx = round(x + (FrmFuros.TrackBar1.Position / 2))) and (cy = round(y + (FrmFuros.TrackBar1.Position / 2)))) or
        //    ((cx = round(x + (FrmFuros.TrackBar1.Position / 2))) and (cy = round(y - (FrmFuros.TrackBar1.Position / 2)))) or
        //    ((cx = round(x - (FrmFuros.TrackBar1.Position / 2))) and (cy = round(y + (FrmFuros.TrackBar1.Position / 2)))) or
        //    ((cx = round(x - (FrmFuros.TrackBar1.Position / 2))) and (cy = round(y - (FrmFuros.TrackBar1.Position / 2))))) )  then
           Begin
            Confirma := false;
            // Usado nos testes
            //FrmPrincipal.image5.Canvas.Pixels[cx,tpy - cy] := clRed;
           End
           else
           Begin
            // Usado nos testes
            //FrmPrincipal.image5.Canvas.Pixels[cx,tpy - cy] := clBlue;
           End;
       End;
      End;
      if Confirma then
      Begin
       ContaFuro := ContaFuro + 1;
       FrmFuros.Edit1.Caption := IntToStr(ContaFuro);
       // Guarda intervalo de coordenadas que representam o furo
       ZInic[ContaFuro] := ZInicial + 2;
       ZFim[ContaFuro] := ZFinal + 1;
       //FrmPrincipal.memo2.Append(IntToStr(ContaFuro) + ' - ' + IntToStr(ZInicial - 1) + ' - ' + IntToStr(ZFinal));
       if (((ux <> 0) and (uy <> 0))) then
       begin
        FrmPrincipal.Image5.Canvas.Pen.Color:= $0FF7D7;
        FrmPrincipal.Image5.Canvas.Line(ux, uy, round(x), tpy - round(y));
        FrmPrincipal.image5.Canvas.Pixels[ux,uy] := ClBlack;
       end;
       FrmPrincipal.image5.Canvas.Pixels[round(x),(tpy - round(y))] := ClBlack;
       ux := round(x);
       uy := tpy - round(y);
       l := l + 1;
       f := ' F' + inttostr(vfz);
       GLinha := 'N' + inttostr(l) + ' G00 X' + copy(floattostr(x / tx),0,4 + pos(',',floattostr(x / tx))) + ' Y' + copy(floattostr(y / ty),0,3 + pos(',',floattostr(y / ty))) + ' Z'+ floattostr(ZP);
       if FrmPrincipal.SMPonto.Checked then
       begin
        GLinha := VirgPonto(GLinha);
       end;
       FrmPrincipal.memo3.Append(GLinha);
       l := l + 1;
       GLinha := 'N' + inttostr(l) + ' G01 X' + copy(floattostr(x / tx),0,4 + pos(',',floattostr(x / tx))) + ' Y' + copy(floattostr(y / ty),0,3 + pos(',',floattostr(y / ty))) + ' Z-' + floattostr(ZPF) + f ;
       if FrmPrincipal.SMPonto.Checked then
       begin
        GLinha := VirgPonto(GLinha);
       end;
       FrmPrincipal.memo3.Append(GLinha);
       l := l + 1;
       GLinha := 'N' + inttostr(l) + ' G00 X' + copy(floattostr(x / tx),0,4 + pos(',',floattostr(x / tx))) + ' Y' + copy(floattostr(y / ty),0,3 + pos(',',floattostr(y / ty))) + ' Z' + floattostr(ZP);
       if FrmPrincipal.SMPonto.Checked then
       begin
        GLinha := VirgPonto(GLinha);
       end;
       FrmPrincipal.memo3.Append(GLinha);
      end;
     end;
    end;
   end;
   x := 0;
   y := 0;
   l := l + 1;
   GLinha := 'N' + inttostr(l) + ' G00 X' + copy(floattostr(x / tx),0,4 + pos(',',floattostr(x / tx))) + ' Y' + copy(floattostr(y / ty),0,3 + pos(',',floattostr(y / ty))) + ' Z' + floattostr(ZP);
   if FrmPrincipal.SMPonto.Checked then
   begin
    GLinha := VirgPonto(GLinha);
   end;
   FrmPrincipal.memo3.Append(GLinha);
   //FrmFuros.Edit1.Caption := IntToStr(ContaFuro); // IntToStr(round((l-2) / 3));
   // Comandos finais do arquivo de furação.
   GLinha := 'M05';
   FrmPrincipal.memo3.Append(GLinha);
   GLinha := 'M09';
   FrmPrincipal.memo3.Append(GLinha);
   GLinha := 'M18';
   FrmPrincipal.memo3.Append(GLinha);
   GLinha := 'M02';
   FrmPrincipal.memo3.Append(GLinha);
   closefile(arquivo);
  end;
 end;
 FrmPrincipal.SMMapaFresagemsf.Enabled := True;
 FrmPrincipal.SMGeraFresagemsf.Enabled := True;
 FrmPrincipal.Image5.Show;
end;


procedure TFrmFuros.FormShow(Sender: TObject);
 var
 i:integer;
Begin
 Limpa();
 TrackBar1.Position := Round(tx);
 TrackBar2.Position := Round(ty);
 Shape1.Height := (5 + TrackBar1.Position) * 4;
 Shape1.Width := (5 + TrackBar1.Position) * 4;
 Shape1.Top := Round((Panel1.Height / 2) - ((5 + TrackBar1.Position) * 4 / 2));
 Shape1.Left := Round((Panel1.Height / 2) - ((5 + TrackBar1.Position) * 4 / 2));
 Shape2.Height := (2 + TrackBar2.Position) * 2;
 Shape2.Width := (2 + TrackBar2.Position) * 2;
 Shape2.Top := Round((Panel1.Height / 2) - ((2 + TrackBar2.Position)));
 Shape2.Left := Round((Panel1.Height / 2) - ((2 + TrackBar2.Position)));
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
End;

procedure TFrmFuros.BtnCapturarClick(Sender: TObject);
begin
 CapturaFuros();
 FrmPrincipal.ScrollBar3.Max := round(FrmPrincipal.image5.Height);
 FrmPrincipal.ScrollBar3.Min := 0;
 FrmPrincipal.ScrollBar3.Position := 0;
 FrmPrincipal.ScrollBar4.Max := round(FrmPrincipal.image5.Width);
 FrmPrincipal.ScrollBar4.Min := 0;
 FrmPrincipal.ScrollBar4.Position := 0;
 FrmPrincipal.SMSalvaGCodeFuros.Enabled := true;
 if FrmPrincipal.SMSalvaGCodeFresagem.Enabled then FrmPrincipal.SMSalvaGCodeUnico.Enabled := true;
end;

procedure TFrmFuros.BtnGeraGCodeFurosClick(Sender: TObject);
begin
  TiraMarcaFuros();
  FrmFuros.Close;
end;

procedure TFrmFuros.BtnIncluirClick(Sender: TObject);
var
L : integer;
GLinha : String;

begin
 If (Label5.Caption <> 'X =') then
 Begin
  FrmPrincipal.Memo3.Lines.Delete(FrmPrincipal.Memo3.Lines.Count -1);
  FrmPrincipal.Memo3.Lines.Delete(FrmPrincipal.Memo3.Lines.Count -1);
  FrmPrincipal.Memo3.Lines.Delete(FrmPrincipal.Memo3.Lines.Count -1);
  FrmPrincipal.Memo3.Lines.Delete(FrmPrincipal.Memo3.Lines.Count -1);
  FrmPrincipal.Memo3.Lines.Delete(FrmPrincipal.Memo3.Lines.Count -1);
  L := FrmPrincipal.Memo3.Lines.Count - 9;
  GLinha := 'N' + inttostr(l) + ' G00 X' + copy(Label5.Caption,5,4 + pos(',',Label5.Caption) - 4) + ' Y' + copy(Label6.Caption,5,3 + pos(',',Label6.Caption) - 4) + ' Z'+ floattostr(ZP);
  if FrmPrincipal.SMPonto.Checked then
  begin
   GLinha := VirgPonto(GLinha);
  end;
  FrmPrincipal.memo3.Append(GLinha);
  l := l + 1;
  GLinha := 'N' + inttostr(l) + ' G00 X' + copy(Label5.Caption,5,4 + pos(',',Label5.Caption) - 4) + ' Y' + copy(Label6.Caption,5,3 + pos(',',Label6.Caption) - 4) + ' Z-'+ floattostr(ZPF) + ' F' + inttostr(vfz) ;
  if FrmPrincipal.SMPonto.Checked then
  begin
   GLinha := VirgPonto(GLinha);
  end;
  FrmPrincipal.memo3.Append(GLinha);
  l := l + 1;
  GLinha := 'N' + inttostr(l) + ' G00 X' + copy(Label5.Caption,5,4 + pos(',',Label5.Caption) - 4) + ' Y' + copy(Label6.Caption,5,3 + pos(',',Label6.Caption) - 4) + ' Z'+ floattostr(ZP);
  if FrmPrincipal.SMPonto.Checked then
  begin
   GLinha := VirgPonto(GLinha);
  end;
  FrmPrincipal.memo3.Append(GLinha);
  l := l + 1;
  GLinha := 'N' + inttostr(l) + ' G00 X0 Y0 Z' + floattostr(ZP);
  FrmPrincipal.memo3.Append(GLinha);
  // Comandos finais do arquivo.
  GLinha := 'M05';
  FrmPrincipal.memo3.Append(GLinha);
  GLinha := 'M09';
  FrmPrincipal.memo3.Append(GLinha);
  GLinha := 'M18';
  FrmPrincipal.memo3.Append(GLinha);
  GLinha := 'M02';
  FrmPrincipal.memo3.Append(GLinha);
  Label5.Caption := 'X =';
  Label6.Caption := 'Y =';
  ShowMessage(Texto16);
 end;
end;

procedure TFrmFuros.BtnExcluirClick(Sender: TObject);
Var
N : integer;
X : String;
XL: String;
Y : String;
YL: String;
Ex: boolean;
begin
 If (Label5.Caption <> 'X =') then
 Begin
  Ex := False;
  // Seleciona os primerios digitos antes do separador decimal.
  x := copy(Label5.Caption, 5, (length(Label5.Caption)));
  x := copy(X, 1, (pos(',', X) - 1));
  // Seleciona os primerios digitos antes do separador decimal.
  Y := copy(Label6.Caption, 5, (length(Label6.Caption)));
  Y := copy(Y, 1, (pos(',', Y) - 1));
  FrmPrincipal.Memo3.SelStart:= 1;
  For N := 11 to FrmPrincipal.Memo3.Lines.Count - 5 do
  Begin
   // Varre o Memo em busca de comandos com a mesma coordenada
   YL := copy(FrmPrincipal.Memo3.Lines[N], pos('Y',FrmPrincipal.Memo3.Lines[N]) + 1 , Length(FrmPrincipal.Memo3.Lines[N]));
   XL := copy(FrmPrincipal.Memo3.Lines[N], pos('X',FrmPrincipal.Memo3.Lines[N]) + 1 , Length(FrmPrincipal.Memo3.Lines[N]) - Length(YL));
   // Verifica se os dados estão formatados com ponto para extrair os dados
   if (FrmPrincipal.SMPonto.Checked) then
   begin
    YL := copy(YL, 1 , pos('.', YL) -1);
    XL := copy(XL, 1 , pos('.', XL) -1);
   end;
   // Verifica se os dados estão formatados com virgula para extrair os dados
   if (FrmPrincipal.SMVirgula.Checked) then
   begin
    YL := copy(YL, 1 , pos(',', YL) -1);
    XL := copy(XL, 1 , pos(',', XL) -1);
   end;
   // Caso as coordenadas coincidirem comenta a linha
   if ((X = XL) and (Y = YL) and (copy(FrmPrincipal.Memo3.Lines[N], 1, 1) <> '(')) then
    begin
     FrmPrincipal.Memo3.Lines[N] := '(' + FrmPrincipal.Memo3.Lines[N] + ')';
     Ex := True;
    end;
  end;
  Label5.Caption := 'X =';
  Label6.Caption := 'Y =';
  If (Ex) then
   Begin
    ShowMessage(Texto14);
   end
   else
   Begin
    ShowMessage(Texto15);
   end;
 end;
end;

procedure TFrmFuros.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  TiraMarcaFuros();
end;

procedure TFrmFuros.TrackBar1Change(Sender: TObject);
begin
 Shape1.Height := (5 + TrackBar1.Position) * 4;
 Shape1.Width := (5 + TrackBar1.Position) * 4;
 Shape1.Top := Round((Panel1.Height / 2) - ((5 + TrackBar1.Position) * 4 / 2));
 Shape1.Left := Round((Panel1.Height / 2) - ((5 + TrackBar1.Position) * 4 / 2));
end;

procedure TFrmFuros.TrackBar2Change(Sender: TObject);
begin
  Shape2.Height := (2 + TrackBar2.Position) * 2;
  Shape2.Width := (2 + TrackBar2.Position) * 2;
  Shape2.Top := Round((Panel1.Height / 2) - ((2 + TrackBar2.Position)));
  Shape2.Left := Round((Panel1.Height / 2) - ((2 + TrackBar2.Position)));
end;


initialization
  {$I UFuros.lrs}

end.

