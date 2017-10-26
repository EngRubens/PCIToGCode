unit UCMedidas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls;

type

  { TFrmCMedidas }

  TFrmCMedidas = class(TForm)
    BtnCalcularx: TButton;
    BtnCalculary: TButton;
    BtnPonto1x: TButton;
    BtnPonto2x: TButton;
    BtnPonto1y: TButton;
    BtnPonto2y: TButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Label1x: TLabel;
    Label2x: TLabel;
    Label1: TLabel;
    Label3x: TLabel;
    Label1y: TLabel;
    Label2y: TLabel;
    Label3y: TLabel;
    procedure BtnCalcularxClick(Sender: TObject);
    procedure BtnCalcularyClick(Sender: TObject);
    procedure BtnPonto1xClick(Sender: TObject);
    procedure BtnPonto1yClick(Sender: TObject);
    procedure BtnPonto2xClick(Sender: TObject);
    procedure BtnPonto2yClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmCMedidas: TFrmCMedidas;

implementation

{ TFrmCMedidas }

uses
  UPrincipal, UMedidas;

procedure TFrmCMedidas.BtnPonto1xClick(Sender: TObject);
begin
  Label1x.Caption:= FloatToStr((FrmPrincipal.Image3.Picture.Bitmap.Width * pcxi) / FrmPrincipal.Image3.Width);
end;

procedure TFrmCMedidas.BtnPonto1yClick(Sender: TObject);
begin
  Label1y.Caption:= FloatToStr((FrmPrincipal.Image3.Picture.Bitmap.Height * pcyi) / FrmPrincipal.Image3.Height);
end;

procedure TFrmCMedidas.BtnCalcularxClick(Sender: TObject);
begin
  if (StrToFloat(Label1x.Caption) > StrToFloat(Label2x.Caption)) then
    begin
    Label3x.Caption := FloatToStr((StrToFloat(Label1x.Caption) - StrToFloat(Label2x.Caption)) / 2.54);
    end;
  if (StrToFloat(Label1x.Caption) < StrToFloat(Label2x.Caption)) then
    begin
    Label3x.Caption := FloatToStr((StrToFloat(Label2x.Caption) - StrToFloat(Label1x.Caption)) / 2.54);
    end;
     Button1.Enabled := true;
end;

procedure TFrmCMedidas.BtnCalcularyClick(Sender: TObject);
begin
     if (StrToFloat(Label1y.Caption) > StrToFloat(Label2y.Caption)) then
    begin
    Label3y.Caption := FloatToStr(((StrToFloat(Label1y.Caption) - StrToFloat(Label2y.Caption)) / 2.54));
    end;
  if (StrToFloat(Label1y.Caption) < StrToFloat(Label2y.Caption)) then
    begin
    Label3y.Caption := FloatToStr(((StrToFloat(Label2y.Caption) - StrToFloat(Label1y.Caption)) / 2.54));
    end;
     Button1.Enabled := true;
end;

procedure TFrmCMedidas.BtnPonto2xClick(Sender: TObject);
begin
    Label2x.Caption := FloatToStr((FrmPrincipal.Image3.Picture.Bitmap.Width * pcxi) / FrmPrincipal.Image3.Width);
end;

procedure TFrmCMedidas.BtnPonto2yClick(Sender: TObject);
begin
  Label2y.Caption := FloatToStr((FrmPrincipal.Image3.Picture.Bitmap.Height * pcyi) / FrmPrincipal.Image3.Height);
end;

procedure TFrmCMedidas.Button1Click(Sender: TObject);
begin
  if (Label3x.Caption <> '') or (Label3y.Caption <> '') then
  begin
    if (Label3x.Caption <> '') then
    begin
      PlacaX := formatFloat('0.00',(tpx / (StrToFloat(Label3x.Caption)) / 10));
    end;
    if (Label3y.Caption <> '') then
    begin
      PlacaY := formatFloat('0.00',(tpy / (StrToFloat(Label3y.Caption)) / 10));
    end;
     if (Label3x.Caption = '') then
    begin
      PlacaX := formatFloat('0.00',(tpx / (StrToFloat(Label3y.Caption)) / 10));
    end;
    if (Label3y.Caption = '') then
    begin
      PlacaY := formatFloat('0.00',(tpy / (StrToFloat(Label3x.Caption)) / 10));
    end;
    FrmMedida.Edit1.Text := Placax;
    FrmMedida.Edit2.Text := Placay;
    FrmCMedidas.Close;
  end;

  FrmMedida.ShowModal;
  FrmPrincipal.SMGeraFresagem.Enabled := True;
  FrmPrincipal.SMGeraFuracao.Enabled := True;
  FrmPrincipal.image3.Picture.Graphic.Assign(b);
end;


procedure TFrmCMedidas.FormShow(Sender: TObject);
begin
   Label1x.Caption := '';
   Label2x.Caption := '';
   Label3x.Caption := '';
   Label1y.Caption := '';
   Label2y.Caption := '';
   Label3y.Caption := '';
   PlacaX := '';
   PlacaY := '';
   FrmMedida.Edit1.Text := Placax;
   FrmMedida.Edit2.Text := Placay;
   Button1.Enabled := false;
end;

initialization
  {$I UCMedidas.lrs}

end.

