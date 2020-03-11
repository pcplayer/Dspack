program VMRPlayWin;

uses
  Forms,
  main in 'main.pas' {FormPlayWin},
  SelectURL in 'SelectURL.pas' {FormSelectURL},
  UFmFullScren2 in 'UFmFullScren2.pas' {FmFullScren};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPlayWin, FormPlayWin);
  Application.CreateForm(TFmFullScren, FmFullScren);
  Application.Run;
end.
