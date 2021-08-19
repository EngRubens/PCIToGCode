unit UZInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ComCtrls, ExtCtrls;

type

  { TFrmZInfo }

  TFrmZInfo = class(TForm)
    Bevel1: TBevel;
    BtnOK: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    procedure BtnOKClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmZInfo: TFrmZInfo;

implementation

{ TFrmZInfo }

uses
  UPrincipal;

procedure TFrmZInfo.FormShow(Sender: TObject);
var
 i:integer;
begin
  Edit1.Text := FloatToStr(ZF);
  Edit2.Text := FloatToStr(ZP);
  Edit3.Text := FloatToStr(ZPF);
  Edit4.Text := FloatToStr(ZR);
  Edit5.Text := FloatToStr(ZRP);
  Edit6.Text := FloatToStr(ZRA);
  Edit7.Text := IntToStr(ZVS);
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

procedure TFrmZInfo.BtnOKClick(Sender: TObject);
begin
  ZF := StrToFloat(edit1.Caption);
  ZP := StrToFloat(edit2.Caption);
  ZPF:= StrToFloat(edit3.Caption);
  ZR := StrToFloat(edit4.Caption);
  ZRP:= StrToInt(edit5.Caption);
  ZRA:= StrToFloat(edit6.Caption);
  ZVS:= StrToInt(edit7.Caption);
  FrmZInfo.close;
end;

procedure TFrmZInfo.Edit1Change(Sender: TObject);
begin
 try
  if(edit1.Text <> '') then
  begin
   edit1.Text := StringReplace(edit1.Text, ThousandSeparator, '.', [rfReplaceAll]);
   UpDown1.Position:= round(StrToFloat(edit1.Text) * 100);
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmZInfo.Edit1Exit(Sender: TObject);
begin
   if(edit1.Text = '') then  Edit1.Text := '0,01';
end;

procedure TFrmZInfo.Edit2Change(Sender: TObject);
begin
 try
  if(edit2.Text <> '') then
  begin
   edit2.Text := StringReplace(edit2.Text, ThousandSeparator, '.', [rfReplaceAll]);
   UpDown2.Position := round(StrToFloat(edit2.Text) * 50);
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmZInfo.Edit2Exit(Sender: TObject);
begin
  if(edit2.Text = '') then  Edit2.Text := '0,01';
end;

procedure TFrmZInfo.Edit3Change(Sender: TObject);
begin
  try
  if(edit3.Text <> '') then
  begin
   edit3.Text := StringReplace(edit3.Text, ThousandSeparator, '.', [rfReplaceAll]);
   UpDown3.Position:= round(StrToFloat(edit3.Text) * 50);
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmZInfo.Edit3Exit(Sender: TObject);
begin
  if(edit3.Text = '') then  Edit3.Text := '0,01';
end;

procedure TFrmZInfo.Edit4Change(Sender: TObject);
begin
   try
  if(edit4.Text <> '') then
  begin
   edit4.Text := StringReplace(edit4.Text, ThousandSeparator, '.', [rfReplaceAll]);
   UpDown4.Position:= round(StrToFloat(edit4.Text) * 50);
   Edit6.Text:= FloatToStr(StrToFloat(edit4.Text) / StrToInt(edit5.Text));
  end;
 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmZInfo.Edit4Exit(Sender: TObject);
begin
   if(edit4.Text = '') then  Edit4.Text := '0,02';
end;

procedure TFrmZInfo.Edit5Change(Sender: TObject);
begin
  try
  if(edit5.Text <> '') then
  begin
   edit5.Text := StringReplace(edit5.Text, ',', '', [rfReplaceAll]);
   edit5.Text := StringReplace(edit5.Text, '.', '', [rfReplaceAll]);
   if(StrToInt(edit5.Text) > 10) then edit5.Text := '10';
   if(StrToInt(edit5.Text) < 1) then edit5.Text := '1';
   UpDown5.Position:= StrToInt(edit5.Text);
   Edit6.Text:= FloatToStr(StrToFloat(edit4.Text) / StrToInt(edit5.Text));
  end;

 except
  on E: Exception do
  ShowMessage(E.message);
 end;
end;

procedure TFrmZInfo.Edit5Exit(Sender: TObject);
begin
 if(edit5.Text = '') then edit5.Text := '1';
end;

procedure TFrmZInfo.Edit7Change(Sender: TObject);
begin
 try
 if(edit7.Text <> '') then
 begin
  edit7.Text := StringReplace(edit7.Text, ',', '', [rfReplaceAll]);
  edit7.Text := StringReplace(edit7.Text, '.', '', [rfReplaceAll]);
  if(StrToInt(edit7.Text) > 50000) then edit7.Text := '50000';
  if(StrToInt(edit7.Text) < 1) then edit7.Text := '0';
 end;

except
 on E: Exception do
 ShowMessage(E.message);
end;
end;

procedure TFrmZInfo.Edit7Exit(Sender: TObject);
begin
   if(edit5.Text = '') then edit5.Text := '0';
end;



procedure TFrmZInfo.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  edit1.Caption := floattostr(updown1.Position / 100);
end;

procedure TFrmZInfo.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  edit2.Caption := floattostr(updown2.Position / 50);
end;

procedure TFrmZInfo.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
   edit3.Caption := floattostr(updown3.Position / 50);
end;

procedure TFrmZInfo.UpDown4Click(Sender: TObject; Button: TUDBtnType);
begin
  edit4.Caption := floattostr(updown4.Position / 50);
end;

procedure TFrmZInfo.UpDown5Click(Sender: TObject; Button: TUDBtnType);
begin
  edit5.Caption := IntToStr(updown5.Position);
end;

initialization
  {$I UZInfo.lrs}

end.

