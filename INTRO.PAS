unit Intro;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFormIntro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    LabelNo2: TLabel;
    LabelNo3: TLabel;
    LabelNo5: TLabel;

    BitBtn1: TBitBtn;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIntro: TFormIntro;

implementation

{$R *.DFM}



end.
