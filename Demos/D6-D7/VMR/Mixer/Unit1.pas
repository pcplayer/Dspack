unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, DSUtil, Winapi.DirectShow9, ComCtrls;

type
  TFormVMRMixer = class(TForm)
    FilterGraph: TFilterGraph;
    VideoWindow: TVideoWindow;
    btRender: TButton;
    Alpha: TTrackBar;
    OpenDialog: TOpenDialog;
    CoordX: TTrackBar;
    CoordY: TTrackBar;
    Label1: TLabel;
    Button1: TButton;
    procedure btRenderClick(Sender: TObject);
    procedure AlphaChange(Sender: TObject);
    procedure CoordChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { D閏larations priv閑s }
  public
    { D閏larations publiques }
  end;

var
  FormVMRMixer: TFormVMRMixer;
  ARect: TVMR9NORMALIZEDRECT;
  BRect: TVMR9NORMALIZEDRECT;

implementation

{$R *.dfm}

procedure TFormVMRMixer.btRenderClick(Sender: TObject);
var
  S: string;
begin
  S := 'D:\MV\rael.steel.2011.minibd.720p.x264.ac3-cnscg(1).mkv';
  if OpenDialog.Execute then
  begin
    FilterGraph.ClearGraph;
    ARect.left   := 0;
    ARect.top    := 0;
    ARect.right  := CoordX.Position / 100;
    ARect.bottom := CoordY.Position / 100;
    with (VideoWindow as IVMRMixerControl9) do
    begin
      SetOutputRect(1,@ARect);
      SetAlpha(1,Alpha.Position/100);
      SetZOrder(1,0)
    end;
    FilterGraph.RenderFile(OpenDialog.FileName);
    FilterGraph.RenderFile(ExtractFilePath(Application.ExeName) + '\penguin.gif');
    //FilterGraph.RenderFile(S);
    FilterGraph.Play;
  end;
end;

procedure TFormVMRMixer.Button1Click(Sender: TObject);
begin
  //测试调整输出视频的位置
  BRect.left   := 0.5;
  BRect.top    := 0.5;
  BRect.right  := 1;
  BRect.bottom := 1;
  (VideoWindow as IVMRMixerControl9).SetOutputRect(2,@BRect);
  //(VideoWindow as IVMRMixerControl9).SetAlpha(0, 1);
end;

procedure TFormVMRMixer.AlphaChange(Sender: TObject);
begin
  (VideoWindow as IVMRMixerControl9).SetAlpha(1,Alpha.Position/100);
end;

procedure TFormVMRMixer.CoordChange(Sender: TObject);
begin
  ARect.left   := 0;
  ARect.top    := 0;
  ARect.right  := CoordX.Position / 100;
  ARect.bottom := CoordY.Position / 100;
  (VideoWindow as IVMRMixerControl9).SetOutputRect(1,@ARect);
  (VideoWindow as IVMRMixerControl9).SetOutputRect(0,@ARect);
end;

end.
