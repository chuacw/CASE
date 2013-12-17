unit Login;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    EditInstructorName: TEdit;
    Label2: TLabel;
    EditPassword: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation
{$R *.DFM}


end.
