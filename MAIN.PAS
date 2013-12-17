unit Main;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, Outline, Menus, StdCtrls, ExtCtrls;

type
  TFormTrainee = class(TForm)
    MainMenu1: TMainMenu;
    Tests1: TMenuItem;
    Exit1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    PanelImage: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    ScrollBox1: TScrollBox;
    Label2: TLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTrainee: TFormTrainee;

implementation

{$R *.DFM}

end.
