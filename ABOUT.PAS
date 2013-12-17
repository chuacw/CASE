unit About;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormAbout = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    Timer1: TTimer;
    PanelAbout: TPanel;
    Image1: TImage;
    MemoAbout: TMemo;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.DFM}

procedure TFormAbout.Timer1Timer(Sender: TObject);
var
 P1, P2: TPoint;
begin
 P1 := ScrollBox1.ClientToScreen(Point(0, PanelAbout.Top+PanelAbout.Height));
 P2 := ClientToScreen(Point(0, ScrollBox1.Top));
 if P1.Y<P2.Y then
  begin
   PanelAbout.Top := ScrollBox1.Top+ScrollBox1.Height+2;
  end else
  begin
   ScrollBox1.ScrollBy(0, -1);
  end;
end;

end.
