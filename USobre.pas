unit USobre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, LCLIntf;

type

  { TFrmSobre }

  TFrmSobre = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmSobre: TFrmSobre;

implementation

{ TFrmSobre }


procedure TFrmSobre.Button1Click(Sender: TObject);
begin
  FrmSobre.Close;
end;

procedure TFrmSobre.Button2Click(Sender: TObject);
begin
   OpenURL('https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4PTSTUHFA64GE');
end;



initialization
  {$I USobre.lrs}

end.

