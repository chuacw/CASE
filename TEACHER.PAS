unit Teacher;
{ The components stored inside the Question file will consist of the following
  The exam question(MemoQuestion), the possible answers(AnswerMemo1..5)
   and the answer(RadioButton) }
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, Tabs, ExtCtrls, StdCtrls, Buttons, DdeMan, Spin;

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
    MenuExam: TMenuItem;
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
    ComboBoxQuestions: TComboBox;
    PanelExamName: TPanel;
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
    MyNameIs: TMenuItem;
    ExitTrainee: TMenuItem;
    N2: TMenuItem;
    ExamSelect: TMenuItem;
    MenuBank: TMenuItem;
    BankNew: TMenuItem;
    BankOpen: TMenuItem;
    BankDelete: TMenuItem;
    BankExit: TMenuItem;
    View1: TMenuItem;
    ViewExam: TMenuItem;
    ViewBank: TMenuItem;
    N1: TMenuItem;
    BankImport: TMenuItem;
    N5: TMenuItem;
    MarkPaper: TMenuItem;
    QuestionGoto: TMenuItem;
    Options1: TMenuItem;
    Timeforthisexam1: TMenuItem;
    CurrentTime: TMenuItem;
    TimeLeft: TMenuItem;
    Howtouse1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ComboBoxQuestionsNotDone: TComboBox;
    Label1: TLabel;
    Paths1: TMenuItem;
    Instruction: TMenuItem;
    About: TMenuItem;
    LabelA: TLabel;
    LabelB: TLabel;
    LabelC: TLabel;
    LabelD: TLabel;
    LabelE: TLabel;
    PopupMenu2: TPopupMenu;
    COC1: TMenuItem;
    BankClose: TMenuItem;
    N3: TMenuItem;
    SpinEditMarks: TSpinEdit;
    Marks: TLabel;
    N4: TMenuItem;
    ExamPrint: TMenuItem;
    PrintDialog1: TPrintDialog;
    N6: TMenuItem;
    BankPrint: TMenuItem;
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
    procedure TimeLeftClick(Sender: TObject);
    procedure CurrentTimeClick(Sender: TObject);
    procedure Timeforthisexam1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBoxQuestionsNotDoneClick(Sender: TObject);
    procedure ExamDeleteClick(Sender: TObject);
    procedure Paths1Click(Sender: TObject);
    procedure InstructionClick(Sender: TObject);
    procedure IntroductionClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OESCASEExecuteMacro(Sender: TObject; Msg: TStrings);
    procedure BankCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ExamPrintClick(Sender: TObject);
    procedure BankPrintClick(Sender: TObject);
  protected
    { Private declarations }
    TimeFormat: Boolean;
    ExamFileName: string;
    fMode: TMemoMode;
    fNoDiagrams, fNoAnswers, fNoQuestions: Integer;
    AtQuestion: Longint;
    WeHaveFocus, ForceExit, stModified: Bool;
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
    DDEServer, DDEClient, DDEExecuting: Bool;
    ExamIndex: TIndexFile;
    TimeStarted, ExamDuration, TimeToEnd: TDateTime;
    QuestionsDone: array[0..100] of Boolean;
    MarkingPaper, Dirty: Bool;
    FileName,
    QFindText, AFindText: String;
    QuestionBank: TQuestionBank;
    function ExamOpened: Bool;
    function RadioButtonsChecked: Bool;
    procedure LoadOptions;
    procedure SaveOptions;
    function LoadBankFile(const AFile: string): Bool;
    function LoadExamFile(const AFile: string): Bool;
    function LoadQuestion: Bool;
    function SaveQuestion: Bool;
    procedure CheckButtons;
    function WarnFileOpen: Integer;
    function SaveBankFile: Bool;
    procedure RebuildQuestionsList;
    procedure BuildDoneList;
    property FileNameWithoutExt: string
             read fFileNameWithoutExt
             write SetFileNameWithoutExt;
    property QuestionPos[Index: Integer]: Longint read GetQuestionPos write SetQuestionPos;
  end;

  TTransferMemo = class(TMemo)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

{ Marks for a question are set when it is created or when it is changed.
  The value itself is read from the SpinEditMarks whenever a
  TQuestionAnswer is created.
  }
  TQuestionAnswer = class
  private
   fQuestionBank: TQuestionBank;
   fQuestion: TStringList;
   fAnswers: array[0..4] of TStringList;
   fAnswer: Word;
  function GetAnswers(Index: Integer): TStringList;
  public
   MarksForThisQuestion: Word;
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
   property FileName: string read fFileName;
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
{  ExamIndex: TIndexFile; }

implementation
uses
About, ExamCls, ExamTime, FileName, Global, IniFiles, Instruct,
Intro, Login, Paths, QGoto, Results, Save, Security, ShowProg{ress}, UserName;

{$R *.DFM}

const
 piQuestions = 0;
 piAnswers = 1;
 piDiagrams = 2;


function FetchLResult: Longint; inline($90);
function FetchWResult: Word; inline($90);

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
   try
    fFileStream := TFileStream.Create(fFileName, Mode);
    FileMode := Mode;
    Reset(fFileIndex);
   except
    MessageDlg('Error opening question bank. Please retry.', mtError, [mbOk], 0);
   end;
  end else
  begin { create the file }
   try
    fFileStream := TFileStream.Create(fFileName, fmCreate);
    Rewrite(fFileIndex);
   except
    MessageDlg('Error creating question bank. Please retry.', mtInformation, [mbOk], 0);
   end;
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
  MessageDlg('Unable to access question bank(Seek failed).', mtError, [mbOk], 0);
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
 try
  fFileStream.Seek(0, soFromEnd);
 except
  MessageDlg('Unable to go to end of file(SeekEOF failed).', mtError, [mbOk], 0);
 end;
end;

function TQuestionBank.SeekIndexEOF: Bool;
begin
 try
  Seek(fFileIndex, FileSize(fFileIndex));
 except
  MessageDlg('Unable to read question bank index(SeekIndexEOF failed).', mtError,
             [mbOk], 0);
 end;
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
 try
  Result := TQuestionAnswer.Create(Self);
  fFileStream.Read(ACount, SizeOf(ACount));
  for I := 0 to ACount-1 do
   begin
    fFileStream.Read(S[0], SizeOf(S[0]));
    fFileStream.Read(S[1], Length(S));
    Result.Question.Add(S);
   end;
  fFileStream.Read(Result.MarksForThisQuestion,
                    SizeOf(Result.MarksForThisQuestion));
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
 except
  MessageDlg('Unable to read item(Read failed). This may not be a question bank', mtError, [mbOk], 0);
 end;
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
 try
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
 except
  MessageDlg('Unable to reindex(ReIndex failed).', mtError, [mbOk], 0);
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
 try
  SaveFilePos := System.FilePos(fFileIndex); { Save index file position }
  System.Seek(fFileIndex, Item);
  System.Read(fFileIndex, Result);
  System.Seek(fFileIndex, SaveFilePos); { restore index file position }
 except
  MessageDlg('Unable to get index for item(IndexForItem failed).', mtError,
             [mbOk], 0);
 end;
end;

function TQuestionBank.Write(AQuestionAnswer: TQuestionAnswer): Bool;
var
 I, J, ACount, ACount2, ACount3: Integer;
 S: string; Answer: Word;
 PositionForIndex: Longint;
begin
 try
  PositionForIndex := FilePosition;
  System.Write(fFileIndex, PositionForIndex);
  ACount := AQuestionAnswer.fQuestion.Count;
  fFileStream.Write(ACount, SizeOf(ACount));
  for I := 0 to ACount-1 do
   begin
    S := AQuestionAnswer.fQuestion.Strings[I];
    fFileStream.Write(S, Length(S)+1);
   end;
  fFileStream.Write(AQuestionAnswer.MarksForThisQuestion,
                    SizeOf(AQuestionAnswer.MarksForThisQuestion));
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
 except
  MessageDlg('Unable to write item(Write failed).', mtError, [mbOk], 0);
 end;
end;

destructor TQuestionBank.Destroy;
begin
 { close the file here }
 try
  System.Close(fFileIndex);
  fFileStream.Free;
 except
  MessageDlg('Unable to close question bank properly. File may not be updated(Destroy failed).',
             mtError, [mbOk], 0);
 end;
 inherited Destroy;
end;

function TQuestionBank.GetCount;
begin { Return some value here }
 Result := 0;
end;

function TQuestionBank.GetSize;
begin { Return some value here }
 try
  Result := FileSize(fFileIndex);
 except
  MessageDlg('Unable to get question bank size', mtError, [mbOk], 0);
  Result := 0;
 end;
end;

constructor TQuestionAnswer.Create(const AQuestionBank: TQuestionBank);
var
 I: Word;
begin
 try
  MarksForThisQuestion := FormInstructor.SpinEditMarks.Value;
  fQuestionBank := AQuestionBank;
  fAnswer := $FFFF;
  fQuestion := TStringList.Create;
  for I := Low(fAnswers) to High(fAnswers) do
   fAnswers[I] := TStringList.Create;
 except
  MessageDlg('Unable to create item(Create failed).', mtError, [mbOk], 0);
 end;
end;

destructor TQuestionAnswer.Destroy;
var
 I: Word;
begin
 try
  for I := Low(fAnswers) to High(fAnswers) do
   fAnswers[I].Free;
  fQuestion.Free;
 except
  MessageDlg('Unable to free item(Destroy failed).', mtError, [mbOk], 0);
 end;
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
 case ViewMode of
  tvViewBank:
   begin
   end;
  tvViewExam:
   begin
   end;
 end; { case ViewMode }
end;

function TFormInstructor.GetQuestionPos(Index: Integer): Longint;
begin
 TempIndex.Position := SizeOf(Longint)*Index;
 TempIndex.Read(Result, SizeOf(Longint));
end;

procedure TFormInstructor.SetNoQuestions(const Value: Integer);
begin
 fNoQuestions := Value;
 PanelNoQuestions.Caption := Format('%03d questions, %03d answers done',
                                    [fNoQuestions, fNoAnswers]);
end;

procedure TFormInstructor.SetNoAnswers(const Value: Integer);
{const
 Prompted: Bool=False; }
var
 DoneStr: string;
 I: Integer;
begin
 fNoAnswers := Value;
 PanelNoQuestions.Caption := Format('%03d questions, %03d answers done',
                   [fNoQuestions, fNoAnswers]);
 if (fNoAnswers<>0) and (fNoAnswers=fNoQuestions) then
  begin
   ComboBoxQuestionsNotDone.Clear;
   if {(not Prompted) and }(MessageDlg('You''ve finished the exam! Do you want to submit the exam?',
                 mtInformation, [mbYes, mbNo], 0)=mrYes) then
    begin
     Close;
    end;
{   Prompted := True; }
  end else
  begin
   PanelNoQuestions.Caption := Format('%03d questions, %03d answers done',
                                      [fNoQuestions, fNoAnswers]);
  end;
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
 IniFile: TIniFile;
begin
 with Application do
  begin
   OnDeactivate := FormDeactivate;
   OnActivate := FormActivate;
  end;
 DDEServer := HPrevInst=0;
 DDEClient := not DDEServer;
 DDEExecuting := False;
 for I := Low(QuestionsDone) to High(QuestionsDone) do
  QuestionsDone[I] := False;
 try
   try
    IniFile := TIniFile.Create(ExecPath+CASEIni);
    ExamPath := IniFile.ReadString('Paths', 'Exam', 'G:\EXAM\BANK\');
    AnswersPath := IniFile.ReadString('Paths', 'Answers', 'G:\EXAM\ANSWERS\');
   except
   end;
 finally
   IniFile.Free;
 end;
 AssignFile(ExamIndex, 'NUL');
 ForceExit := False;
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
 TimeToEnd := 0.0;
 case UserMode of
  tuInstructor:
  begin
   SpinEditMarks.EditorEnabled := True;
   CurrentTimeClick(Self);
   PanelToolBar.Visible := True;
   Caption := 'Instructor Mode';
   SetViewMode(tvViewBank);
  end;
  tuTrainee:
  begin
   SpinEditMarks.EditorEnabled := False;
   TimeLeftClick(Self);
   Menu := MainMenuTrainee;
   SetViewMode(tvViewExam);
   LoadOptions;
   LoadBankFile(ParamStr(1));
   LoadExamFile(ParamStr(1));
   { Load question and answers }
   RebuildQuestionsList;
   BuildDoneList;
   ComboBoxQuestions.ItemIndex := 0;
   InstructionClick(Self);
   if not Bool(FetchWResult) then
    begin
     ForceExit := True;
     Application.Terminate;
    end else
    begin
     MyNameIsClick(Self);
     if not Bool(FetchWResult) then
      begin
       ForceExit := True;
       Application.Terminate;
      end;
    end;
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
 IniFile: TIniFile;
 I: Integer;
 RightAnswer, UserAnswer: TAnswer;
 MySearchRec: TMySearchRec;
 F: TSearchRec absolute MySearchRec;
 F2: TSearchRec;
 ResultCount, Rights, FResult: Integer;
 ATextFile: TextFile;
 AtFiles, FilesFound, AnswerFilePos: Longint;
 AQuestionAnswer: TQuestionAnswer;
 MarkedFiles: TStringList;
 UpdateMarks: Longint; Marks, SavedErrorMode: Word;
const
 ExamOver: Bool=False;
begin
{ Check if exam duration has ended }
if UserMode=tuTrainee then
 begin
  if TimeToEnd<>0.0 then { Check if exam time has ended }
   begin
    if TimeToEnd-EncodeTime(0, 5, 0, 0)>Time then
     begin
      PanelAnswers.Color := clYellow;
     end;
    if TimeToEnd-EncodeTime(0, 10, 0, 0)>Time then
     begin
      PanelAnswers.Color := clGreen;
     end else
    if TimeToEnd-EncodeTime(0, 20, 0, 0)>Time then
     begin
      PanelAnswers.Color := clTeal;
     end;
    if (Time>TimeToEnd) and not ExamOver then
     begin
      ExamOver := True; ForceExit := True;
      MessageDlg('The exam is over!', mtInformation, [mbOk], 0);
      Close;
      exit;
     end;
   end;
 end;
{ Wait until TempIndex is opened before scanning for all answer files }
 if ((UserMode=tuMarker) or (UserMode=tuInstructor)) and
    Assigned(QuestionBank) and MarkingPaper then
  begin { Continually scan for all answers }
   MarkingPaper := False; { Prevent reentry unless remarked }
   FillChar(MySearchRec, SizeOf(MySearchRec), 0);
   FilesFound := 0;
   if FindFirst(AnswersPath+'*.UAS', faAnyFile, F2)=0 then
    begin
     Inc(FilesFound);
     while FindNext(F2)=0 do Inc(FilesFound);
     FindClose(F2);
    end;
   FResult := FindFirst(AnswersPath+'*.UAS', faAnyFile, F);
   if FResult=0 then
    ExamDate := FileDateToDateTime(F.Time);
   MarkedFiles := TStringList.Create;
   MarksList := TList.Create;
   MarksList.Capacity := 50;
   MarksList.Expand;
   FileMode := fmOpenRead;
   Reset(ExamIndex);
   FormProgress := TFormProgress.Create(Self);
   FormProgress.Gauge.Progress := 0;
   FormProgress.Gauge.MinValue := 0;
   FormProgress.Gauge.MaxValue := FileSize(ExamIndex)*FilesFound;
   if FResult=0 then
    begin
{ Begin create answers here }
     { Add files for deleting once finished marking }
     MarkedFiles.Add(AnswersPath+F.Name);
{     MessageDlg(AnswersPath+' '+IntToStr(FileMode)+' '+IntToHex(FileMode, 4), mtInformation, [mbOk], 0); }
     AssignFile(ATextFile, AnswersPath+'RESULTS.TXT');
     Rewrite(ATextFile);
     FormProgress.Caption := 'Marking Exam in Progress';
     FormProgress.GaugeText2.Visible := True;
     FormProgress.Show;
     ResultCount := 0; AtFiles := 0;
     while FResult=0 do
      begin
       try
        Inc(ResultCount);
        Reset(ExamIndex);
        UserFile := nil; Rights := 0;
        try
         SavedErrorMode := SetErrorMode(sem_FailCriticalErrors);
         UserFile := TFileStream.Create(AnswersPath+F.Name, fmOpenRead or fmShareExclusive);
        except
         MessageDlg('Error in opening answers file!', mtError, [mbOk], 0);
         raise;
        end;
        FormProgress.GaugeText2.Caption := 'Marking '+F.Name;
        if WeHaveFocus then FormProgress.Refresh;
        WriteLn(ATextFile, 'Answers for IC: ', Copy(F.Name, 1, 8));
        WriteLn(ATextFile, '------------------------');
        QuestionBank.Position := 0;
        System.Seek(ExamIndex, 0); Marks := 0;
        for I := 1 to FileSize(ExamIndex) do
         begin
          if MarksList.Count<I then
           MarksList.Add(nil);
          FormProgress.Gauge.Progress := FormProgress.Gauge.Progress+1;
          WriteLn(ATextFile, Format('Question %2.2d', [I]));
          System.Read(ExamIndex, AnswerFilePos);
          QuestionBank.Position := AnswerFilePos;
          AQuestionAnswer := QuestionBank.Read;
          RightAnswer := AQuestionAnswer.Answer;
          UserFile.Read(UserAnswer, SizeOf(UserAnswer));
          UserAnswer := UserAnswer xor $FF50;
          if RightAnswer=UserAnswer then
           begin
            Inc(Rights);
{ Trainee got this question right }
            Inc(Marks, AQuestionAnswer.MarksForThisQuestion);
            UpdateMarks := Longint(MarksList[I-1]);
            Inc(UpdateMarks);
            MarksList[I-1] := Pointer(UpdateMarks);
           end;
          AQuestionAnswer.Free;
          if UserAnswer in [0..4] then
           begin
            WriteLn(ATextFile, 'Exam answer: ', Chr(Ord('A')+RightAnswer),
                 ' User answer: ', Chr(Ord('A')+UserAnswer), ' ',
                 RightStr[RightAnswer=UserAnswer]);
           end else
            WriteLn(ATextFile, 'This question was skipped');
         end;
        WriteLn(ATextFile, Format('Trainee has %2.2d answers right!', [Rights]));
        WriteLn(ATextFile, Format('Percentage right: %04.2f', [Rights*100/I]));
        FormResults.StringGrid1.Cells[0, ResultCount] := IntToStr(ResultCount);
        FormResults.StringGrid1.Cells[1, ResultCount] := System.Copy(F.Name, 1, 8);
        FormResults.StringGrid1.Cells[2, ResultCount] :=
         Format('%04.2f', [Rights*100/I]);
        if ResultCount+1>FormResults.StringGrid1.RowCount then
         FormResults.StringGrid1.RowCount := ResultCount+1;
        FormResults.StringGrid1.Cells[3, ResultCount] := IntToStr(Marks);
       finally
        SetErrorMode(SavedErrorMode);
        UserFile.Free;
       end;
       FResult := FindNext(F);
      end;
     CloseFile(ATextFile);
     FormProgress.GaugeText2.Visible := False;
     FormProgress.Hide;
     FormProgress.Free;
     if MessageDlg('Finished marking exam. Do you want to clear all trainees'''+
                   ' answers away?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
{ Clear all trainees' results away once results are marked }
       for I := 0 to MarkedFiles.Count-1 do
        DeleteFile(MarkedFiles[I]);
      end;
     NoCandidates := MarkedFiles.Count;
     MarkedFiles.Free;
     try
      IniFile := TIniFile.Create(Format('%s%s.INI', [AnswersPath, System.Copy(F.Name, 1, 8)]));
      Global.ClassName := IniFile.ReadString('Classes', 'Class', 'unknown class');
     finally
      IniFile.Free;
     end;
{     FormResults.ChartFX1.NSeries := 1; }
     FormResults.ShowModal;
    end else
    begin  { if FResult = 0 }
     MessageDlg('There are no files to mark.', mtInformation, [mbOk], 0);
    end;
   MarksList.Free;
   FindClose(F);
  end;
 if CurrentTime.Checked then
  begin
   if TimeFormat then
    PanelTime.Caption := FormatDateTime('hh:mm:ss', Time) else
    PanelTime.Caption := FormatDateTime('hh:mm:ss am/pm', Time);
  end else
 if TimeLeft.Checked then
  begin
   if Time<TimeToEnd then
    PanelTime.Caption := FormatDateTime('hh:mm:ss', TimeToEnd-Time) else
    PanelTime.Caption := FormatDateTime('hh:mm', 0.0);
  end;
 ComboBoxQuestions.Enabled := Assigned(QuestionBank) or (UserMode=tuTrainee);
{
 for I := Low(vkconsts) to High(vkconsts) do
  begin
   Toggles[I] := Bool(GetKeyState(vkconsts[I]) and 1);
   if stToggles[I]<>Toggles[I] then
    begin
     stToggles[I] := Toggles[I];
     Panels[I].Font.Color := PanelColor[Toggles[I]];
    end;
  end; }
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
 BankClose.Enabled := Assigned(QuestionBank);
 BitBtnEdit.Enabled := (UserMode=tuInstructor) and (NoQuestions>0);
 BitBtnOk.Enabled := (fMode<>tmNone) and (RadioButtonsChecked);
 BitBtnCancel.Enabled := fMode<>tmNone;
 BitBtnAdd.Enabled := (Assigned(QuestionBank)) and (fMode<>tmAdd);
 BankImport.Enabled := Assigned(QuestionBank);
 ViewExam.Enabled := ExamOpened;
 ViewBank.Enabled := Assigned(QuestionBank);
 ExamSelect.Enabled := ExamOpened;
{ ExamSave.Enabled := Assigned(TempIndex);
 ExamSaveAs.Enabled := Assigned(TempIndex);
 ExamFind.Enabled := BitBtnFind.Enabled;
 ExamFindNext.Enabled := BitBtnFindNext.Enabled; }
end;

procedure TFormInstructor.BankExitClick(Sender: TObject);
begin
 Close;
end;

procedure TFormInstructor.FormDestroy(Sender: TObject);
begin
 BankClose.Click;
end;

procedure TFormInstructor.BuildDoneList;
var
 I: Word;
begin
 ComboBoxQuestionsNotDone.Clear;
 for I := 1 to FileSize(ExamIndex) do
  ComboBoxQuestionsNotDone.Items.Add(Format('Question %2d', [I]));
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
   I := 0;
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
 if (TFileRec(ExamIndex).Mode>fmClosed) and Dirty then
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
   SpinEditMarks.Value := AQuestionAnswer.MarksForThisQuestion;
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
        if (Answer<=4) and (Answer>=0) then RadioButtons[Answer].Checked := True;
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
function TFormInstructor.LoadExamFile(const AFile: string): Bool;
var
 AFileMode: Word;
 SavedErrorMode: Word;
begin
 Result := True;
     try
      if TFileRec(ExamIndex).Mode>fmClosed then
       System.CloseFile(ExamIndex);
     except
      MessageDlg('Can''t close file', mtError, [mbOk], 0);
     end;
     try
      LoadOptions;
      FileName := AFile;
      FileNameWithoutExt := FileName;
      ExamFileName := FileName;
      ExamDescription := GetDescription(AFile);
{      TFileStream.Create(FileNameWithoutExt+'.EDX', fmCreate); }
{      MessageDlg('AssignFile', mtError, [mbOk], 0); }
      AssignFile(ExamIndex, FileNameWithoutExt+'.EDX');
      if FileExists(FileNameWithoutExt+'.EDX') then
       begin
        case UserMode of
         tuTrainee: FileMode := fmOpenRead or fmShareDenyWrite;
         tuInstructor: FileMode := fmOpenReadWrite or fmShareExclusive;
        end;
        try
         SavedErrorMode := SetErrorMode(sem_FailCriticalErrors);
         try
          Reset(ExamIndex);
         except
          MessageDlg('Can''t Reset', mtError, [mbOk], 0);
          {on EInOutError do
           begin
            MessageDlg('Unable to open exam index. File may already be opened.', mtError, [mbOk], 0);
            Result := False;
           end;}
         end;
        finally
         SetErrorMode(SavedErrorMode);
        end;
       end else
       begin
        try
         Rewrite(ExamIndex);
        except
         MessageDlg(FileNameWithoutExt+' '+IntToStr(FileMode)+' '+IntToHex(FileMode, 4), mtInformation, [mbOk], 0);
        end;
       end;
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
      ComboBoxQuestions.Items.Add(Format('Question %2d', [NoQuestions]));
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
{     if NoAnswers=ComboBoxQuestions.Items.Count then
      begin
       I := MessageDlg('You have finished all questions! Do you want to exit?',
                  mtInformation, [mbYes, mbNo], 0);
       if I = mrYes then Close;
      end; }
    end;
  end;
{ This is common code for all 3 user modes }
{ Need to change QuestionBank to the actual question bank first before
  changing the position}
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
{  if UserMode=tuTrainee then }
   if Sender is TComponent then
    RadioButtons[(Sender as TComponent).Tag].Checked := True;
end;

{ Check if the Exam file is already opened }
function  TFormInstructor.ExamOpened: Bool;
begin
 Result := (TFileRec(ExamIndex).Mode<>fmClosed) and
           (TFileRec(ExamIndex).Mode-fmClosed in [1..3]);
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
        TheItemIndex := ComboBoxQuestionsNotDone.Items.IndexOf(
                         Format('Question %2d', [AtQuestion]));
{ Remove a question from the Not Done list once it is done }
        if TheItemIndex<>-1 then
         ComboBoxQuestionsNotDone.Items.Delete(TheItemIndex);
        if ComboBoxQuestionsNotDone.Items.Count>0 then
         ComboBoxQuestionsNotDone.ItemIndex := 0;
       end;
      TheItemIndex := ComboBoxQuestions.ItemIndex;
{      ComboBoxQuestions.Selected[TheItemIndex] := True; }
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
   if ForceExit then
    CanClose := True else
   if NoQuestions<>NoAnswers then
    begin
     CanClose := MessageDlg(Format('You still have %d questions without answers! Are '+
                       'you sure you want to exit?',
                       [(ComboBoxQuestions.Items.Count)-NoAnswers]),
                       mtWarning, [mbYes, mbNo], 0)=mrYes;
    end;
  end;
 end;
end;

{ This is called some time after LoadExamFile, so ExamDescription is valid }
procedure TFormInstructor.MyNameIsClick(Sender: TObject);
var
 Created: Bool;
 OldMode: Word;
 WResult: Word;
 IniFile: TIniFile;
begin
 WResult := Word(True);
 UserNameForm := TUserNameForm.Create(nil);
 OldMode := SetErrorMode(sem_FailCriticalErrors);
 repeat
  if UserNameForm.ShowModal=mrAbort then
   begin
    WResult := Word(False);
    Break;
   end;
  PanelExamName.Caption := UserNameForm.EditName.Text;
  PanelNRIC.Caption := UserNameForm.EditNRIC.Text;
  try
   if (Length(PanelNRIC.Caption)=8) and
      (not FileExists(Format('%s%s.UAS', [AnswersPath, PanelNRIC.Caption]))) then
    begin
     UserFile := TFileStream.Create(Format('%s%s.UAS', [AnswersPath, PanelNRIC.Caption]),
                                        fmCreate);
     try
      IniFile := TIniFile.Create(Format('%s%s.INI', [AnswersPath, PanelNRIC.Caption]));
{ Store the class name under section Classes with keyname of Class }
      IniFile.WriteString('Classes', 'Class', Global.ClassName);
      IniFile.WriteString('ExamName', 'Exam', ExamDescription);
      IniFile.WriteString('Trainee', 'Name', UserNameForm.EditName.Text);
      IniFile.WriteString('Trainee', 'NRIC', UserNameForm.EditNRIC.Text);
     finally
      IniFile.Free;
     end;
     Created := True;
    end else Created := False;
  except
   Created := False;
  end;
  if not Created then
   MessageDlg('Please correct your IC no.', mtWarning, [mbOk], 0);
 until Created;
 SetErrorMode(OldMode);
{ To check current time and if current time has passed start time,
  begin exam }
 TimeStarted := Time;
 TimeToEnd := TimeStarted+ExamDuration;
 UserNameForm.Free;
 asm MOV AX, WResult end;
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

procedure TFormInstructor.LoadOptions;
var
 OptionsFile: TIniFile;
 Hour: Word;
begin
 try
  OptionsFile := TIniFile.Create(ExecPath+CASEIni);
  Hour := OptionsFile.ReadInteger('Exam', 'Duration', 60);
  try
   if not Assigned(FormExamTime) then
    FormExamTime := TFormExamTime.Create(Self);
   FormExamTime.SpinEdit1.Value := Hour;
  except
  end;
  ExamDuration := EncodeTime(Hour div 60, Hour mod 60, 0, 0);
 finally
  OptionsFile.Free;
 end;
end;

procedure TFormInstructor.SaveOptions;
var
 OptionsFile: TIniFile;
 Minutes: Word;
begin
 try
  OptionsFile := TIniFile.Create(ExecPath+CASEIni);
  try
   Minutes := FormExamTime.SpinEdit1.Value;
  except
   Minutes := 60;
  end;
  OptionsFile.WriteInteger('Exam', 'Duration', Minutes);
 finally
  OptionsFile.Free;
 end;
end;

procedure TFormInstructor.BankNewClick(Sender: TObject);
begin
 FormSave.Title := 'New Bank';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  begin
   if LoadBankFile(FormSave.FileName) then
    begin
     ViewBank.Enabled := True;
     ViewBank.Click;
    end;
  end;
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
    if LoadBankFile(FormSave.FileName) then
     begin
      ViewBank.Enabled := True;
      ViewBank.Click;
     end;
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

function TFormInstructor.LoadBankFile(const AFile: string): Bool;
var
 SavedErrorMode, Mode: Word;
 BankFilename: string;
begin
 Result := True;
 if QuestionBank<>nil then
  begin
   MessageDlg('Diagnostic: Question Bank not free!', mtInformation,
              [mbOk], 0);
   QuestionBank.Free;
  end;
 case UserMode of
  tuTrainee: Mode := fmOpenRead or fmShareDenyWrite;
  tuInstructor: Mode := fmOpenReadWrite or fmShareExclusive;
 else
  Mode := fmOpenRead or fmShareDenyWrite;
 end;
 FileNameWithoutExt := AFile;
 try
  SavedErrorMode := SetErrorMode(sem_FailCriticalErrors);
  try
{   MessageDlg('QuestionBank.Create', mtError, [mbOk], 0); }
   QuestionBank := TQuestionBank.Create(FileNameWithoutExt+'.BNK', Mode);
   PanelExamName.Caption := GetDescription(FileNameWithoutExt+'.BNK');
  except
   MessageDlg('Error in LoadBankFile()', mtError, [mbOk], 0);
   {on EInOutError do
    Result := False;}
  end;
 finally
  SetErrorMode(SavedErrorMode);
 end;
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
 FormSave.Title := 'Import Bank';
 if (FormSave.ShowModal=mrOk) then
  begin
  try
   QuestionBank.SeekEOF;
   AQuestionAnswer := TQuestionAnswer.Create(QuestionBank);
   ParseState := tpsDoubleSlash;
   AssignFile(F, FormSave.FileName);
   Reset(F); ItemsImported := 0; Importing := False;
   Stop := False;
   Application.CreateForm(TFormProgress, FormProgress);
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
   FormProgress.Free;
  end;
  end;
end;

procedure TFormInstructor.ExamSelectClick(Sender: TObject);
var
 Index: Longint;
 ThisFilePos: Longint;
begin
 try
  Index := AtQuestion;
  ThisFilePos := System.FilePos(ExamIndex);
  System.Seek(ExamIndex, System.FileSize(ExamIndex));
  System.Write(ExamIndex, Index);
 except
  MessageDlg('This question cannot be selected due to io error.', mtError, [mbOk], 0);
 end;
{
}
end;

{ Assumes that a bank is already opened }
procedure TFormInstructor.ExamNewClick(Sender: TObject);
var
 IniFile: TIniFile;
begin
 FormSave.Title := 'New Exam';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  begin
   LoadExamFile(FormSave.FileName);
   ViewExam.Enabled := True;
   ViewExam.Click;
   try
    FormExamSelectClass := TFormExamSelectClass.Create(Self);
    if FormExamSelectClass.ShowModal=mrOk then
     begin { store class for this exam }
      try
       IniFile := TIniFile.Create(ExecPath+CASEIni);
       IniFile.WriteString('Classes', FormSave.FileName,
                           FormExamSelectClass.ComboBoxExamClass.Text);
      finally
       IniFile.Free;
      end;
     end;
   finally
    FormExamSelectClass.Free;
   end;
  end;
end;

{ Assumes that a bank is already opened }
procedure TFormInstructor.ExamOpenClick(Sender: TObject);
begin
 FormSave.Title := 'Open Exam';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
  begin
   if LoadBankFile(FormSave.FileName) and LoadExamFile(FormSave.FileName) then
    begin
     ViewExam.Enabled := True;
     ViewExam.Click;
    end;
  end;
end;

procedure TFormInstructor.MarkPaperClick(Sender: TObject);
begin
 FormSave.Title := 'Mark Exam';
 if (WarnFileOpen=mrOk) and (FormSave.ShowModal=mrOk) then
   begin
     MarkingPaper := LoadBankFile(FormSave.FileName) and
                     LoadExamFile(FormSave.FileName);
   end;
end;

procedure TFormInstructor.QuestionGotoClick(Sender: TObject);
begin
 try
  FormGotoQuestion := TFormGotoQuestion.Create(Self);
  if (ComboBoxQuestions.Items.Count>0) and (FormGotoQuestion.ShowModal=mrOk) then
   begin
    ComboBoxQuestions.ItemIndex := FormGotoQuestion.ListBox1.ItemIndex;
    ComboBoxQuestionsClick(Sender);
   end;
 finally
  FormGotoQuestion.Free;
 end;
end;

procedure TFormInstructor.PanelTimeDblClick(Sender: TObject);
begin
 if CurrentTime.Checked then
  if TimeFormat then
   N12Hr1.Click else
   N24Hr1.Click;
end;

procedure TFormInstructor.N12hr1Click(Sender: TObject);
var
 I: Integer;
begin
 TimeFormat := False;
 N24Hr1.Checked := False;
 N12Hr1.Checked := True;
 CurrentTime.Click;
end;

procedure TFormInstructor.N24hr1Click(Sender: TObject);
var
 I: Integer;
begin
 TimeFormat := True;
 N24Hr1.Checked := True;
 N12Hr1.Checked := False;
 CurrentTime.Click;
end;

procedure TFormInstructor.TimeLeftClick(Sender: TObject);
begin
 TimeLeft.Checked := True;
 CurrentTime.Checked := False;
 N24Hr1.Checked := False;
 N12Hr1.Checked := False;
end;

procedure TFormInstructor.CurrentTimeClick(Sender: TObject);
begin
 TimeLeft.Checked := False;
 CurrentTime.Checked := True;
end;

procedure TFormInstructor.Timeforthisexam1Click(Sender: TObject);
begin
 try
  FormExamTime.ShowModal;
  ExamDuration := FormExamTime.SpinEdit1.Value;
 except
 end;
 SaveOptions;
end;

procedure TFormInstructor.SpeedButton1Click(Sender: TObject);
begin
 if ComboBoxQuestions.ItemIndex>0 then
  begin
   ComboBoxQuestions.ItemIndex := ComboBoxQuestions.ItemIndex-1;
   ComboBoxQuestionsClick(Sender);
  end;
end;

procedure TFormInstructor.SpeedButton2Click(Sender: TObject);
begin
 if ComboBoxQuestions.ItemIndex+1<ComboBoxQuestions.Items.Count then
  begin
   ComboBoxQuestions.ItemIndex := ComboBoxQuestions.ItemIndex+1;
   ComboBoxQuestionsClick(Sender);
  end;
end;



procedure TFormInstructor.ComboBoxQuestionsNotDoneClick(Sender: TObject);
var
 Str: string[30];
 I: Integer;
begin
 Str := ComboBoxQuestionsNotDone.Items[ComboBoxQuestionsNotDone.ItemIndex];
 I := ComboBoxQuestions.Items.IndexOf(Str);
 if I<>-1 then
  begin
   ComboBoxQuestions.ItemIndex := I;
   ComboBoxQuestionsClick(ComboBoxQuestions);
  end;
end;

procedure TFormInstructor.ExamDeleteClick(Sender: TObject);
begin
 FormSave.Title := 'Delete Exam';
 if FormSave.ShowModal=mrOk then
  begin
   if not DeleteFile(FormSave.FileName) then
    MessageDlg('Cannot delete this bank! File may be in use or missing.',
               mtWarning, [mbOk], 0);
  end;
end;

procedure TFormInstructor.Paths1Click(Sender: TObject);
var
 IniFile: TIniFile;
begin
 try
  FormPaths := TFormPaths.Create(Self);
  try
   FormPaths.EditExamPath.Text := ExamPath;
   FormPaths.EditAnswersPath.Text := AnswersPath;
   if FormPaths.ShowModal=mrOk then
    begin
     ExamPath := FormPaths.EditExamPath.Text;
     AnswersPath := FormPaths.EditAnswersPath.Text;
     try
      try
       IniFile := TIniFile.Create(ExamPath+CASEIni);
       IniFile.WriteString('Paths', 'Exam', ExamPath);
       IniFile.WriteString('Paths', 'Answers', AnswersPath);
      except
       MessageDlg('Error in writing IniFile', mtError, [mbOk], 0);
       raise;
      end;
     finally
      IniFile.Free;
     end;
    end;
  except
   MessageDlg('Unable to access FormPaths', mtError, [mbOk], 0);
  end;
 finally
  FormPaths.Free;
 end;
end;

function TryLogin: Word;
var
 IniFile: TIniFile;
 Password1, Password2: string;
begin
 Result := mrAbort;
 try
  FormLogin := TFormLogin.Create(Application);
  try
   Result := FormLogin.ShowModal;
   if Result=mrOk then
    begin
     Global.UserName := FormLogin.EditInstructorName.Text;
     Password1 := FormLogin.EditPassword.Text;
     Password1 := TransformString(Password1);
     IniFile := TIniFile.Create(ExecPath+CASEIni);
     Password2 := IniFile.ReadString(Global.UserName, 'Password', EmptyStr);
     if (Password2<>EmptyStr) and (Password1=Password2) then
      Result := mrOk else
      Result := mrCancel;
     IniFile.Free;
    end;
  except
   MessageDlg('Error in trying to login', mtError, [mbOk], 0);
  end;
 finally
  FormLogin.Free;
 end;
end;

procedure TFormInstructor.InstructionClick(Sender: TObject);
var
 WResult: Bool;
begin
 FormInstruction := TFormInstruction.Create(nil);
 FormInstruction.Memo1.Lines[1] :=
  Format(FormInstruction.Memo1.Lines[1], [fNoQuestions]);
 WResult := not (FormInstruction.ShowModal=mrAbort);
 FormInstruction.Free;
 asm MOV AX, WResult end;
end;

procedure TFormInstructor.IntroductionClick(Sender: TObject);
begin
 FormIntro := TFormIntro.Create(nil);
 FormIntro.ShowModal;
 FormIntro.Free;
end;

procedure TFormInstructor.AboutClick(Sender: TObject);
begin
 FormAbout := TFormAbout.Create(Self);
 FormAbout.ShowModal;
 FormAbout.Free;
end;

procedure TFormInstructor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_Prior:
   begin
    if ComboBoxQuestions.ItemIndex>0 then
     begin
      ComboBoxQuestions.ItemIndex := ComboBoxQuestions.ItemIndex-1;
      ComboBoxQuestionsClick(Self);
     end;
   end;
  vk_Next:
   begin
    if ComboBoxQuestions.ItemIndex<ComboBoxQuestions.Items.Count then
     begin
      ComboBoxQuestions.ItemIndex := ComboBoxQuestions.ItemIndex+1;
      ComboBoxQuestionsClick(Self);
     end;
   end;
 end;
end;

procedure TFormInstructor.OESCASEExecuteMacro(Sender: TObject;
  Msg: TStrings);
var
 I: Integer;
begin
 for I := 1 to Msg.Count do
  begin

  end;
end;

procedure TFormInstructor.BankCloseClick(Sender: TObject);
begin
{ Write list out to stream }
 try
  if (TFileRec(ExamIndex).Mode<>fmClosed) then
   System.Close(ExamIndex);
  if UserMode=tuTrainee then
   UserFile.Free;
  TempIndex.Free;
  BankIndex.Free;
  QuestionBank.Free;
  QuestionBank := nil;
  BankClose.Enabled := False;
 except
 end;
end;

procedure TFormInstructor.FormDeactivate(Sender: TObject);
begin
WeHaveFocus := False;
end;

procedure TFormInstructor.FormActivate(Sender: TObject);
begin
WeHaveFocus := True;
end;

procedure TFormInstructor.ExamPrintClick(Sender: TObject);
begin
 PrintDialog1.Execute;
end;

procedure TFormInstructor.BankPrintClick(Sender: TObject);
begin
 PrintDialog1.Execute;
end;

initialization
 if ParamStr(1)='/I' then
  begin
   case TryLogin of
    mrOk: UserMode := tuInstructor;
    mrAbort: Halt;
    mrCancel:
    begin
     MessageDlg('You''re not authorised to access!', mtError, [mbOk], 0);
     Halt;
    end;
   end;
  end else
 if IsValidFileName(ParamStr(1)) then
  begin
   UserMode := tuTrainee;
   BankFileName := ParamStr(1);
  end else
 begin
  MessageDlg('Unknown parameter', mtError, [mbOk], 0);
  Halt;
 end;
end.
