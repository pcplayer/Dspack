unit UPushBMP;

interface


type
  IPushBMP=interface(IUnknown)
  ['{F0220048-2650-4EE9-823B-4B710C1DD034}']
    procedure PushBMP(BMP:PChar;ASize:Integer);safecall;
  end;

implementation

end.
