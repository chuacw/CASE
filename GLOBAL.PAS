unit Global;

interface
uses Classes;
const
  CASEIni = 'CASE.INI';
var
 MarksList: TList; { Valid only when an exam is being marked }
 ClassName, BankFileName, ExecPath, UserName,
 ExamDescription: string;

 ExamPath, AnswersPath: string;

 { Valid only when MarkingPaper is true }
 NoCandidates: Integer;
 ExamDate: TDateTime;

implementation
uses SysUtils, WinProcs;

initialization
 ExecPath := ExtractFilePath(ParamStr(0));
 NoCandidates := 0;
 SetHandleCount(255);
end.
 