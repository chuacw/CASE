unit Username;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUserNameForm = class(TForm)
    EditName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditNRIC: TEdit;
    BitBtnOk: TBitBtn;
    Label3: TLabel;
    EditConfirm: TEdit;
    BitBtnAbort: TBitBtn;
    LabelWarning: TLabel;
    BlinkTimer2: TTimer;
    ListBoxClasses: TListBox;
    Label4: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditNRICChange(Sender: TObject);
    procedure BitBtnAbortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BlinkTimer2Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
    function GetClasses: string;
  private
    { Private declarations }
    ForcedExit: Bool;
  public
    { Public declarations }
    property Classes: string read GetClasses;
  end;

var
  UserNameForm: TUserNameForm;

implementation
uses Global, IniFiles;
{$R *.DFM}

function TUserNameForm.GetClasses;
begin
 try
  Result := ListBoxClasses.Items[ListBoxClasses.ItemIndex];
 except
  Result := EmptyStr;
 end;
end;

procedure TUserNameForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose := (ForcedExit) or
             ((EditName.Text<>EmptyStr) and (EditNRIC.Text<>EmptyStr) and
              (EditNRIC.Text=EditConfirm.Text)) and
              (ListBoxClasses.ItemIndex<>-1);
 if not CanClose then
  begin
   MessageDlg('Please check that the Name is entered, your NRIC is entered '+
               'twice, and you''ve selected a valid class.',
              mtError, [mbOk], 0);
  end else
  begin
   try
    Global.ClassName := ListBoxClasses.Items[ListBoxClasses.ItemIndex];
   except
   end;
  end;
end;

procedure TUserNameForm.EditNRICChange(Sender: TObject);
var
 I: Integer;
begin
 if (Length(EditNRIC.Text)>=1) and (Length(EditNRIC.Text)<=7) then
  begin
   if not (EditNRIC.Text[Length(EditNRIC.Text)] in ['0'..'9']) then
    begin
     MessageBeep(Word(-1));
     EditNRIC.Text := System.Copy(EditNRIC.Text, 1, Length(EditNRIC.Text)-1);
    end;
  end;
 if (Length(EditNRIC.Text)=8) then
  begin
   if not (Upcase(EditNRIC.Text[8]) in ['A'..'Z']) then
    begin
     MessageBeep(Word(-1));
     EditNRIC.Text := System.Copy(EditNRIC.Text, 1, 7);
    end;
  end;
end;

procedure TUserNameForm.BitBtnAbortClick(Sender: TObject);
begin
 ForcedExit := True;
 ModalResult := mrAbort;
end;

procedure TUserNameForm.FormCreate(Sender: TObject);
var
 IniFile: TIniFile;
 SClasses: TStringList;
 S: string; I: Integer;
begin
 ForcedExit := False;
 try
  IniFile := TIniFile.Create(ExecPath+CaseIni);
  SClasses := TStringList.Create;
  IniFile.ReadSection('Classes', SClasses);
  IniFile.ReadSectionValues('Classes', SClasses);
  for I := 0 to SClasses.Count-1 do
   begin
    if CompareText(SClasses[I], BankFileName)=0 then
     ListBoxClasses.Items.Add(SClasses.Values[SClasses[I]]);
   end;
 finally
  SClasses.Free;
  IniFile.Free;
 end;
end;

procedure TUserNameForm.BlinkTimer2Timer(Sender: TObject);
begin
 if LabelWarning.Font.Color = LabelWarning.Color then
  LabelWarning.Font.Color := clRed else
  LabelWarning.Font.Color := LabelWarning.Color;
end;

procedure TUserNameForm.FormDestroy(Sender: TObject);
begin
 BlinkTimer2.Enabled := False;
end;

end.
