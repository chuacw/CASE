program Makeuser;

uses
  Forms,
  Umake in 'UMAKE.PAS' {FormMakeUser};

{$R *.RES}

begin
  Application.CreateForm(TFormMakeUser, FormMakeUser);
  Application.Run;
end.
