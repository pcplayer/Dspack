unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSUtil, StdCtrls, DSPack, DirectShow9, Menus, ExtCtrls;

type
  TVideoForm = class(TForm)
    FilterGraph: TFilterGraph;
    VideoWindow: TVideoWindow;
    MainMenu1: TMainMenu;
    Devices: TMenuItem;
    Filter: TFilter;
    Image: TImage;
    SampleGrabber: TSampleGrabber;
    SnapShot: TButton;
    CallBack: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SnapShotClick(Sender: TObject);
    procedure SampleGrabberBuffer(Sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
  private
    procedure IniMenu;
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure OnSelectDevice(Sender: TObject);
  end;

var
  VideoForm: TVideoForm;
  SysDev: TSysDevEnum;

implementation

{$R *.dfm}

procedure TVideoForm.FormCreate(Sender: TObject);
begin
  IniMenu;
end;

procedure TVideoForm.OnSelectDevice(Sender: TObject);
begin
  FilterGraph.ClearGraph;
  FilterGraph.Active := false;
  Filter.BaseFilter.Moniker := SysDev.GetMoniker(TMenuItem(Sender).Tag);
  FilterGraph.Active := true;
  with FilterGraph as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW, nil, Filter as IBaseFilter,
      SampleGrabber as IBaseFilter, VideoWindow as IBaseFilter);
  FilterGraph.Play;
end;

procedure TVideoForm.IniMenu;
var
  Device: TMenuItem;
  i: Integer;
begin
  SysDev := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  if SysDev.CountFilters > 0 then
    for i := 0 to SysDev.CountFilters - 1 do
    begin
      Device := TMenuItem.Create(Devices);
      Device.Caption := SysDev.Filters[i].FriendlyName;
      Device.Tag := i;
      Device.OnClick := OnSelectDevice;
      Devices.Add(Device);
    end;
end;

procedure TVideoForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CallBack.Checked := false;
  SysDev.Free;
  FilterGraph.ClearGraph;
  FilterGraph.Active := false;
end;

procedure TVideoForm.SnapShotClick(Sender: TObject);
begin
  SampleGrabber.GetBitmap(Image.Picture.Bitmap);
end;

procedure TVideoForm.SampleGrabberBuffer(Sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
begin
  if CallBack.Checked then
  begin
    Image.Canvas.Lock;
    try
      SampleGrabber.GetBitmap(Image.Picture.Bitmap, pBuffer, BufferLen);
    finally
      Image.Canvas.Unlock;
    end;
  end;
end;

end.
