unit Qgoto;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFormGotoQuestion = class(TForm)
    ListBox1: TListBox;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGotoQuestion: TFormGotoQuestion;

implementation
uses Teacher;
{$R *.DFM}

procedure TFormGotoQuestion.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TFormGotoQuestion.FormShow(Sender: TObject);
begin
 ListBox1.Items.Assign(FormInstructor.ComboBoxQuestions.Items);
end;

end.
