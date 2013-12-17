unit Casesrv;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls, DdeMan,
  Menus, ExtCtrls;

type
  TDdeSrvrForm = class(TForm)
    DdeTestTopic: TDdeServerConv;
    DdeTestItem: TDdeServerItem;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit2: TMenuItem;
    Copy1: TMenuItem;
    Label1: TLabel;
    Bevel1: TBevel;
    Edit1: TMemo;
    procedure doOnPoke(Sender: TObject);
    procedure doOnChange(Sender: TObject);
    procedure doMacro(Sender: TObject; Msg: TStrings);
    procedure CopyClick(Sender: TObject);

  private
    FInPoke: Boolean;
  public
    { Public declarations }
  end;

var
  DdeSrvrForm: TDdeSrvrForm;

implementation

uses Dialogs;

{$R *.DFM}

procedure TDdeSrvrForm.doOnPoke(Sender: TObject);
begin
  FInPoke := True;
  Edit1.Lines := DdeTestItem.Lines;
  FInPoke := False;
end;

procedure TDdeSrvrForm.doOnChange(Sender: TObject);
begin
  if not FInPoke then
    DdeTestItem.Lines := Edit1.Lines;
end;

procedure TDdeSrvrForm.doMacro(Sender: TObject;
  Msg: TStrings);
var
  Text: string;
begin
  Text := '';
  if Msg.Count > 0 then Text := Msg.Strings[0];
  MessageDlg ('Executing Macro - ' + Text, mtInformation, [mbOK], 0);
end;

procedure TDdeSrvrForm.CopyClick(Sender: TObject);
begin
  DdeTestItem.CopyToClipboard;
end;

end.
