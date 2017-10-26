program PCIToGCode;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  {cthreads}
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { you can add units after this }, UPrincipal,  UOtimizar, UMedidas, UZInfo, UVelocidade,USobre,
    UFuros, defaulttranslator, UCMedidas;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmOtimizar, FrmOtimizar);
  Application.CreateForm(TFrmMedida, FrmMedida);
  Application.CreateForm(TFrmCMedidas, FrmCMedidas);
  Application.CreateForm(TFrmZInfo, FrmZInfo);
  Application.CreateForm(TFrmVelocidade, FrmVelocidade);
  Application.CreateForm(TFrmFuros, FrmFuros);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.Run;
end.

