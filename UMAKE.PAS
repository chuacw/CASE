unit Umake;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TFormMakeUser = class(TForm)
    Label1: TLabel;
    EditInstructorName: TEdit;
    Label2: TLabel;
    EditPassword: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeUser: TFormMakeUser;

implementation
uses Global, IniFiles, Security;
{$R *.DFM}


{ Must run from the same path as CAISCORE }
procedure TFormMakeUser.BitBtn1Click(Sender: TObject);
var
 IniFile: TIniFile;
 ExecPath, Password1,
 User1: string;
begin
 ExecPath := ExtractFilePath(ParamStr(0));
 Password1 := FormMakeUser.EditPassword.Text;
 User1 := FormMakeUser.EditInstructorName.Text;
 Password1 := TransformString(Password1);
 IniFile := TIniFile.Create(ExecPath+CASEIni);
 IniFile.WriteString(User1, 'Password', Password1);
 IniFile.Free;
 Close;
end;

procedure TFormMakeUser.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

end.
