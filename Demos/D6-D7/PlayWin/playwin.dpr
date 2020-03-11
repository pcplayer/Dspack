program playwin;

uses
  Forms,
  main in 'main.pas' {FormPlayWin},
  SelectURL in 'SelectURL.pas' {FormSelectURL},
  Unit1 in 'Unit1.pas' {Form1},
  UFmFS in 'UFmFS.pas' {FmFS};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPlayWin, FormPlayWin);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFmFS, FmFS);
  Application.Run;
end.
