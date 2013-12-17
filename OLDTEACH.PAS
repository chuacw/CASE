unit Teacher;
{ The components stored inside the Question file will consist of the following
  The exam question(MemoQuestion), the possible answers(AnswerMemo1..5)
   and the answer(RadioButton) }
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, Tabs, ExtCtrls, StdCtrls, Buttons;

type
  TMemoMode = (tmNone, tmAdd, tmEdit, tmDelete);
  TUserMode = (tuInstructor, tuTrainee, tuMarker);
  TAnswer = Longint;
 TIndexFile = File of Longint;
const
  TAnswerSize = SizeOf(TAnswer);
type

  TQuestionBank = class;

  TViewMode = (tvViewExam, tvViewBank);


  TPanel = class(ExtCtrls.TPanel)
  public
   property Canvas;
  end;

  TFormInstructor = class(TForm)
    MainMenuInstructor: TMainMenu;
    Exam1: TMenuItem;
    ExamNew: TMenuItem;
    ExamOpen: TMenuItem;
    ExamSave: TMenuItem;
    ExamSaveAs: TMenuItem;
    PanelStatus: TPanel;
    PanelMain: TPanel;
    PanelNoQuestions: TPanel;
    PanelTime: TPanel;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N12hr1: TMenuItem;
    N24hr1: TMenuItem;
    MainMenuPopupMenu: TPopupMenu;
    Move1: TMenuItem;
    ShortCut1: TMenuItem;
    PanelFastAccess: TPanel;
    ExamDelete: TMenuItem;
    PanelToolBar: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnAdd: TBitBtn;
    BitBtnDelete: TBitBtn;
    BitBtnFindNext: TBitBtn;
    BitBtnFind: TBitBtn;
    BitBtnEdit: TBitBtn;
    FindDialog: TFindDialog;
    ComboBoxQuestions: TListBox;
    PanelExamName: TPanel;

{   Must never absolutely change position! Code depends on this!
    PanelScrollLock, PanelINS, PanelCAPS, PanelNUM }
    PanelScrollLock: TPanel;
    PanelINS: TPanel;
    PanelCAPS: TPanel;
    PanelNUM: TPanel;
    PanelAllMemos: TPanel;
    MemoQuestion: TMemo;
    ScrollBox1: TScrollBox;
    PanelRadioButtons: TPanel;
    PanelAnswers: TPanel;

{ RadioButtons must not change position! Code depends on this! }
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    PanelAnswer5: TPanel;

{ AnswerMemos must not change position! Code depends on this! }
    AnswerMemo1: TMemo;
    AnswerMemo2: TMemo;
    AnswerMemo3: TMemo;
    AnswerMemo4: TMemo;
    AnswerMemo5: TMemo;
    PanelAnswer4: TPanel;
    PanelAnswer3: TPanel;
    PanelAnswer2: TPanel;
    PanelAnswer1: TPanel;
    PanelNRIC: TPanel;
    MainMenuTrainee: TMainMenu;
    Exam3: TMenuItem;
    MyNameIs: TMenuItem;
    N3: TMenuItem;
    ExitTrainee: TMenuItem;
    N2: TMenuItem;
    ExamSelect: TMenuItem;
    Bank1: TMenuItem;
    BankNew: TMenuItem;
    BankOpen: TMenuItem;
    BankDelete: TMenuItem;
    N4: TMenuItem;
    BankExit: TMenuItem;
    View1: TMenuItem;
    ViewExam: TMenuItem;
    ViewBank: TMenuItem;
    N1: TMenuItem;
    BankImport: TMenuItem;
    N5: TMenuItem;
    MarkPaper: TMenuItem;
    QuestionGoto: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PanelTimeDblClick(Sender: TObject);
    procedure N12hr1Click(Sender: TObject);
    procedure N24hr1Click(Sender: TObject);
    procedure BankExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure ComboBoxQuestionsClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure FindDialogFind(Sender: TObject);
    procedure AnswerMemo1Click(Sender: TObject);
    procedure BitBtnFindClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MyNameIsClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure BankSaveClick(Sender: TObject);
    procedure BankSaveAsClick(Sender: TObject);
    procedure BankNewClick(Sender: TObject);
    procedure BankOpenClick(Sender: TObject);
    procedure BankDeleteClick(Sender: TObject);
    procedure ViewExamClick(Sender: TObject);
    procedure ViewBankClick(Sender: TObject);
    procedure BankImportClick(Sender: TObject);
    procedure ExamSelectClick(Sender: TObject);
    procedure ExamNewClick(Sender: TObject);
    procedure ExamOpenClick(Sender: TObject);
    procedure MarkPaperClick(Sender: TObject);
    procedure QuestionGotoClick(Sender: TObject);
  protected
    { Private declarations }
    TimeFormat: Boolean;
    ExamFileName, ExamDescription: string;
    fMode: TMemoMode;
    fNoDiagrams, fNoAnswers, fNoQuestions: Integer;
    AtQuestion: Longint;
    stModified: Bool;
    stToggles: array[0..3] of Bool;
    fFileNameWithoutExt: string;
    procedure SetNoDiagrams(const Value: Integer);
    procedure SetNoAnswers(const Value: Integer);
    procedure SetNoQuestions(const Value: Integer);
    property NoDiagrams: Integer read fNoDiagrams write SetNoDiagrams;
    property NoAnswers: Integer read fNoAnswers write SetNoAnswers;
    property NoQuestions: Integer read fNoQuestions write SetNoQuestions;
    procedure SetFileNameWithoutExt(const Value: string);
    procedure SetQuestionPos(Index: Integer; const Value: Longint);
    function GetQuestionPos(Index: Integer): Longint;
    procedure SetViewMode(ViewMode: TViewMode);
    procedure DeleteIndex(var IndexFile: TIndexFile; Index: Word);
  public
    { Public declarations }
    QuestionsDone: array[0..100] of Boolean;
    MarkingPaper, Dirty: Bool;
    FileName,
    QFindText, AFindText: String;
    QuestionBank: TQuestionBank;
    function RadioButtonsChecked: Bool;
    procedure LoadBankFile(AFile: string);
    procedure LoadExamFile(AFile: string);
    function LoadQuestion: Bool;
    function SaveQuestion: Bool;
    procedure CheckButtons;
    function WarnFileOpen: Integer;
    function SaveBankFile: Bool;
    procedure RebuildQuestionsList;
    property FileNameWithoutExt: string
             read fFileNameWithoutExt
             write SetFileNameWithoutExt;
    property QuestionPos[Index: Integer]: Longint read GetQuestionPos write SetQuestionPos;
  end;

  TTransferMemo = class(TMemo)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TQuestionAnswer = class
  private
   fQuestionBank: TQuestionBank;
   fQuestion: TStringList;
   fAnswers: array[0..4] of TStringList;
   fAnswer: Word;
  function GetAnswers(Index: Integer): TStringList;
  public
   property Question: TStringList read fQuestion;
   property Answers[Index: Integer]: TStringList read GetAnswers;
   property Answer: Word read fAnswer write fAnswer;
   constructor Create(const AQuestionBank: TQuestionBank);
   destructor Destroy; override;
   procedure Store;
   procedure Clear;
  end;

  TQuestionBank = class
  protected
   fFileName: string;
   fCount: Longint;
   fFileIndex, fExamIndex: TIndexFile;
   fFileStream: TFileStream;
   fBankPosition, fFilePosition: Longint;
   function GetCount: Longint;
   function GetSize: Longint;
   function GetFilePosition: Longint;
   procedure SetFilePosition(const NewPosition: Longint);
   function GetBankPosition: Longint;
   procedure SetBankPosition(const NewPosition: Longint);
   procedure SetIndexPosition(const NewPosition: Longint);
   function GetIndexPosition: Longint;
   function SeekBankEOF: Bool;
   function SeekIndexEOF: Bool;
  public
   property Size: Longint read GetSize;
   property Position: Longint read GetBankPosition write SetBankPosition;
   property FilePosition: Longint read GetFilePosition write SetFilePosition;
   property IndexPosition: Longint read GetIndexPosition write SetIndexPosition;
   property Count: Longint read GetCount; { Nos of Question in Bank }
   constructor Create(const AFileName: string; Mode: Word);
   destructor Destroy; override;
   function Write(AQuestionAnswer: TQuestionAnswer): Bool;
   function Read: TQuestionAnswer;
   procedure ReIndex;
   procedure PackFromIndex;
{ Returns the size of an index for 1 item }
   function IndexItemSize: Word;
{ Gets the index for an item }
   function IndexForItem(Item: Word): Longint;
   function SeekEOF: Bool;
  end;

  TExam = class(TQuestionBank)
  end;

var
  UserMode: TUserMode;
  FormInstructor: TFormInstructor;
  BankIndex, UserFile,
  TempIndex: TFileStream;
  ExamIndex: TIndexFile;

implementation
uses QGoto, FileName, UserName, Save, ShowProg{ress};
{$R *.DFM}

const
 piQuestions = 0;
 piAnswers = 1;
 piDiagrams = 2;


function GetFileNameWithoutExt(const FileName: string): string;
begin
 Result := FileName;
 System.Delete(Result, Pos('.', Result), Length(Result));
end;

procedure TTransferMemo.CreateParams(var Params: TCreateParams);
begin
 inherited CreateParams(Params);
 Params.Style := Params.Style and not WS_CHILD;
end;

constructor TQuestionBank.Create(const AFileName: string; Mode: Word);
begin
 fFileName := AFileName;
 Assign(fFileIndex, GetFileNameWithoutExt(fFileName)+'.BDX');
 if FileExists(AFileName) then
  begin { open the file in read/write mode }
   fFileStream := TFileStream.Create(fFileName, Mode);
   FileMode := Mode;
   Reset(fFileIndex);
  end else
  begin { create the file }
   fFileStream := TFileStream.Create(fFileName, fmCreate);
   Rewrite(fFileIndex);
  end;
end;

function TQuestionBank.GetFilePosition: Longint;
begin
 Result := fFileStream.Position;
end;

procedure TQuestionBank.SetFilePosition(const NewPosition: Longint);
begin
 fFileStream.Position := NewPosition;
end;

function TQuestionBank.GetBankPosition: Longint;
var
 PositionFromIndex: Longint;
begin
 Result := fBankPosition;
end;

{ NewPosition is a number starting from 0 }
procedure TQuestionBank.SetBankPosition(const NewPosition: Longint);
var
 PositionFromIndex: Longint;
begin
 try
  System.Seek(fFileIndex, NewPosition);
  System.Read(fFileIndex, PositionFromIndex);
 except
  PositionFromIndex := 0;
 end;
 fBankPosition := NewPosition;
 fFileStream.Position := PositionFromIndex;
end;

{ Warning! Calling this function directly will desynchronise the
  integration between the Question Bank and the index file,
  use with care! }
procedure TQuestionBank.SetIndexPosition(const NewPosition: Longint);
begin
 try
  System.Seek(fFileIndex, NewPosition);
 except
 end;
end;

function TQuestionBank.GetIndexPosition: Longint;
begin
 Result := System.FilePos(fFileIndex);
end;

function TQuestionBank.SeekBankEOF: Bool;
begin
 fFileStream.Seek(0, soFromEnd);
end;

function TQuestionBank.SeekIndexEOF: Bool;
begin
 Seek(fFileIndex, FileSize(fFileIndex));
end;

function TQuestionBank.SeekEOF: Bool;
begin
 SeekIndexEOF;
 SeekBankEOF;
end;

function TQuestionBank.Read;
var
{ Warning! The following variables must be signed }
 I, J, ACount, ACount2, ACount3: Integer;
 Answer: Word; S: string;
begin
 Result := TQuestionAnswer.Create(Self);
 fFileStream.Read(ACount, SizeOf(ACount));
 for I := 0 to ACount-1 do
  begin
   fFileStream.Read(S[0], SizeOf(S[0]));
   fFileStream.Read(S[1], Length(S));
   Result.Question.Add(S);
  end;
 fFileStream.Read(ACount2, SizeOf(ACount2));
 fFileStream.Read(ACount3, SizeOf(ACount3));
 for I := ACount2 to ACount3 do
  begin
   fFileStream.Read(ACount, SizeOf(ACount));
   for J := 0 to ACount-1 do
    begin
     fFileStream.Read(S[0], SizeOf(S[0]));
     fFileStream.Read(S[1], Length(S));
     Result.Answers[I].Add(S);
    end;
  end;
 fFileStream.Read(Answer, SizeOf(Answer));
 Result.Answer := Answer;
end;

{ Packs the Question Bank from the index.
  This assumes that, for e.g, originally,
  index 0 points to item 0 in Question Bank
  When changes occur, such as index 0 points to item 1 in Question Bank,
  item 0 is no longer valid. Thus item 0 needs to be removed from the
  Question Bank }
procedure TQuestionBank.PackFromIndex;
begin
end;

{ Assumes that access is given to write to file,
  and reindexing is based on the Question Bank being existing and
  the index being missing }
procedure TQuestionBank.ReIndex;
var
 AQuestionAnswer: TQuestionAnswer;
 PositionForIndex: Longint;
begin
 FilePosition := 0;
 System.Seek(fFileIndex, 0);
 PositionForIndex := FilePosition;
 while PositionForIndex<fFileStream.Size do
  begin
   PositionForIndex := FilePosition;
   System.Write(fFileIndex, PositionForIndex);
   AQuestionAnswer := Read;
   AQuestionAnswer.Free;
  end;
end;

{ Generic function }
function TQuestionBank.IndexItemSize;
begin
 Result := SizeOf(Longint);
end;

{ Generic function, can be used in future databases }
function TQuestionBank.IndexForItem(Item: Word): Longint;
var
 SaveFilePos: Longint;
begin
 SaveFilePos := System.FilePos(fFileIndex); { Save index file position }
 System.Seek(fFileIndex, Item);
 System.Read(fFileIndex, Result);
 System.Seek(fFileIndex, SaveFilePos); { restore index file position }
end;

function TQuestionBank.Write(AQuestionAnswer: TQuestionAnswer): Bool;
var
 I, J, ACount, ACount2, ACount3: Integer;
 S: string; Answer: Word;
 PositionForIndex: Longint;
begin
 PositionForIndex := FilePosition;
 System.Write(fFileIndex, PositionForIndex);
 ACount := AQuestionAnswer.fQuestion.Count;
 fFileStream.Write(ACount, SizeOf(ACount));
 for I := 0 to ACount-1 do
  begin
   S := AQuestionAnswer.fQuestion.Strings[I];
   fFileStream.Write(S, Length(S)+1);
  end;
 ACount3 := High(AQuestionAnswer.fAnswers);
 ACount2 := Low(AQuestionAnswer.fAnswers);
 fFileStream.Write(ACount2, SizeOf(ACount2));
 fFileStream.Write(ACount3, SizeOf(ACount3));
 for I := Low(AQuestionAnswer.fAnswers) to High(AQuestionAnswer.fAnswers) do
  begin
   ACount := AQuestionAnswer.Answers[I].Count;
   fFileStream.Write(ACount, SizeOf(ACount));
   for J := 0 to ACount-1 do
    begin
     S := AQuestionAnswer.Answers[I].Strings[J];
     fFileStream.Write(S, Length(S)+1);
    end;
  end;
 Answer := AQuestionAnswer.Answer;
 fFileStream.Write(Answer, SizeOf(Answer));
end;

destructor TQuestionBank.Destroy;
begin
 { close the file here }
 System.Close(fFileIndex);
 fFileStream.Free;
 inherited Destroy;
end;

function TQuestionBank.GetCount;
begin { Return some value here }
 Result := 0;
end;

function TQuestionBank.GetSize;
begin { Return some value here }
 Result := FileSize(fFileIndex);
end;

constructor TQuestionAnswer.Create(const AQuestionBank: TQuestionBank);
var
 I: Word;
begin
 fQuestionBank := AQuestionBank;
 fAnswer := $FFFF;
 fQuestion := TStringList.Create;
 for I := Low(fAnswers) to High(fAnswers) do
  fAnswers[I] := TStringList.Create;
end;

destructor TQuestionAnswer.Destroy;
var
 I: Word;
begin
 for I := Low(fAnswers) to High(fAnswers) do
  fAnswers[I].Free;
 fQuestion.Free;
 inherited Destroy;
end;

procedure TQuestionAnswer.Store;
begin
end;

procedure TQuestionAnswer.Clear;
var
 I: Word;
begin
 for I := Low(fAnswers) to High(fAnswers) do
  fAnswers[I].Clear;
 fQuestion.Clear;
end;

function TQuestionAnswer.GetAnswers(Index: Integer): TStringList;
begin
 Result := fAnswers[Index];
end;

procedure TFormInstructor.SetQuestionPos(Index: Integer; const Value: Longint);
begin
end;

procedure TFormInstructor.SetViewMode(ViewMode: TViewMode);
begin
 ViewExam.Checked := ViewMode=tvViewExam;
 ViewBank.Checked := ViewMode=tvViewBank;
end;

function TFormInstructor.GetQuestionPos(Index: Integer): Longint;
begin
 TempIndex.Position := SizeOf(Longint)*Index;
 TempIndex.Read(Result, SizeOf(Longint));
end;

procedure TFormInstructor.SetNoQuestions(const Value: Integer);
begin
 fNoQuestions := Value;
 PanelNoQuestions.Caption := Format('%d qns, %d ans',
                                    [fNoQuestions, fNoAnswers, fNoDiagrams]);
end;

procedure TFormInstructor.SetNoAnswers(const Value: Integer);
var
 DoneStr: string;
 I: Integer;
begin
 fNoAnswers := Value;
 DoneStr := Format('%d qns, %d ans',
                   [fNoQuestions, fNoAnswers, fNoDiagrams]);
 if (fNoAnswers<>0) and (fNoAnswers=fNoQuestions) then
  begin
   if MessageDlg('You''ve finished the exam! Do you want to submit the exam?',
                 mtInformation, [mbYes, mbNo], 0)=mrYes then
    begin
     Close;
    end;
  end else
  begin
   DoneStr := Format('%d qns, %d ans Not Done: ',
                   [fNoQuestions, fNoAnswers, fNoDiagrams]);
   for I := Low(QuestionsDone) to fNoQuestions-1 do
    if not QuestionsDone[I] then
     DoneStr := DoneStr+Format('%02d ', [I]);
   while PanelNoQuestions.Canvas.TextWidth(DoneStr)>PanelNoQuestions.Width do
    begin
     Delete(DoneStr, Length(DoneStr)-3, 3);
    end;
  end;
 PanelNoQuestions.Caption := DoneStr;
end;

procedure TFormInstructor.SetNoDiagrams(const Value: Integer);
begin
 fNoDiagrams := Value;
 PanelNoQuestions.Caption := Format('%d qns, %d ans, %d diagrams',
                                    [fNoQuestions, fNoAnswers, fNoDiagrams]);
end;

procedure TFormInstructor.SetFileNameWithoutExt(const Value: string);
begin
 fFileNameWithoutExt := Value;
 System.Delete(fFileNameWithoutExt, Pos('.', fFileNameWithoutExt),
               Length(fFileNameWithoutExt));
end;

procedure TFormInstructor.FormCreate(Sender: TObject);
var
 I: Word;
begin
 for I := Low(QuestionsDone) to High(QuestionsDone) do
  QuestionsDone[I] := False;
 QuestionBank := nil;
 UserFile := nil;
 QFindText := '';
 AFindText := '';
 N12Hr1.Click;
 BankIndex := nil;
 TempIndex := nil;
 MarkingPaper := False; Dirty := False;
 MemoQuestion.Clear;
 PanelExamName.Caption := 'Description of exam';
 NoDiagrams := 0; NoQuestions := 0; NoAnswers := 0;
 ComboBoxQuestions.Enabled := False;
 case UserMode of
  tuInstructor:
  begin
   PanelToolBar.Visible := True;
   Caption := 'Instructor Mode';
   SetViewMode(tvViewBank);
  end;
  tuTrainee:
  begin
   Menu := MainMenuTrainee;
   SetViewMode(tvViewExam);
   LoadBankFile(ParamStr(1));
   LoadExamFile(ParamStr(1));
   { Load question and answers }
   RebuildQuestionsList;
   ComboBoxQuestions.ItemIndex := 0;
   PostMessage(Handle, WM_COMMAND, MyNameIs.Command, 0);
  end;
 end;
end;

procedure TFormInstructor.Timer1Timer(Sender: TObject);
type
 TMySearchRec = record
    Fill: array[1..21] of char;
    Attr: Byte;
    Time: Longint;
    Size: Longint;
    Name: string[12];
    Reserved: array[0..30] of Char;
 end;
const
 vkconsts: array[0..3] of Word=(vk_Scroll, vk_Insert, vk_Capital, vk_NumLock);
 PanelColor: array[Boolean] of TColor=(clGray, clBlack);
 RightStr: array[False..True] of string[5]=('Wrong','Right');
var
{ tmScrollLock, tmNumLock, tmCapital, tmInsert: Bool; }
 Toggles: array[0..3] of Bool;
 Panels: array[0..3] of TPanel absolute PanelScrollLock;
 I: Integer;
 RightAnswer, UserAnswer: TAnswer;
 MySearchRec: TMySearchRec;
 F: TSearchRec absolute MySearchRec;
 Rights, FResult: Integer;
 ATextFile: TextFile;
 AnswerFilePos: Longint;
 AQuestionAnswer: TQuestionAnswer;
begin
{ Wait until TempIndex is opened before scanning for all answer files }
 if ((UserMode=tuMarker) or (UserMode=tuInstructor)) and
    Assigned(QuestionBank) and MarkingPaper then
  begin { Continually scan for all answers }
   MarkingPaper := False; { Prevent reentry unless remarked }
   FillChar(MySearchRec, SizeOf(MySearchRec), 0);
   FResult := FindFirst('*.UAS', faAnyFile, F);
   if FResult=0 then
    begin
{ Begin create answers here }
     AssignFile(ATextFile, 'RESULTS.TXT');
     Rewrite(ATextFile);
     FormProgress.Caption := 'Marking Exam in Progress';
     FormProgress.Show;
     while FResult=0 do
      begin
       try
        FileMode := fmOpenRead;
        Reset(ExamIndex);
        UserFile := nil; Rights := 0;
        UserFile := TFileStream.Create(F.Name, fmOpenRead or fmShareExclusive);
        WriteLn(ATextFile, 'Answers for IC: ', Copy(F.Name, 1, 8));
        WriteLn(ATextFile, '------------------------');
        QuestionBank.Position := 0;
        System.Seek(ExamIndex, 0);
        for I := 1 to FileSize(ExamIndex) do
         begin
          WriteLn(ATextFile, Format('Question %2.2d', [I]));
          System.Read(ExamIndex, AnswerFilePos);
          QuestionBank.Position := AnswerFilePos;
          AQuestionAnswer := QuestionBank.Read;
          RightAnswer := AQuestionAnswer.Answer;
          AQuestionAnswer.Free;
          UserFile.Read(UserAnswer, SizeOf(UserAnswer));
          UserAnswer := UserAnswer xor $FF50;
          if RightAnswer=UserAnswer then
           Inc(Rights);
          WriteLn(ATextFile, 'Exam answer: ', Chr(Ord('A')+RightAnswer),
                 ' User answer: ', Chr(Ord('A')+UserAnswer), ' ',
                 RightStr[RightAnswer=UserAnswer]);
         end;
        WriteLn(ATextFile, Format('Trainee got %2.2d answers right!', [Rights]));
        WriteLn(ATextFile, Format('Percentage right: %4.2f', [Rights*100/I]));
       finally
        UserFile.Free;
       end;
       FResult := FindNext(F);
      end;
     CloseFile(ATextFile);
    end;
   FindClose(F);
  end;
 if TimeFormat then
  PanelTime.Caption := FormatDateTime('hh:mm:ss', Time) else
  PanelTime.Caption := FormatDateTime('hh:mm:ss am/pm', Time);
 ComboBoxQuestions.Enabled := Assigned(QuestionBank) or (UserMode=tuTrainee);
 for I := Low(vkconsts) to High(vkconsts) do
  begin
   Toggles[I] := Bool(GetKeyState(vkconsts[I]) and 1);
   if stToggles[I]<>Toggles[I] then
    begin
     stToggles[I] := Toggles[I];
     Panels[I].Font.Color := PanelColor[Toggles[I]];
    end;
  end;
{ tmScrollLock := (GetKeyState(vk_Scroll) and 1);
 tmInsert  := (GetKeyState(vk_Insert) and 1);
 tmCapital := (GetKeyState(vk_Capital) and 1);
 tmNumLock  := (GetKeyState(vk_NumLock) and 1);
 if stScrollLock<>tmScrollLock then
  begin
   stLock := tmScrollLock;
   if stInsert then
    PanelScrollLock.Font.Color := clBlack else
    PanelScrollLock.Font.Color := clGray
  end;
 if stInsert<>tmInsert then
  begin
   stInsert := tmInsert;
   if stInsert then
    PanelINS.Font.Color := clBlack else
    PanelINS.Font.Color := clGray
  end;
 if stCapital<>tmCapital then
  begin
   stCapital := tmCapital;
   if stCapital then
    PanelCAPS.Font.Color := clBlack else
    PanelCAPS.Font.Color := clGray
  end;
 if stNumLock<>tmNumLock then
  begin
   stNumLock := tmNumLock;
   if stNumLock then
    PanelNUM.Font.Color := clBlack else
    PanelNUM.Font.Color := clGray
  end; }
 CheckButtons;
{ PanelNoQuestions.Caption := Format('%x qns, %x ans, %x diagrams',
                                    [NoQuestions, NoAnswers, NoDiagrams]); }
end;

{ Called every timer tick @ 1 second }
procedure TFormInstructor.CheckButtons;
begin
 BitBtnEdit.Enabled := (UserMode=tuInstructor) and (NoQuestions>0);
 BitBtnOk.Enabled := (fMode<>tmNone) and (RadioButtonsChecked);
 BitBtnCancel.Enabled := fMode<>tmNone;
 BitBtnAdd.Enabled := (Assigned(QuestionBank)) and (fMode<>tmAdd);
 BankImport.Enabled := Assigned(QuestionBank);
{ ExamSave.Enabled := Assigned(TempIndex);
 ExamSaveAs.Enabled := Assigned(TempIndex);
 ExamFind.Enabled := BitBtnFind.Enabled;
 ExamFindNext.Enabled := BitBtnFindNext.Enabled; }
end;

procedure TFormInstructor.PanelTimeDblClick(Sender: TObject);
begin
 if TimeFormat then
  N12Hr1.Click else
  N24Hr1.Click;
end;

procedure TFormInstructor.N12hr1Click(Sender: TObject);
var
 I: Integer;
begin
 TimeFormat := False;
 for I := PopUpMenu1.Items.Count-1 downto 0 do
  TMenuItem(PopUpMenu1.Items[I]).Checked := False;
 TMenuItem(Sender).Checked := True;
end;

procedure TFormInstructor.N24hr1Click(Sender: TObject);
var
 I: Integer;
begin
 TimeFormat := True;
 for I := PopUpMenu1.Items.Count-1 downto 0 do
  TMenuItem(PopUpMenu1.Items[I]).Checked := False;
 TMenuItem(Sender).Checked := True;
end;

procedure TFormInstructor.BankExitClick(Sender: TObject);
begin
 Close;
end;

procedure TFormInstructor.FormDestroy(Sender: TObject);
begin
{ Write list out to stream }
 try
  if TFileRec(ExamIndex).Mode<>fmClosed then
   System.Close(ExamIndex);
  if UserMode=tuTrainee then
   UserFile.Free;
  TempIndex.Free;
  BankIndex.Free;
 except
 end;
end;

procedure TFormInstructor.RebuildQuestionsList;
var
 NewFilePos, I: Longint;
begin
 ComboBoxQuestions.Clear;
 if ViewExam.Checked then
  begin
   I := FileSize(ExamIndex);
   for I := 1 to FileSize(ExamIndex) do
    ComboBoxQuestions.Items.Add(Format('Question %2d', [I]));
  end else
 if ViewBank.Checked then
  begin
   for I := 1 to QuestionBank.Size do
    ComboBoxQuestions.Items.Add(Format('Question %2d', [I]));
  end;
 ComboBoxQuestions.ItemIndex := 0;
 AtQuestion := 1;
 NoQuestions := I;
 ComboBoxQuestionsClick(Self);
end;

function TFormInstructor.SaveBankFile: Bool;
begin
 try
  Screen.Cursor := crHourglass;
 finally
  Screen.Cursor := crDefault;
  Dirty := False;
 end;
end;

function TFormInstructor.WarnFileOpen: Integer;
begin
 if Assigned(TempIndex) and Dirty then
  begin
   Result := MessageDlg(Format('%s:"%s" is still open and data is not yet saved! Save?',
                               [FileName, ExamDescription]), mtWarning,
                               [mbOk, mbCancel, mbIgnore], 0);
   case Result of
    mrOk:
     begin
{      if SaveBankFile then Result := mrOk; }
      if Result<>mrOk then
       begin
        MessageDlg('Unable to save %s!', mtError, [mbOk], 0);
        Result := mrCancel;
       end;
     end
   else
   end;
  end else
  Result := mrOk;
end;

function TFormInstructor.SaveQuestion: Bool;
var
 Answer: TAnswer;
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
 AQuestionAnswer: TQuestionAnswer;
 SavedIndexPosition, SavedFilePosition: Longint;
begin
      AQuestionAnswer := TQuestionAnswer.Create(QuestionBank);
      AQuestionAnswer.Question.Assign(MemoQuestion.Lines);
      for Answer := 0 to 4 do
       begin
        AQuestionAnswer.Answers[Answer].Assign(AnswerMemos[Answer].Lines);
        AnswerMemos[Answer].Enabled := False;
       end;
      for Answer := 0 to 4 do
       if RadioButtons[Answer].Checked then
        begin
         if UserMode=tuTrainee then Answer := Answer xor $FF50;
         AQuestionAnswer.Answer := Answer;
         Break;
        end;
      SavedIndexPosition := QuestionBank.IndexPosition;
      SavedFilePosition := QuestionBank.FilePosition;
      QuestionBank.IndexPosition := ComboBoxQuestions.ItemIndex;
      QuestionBank.SeekBankEOF;
      QuestionBank.Write(AQuestionAnswer);
      AQuestionAnswer.Free;
      QuestionBank.FilePosition := SavedFilePosition;
      QuestionBank.IndexPosition := SavedIndexPosition;
end;

{ Assumes that the QuestionBank's position is set by caller already }
function TFormInstructor.LoadQuestion: Bool;
var
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
 J, K: Word;
 Answer: TAnswer;
 C: Char;
 AQuestionAnswer: TQuestionAnswer;
begin
  for J := 0 to 4 do
   RadioButtons[J].Checked := False;
  try
   AQuestionAnswer := QuestionBank.Read;
   try
   MemoQuestion.Lines.Assign(AQuestionAnswer.Question);
   for Answer := 0 to 4 do
    begin
     AnswerMemos[Answer].Lines.Assign(AQuestionAnswer.Answers[Answer]);
    end;
   case UserMode of
    tuTrainee:
     begin
      for J := 0 to 4 do
       AnswerMemos[J].ReadOnly := True;
      if Assigned(UserFile) and (UserFile.Size>=TAnswerSize*Pred(AtQuestion)) then
       begin
        UserFile.Position := TAnswerSize*Pred(AtQuestion);
        UserFile.Read(Answer, TAnswerSize);
        Answer := Answer xor $FF50;
        if Answer<=4 then RadioButtons[Answer].Checked := True;
       end;
     end;
    tuInstructor:
     begin
      for J := 0 to 4 do
       AnswerMemos[J].ReadOnly := False;
      RadioButtons[AQuestionAnswer.Answer].Checked := True;
     end;
   end;
   except
    MessageDlg('Cannot load a question', mtError, [mbOk], 0);
   end;
  finally
   AQuestionAnswer.Free;
  end;
end;

{ Runs either in instructor or trainee mode }
procedure TFormInstructor.LoadExamFile(AFile: string);
var
 AFileMode: Word;
begin
     try
      FileName := AFile;
      FileNameWithoutExt := FileName;
      ExamFileName := FileName;
      ExamDescription := GetDescription(AFile);
{      TFileStream.Create(FileNameWithoutExt+'.EDX', fmCreate); }
      AssignFile(ExamIndex, FileNameWithoutExt+'.EDX');
      if FileExists(FileNameWithoutExt+'.EDX') then
       begin
        case UserMode of
         tuTrainee: FileMode := fmOpenRead or fmShareDenyWrite;
         tuInstructor: FileMode := fmOpenReadWrite or fmShareExclusive;
        end;
        Reset(ExamIndex);
       end else Rewrite(ExamIndex);
      if UserMode = tuTrainee then
       Caption := ExamDescription else
       PanelExamName.Caption := ExamDescription;
      AtQuestion := 1;
     except
     end;
end;

procedure TFormInstructor.BitBtnAddClick(Sender: TObject);
var
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
 I: Word;
begin
 for I := 0 to 4 do
  begin
   AnswerMemos[I].Clear;
   AnswerMemos[I].Enabled := True;
   RadioButtons[I].Checked := False;
  end;
 MemoQuestion.Clear;
 MemoQuestion.Enabled := True;
 MemoQuestion.Modified := False;
 MemoQuestion.SetFocus;
 fMode := tmAdd;
 BitBtnAdd.Enabled := False;
end;

procedure TFormInstructor.BitBtnOkClick(Sender: TObject);
var
 I, J, K: Longint;
 DiffSize: Longint;
 TransferMemo: TMemo;
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
 C: Char; Lines: TStrings;
begin
{ if MemoQuestion.Modified then }
  begin
   Dirty := True;
   try
    Screen.Cursor := crHourglass;
   case fMode of
    tmAdd:
     begin
      NoQuestions := ComboBoxQuestions.Items.Count+1;
      ComboBoxQuestions.Items.Add(Format('Question %2x', [NoQuestions]));
      ComboBoxQuestions.ItemIndex := ComboBoxQuestions.Items.Count-1;
{      MemoQuestion.Lines.SaveToStream(TempBank); }
      SaveQuestion;
      BitBtnOk.Enabled := False;
      MemoQuestion.Modified := False;
     end;
    tmEdit:
     begin
      SaveQuestion;
     end;
   end;
   fMode := tmNone;
   finally
    Screen.Cursor := crDefault;
   end;
  end;
end;

procedure TFormInstructor.ComboBoxQuestionsClick(Sender: TObject);
var
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
 SavedAt, I: Word;
 Str: string[4];
begin
 if ComboBoxQuestions.Items.Count=0 then exit;
 Str := System.Copy(ComboBoxQuestions.Items[ComboBoxQuestions.ItemIndex], 10, 4);
 AtQuestion := StrToInt(Str);
 SavedAt := AtQuestion;
 if (UserMode=tuTrainee) or (ViewExam.Checked) then { Trainee mode, store answers }
  begin
   System.Seek(ExamIndex, AtQuestion-1);
   System.Read(ExamIndex, AtQuestion);
{   if not RadioButtonsChecked then
    begin
     MessageDlg(Format('You cannot skip this question!',
                       [(ComboBoxQuestions.Items.Count)-NoAnswers]),
                       mtWarning, [mbOk], 0);
     ComboBoxQuestions.ItemIndex := AtQuestion-1;
     exit;
    end else }
    begin
     if NoAnswers=ComboBoxQuestions.Items.Count then
      begin
       I := MessageDlg('You have finished all questions! Do you want to exit?',
                  mtInformation, [mbYes, mbNo], 0);
       if I = mrYes then Close;
      end;
    end;
  end;
{ This is common code for all 3 user modes }
 QuestionBank.Position := AtQuestion-1;
 AtQuestion := SavedAt;
 MemoQuestion.Enabled := False;
 MemoQuestion.Clear;
 LoadQuestion;
end;

procedure TFormInstructor.BitBtnEditClick(Sender: TObject);
var
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 I: Word;
begin
{ This code is available only to the instructor }
 BitBtnEdit.Enabled := False;
 fMode := tmEdit;
 MemoQuestion.Enabled := True;
 for I := 0 to 4 do AnswerMemos[I].Enabled := True;
 MemoQuestion.SetFocus;
 MemoQuestion.Modified := False;
end;

procedure TFormInstructor.BitBtnCancelClick(Sender: TObject);
begin
 fMode := tmNone;
 MemoQuestion.Enabled := False;
end;

procedure TFormInstructor.DeleteIndex(var IndexFile: TIndexFile; Index: Word);
var
 I: Word;
 SavedFilePos: Longint;
 FilePosition: Longint;
begin
 if FileSize(IndexFile)-1=Index then
  begin
   System.Seek(IndexFile, Index);
  end else
 for I := Index+1 to FileSize(IndexFile)-1 do
  begin
   System.Seek(IndexFile, I);
   System.Read(IndexFile, FilePosition);
   System.Seek(IndexFile, I-1);
   System.Write(IndexFile, FilePosition);
  end;
 Truncate(IndexFile);
end;

procedure TFormInstructor.BitBtnDeleteClick(Sender: TObject);
var
 ToDelete: Integer;
begin
 { Delete item here }
{ Code is available only to instructor }
 if (UserMode=tuInstructor) then
  if ComboBoxQuestions.Items.Count>1 then
   begin
    ToDelete := ComboBoxQuestions.ItemIndex;
    ComboBoxQuestions.Items.Delete(ToDelete);
    ComboBoxQuestions.ItemIndex := ToDelete-1;
    if ViewBank.Checked then
     DeleteIndex(QuestionBank.fFileIndex, ToDelete) else
    if ViewExam.Checked then
     DeleteIndex(ExamIndex, ToDelete);
    RebuildQuestionsList;
   end;
end;

procedure TFormInstructor.FindDialogFind(Sender: TObject);
begin
 { look for text inside FindText}
 { Code is available only to instructor }

end;

procedure TFormInstructor.AnswerMemo1Click(Sender: TObject);
var
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
begin
{ Common code for instructor and trainee }
  if UserMode=tuTrainee then
   RadioButtons[(Sender as TMemo).Tag].Checked := True;
end;

function TFormInstructor.RadioButtonsChecked;
var
 I: Word;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
begin
 Result := False;
 for I := 0 to 4 do
  Result := Result or RadioButtons[I].Checked;
end;

procedure TFormInstructor.BitBtnFindClick(Sender: TObject);
begin
 FindDialog.Execute;
end;

procedure TFormInstructor.RadioButton2Click(Sender: TObject);
var
 Answer: TAnswer;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
 TheItemIndex: Integer;
begin
 BitBtnOk.Enabled := True;
 if UserMode=tuTrainee then
  begin
   UserFile.Position := TAnswerSize*Pred(AtQuestion);
   for Answer := 0 to 4 do
    if RadioButtons[Answer].Checked then
     begin
      Answer := Answer xor $FF50;
      UserFile.Write(Answer, SizeOf(Answer));
      if not QuestionsDone[Pred(AtQuestion)] then
       begin
        QuestionsDone[Pred(AtQuestion)] := True;
        NoAnswers := NoAnswers + 1;
       end;
{      TheItemIndex := ComboBoxQuestions.ItemIndex;
      ComboBoxQuestions.Selected[TheItemIndex] := True; }
      Break;
     end;
  end;
end;

procedure TFormInstructor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 case UserMode of
  tuInstructor:
  begin
   CanClose := True;
  end;
  tuTrainee:
  begin
    CanClose := NoQuestions=NoAnswers;
   if not CanClose then
    MessageDlg(Format('You still have %d questions without answers!',
                       [(ComboBoxQuestions.Items.Count)-NoAnswers]),
                       mtWarning, [mbOk], 0);
  end;
 end;
end;

procedure TFormInstructor.MyNameIsClick(Sender: TObject);
var
 Created: Bool;
begin
 repeat
  UserNameForm.ShowModal;
  PanelExamName.Caption := UserNameForm.EditName.Text;
  PanelNRIC.Caption := UserNameForm.EditNRIC.Text;
  try
   UserFile := TFileStream.Create(Format('%s.UAS', [PanelNRIC.Caption]),
                                   fmCreate);
   Created := True;
  except
   Created := False;
   MessageDlg('Please correct your IC no.', mtWarning, [mbOk], 0);
  end;
 until Created
end;


procedure TFormInstructor.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TFormInstructor.BankSaveClick(Sender: TObject);
begin
 SaveBankFile;
end;

procedure TFormInstructor.BankSaveAsClick(Sender: TObject);
var
 BankSaveAs: TFormSave;
 I: Integer;
begin
 { Instantiate a copy of the Save As dialog }
 try
  BankSaveAs := TFormSave.Create(Self);
  BankSaveAs.Caption := 'Save Question Bank As';
  if BankSaveAs.ShowModal=mrOk then
   begin
    FileName := BankSaveAs.FileName;

   end;
 finally
  BankSaveAs.Free;
 end;
end;

procedure TFormInstructor.BankNewClick(Sender: TObject);
begin
 FormSave.Title := 'New Bank';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  LoadBankFile(FormSave.FileName);
end;

procedure TFormInstructor.BankOpenClick(Sender: TObject);
var
 I: Longint;
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 RadioButtons: array[0..4] of TRadioButton absolute RadioButton1;
begin
 FormSave.Title := 'Open Bank';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  begin
   try
    Screen.Cursor := crHourglass;
{ Load question banks here, includes answers }
    LoadBankFile(FormSave.FileName);
{ Load question and answers }
    RebuildQuestionsList;
   finally
    Screen.Cursor := crDefault;
   end;
  end;
end;

procedure TFormInstructor.BankDeleteClick(Sender: TObject);
begin
 FormSave.Title := 'Delete Bank';
 if (FormSave.ShowModal=mrOk) then
  begin
   if not DeleteFile(FormSave.FileName) then
    MessageDlg('Cannot delete this bank! File may be in use or missing.',
               mtWarning, [mbOk], 0);
  end;
end;

procedure TFormInstructor.ViewExamClick(Sender: TObject);
begin
 SetViewMode(tvViewExam);
 RebuildQuestionsList;
end;

procedure TFormInstructor.ViewBankClick(Sender: TObject);
begin
 SetViewMode(tvViewBank);
 RebuildQuestionsList;
end;

procedure TFormInstructor.LoadBankFile(AFile: string);
var
 Mode: Word;
begin
 if QuestionBank<>nil then QuestionBank.Free;
 case UserMode of
  tuTrainee: Mode := fmOpenRead or fmShareDenyWrite;
  tuInstructor: Mode := fmOpenReadWrite or fmShareDenyWrite;
 else
  Mode := fmOpenRead or fmShareDenyWrite;
 end;
 QuestionBank := TQuestionBank.Create(AFile, Mode);
end;

{
  Bank import implements a finite state machine that
  (ParseState) transits through the following states:
  tpsDoubleSlash, tpsAnswerType, tpsActualAnswer, tpsSlash, tpsQuestion,
  tpsAnswerList and tpsSkip17Lines.

}
procedure TFormInstructor.BankImportClick(Sender: TObject);
type
 TParseState = (tpsNone, tpsDoubleSlash, tpsAnswerType, tpsActualAnswer,
                tpsSlash, tpsQuestion, tpsAnswerList, tpsSkip17Lines);
 TAnswerState = (taNone, taAnswer, taAnswerOrSlash, taSlash);
var
 AnswerMemos: array[0..4] of TMemo absolute AnswerMemo1;
 F: TextFile;
 Line: String;
 ParseState: TParseState;
 AnswerState: TAnswerState;
 ItemsImported, AnswerI, AnswerCount, IgnoreCount: Word;
 Importing: Boolean;
 AQuestionAnswer: TQuestionAnswer;
 Stop: Bool;
 ProgressResult: Word;
begin
 if (FormSave.ShowModal=mrOk) then
  begin
  try
   QuestionBank.SeekEOF;
   AQuestionAnswer := TQuestionAnswer.Create(QuestionBank);
   FormSave.Title := 'Import Bank';
   ParseState := tpsDoubleSlash;
   AssignFile(F, FormSave.FileName);
   Reset(F); ItemsImported := 0; Importing := False;
   Stop := False;
   FormProgress.Caption := 'Importing Bank Progress';
   FormProgress.Gauge.MaxValue := 7;
   FormProgress.Gauge.Progress := 0;
   FormProgress.ModalResult := 0;
   FormProgress.BitBtn1.Kind := bkCancel;
   ProgressResult := FormProgress.ModalResult;
   while (not EOF(F)) and (not Stop) do
    begin
     Application.ProcessMessages;
     FormProgress.GaugeText2.Show;
     FormProgress.GaugeText2.Caption :=
      Format('Items imported: %02u', [ItemsImported]);
     FormProgress.GaugeText1.Caption := 'Importing';
     FormProgress.Show;
     ReadLn(F, Line);
     case ParseState of
      tpsDoubleSlash:
       if Line='\\' then
        begin
         Stop := ProgressResult<>FormProgress.ModalResult;
         if Stop then Break;
         FormProgress.Gauge.Progress := 0;
         ParseState := tpsAnswerType;
         Importing := True;
         FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
         AQuestionAnswer.Clear;
        end else
        { error } ;
      tpsAnswerType:
       if Line='MC' then
        begin
         ParseState := tpsActualAnswer;
         FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
        end else
        { error } ;
      tpsActualAnswer:
       begin
        FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
        ParseState := tpsSlash;
        if Length(Line)=1 then
        begin
         AQuestionAnswer.Answer := Ord(UpCase(Line[1]))-Ord('A');
        end else
        begin { no answer listed }
         AQuestionAnswer.Answer := $FFFF;
        end;
       end;
      tpsSlash:
        if Line='\' then
         begin
          ParseState := tpsQuestion;
          FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
         end;
      tpsQuestion:
       begin
        if Line='\' then
         begin
          ParseState := tpsAnswerList;
          AnswerState := taAnswer;
          AnswerCount := 5;
          AnswerI := 0;
         end else
         begin { add this line to the question }
          AQuestionAnswer.Question.Add(Line);
         end;
        FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
       end;
      tpsAnswerList:
       begin
        if (AnswerState=taAnswer) and (Line='\') then
         begin { Empty...No answer }
          Dec(AnswerCount);
          Inc(AnswerI);
          if AnswerCount=0 then
           begin
            IgnoreCount := 17;
            ParseState := tpsSkip17Lines;
           end;
         end else
         begin { Answer }
          AQuestionAnswer.Answers[AnswerI].Add(Line);
         end;
        FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
       end;
      tpsSkip17Lines:
       begin
        Dec(IgnoreCount);
        if IgnoreCount=0 then
         begin
          ParseState := tpsDoubleSlash;
          Importing := False; { finished importing 1 question }
          QuestionBank.Write(AQuestionAnswer);
          Inc(ItemsImported);
          FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
         end;
       end;
     end;
    end;
  finally
   AQuestionAnswer.Free;
   RebuildQuestionsList;
   FormProgress.BitBtn1.Kind := bkOk;
   if FormProgress.ModalResult=mrCancel then
    FormProgress.GaugeText1.Caption := 'Import cancelled' else
    FormProgress.GaugeText1.Caption := 'Import completed';
   FormProgress.Hide;
   FormProgress.ShowModal;
   FormProgress.Hide;
   FormProgress.GaugeText2.Hide;
  end;
  end;
end;

procedure TFormInstructor.ExamSelectClick(Sender: TObject);
var
 Index: Longint;
begin
 Index := AtQuestion;
 System.Write(ExamIndex, Index);
{
}
end;

procedure TFormInstructor.ExamNewClick(Sender: TObject);
begin
 FormSave.Title := 'New Exam';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  begin
   LoadExamFile(FormSave.FileName);
  end;
end;

procedure TFormInstructor.ExamOpenClick(Sender: TObject);
begin
 FormSave.Title := 'Open Exam';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  begin
   LoadBankFile(FormSave.FileName);
   LoadExamFile(FormSave.FileName);
  end;
end;

procedure TFormInstructor.MarkPaperClick(Sender: TObject);
begin
 FormSave.Title := 'Mark Paper';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
   begin
    MarkingPaper := True;
    LoadBankFile(FormSave.FileName);
    LoadExamFile(FormSave.FileName);
   end;
end;

procedure TFormInstructor.QuestionGotoClick(Sender: TObject);
begin
 if (ComboBoxQuestions.Items.Count>0) and (FormGotoQuestion.ShowModal=mrOk) then
  begin
   ComboBoxQuestions.ItemIndex := FormGotoQuestion.ListBox1.ItemIndex;
   ComboBoxQuestionsClick(Sender);
  end;
end;

initialization
 if ParamStr(1)='/I' then
  UserMode := tuInstructor else
 if ParamStr(1)='/M' then
  UserMode := tuMarker else
 if IsValidFileName(ParamStr(1)) then
  UserMode := tuTrainee else
 begin
  MessageDlg(Format('Exam paper %s is not valid!', [ParamStr(1)]),
             mtError, [mbOk], 0);
  Halt;
 end;
end.