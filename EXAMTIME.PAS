unit Examtime;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Spin, Grids, Calendar;

type
  TFormExamTime = class(TForm)
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    CalendarExamDate: TCalendar;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
      private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExamTime: TFormExamTime;

implementation

{$R *.DFM}

procedure TFormExamTime.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

end.
