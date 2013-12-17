unit Paths;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, FileCtrl;

type
  TFormPaths = class(TForm)
    Label1: TLabel;
{ Warning! Not to move EditExamPath and EditAnswersPath below }
    EditExamPath: TEdit;
    EditAnswersPath: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPaths: TFormPaths;

implementation

{$R *.DFM}


procedure TFormPaths.SpeedButton1Click(Sender: TObject);
var
 Directory: string;
 EditPaths: array[1..2] of TEdit absolute EditExamPath;
begin
 if (Sender is TComponent) and (TComponent(Sender).Tag in [1..2]) then
  begin
   Directory := EditPaths[TComponent(Sender).Tag].Text;
   SelectDirectory(Directory, [sdAllowCreate, sdPerformCreate, sdPrompt], 0);
   EditPaths[TComponent(Sender).Tag].Text := Directory;
  end;
end;


procedure TFormPaths.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Length(EditExamPath.Text)>1 then
  if EditExamPath.Text[Length(EditExamPath.Text)]<>'\' then
   EditExamPath.Text := EditExamPath.Text+'\';
 if Length(EditAnswersPath.Text)>1 then
  if EditAnswersPath.Text[Length(EditAnswersPath.Text)]<>'\' then
   EditAnswersPath.Text := EditAnswersPath.Text+'\';
end;


end.
