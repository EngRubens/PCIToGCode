unit UMedidas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, ComCtrls;

type

  { TFrmMedida }

  TFrmMedida = class(TForm)
    BtnOK: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure BtnOKClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmMedida: TFrmMedida;

implementation

{ TFrmMedida }

uses
  UPrincipal;

procedure Atualisar();
  begin
    tx := (TPX / FrmMedida.UpDown1.Position * 10);
    ty := (TPY / FrmMedida.UpDown2.Position * 10);
    FrmMedida.Label8.Caption := 'X => ' + formatFloat('0.00',tx) + Texto03;
    FrmMedida.Label9.Caption := 'Y => ' + FormatFloat('0.00',ty) + Texto03;
    FrmMedida.Label10.Caption := 'DPI => ' + IntToStr(Round(25.4 * tx));
  end;

procedure TFrmMedida.FormShow(Sender: TObject);
var
 i:integer;
begin
  image1.Picture.Bitmap := FrmPrincipal.Image2.Picture.Bitmap;
  edit1.Text := StringReplace(edit1.Text, ThousandSeparator, '.', [rfReplaceAll]);
  edit2.Text := StringReplace(edit2.Text, ThousandSeparator, '.', [rfReplaceAll]);
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

procedure TFrmMedida.BtnOKClick(Sender: TObject);
begin
  tx := (TPX / UpDown1.Position * 10);
  ty := (TPY / UpDown2.Position * 10);
  PlacaX := Edit1.Text;
  PlacaY := Edit2.Text;
  FrmPrincipal.SMGeraFresagem.Enabled := True;
  FrmPrincipal.SMGeraFuracao.Enabled := True;
  FrmPrincipal.SMGeraRecorte.Enabled := True;
  FrmMedida.Close;
end;

procedure TFrmMedida.Edit1Change(Sender: TObject);
begin
 try
  if(edit1.Text <> '') then
  begin
   edit1.Text := StringReplace(edit1.Text, ThousandSeparator, '.', [rfReplaceAll]);
   UpDown1.Position:= round(StrToFloat(edit1.Text) * 100);
   Atualisar();
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmMedida.Edit2Change(Sender: TObject);
begin
   try
  if(edit2.Text <> '') then
  begin
   edit2.Text := StringReplace(edit2.Text, ThousandSeparator, '.', [rfReplaceAll]);
   UpDown2.Position:= round(StrToFloat(edit2.Text) * 100);
   Atualisar();
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmMedida.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  edit1.Caption := floattostr(UpDown1.Position / 100);
  Atualisar();
end;

procedure TFrmMedida.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  edit2.Caption := floattostr(UpDown2.Position / 100);
  Atualisar();
end;


initialization
  {$I UMedidas.lrs}

end.

