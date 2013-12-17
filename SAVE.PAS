{$X+}
unit Save;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, FileCtrl;

type
  TFormSave = class(TForm)
    FileListBox1: TFileListBox;
    FilterComboBox1: TFilterComboBox;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    EditFileName: TEdit;
    BitBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    LabelDir: TLabel;
    Label1: TLabel;
    EditDescription: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FileListBox1DblClick(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DefaultExt: string[4];
    procedure SetCaption(const Value: TCaption);
    function GetCaption: TCaption;
    procedure SetFileName(const Value: TFileName);
    function GetFileName: TFileName;
    procedure SetDescription(const Value: string);
    function GetDescription: string;
  public
    { Public declarations }
    property Title: TCaption read GetCaption write SetCaption;
    property FileName: TFileName read GetFileName write SetFileName;
    property Description: string read GetDescription write SetDescription;
  end;

function GetDescription(AFileName: string): string;

var
  FormSave: TFormSave;

implementation
uses Global, IniFiles, FileName;
{$R *.DFM}

function GetDescription(AFileName: string): string;
var
 IniFile: TIniFile;
begin
 try
  IniFile := nil;
  IniFile := TIniFile.Create(ExecPath+CASEIni);
  Result := IniFile.ReadString('Description', AFileName, EmptyStr);
 finally
  IniFile.Free;
 end;
end;


procedure TFormSave.SetDescription(const Value: string);
begin
 EditDescription.Text := Value;
end;

function TFormSave.GetDescription: string;
begin
 Result := EditDescription.Text;
end;


procedure TFormSave.SetFileName(const Value: TFileName);
begin
 EditFileName.Text := Value;
end;

function TFormSave.GetFileName: TFileName;
begin
 Result := LabelDir.Caption+'\'+EditFileName.Text;
end;

procedure TFormSave.SetCaption(const Value: TCaption);
begin
 Caption := Value;
end;

function TFormSave.GetCaption: TCaption;
begin
 Result := Caption;
end;

procedure TFormSave.FileListBox1DblClick(Sender: TObject);
begin
 BitBtnOk.Click;
end;

procedure TFormSave.FileListBox1Change(Sender: TObject);
begin
 try
  Screen.Cursor := crHourglass;
  Description := Save.         GetDescription(FileName);
 finally
  Screen.Cursor := crDefault;
 end;
end;

procedure TFormSave.FormCreate(Sender: TObject);
begin
 DefaultExt := System.Copy(FileListBox1.Mask, 2, 5);
end;

procedure TFormSave.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
 ThisSelect: string;
 IniFile: TIniFile;
 OldDescription: string;
begin
 ThisSelect := DirectoryListBox1.GetItemPath(DirectoryListBox1.ItemIndex);
 CanClose := CompareText(LabelDir.Caption, ThisSelect)=0;
 if not CanClose then
   DirectoryListBox1.OpenCurrent; {else}
(* if ModalResult=mrOk then { No point doing a validate if Ok button not pressed }
  begin
   CanClose := IsValidFileName(FileName);
  end; *)
 if CanClose then
  if ModalResult=mrOk then
    try
     Screen.Cursor := crHourglass;
     IniFile := TIniFile.Create(ExecPath+CASEIni);
     IniFile.WriteString('Description', FileName, Description);
    finally
     IniFile.Free;
     Screen.Cursor := crDefault;
    end;
end;

var
 ALogFile: TextFile;

procedure DoneLogFile; far;
begin
{ WriteLn(ALogFile, FormatDateTime('Exit at dd mmm yyyy on hh:mm:ss', Now); }
end;



procedure TFormSave.FormShow(Sender: TObject);
begin
 FileListBox1.Update;
 DirectoryListBox1.Update;
end;

{ Assign(ALogFile, ExecPath+'CASE.LOG');
 if FileExists(ExecPath+'CASE.LOG');
 WriteLn(ALogFile, FormatDateTime('Startup at dd mmm yyyy on hh:mm:ss', Now); }
end.

