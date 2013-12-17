unit Margins;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, Spin;

type
  TFormMargins = class(TForm)
    SpinEditTop: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinEditRight: TSpinEdit;
    SpinEditLeft: TSpinEdit;
    SpinEditBottom: TSpinEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    Measurement: Integer;
  public
    { Public declarations }
    Margins: TRect;
  end;

var
  FormMargins: TFormMargins;

implementation

{$R *.DFM}

procedure TFormMargins.FormCreate(Sender: TObject);
begin
 Margins := Rect(1, 1, 1, 1);
end;

procedure TFormMargins.FormActivate(Sender: TObject);
begin
 SpinEditTop.Value := Margins.Top;
 SpinEditBottom.Value := Margins.Bottom;
 SpinEditRight.Value := Margins.Right;
 SpinEditLeft.Value := Margins.Left;
end;

procedure TFormMargins.BitBtn1Click(Sender: TObject);
begin
 ModalResult := mrOk;
 Margins.Top := SpinEditTop.Value;
 Margins.Bottom := SpinEditBottom.Value;
 Margins.Right := SpinEditRight.Value;
 Margins.Left := SpinEditLeft.Value;
end;

end.
