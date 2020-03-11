unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DSPack, StdCtrls, ComCtrls, dsutil, Buttons, ToolWin,
  ImgList, SelectURL, Vcl.ExtCtrls;

  
type
  TFormPlayWin = class(TForm)
    FilterGraph: TFilterGraph;
    MainMenu: TMainMenu;
    OpenDialog: TOpenDialog;
    FileMenu: TMenuItem;
    OpenMenu: TMenuItem;
    OpenURLMenu: TMenuItem;
    ExitMenu: TMenuItem;
    TrackBar: TDSTrackBar;
    ImageList: TImageList;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    btPlay: TToolButton;
    btPause: TToolButton;
    btStop: TToolButton;
    ToolButton1: TToolButton;
    SoundLevel: TTrackBar;
    btFullScreen: TToolButton;
    PopupMenu: TPopupMenu;
    Play1: TMenuItem;
    Pause1: TMenuItem;
    Stop1: TMenuItem;
    FullScreen1: TMenuItem;
    log: TMemo;
    ToolButton2: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    VideoWindow: TVideoWindow;
    Edit1: TEdit;
    N4: TMenuItem;
    Edit2: TEdit;
    N5: TMenuItem;
    procedure OpenMenuClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btPlayClick(Sender: TObject);
    procedure btPauseClick(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure TrackBarTimer(sender: TObject; CurrentPos,
      StopPos: Cardinal);
    procedure SoundLevelChange(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure OpenURLMenuClick(Sender: TObject);
    procedure btFullScreenClick(Sender: TObject);
    procedure FilterGraphDSEvent(sender: TComponent; Event, Param1,
      Param2: Integer);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);

  private
    { Déclarations privées }
    VMRBitmap: TVMRBitmap;
    FFullScreen: Boolean;
  public
    { Déclarations publiques }
  end;

var
  FormPlayWin: TFormPlayWin;

implementation
uses DirectShow9, Unit1, UFmFS;

{$R *.dfm}

procedure TFormPlayWin.OpenMenuClick(Sender: TObject);
begin
  VMRBitmap:= TVMRBitmap.Create(VideoWindow);
  if OpenDialog.Execute then
  begin
    if not FilterGraph.Active then FilterGraph.Active := true;
    FilterGraph.ClearGraph;
    FilterGraph.RenderFile(OpenDialog.FileName);
    VideoWindow.PopupMenu := PopupMenu;
    SoundLevel.Position := FilterGraph.Volume;
    FilterGraph.Play;

     Edit1.Text := ('¾ä±úHandle = ' + IntToStr(Self.Handle));
  end;
end;

procedure TFormPlayWin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // Important
  FilterGraph.ClearGraph;
end;

procedure TFormPlayWin.N2Click(Sender: TObject);
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    VideoWindow.VMRGetBitmap(AStream);

    AStream.Position := 0;
    Form1.Image1.Picture.Bitmap.LoadFromStream(AStream);

    Form1.show;
  finally
    AStream.Free;
  end;
end;

procedure TFormPlayWin.N3Click(Sender: TObject);
begin
  with VMRBitmap, Canvas do
  begin
    LoadEmptyBitmap(300,200,pf24bit, clSilver);
    Source := VMRBitmap.Canvas.ClipRect;
    Options := VMRBitmap.Options + [vmrbSrcColorKey];
    ColorKey := clSilver;
    Brush.Color := clSilver;
    Font.Color := clWhite;
    Font.Style := [fsBold];
    Font.Size := 30;
    Font.Name := 'Arial';
    TextOut(0,0,'Hello Word :)');
    DrawTo(0,0,1,1,0.5);
  end;

end;

procedure TFormPlayWin.N4Click(Sender: TObject);
var
  i: LongWord;
begin

  VideoWindow.VMR9.GetBorderColor(i);
  ShowMessage('Border Clor = ' + INtToStr(i));
end;

procedure TFormPlayWin.N5Click(Sender: TObject);
var
  i: DWord;
begin
  i := StrToInt(Edit2.Text);
  i := VideoWindow.VMR9.SetBorderColor(i);

  if i <> S_OK then ShowMessage(IntToStr(i));

end;

procedure TFormPlayWin.btPlayClick(Sender: TObject);
begin
  if not FilterGraph.Active then OpenMenuClick(nil)
                            else FilterGraph.play;


  Edit1.Text := ('¾ä±úHandle = ' + IntToStr(Self.Handle));
end;

procedure TFormPlayWin.btPauseClick(Sender: TObject);
begin
  FilterGraph.Pause;
end;

procedure TFormPlayWin.btStopClick(Sender: TObject);
begin
  FilterGraph.Stop;
end;

procedure TFormPlayWin.TrackBarTimer(sender: TObject; CurrentPos,
  StopPos: Cardinal);
begin
  StatusBar.SimpleText := format('Position: %s Duration: %s',
    [TimeToStr(CurrentPos / MiliSecPerDay), TimeToStr(StopPos / MiliSecPerDay)])
end;

procedure TFormPlayWin.SoundLevelChange(Sender: TObject);
begin
  FilterGraph.Volume := SoundLevel.Position;
end;

procedure TFormPlayWin.ExitMenuClick(Sender: TObject);
begin
  FormPlayWin.Close;
end;

procedure TFormPlayWin.OpenURLMenuClick(Sender: TObject);
begin
  FormSelectURL:= TFormSelectURL.Create(nil);
  if FormSelectURL.ShowModal = mrOK then
  begin
    if not FilterGraph.Active then FilterGraph.Active := true;
    FilterGraph.ClearGraph;
    FilterGraph.RenderFile(FormSelectURL.URL.Text);
    VideoWindow.PopupMenu := PopupMenu;
    SoundLevel.Position := FilterGraph.Volume;
    FilterGraph.Play;
  end;
  FormSelectURL.Free;
end;

procedure TFormPlayWin.btFullScreenClick(Sender: TObject);
var
  ARect: TRect;
begin
  {
  VideoWindow.FullScreen := not VideoWindow.FullScreen;
  btFullScreen.Down := VideoWindow.FullScreen;
   }


  {
  if VideoWindow.Parent = FmFS then
  begin
   VideoWindow.Parent := Panel1;
   //VideoWindow.VMR9.SetVideoClippingWindow(Panel1.Handle);
   VideoWindow.VMR9.SetVideoClippingWindow(VideoWindow.Handle);
   FmFS.Hide;
  end
  else
  begin
    VideoWindow.Parent := FmFS;

    FmFS.WindowState := wsMaximized;
    FmFS.BorderStyle := bsNone;
    FmFS.Show;
    FmFS.FormStyle := fsStayOnTop;
    //VideoWindow.VMR9.SetVideoClippingWindow(FMFS.Handle);
    VideoWindow.VMR9.SetVideoClippingWindow(VideoWindow.Handle);
  end;
  }

  if not FilterGraph.Active then Exit;
  if not (FilterGraph.State in [gsPlaying, gsPaused])  then Exit;



  if not FFullScreen then
  begin
    if not Assigned(FmFS) then FmFS := TFmFS.Create(Application);

    FmFS.WindowState := wsMaximized;
    FmFS.BorderStyle := bsNone;
    FmFS.Show;
    //FmFS.FormStyle := fsStayOnTop;

    ARect := Rect(0, 0, FmFS.Width, FmFS.Height);
    VideoWindow.VMR9.SetVideoClippingWindow(FMFS.Handle);
    VideoWindow.VMR9.SetVideoPosition(nil, @ARect);
  end
  else
  begin

    ARect := Rect(0, 0, VideoWindow.Width, VideoWindow.Height);
    VideoWindow.VMR9.SetVideoClippingWindow(VideoWindow.Handle);
    VideoWindow.VMR9.SetVideoPosition(nil, @ARect);
    FreeAndNil(FmFS);
  end;

  FFullScreen := not FFullScreen;
end;

procedure TFormPlayWin.FilterGraphDSEvent(sender: TComponent; Event,
  Param1, Param2: Integer);
begin
  log.Lines.Add(GetEventCodeDef(event))
end;

end.
