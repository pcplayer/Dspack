unit UFmFS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFmFS = class(TForm)
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmFS: TFmFS;

implementation

uses  main;

{$R *.dfm}

procedure TFmFS.FormDblClick(Sender: TObject);
begin
  FormPlayWin.btFullScreenClick(Self);
end;

end.
