unit UVelocidade;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ComCtrls, ExtCtrls;

type

  { TFrmVelocidade }

  TFrmVelocidade = class(TForm)
    Bevel1: TBevel;
    BtnOK: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    procedure BtnOKClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmVelocidade: TFrmVelocidade;

implementation

{ TFrmVelocidade }

uses
  UPrincipal;

procedure TFrmVelocidade.FormShow(Sender: TObject);
var
 i:integer;
begin
  edit1.Caption := inttostr(VFZ);
  edit2.Caption := inttostr(VFXY);
  edit3.Caption := inttostr(VRXY);
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

procedure TFrmVelocidade.BtnOKClick(Sender: TObject);
begin
  VFZ := strtoint(edit1.Caption);
  VFXY := strtoint(edit2.Caption);
  VRXY := strtoint(edit3.Caption);
  frmvelocidade.Close;
end;

procedure TFrmVelocidade.Edit1Change(Sender: TObject);
begin
 try
  if(edit1.Text <> '') then
  begin
   UpDown1.Position:= round(StrToFloat(edit1.Text));
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmVelocidade.Edit2Change(Sender: TObject);
begin
 try
  if(edit2.Text <> '') then
  begin
   UpDown2.Position:= round(StrToFloat(edit2.Text));
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmVelocidade.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  edit1.Text := inttostr(updown1.Position);
end;

procedure TFrmVelocidade.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
 edit2.Text := inttostr(updown2.Position);
end;

procedure TFrmVelocidade.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
   edit3.Text := inttostr(updown3.Position);
end;



initialization
  {$I UVelocidade.lrs}

end.
