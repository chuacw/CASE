program Caiscore;

uses
  Controls,
  Forms,
  Trainee in 'TRAINEE.PAS' {FormTrainee},
  Teacher in 'TEACHER.PAS' {FormInstructor},
  Save in 'SAVE.PAS' {FormSave},
  Showprog in 'SHOWPROG.PAS' {FormProgress},
  Username in 'USERNAME.PAS' {UserNameForm},
  Qgoto in 'QGOTO.PAS' {FormGotoQuestion},
  Instruct in 'INSTRUCT.PAS' {FormInstruction},
  Intro in 'INTRO.PAS' {FormIntro},
  Examtime in 'EXAMTIME.PAS' {FormExamTime},
  Splash in 'SPLASH.PAS' {SplashForm},
  Results in 'RESULTS.PAS' {FormResults},
  Paths in 'PATHS.PAS' {FormPaths},
  About in 'ABOUT.PAS' {FormAbout},
  Examcls in 'EXAMCLS.PAS' {FormExamSelectClass},
  Global in 'GLOBAL.PAS',
  Login in 'LOGIN.PAS' {FormLogin},
  Security in 'SECURITY.PAS',
  Filename in 'FILENAME.PAS';

{$R *.RES}

begin
  Screen.Cursor := crHourglass;
  Application.HintPause := 0;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'CASE';
  Application.CreateForm(TFormInstructor, FormInstructor);
  Application.CreateForm(TFormSave, FormSave);
  Application.CreateForm(TFormResults, FormResults);
  Application.CreateForm(TFormExamTime, FormExamTime);
  SplashForm.Hide;
  Screen.Cursor := crDefault;
  Application.Run;
end.
