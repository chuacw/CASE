unit Instruct;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons;

type
   TFormInstruction = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    BitBtnOk: TBitBtn;
    Bevel1: TBevel;
    BitBtnHelpHowToUse: TBitBtn;
    BitBtnAbort: TBitBtn;
    LabelWarning: TLabel;
    BlinkTimer1: TTimer;
    procedure BitBtnHelpHowToUseClick(Sender: TObject);
    procedure BlinkTimer1Timer(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInstruction: TFormInstruction;

implementation
uses Intro;
{$R *.DFM}

procedure TFormInstruction.BitBtnHelpHowToUseClick(Sender: TObject);
begin
 FormIntro := TFormIntro.Create(Self);
 FormIntro.ShowModal;
 FormIntro.Free;
end;

procedure TFormInstruction.BlinkTimer1Timer(Sender: TObject);
begin
 if LabelWarning.Font.Color = LabelWarning.Color then
  LabelWarning.Font.Color := clRed else
  LabelWarning.Font.Color := LabelWarning.Color;
end;

procedure TFormInstruction.BitBtnOkClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TFormInstruction.FormDestroy(Sender: TObject);
begin
 BlinkTimer1.Enabled := False;
end;

end.
