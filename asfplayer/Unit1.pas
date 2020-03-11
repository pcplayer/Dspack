unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSPack, StdCtrls;

type
  TForm1 = class(TForm)
    FilterGraph1: TFilterGraph;
    ASFWriter1: TASFWriter;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    FilterGraph2: TFilterGraph;
    VideoWindow1: TVideoWindow;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IF FilterGraph1.Active then begin
      FilterGraph1.ClearGraph;
      FilterGraph1.Active:=false;
   end;
   IF FilterGraph2.Active then begin
      FilterGraph2.ClearGraph;
      FilterGraph2.Active:=false;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   if opendialog1.Execute then begin
      FilterGraph1.ClearGraph;
      FilterGraph1.Active:=true;
      FilterGraph1.RenderFile(opendialog1.FileName);
      FilterGraph1.Play;

      if CheckBox1.Checked then begin
         FilterGraph2.ClearGraph;
         FilterGraph2.Active:=true;
         FilterGraph2.RenderFile('mms://localhost:'+inttostr(ASFWriter1.Port));
         FilterGraph2.Play;
      end;
   end;
end;

end.
