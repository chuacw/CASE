unit Examcls;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TFormExamSelectClass = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBoxExamClass: TComboBox;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExamSelectClass: TFormExamSelectClass;

implementation

{$R *.DFM}

procedure TFormExamSelectClass.BitBtn1Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

end.
