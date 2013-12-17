unit Results;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Menus, PrntPrev;

type

  TFormResults = class(TForm)
    MainMenu1: TMainMenu;
    MenuPrinter: TMenuItem;
    PrintText: TMenuItem;
    FontDialog1: TFontDialog;
    StringGrid1: TStringGrid;
    PrintGraphics: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    PrintSOR1: TMenuItem;
    PrintPreview1: TPrintPreview;
    Settings1: TMenuItem;
    PrinterFont1: TMenuItem;
    Margins1: TMenuItem;
    Close1: TMenuItem;
    View1: TMenuItem;
    MenuSOR1: TMenuItem;
    Individualresult1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PrintTextClick(Sender: TObject);
    procedure FontDialog1Apply(Sender: TObject; Wnd: Word);
    procedure FormDestroy(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PrintSOR1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure PrintPreview1RenderPage(Page: Word; Canvas: TCanvas);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure PrinterFont1Click(Sender: TObject);
    procedure Margins1Click(Sender: TObject);
    procedure PrintPreview1PrintStart(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure MenuSOR1Click(Sender: TObject);
    procedure Individualresult1Click(Sender: TObject);
  private
    { Private declarations }
   MyFile: TextFile;
   MouseX, MouseY: Integer;
   SOR1, SOR2: TBitmap;
   PrnMargins: TRect;
  public
    { Public declarations }
    PrinterInitialized: Bool;
    procedure PrintItem(Item: Integer);
    procedure PrintOpen;
    procedure PrintClose;
  end;

{ PrnRec }
{ Printer data record }
type
  PrnRec = record
    case Integer of
      1: (
        Cur: TPoint;
        Finish: TPoint;         { End of the pritable area }
        Height: Word);          { Height of the current line }
      2: (
        Tmp: array[1..16] of Char);
  end;

var
  FormResults: TFormResults;

implementation
uses Global, IniFiles, Margins, Printers;
{$R *.DFM}

var
 IniFile: TIniFile;

procedure TFormResults.FormCreate(Sender: TObject);
begin
 try
  IniFile := TIniFile.Create(ExecPath+CASEIni);
  try
   PrnMargins.Left  := IniFile.ReadInteger('Printer', 'MarginLeft', 0);
   PrnMargins.Right := IniFile.ReadInteger('Printer', 'MarginRight', 0);
   PrnMargins.Top   := IniFile.ReadInteger('Printer', 'MarginTop', 0);
   PrnMargins.Bottom:= IniFile.ReadInteger('Printer', 'MarginBottom', 0);
  except
   PrnMargins := Rect(0, 0, 0, 0);
  end;
 finally
  IniFile.Free;
 end;
 SOR1 := TBitmap.Create;
 SOR2 := TBitmap.Create;
 SOR1.Assign(Image1.Picture.Bitmap);
 SOR2.Assign(Image2.Picture.Bitmap);
 PrinterInitialized := False;
 with StringGrid1 do
  begin
   Cells[0, 0] := 'No';
   Cells[1, 0] := 'NRIC';
   Cells[2, 0] := 'Percentage (%)';
   Cells[3, 0] := 'Marks';
  end;

end;

procedure TFormResults.PrintClose;
begin
 if PrinterInitialized then
  begin
   CloseFile(MyFile);
   PrinterInitialized := False;
  end;
end;

procedure TFormResults.PrintOpen;
begin
 if not PrinterInitialized then
  begin
   PrinterInitialized := True;
   AssignPrn(MyFile);
   Rewrite(MyFile);
  end;
end;

procedure TFormResults.PrintItem(Item: Integer);
var
 Name, NRIC: string;
begin
 try
  NRIC := StringGrid1.Cells[1, Item];
  IniFile := TIniFile.Create(Format('%s%s.INI', [AnswersPath, NRIC]));
  Name := IniFile.ReadString('Trainee', 'Name', EmptyStr);
  WriteLn(MyFile, NRIC, #9#9, Name, #9#9#9#9, StringGrid1.Cells[3, Item]);
 finally
  IniFile.Free;
 end;
end;

procedure TFormResults.PrintTextClick(Sender: TObject);
var
 LastPage: Integer;
 CurCount: Integer;
begin
 if not PrinterInitialized then
  begin
   PrinterInitialized := True;
   AssignPrn(MyFile);
   Rewrite(MyFile);
  end;
 LastPage := 0;
 CurCount := 1;
 repeat
  Printers.Printer.Title := Format('CASE Results Page %02.2d',
                                   [Printers.Printer.PageNumber]);
  if LastPage<>Printers.Printer.PageNumber then
   begin
    LastPage := Printers.Printer.PageNumber;
    WriteLn(MyFile);
{ ExamDescription is stored in Globals and is valid after
  LoadExamFile is called. }
    WriteLn(MyFile, 'Summary Results');
    WriteLn(MyFile, 'Class: ', Global.ClassName);
    WriteLn(MyFile, 'Subject: ', ExamDescription);
    WriteLn(MyFile, 'Date conducted: ', FormatDateTime('dd mmm yy', ExamDate));
    WriteLn(MyFile);
{    Printer.Canvas.Line }
    WriteLn(MyFile, 'NRIC'#9#9#9'Rank/Name'#9#9#9#9'Marks');
   end;
  PrintItem(CurCount);
  Inc(CurCount);
 until CurCount=StringGrid1.RowCount;
 CloseFile(MyFile);
 PrinterInitialized := False;
end;

procedure TFormResults.FontDialog1Apply(Sender: TObject; Wnd: Word);
begin
 Printers.Printer.Canvas.Font := FontDialog1.Font;
 Invalidate;
end;

procedure TFormResults.FormDestroy(Sender: TObject);
begin
 SOR1.Free;
 SOR2.Free;
 PrintClose;
end;

procedure TFormResults.StringGrid1DblClick(Sender: TObject);
var
 Row, Col: Longint;
begin
 PrintOpen;
 StringGrid1.MouseToCell(MouseX, MouseY, Row, Col);
 if Row>=1 then
  PrintItem(Row);
end;

procedure TFormResults.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 MouseX := X;
 MouseY := Y;
end;



procedure TFormResults.PrintSOR1Click(Sender: TObject);
var
  Info: PBitmapInfo;
  InfoSize: Integer;
  Image: Pointer;
  ImageSize: Longint;
  Bits: HBITMAP;
  DIBWidth, DIBHeight: Longint;
  PrintWidth, PrintHeight: Longint;
  PrintImage: TBitmap;


 procedure PrintPage(BitmapHandle: HBitmap);
 begin
   try
    Bits := BitmapHandle;
    GetDIBSizes(Bits, InfoSize, ImageSize);
    Info := MemAlloc(InfoSize);
    Image := MemAlloc(ImageSize);
    GetDIB(Bits, 0, Info^, Image^);
    with Info^.bmiHeader do
     begin
      DIBWidth := biWidth;
      DIBHeight := biHeight;
     end;
    PrintWidth := MulDiv(DIBWidth, Printer. PageHeight, DIBHeight);
    if PrintWidth < Printer.PageWidth then
     PrintHeight := Printer.PageHeight
    else
    begin
     PrintWidth := Printer.PageWidth;
     PrintHeight := MulDiv(DIBHeight, Printer.PageWidth, DIBWidth);
    end;
    StretchDIBits(Printer.Canvas.Handle, 0, 0, PrintWidth, PrintHeight, 0, 0,
                  DIBWidth, DIBHeight, Image, Info^, DIB_RGB_COLORS, SRCCOPY);
   finally
    FreeMem(Info, InfoSize);
    FreeMem(Image, ImageSize);
   end;
 end;

begin
{  try
   Printer.Title := 'Statement of Result';
   Printer.BeginDoc;
   PrintPage(Image1.Picture.Bitmap.Handle);
   Printer.NewPage;
   PrintPage(Image2.Picture.Bitmap.Handle);
  finally
   Printer.EndDoc;
  end; }
 PrintPreview1.PrintJobDlg;
 PrintPreview1.StartPrintJob('Statement of Result'); 
end;

procedure TFormResults.PaintBox1Paint(Sender: TObject);
begin
{ PaintBox1.Canvas.Brush.Color := clWhite;
 PaintBox1.Canvas.StretchDraw(Rect(0, 0, PaintBox1.Width, PaintBox1.Height),
                              Image1.Picture.Graphic);}
end;

procedure TFormResults.PaintBox2Paint(Sender: TObject);
begin
{ PaintBox2.Canvas.Brush.Color := clWhite;
 PaintBox2.Canvas.StretchDraw(Rect(0, 0, PaintBox2.Width, PaintBox2.Height),
                              Image2.Picture.Graphic);}
end;

procedure TFormResults.PrintPreview1RenderPage(Page: Word;
  Canvas: TCanvas);
var
 Count: Integer;
 XY: TPoint;
 ABounds: TRect;
 SavedFont: TFont;
 PrintStr: string;
begin
{ Canvas.Brush.Color := clWhite; }
 PrintStr := 'RESTRICTED';
 PrintPreview1.ChangeMapMode(mmText, 0, 0);
 Canvas.Font.Name := 'Arial';
 Canvas.Font.Size := 14;
 XY.X := (PrintPreview1.PrintPixels.X - Canvas.TextWidth(PrintStr)) div 2;
 XY.Y := 100;
 Canvas.TextOut(XY.X, XY.Y, PrintStr);
 Canvas.TextOut(XY.X, PrintPreview1.PrintPixels.Y-
                           (Canvas.TextHeight(PrintStr)*2)-100, PrintStr);
 PrintStr := 'EXAM-IN-CONFIDENCE';
 XY.X := (PrintPreview1.PrintPixels.X - Canvas.TextWidth(PrintStr)) div 2;
 Canvas.TextOut(XY.X, XY.Y+Canvas.TextHeight(PrintStr), PrintStr);
 ABounds := Rect(0, XY.Y+(Canvas.TextHeight(PrintStr)*3),
                PrintPreview1.PrintPixels.X-100,
                PrintPreview1.PrintPixels.Y-(Canvas.TextHeight(PrintStr)*2)-100);
 Canvas.TextOut(XY.X, PrintPreview1.PrintPixels.Y-Canvas.TextHeight(PrintStr)-100, PrintStr);
 case Page of
  1:
  begin { First page of SOR }
{     StretchDraw(Rect(Conversion.X, Conversion.Y,
                      PrintPreview1.PagePixels.X-(Conversion.X),
                      PrintPreview1.PagePixels.Y-(Conversion.Y)),
                      Image1.Picture.Graphic); }
   Canvas.StretchDraw(ABounds, Image1.Picture.Graphic);
  end;  { First page of SOR }
  2:
  begin { 2nd page of SOR }
{   Canvas.StretchDraw(Rect(Conversion.X, Conversion.Y,
                           PrintPreview1.PagePixels.X-(Conversion.X),
                           PrintPreview1.PagePixels.Y-(Conversion.Y)),
                      Image2.Picture.Graphic); }
     Canvas.StretchDraw(ABounds, Image2.Picture.Graphic);
  end;  { 2nd page of SOR }
 end;
end;

procedure TFormResults.Notebook1PageChanged(Sender: TObject);
var
 I: Integer;
begin
{ Frees some resources }
{ Notebook.Pages.Objects[I] is a TPage }
{ for I := 0 to Notebook1.Pages.Count-1 do
  if I<>Notebook1.PageIndex then
   THintWindow(Notebook1.Pages.Objects[I]).ReleaseHandle; }
end;

procedure TFormResults.FormPaint(Sender: TObject);
var
 X, Y, Count: Integer;
 Marks: real;
 Name: string; NRIC: string[8];
 Grade: string[2];
 Grades: array[1..7] of Integer;
{ A=1, B=2, B-=3, C=4, C-=5, D=6, F=7 }
begin
 FillChar(Grades, SizeOf(Grades), #0);
 Image1.Picture.Bitmap.Assign(SOR1);
 Image2.Picture.Bitmap.Assign(SOR2);
 with Image1.Canvas do
  begin
   Font := FontDialog1.Font;
   SetBkMode(Handle, Transparent);
   TextOut(86, 167, 'Course Name');
   TextOut(87, 183, Global.ClassName);
   TextOut(87, 199, ExamDescription);
   for Count := 1 to StringGrid1.RowCount-1 do
    begin
     Y := 247+((Count-1)*16);
     TextOut(37,  Y, Format('%02.2d', [Count]));
     TextOut(86,  Y, StringGrid1.Cells[1, Count]);
     try
      NRIC := StringGrid1.Cells[1, Count];
      IniFile := TIniFile.Create(Format('%s%s.INI', [AnswersPath, NRIC]));
      Name := IniFile.ReadString('Trainee', 'Name', EmptyStr);
      if Name=EmptyStr then
       begin
        MessageDlg(Format('Cannot get name for trainee with IC: %s!', [NRIC]),
                   mtError, [mbOk], 0);
       end;
      TextOut(155, Y, Name);
     finally
      IniFile.Free;
     end;
     TextOut(425, Y, StringGrid1.Cells[2, Count]); { Marks }
     try
      Marks := StrToFloat(StringGrid1.Cells[2, Count]);
     except
      Marks := 0.0;
     end;
     if Marks>=75 then
      begin
       X := 539;
       Grade := 'A';
       Inc(Grades[1]);
      end else
     if Marks>=70 then
      begin
       X := 555;
       Grade := 'B';
       Inc(Grades[2]);
      end else
     if Marks>=65 then
      begin
       X := 572;
       Grade := 'B-';
       Inc(Grades[3]);
      end else
     if Marks>=60 then
      begin
       X := 589;
       Grade := 'C';
       Inc(Grades[4]);
      end else
     if Marks>=55 then
      begin
       X := 607;
       Grade := 'C-';
       Inc(Grades[5]);
      end else
     if Marks>=50 then
      begin
       X := 624;
       Grade := 'D';
       Inc(Grades[6]);
      end else
      begin
       X := 641;
       Grade := 'F';
       Inc(Grades[7]);
      end;
     TextOut(425, Y, Grade);
     TextOut(X, Y, '1');
    end;
   for Count := 1 to 7 do
    begin
     Grade := IntToStr(Grades[Count]);
     TextOut(539+((Count-1)*16), 759, Grade);
    end;
   TextOut(155+TextWidth('Name here'), Y+16, '--- LAST ENTRY ---');
  end;
end;

procedure TFormResults.PrinterFont1Click(Sender: TObject);
begin
 if FontDialog1.Execute then
  begin
   Printers.Printer.Canvas.Font := FontDialog1.Font;
   Refresh;
  end;
end;

procedure TFormResults.Margins1Click(Sender: TObject);
begin
 try
  FormMargins := TFormMargins.Create(Self);
  if not EqualRect(PrnMargins, FormMargins.Margins) then
   FormMargins.Margins := PrnMargins;
  if FormMargins.ShowModal=mrOk then
   begin
    if not EqualRect(PrnMargins, FormMargins.Margins) then
     begin
      PrnMargins := FormMargins.Margins;
      with PrnMargins do
       begin
        try
         IniFile := TIniFile.Create(ExecPath+CASEIni);
         try
          IniFile.WriteInteger('Printer', 'MarginLeft', Left);
          IniFile.WriteInteger('Printer', 'MarginRight', Right);
          IniFile.WriteInteger('Printer', 'MarginTop', Top);
          IniFile.WriteInteger('Printer', 'MarginBottom', Bottom);
         except
         end;
        finally
         IniFile.Free;
        end;
       end;
     end;
   end;
 finally
  FormMargins.Free;
 end;
end;

procedure TFormResults.PrintPreview1PrintStart(Sender: TObject);
begin
 PrintPreview1.FromPage := 1;
 PrintPreview1.ToPage := 2;
end;

procedure TFormResults.Close1Click(Sender: TObject);
begin
 Close;
end;

procedure TFormResults.MenuSOR1Click(Sender: TObject);
begin
 StringGrid1.Visible := False;
 PrintPreview1.Previewing := True;
end;

procedure TFormResults.Individualresult1Click(Sender: TObject);
begin
 PrintPreview1.Previewing := False;
 StringGrid1.Visible := True;
end;

end.
