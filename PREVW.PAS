unit Prevw;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Tabs, ExtCtrls, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    Notebook1: TNotebook;
    Image1: TImage;
    Image2: TImage;
    TabSet1: TTabSet;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Edit1: TEdit;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure SpinEdit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PaintBox2Paint(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
   Image1Backup, Image2Backup: TBitmap;
   procedure UpdateActual;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 TabSet1.Tabs := Notebook1.Pages;
 with Image1.Canvas do
  begin
   Font.Name := 'Arial';
   Font.Size := 10;
  end;
 Image1Backup := TBitmap.Create;
 Image2Backup := TBitmap.Create;
 Image1Backup.Assign(Image1.Picture.Bitmap);
 Image2Backup.Assign(Image2.Picture.Bitmap);
end;

procedure TForm1.TabSet1Click(Sender: TObject);
begin
 Notebook1.PageIndex := TabSet1.TabIndex;
end;


procedure TForm1.UpdateActual;
begin
 PaintBox1.Canvas.Brush.Color := clWhite;
 PaintBox1.Canvas.FillRect(Rect(0, 0, PaintBox1.Width, PaintBox1.Height));
 PaintBox1.Refresh;
 PaintBox2.Refresh;
end;


procedure TForm1.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 AllowChange := True;
 case NewTab of
  0: UpdateActual;
  1:
   begin
    with Image1 do
     begin
      Left := (Notebook1.Width-Width) div 2;
      Top := (Notebook1.Height-Height) div 2;
     end;
   end;
  2:
   begin
    with Image2 do
     begin
      Left := (Notebook1.Width-Width) div 2;
      Top := (Notebook1.Height-Height) div 2;
     end;
   end;
 end;
end;


procedure TForm1.SpinEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_Return then
 try
  Image1.Canvas.Draw(0, 0, Image1Backup);
  Image2.Canvas.Draw(0, 0, Image2Backup);
  SetBkMode(Image1.Canvas.Handle, Transparent);
  Image1.Canvas.TextOut(SpinEdit1.Value, SpinEdit2.Value, Edit1.Text);
  UpdateActual;
 except
 end;
end;

procedure TForm1.PaintBox2Paint(Sender: TObject);
begin
   PaintBox2.Canvas.Brush.Color := clWhite;
   PaintBox2.Canvas.CopyMode := cmSrcCopy;
   PaintBox2.Canvas.CopyRect(PaintBox2.ClientRect, Image2.Canvas,
                             Rect(0, 0, Image2.Picture.Bitmap.Width,
                                        Image2.Picture.Bitmap.Height));
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
   PaintBox1.Canvas.Brush.Color := clWhite;
   PaintBox1.Canvas.CopyMode := cmSrcCopy;
   PaintBox1.Canvas.CopyRect(PaintBox1.ClientRect, Image1.Canvas,
                             Rect(0, 0, Image1.Picture.Bitmap.Width,
                                        Image1.Picture.Bitmap.Height));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 Image1Backup.Free;
 Image2Backup.Free;
end;

end.
