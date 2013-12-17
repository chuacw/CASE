unit Showprog;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Gauges, StdCtrls, ExtCtrls, Buttons;

type
  TFormProgress = class(TForm)
    Panel1: TPanel;
    Gauge: TGauge;
    GaugeText1: TLabel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    GaugeText2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgress: TFormProgress;

implementation

{$R *.DFM}

end.
