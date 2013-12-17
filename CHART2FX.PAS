{********************************************}
{*                                          *}
{* CHART2FX.PAS generated from CHART2FX.VBX *}
{*                                          *}
{********************************************}

unit Chart2fx;

interface

uses SysUtils, Classes, Graphics, Forms, Controls, VBXCtrl, BIVBX;

{ $DEFINE InitTChartFX}
{^- Remove space to enable default init data -- See documentation. }

type
  TChartLButtonDblClkEvent = procedure (Sender: TObject; var X: Integer; var
    Y: Integer; var nSerie: Integer; var nPoint: Integer; var nRes: Integer)
    of object;
  TChartRButtonDownEvent = procedure (Sender: TObject; var X: Integer; var Y:
    Integer; var nSerie: Integer; var nPoint: Integer; var nRes: Integer) of
    object;
  TChartChangeValueEvent = procedure (Sender: TObject; var dValue: Double;
    var nSerie: Integer; var nPoint: Integer; var nRes: Integer) of object;
  TChartChangeStringEvent = procedure (Sender: TObject; var nType: Integer;
    var nIndex: Integer; var nRes: Integer) of object;
  TChartChangeColorEvent = procedure (Sender: TObject; var nType: Integer;
    var nIndex: Integer; var nRes: Integer) of object;
  TChartDestroyEvent = procedure (Sender: TObject) of object;
  TChartReadFileEvent = procedure (Sender: TObject) of object;
  TChartChangePaletteEvent = procedure (Sender: TObject; var nIndex: Integer;
    var nRes: Integer) of object;
  TChartChangeFontEvent = procedure (Sender: TObject; var nIndex: Integer;
    var nRes: Integer) of object;
  TChartReadTemplateEvent = procedure (Sender: TObject) of object;
  TChartChangePatternEvent = procedure (Sender: TObject; var nType: Integer;
    var nIndex: Integer; var nRes: Integer) of object;
  TChartChangePattPalEvent = procedure (Sender: TObject; var nIndex: Integer;
    var nRes: Integer) of object;
  TChartMenuEvent = procedure (Sender: TObject; var wParam: Integer; var
    nSerie: Integer; var nPoint: Integer; var nRes: Integer) of object;
  TChartChangeTypeEvent = procedure (Sender: TObject; var nType: Integer; var
    nRes: Integer) of object;
  TChartUserScrollEvent = procedure (Sender: TObject; var wScrollMsg: Integer;
    var wScrollParam: Integer; var nRes: Integer) of object;
  TChartGetLegendEvent = procedure (Sender: TObject; var bYLegend: Integer;
    var nRes: Integer) of object;

  { TChartFX }

  TChartFX = class(TVBXControl)
  protected
    FOnLButtonDblClk: TChartLButtonDblClkEvent;
    FOnRButtonDown: TChartRButtonDownEvent;
    FOnChangeValue: TChartChangeValueEvent;
    FOnChangeString: TChartChangeStringEvent;
    FOnChangeColor: TChartChangeColorEvent;
    FOnDestroy: TChartDestroyEvent;
    FOnReadFile: TChartReadFileEvent;
    FOnChangePalette: TChartChangePaletteEvent;
    FOnChangeFont: TChartChangeFontEvent;
    FOnReadTemplate: TChartReadTemplateEvent;
    FOnChangePattern: TChartChangePatternEvent;
    FOnChangePattPal: TChartChangePattPalEvent;
    FOnMenu: TChartMenuEvent;
    FOnChangeType: TChartChangeTypeEvent;
    FOnUserScroll: TChartUserScrollEvent;
    FOnGetLegend: TChartGetLegendEvent;
    { Event handler }
    procedure HandleVBXEvent(var Message: TWMVBXFireEvent); override;
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;

    property Index: TVBInteger index 1 read GetIntProp;
    property OpenData[Index: Integer]: TVBLongint index 15 read
      GetLongArrayProp write SetLongArrayProp;
    property CloseData[Index: Integer]: TVBLongint index 16 read
      GetLongArrayProp write SetLongArrayProp;
    property Value[Index: Integer]: Single index 17 read GetSingleArrayProp
      write SetSingleArrayProp;
    property XValue[Index: Integer]: Single index 18 read GetSingleArrayProp
      write SetSingleArrayProp;
    property IniValue[Index: Integer]: Single index 19 read
      GetSingleArrayProp write SetSingleArrayProp;
    property pConst[Index: Integer]: Single index 20 read GetSingleArrayProp
      write SetSingleArrayProp;
    property Color[Index: Integer]: TColor index 22 read GetColorArrayProp
      write SetColorArrayProp;
    property BkColor[Index: Integer]: TColor index 24 read GetColorArrayProp
      write SetColorArrayProp;
    property Adm[Index: Integer]: Single index 26 read GetSingleArrayProp
      write SetSingleArrayProp;
    property Pattern[Index: Integer]: TVBInteger index 37 read
      GetIntArrayProp write SetIntArrayProp;
    property BarHorzGap: TVBInteger index 38 read GetIntProp write SetIntProp;
    property View3D: Boolean index 40 read GetBoolProp write SetBoolProp;
    property Angles3D: TVBLongint index 41 read GetLongProp write SetProp;
    property PixFactor: TVBInteger index 42 read GetIntProp write SetIntProp;
    property FixedWidth: TVBInteger index 47 read GetIntProp write SetIntProp;
    property FixedStyle: TVBEnum index 48 read GetEnumProp write SetEnumProp;
    property FixedColor: TColor index 49 read GetColorProp write SetColorProp;
    property FixedBkColor: TColor index 50 read GetColorProp write
      SetColorProp;
    property DblClk[Index: Integer]: TVBInteger index 53 read GetIntArrayProp
      write SetIntArrayProp;
    property RigClk[Index: Integer]: TVBInteger index 55 read GetIntArrayProp
      write SetIntArrayProp;
    property Font[Index: Integer]: TVBLongint index 61 read GetLongArrayProp
      write SetLongArrayProp;
    property Title[Index: Integer]: TVBString index 63 read
      GetStringArrayProp write SetStringArrayProp;
    property Status[Index: Integer]: TVBLongint index 64 read
      GetLongArrayProp write SetLongArrayProp;
    property ShowStatus: Boolean index 65 read GetBoolProp write SetBoolProp;
    property Language: TVBString index 66 read GetStringProp write
      SetStringProp;
    property HText: TVBString index 67 read GetStringProp write SetStringProp;
    property Legend[Index: Integer]: TVBString index 68 read
      GetStringArrayProp write SetStringArrayProp;
    property SerLeg[Index: Integer]: TVBString index 69 read
      GetStringArrayProp write SetStringArrayProp;
    property KeyLeg[Index: Integer]: TVBString index 70 read
      GetStringArrayProp write SetStringArrayProp;
    property FixLeg[Index: Integer]: TVBString index 71 read
      GetStringArrayProp write SetStringArrayProp;
    property YLeg[Index: Integer]: TVBString index 72 read GetStringArrayProp
      write SetStringArrayProp;
    property KeySer[Index: Integer]: TVBString index 73 read
      GetStringArrayProp write SetStringArrayProp;
    property StatusText[Index: Integer]: TVBString index 74 read
      GetStringArrayProp write SetStringArrayProp;
    property ExportFile: TVBString index 75 read GetStringProp write
      SetStringProp;
    property ImportFile: TVBString index 76 read GetStringProp write
      SetStringProp;
    property WriteTemplate: TVBString index 77 read GetStringProp write
      SetStringProp;
    property ReadTemplate: TVBString index 78 read GetStringProp write
      SetStringProp;
    property ChartStatus: TVBInteger index 79 read GetIntProp write
      SetIntProp;
    property RGBFont[Index: Integer]: TColor index 80 read GetColorArrayProp
      write SetColorArrayProp;
    property Edit: TVBInteger index 81 read GetIntProp write SetIntProp;
    property CopyData: TVBInteger index 82 read GetIntProp write SetIntProp;
    property CopyBitmap: TVBInteger index 83 read GetIntProp write SetIntProp;
    property PrintIt: TVBInteger index 84 read GetIntProp write SetIntProp;
    property HFont[Index: Integer]: TVBInteger index 85 read GetIntArrayProp
      write SetIntArrayProp;
    property hCtlWnd: TVBInteger index 94 read GetIntProp write SetIntProp;
    property ReturnValue: TVBLongint index 95 read GetLongProp write SetProp;
    property ThisValue: Single index 100 read GetSingleProp write
      SetSingleProp;
    property XLegType: TVBInteger index 102 read GetIntProp write SetIntProp;
    property ConstType: TVBInteger index 103 read GetIntProp write SetIntProp;
    property ItemWidth[Index: Integer]: TVBInteger index 104 read
      GetIntArrayProp write SetIntArrayProp;
    property ItemStyle[Index: Integer]: TVBInteger index 105 read
      GetIntArrayProp write SetIntArrayProp;
    property ItemColor[Index: Integer]: TColor index 106 read
      GetColorArrayProp write SetColorArrayProp;
    property DecimalsNum[Index: Integer]: TVBInteger index 107 read
      GetIntArrayProp write SetIntArrayProp;
    property ShowDialog[Index: Integer]: TVBInteger index 108 read
      GetIntArrayProp write SetIntArrayProp;
    property LegendWidth: TVBInteger index 110 read GetIntProp write
      SetIntProp;
    property Scroll[Index: Integer]: TVBLongint index 111 read
      GetLongArrayProp write SetLongArrayProp;
  published
    property Visible;
    property BorderStyle: TVBEnum index 9 read GetEnumProp write SetEnumProp
      default 1;
    property pType: TVBLongint index 11 read GetLongProp write SetProp
      default 16385;
    property Style: TVBLongint index 12 read GetLongProp write SetProp
      default -1;
    property NSeries: TVBInteger index 13 {NoRT}read GetIntProp {NoRT}write
      SetIntProp stored False;
    property NValues: TVBInteger index 14 {NoRT}read GetIntProp {NoRT}write
      SetIntProp stored False;
    property ThisColor: TColor index 21 {NoRT}read GetColorProp {NoRT}write
      SetColorProp stored False;
    property ThisBkColor: TColor index 23 {NoRT}read GetColorProp {NoRT}write
      SetColorProp stored False;
    property AdmDlg: TVBLongint index 25 {NoRT}read GetLongProp {NoRT}write
      SetProp stored False;
    property LeftGap: TVBInteger index 27 read GetIntProp write SetIntProp;
    property RightGap: TVBInteger index 28 read GetIntProp write SetIntProp;
    property TopGap: TVBInteger index 29 read GetIntProp write SetIntProp;
    property BottomGap: TVBInteger index 30 read GetIntProp write SetIntProp;
    property Decimals: TVBInteger index 31 read GetIntProp write SetIntProp;
    property PointType: TVBEnum index 32 read GetEnumProp write SetEnumProp;
    property Scheme: TVBEnum index 33 read GetEnumProp write SetEnumProp;
    property Stacked: TVBEnum index 34 read GetEnumProp write SetEnumProp;
    property Grid: TVBEnum index 35 read GetEnumProp write SetEnumProp;
    property WallWidth: TVBInteger index 36 read GetIntProp write SetIntProp;
    property ViewRot3D: TVBInteger index 39 {NoRT}read GetIntProp {NoRT}write
      SetIntProp stored False;
    property LineWidth: TVBInteger index 43 read GetIntProp write SetIntProp;
    property LineStyle: TVBEnum index 44 read GetEnumProp write SetEnumProp;
    property LineColor: TColor index 45 read GetColorProp write SetColorProp;
    property LineBkColor: TColor index 46 read GetColorProp write
      SetColorProp;
    property FixedGap: TVBInteger index 51 read GetIntProp write SetIntProp;
    property DblClkDlg: TVBEnum index 52 {NoRT}read GetEnumProp {NoRT}write
      SetEnumProp;
    property RigClkDlg: TVBEnum index 54 {NoRT}read GetEnumProp {NoRT}write
      SetEnumProp;
    property RGBBarHorz: TColor index 56 read GetColorProp write SetColorProp;
    property RGBBk: TColor index 57 read GetColorProp write SetColorProp;
    property RGB2DBk: TColor index 58 read GetColorProp write SetColorProp;
    property RGB3DBk: TColor index 59 read GetColorProp write SetColorProp;
    property FontDlg: TVBLongint index 60 read GetLongProp write SetProp
      stored False;
    property TitleDlg: TVBLongint index 62 read GetLongProp write SetProp
      stored False;
    property ThisSerie: TVBInteger index 86 read GetIntProp write SetIntProp
      stored False;
    property ChartType: TVBEnum index 87 read GetEnumProp write SetEnumProp
      stored False;
    property Chart3D: Boolean index 88 read GetBoolProp write SetBoolProp
      stored False;
    property ToolBar: Boolean index 89 read GetBoolProp write SetBoolProp
      stored False;
    property PaletteBar: Boolean index 90 read GetBoolProp write SetBoolProp
      stored False;
    property PatternBar: Boolean index 91 read GetBoolProp write SetBoolProp
      stored False;
    property ThisPoint: TVBInteger index 92 read GetIntProp write SetIntProp
      stored False;
    property CustTool: TVBLongint index 93 read GetLongProp write SetProp;
    property AutoIncrement: Boolean index 99 read GetBoolProp write
      SetBoolProp stored False;
    property VertGridGap: TVBInteger index 101 read GetIntProp write
      SetIntProp;
    property OnLButtonDblClk: TChartLButtonDblClkEvent read FOnLButtonDblClk
      write FOnLButtonDblClk;
    property OnRButtonDown: TChartRButtonDownEvent read FOnRButtonDown write
      FOnRButtonDown;
    property OnChangeValue: TChartChangeValueEvent read FOnChangeValue write
      FOnChangeValue;
    property OnChangeString: TChartChangeStringEvent read FOnChangeString
      write FOnChangeString;
    property OnChangeColor: TChartChangeColorEvent read FOnChangeColor write
      FOnChangeColor;
    property OnDestroy: TChartDestroyEvent read FOnDestroy write FOnDestroy;
    property OnReadFile: TChartReadFileEvent read FOnReadFile write
      FOnReadFile;
    property OnChangePalette: TChartChangePaletteEvent read FOnChangePalette
      write FOnChangePalette;
    property OnChangeFont: TChartChangeFontEvent read FOnChangeFont write
      FOnChangeFont;
    property OnReadTemplate: TChartReadTemplateEvent read FOnReadTemplate
      write FOnReadTemplate;
    property OnChangePattern: TChartChangePatternEvent read FOnChangePattern
      write FOnChangePattern;
    property OnChangePattPal: TChartChangePattPalEvent read FOnChangePattPal
      write FOnChangePattPal;
    property OnMenu: TChartMenuEvent read FOnMenu write FOnMenu;
    property OnChangeType: TChartChangeTypeEvent read FOnChangeType write
      FOnChangeType;
    property OnUserScroll: TChartUserScrollEvent read FOnUserScroll write
      FOnUserScroll;
    property OnGetLegend: TChartGetLegendEvent read FOnGetLegend write
      FOnGetLegend;
    property OnEnter;
    property OnExit;
  end;

procedure Register;

implementation

{ Default form data for TChartFX }

{$IFDEF InitTChartFX}

const
  TChartFXInitLen = 254;

procedure TChartFXInitData; near; assembler;
asm
	DB	$00,$05,$43,$68,$61,$72,$74,$01,$00,$00,$02,$06,$FF,$FF,$09,$01
	DB	$0A,$00,$0B,$01,$40,$00,$00,$0C,$FF,$FF,$FF,$FF,$0D,$0E,$02,$00
	DB	$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB	$F0,$3F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB	$59,$40,$15,$00,$00,$00,$00,$00,$00,$17,$19,$1B,$32,$00,$1C,$32
	DB	$00,$1D,$28,$00,$1E,$28,$00,$1F,$02,$00,$20,$02,$21,$00,$22,$00
	DB	$23,$00,$24,$08,$00,$27,$00,$00,$00,$00,$00,$00,$2B,$01,$00,$2C
	DB	$00,$2D,$00,$00,$00,$00,$2E,$00,$00,$00,$00,$33,$00,$00,$34,$00
	DB	$36,$02,$38,$00,$FF,$FF,$00,$39,$C0,$C0,$C0,$00,$3A,$C0,$C0,$C0
	DB	$00,$3B,$FF,$FF,$FF,$00,$3C,$08,$00,$00,$20,$08,$00,$00,$60,$08
	DB	$00,$00,$00,$08,$00,$00,$00,$08,$00,$00,$00,$08,$00,$00,$00,$08
	DB	$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$3E,$00,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$00,$57,$58,$59,$5A,$5B,$5D,$FF,$1F
	DB	$FF,$1F,$60,$00,$61,$00,$62,$00,$65,$01,$00,$6D,$00,$FF
end;

{$ENDIF}

{ TChart }

constructor TChartFX.Create(AOwner: TComponent);
begin
  FVBXFile := StrNew('CHART2FX.VBX');
  FVBXClass := StrNew('ChartFX20');
  SetBounds(0, 0, 80, 32);
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csCaptureMouse, csClickEvents];
  TabStop := True;
  FVBXFlags := [vfArrows, vfLoadMessage];
  {$IFDEF InitTChartFX}
  FHForm := VBXCreateFormFile(TChartFXInitLen, @TChartFXInitData);
  {$ENDIF}
end;

procedure TChartFX.HandleVBXEvent(var Message: TWMVBXFireEvent);
begin
  case Message.VBXEvent^.EventIndex of
    0: DispatchCustomEvent(FOnLButtonDblClk, Message, 0);
    1: DispatchCustomEvent(FOnRButtonDown, Message, 1);
    2: DispatchCustomEvent(FOnChangeValue, Message, 2);
    3: DispatchCustomEvent(FOnChangeString, Message, 3);
    4: DispatchCustomEvent(FOnChangeColor, Message, 4);
    5: DispatchCustomEvent(FOnDestroy, Message, 5);
    6: DispatchCustomEvent(FOnReadFile, Message, 6);
    7: DispatchCustomEvent(FOnChangePalette, Message, 7);
    8: DispatchCustomEvent(FOnChangeFont, Message, 8);
    9: DispatchCustomEvent(FOnReadTemplate, Message, 9);
    10: DispatchCustomEvent(FOnChangePattern, Message, 10);
    11: DispatchCustomEvent(FOnChangePattPal, Message, 11);
    12: DispatchCustomEvent(FOnMenu, Message, 12);
    13: DispatchCustomEvent(FOnChangeType, Message, 13);
    14: DispatchCustomEvent(FOnUserScroll, Message, 14);
    15: DispatchCustomEvent(FOnGetLegend, Message, 15);
    16: begin end; { VCL Handles OnGotFocus }
    17: begin end; { VCL Handles OnLostFocus }
  end;
end;

procedure TChartFX.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  HandleProperty('about', Filer, 10);
  HandleBinaryProperty('NSeries_Data', Filer, 13);
  HandleBinaryProperty('NValues_Data', Filer, 14);
  HandleBinaryProperty('ThisColor_Data', Filer, 21);
  HandleBinaryProperty('ThisBkColor_Data', Filer, 23);
  HandleBinaryProperty('AdmDlg_Data', Filer, 25);
  HandleBinaryProperty('ViewRot3D_Data', Filer, 39);
  HandleBinaryProperty('FontDlg_Data', Filer, 60);
  HandleBinaryProperty('TitleDlg_Data', Filer, 62);
  HandleBinaryProperty('ChartType_Data', Filer, 87);
  HandleBinaryProperty('Chart3D_Data', Filer, 88);
  HandleBinaryProperty('ToolBar_Data', Filer, 89);
  HandleBinaryProperty('PaletteBar_Data', Filer, 90);
  HandleBinaryProperty('PatternBar_Data', Filer, 91);
  HandleProperty('ZReserved1', Filer, 96);
  HandleProperty('ZReserved2', Filer, 97);
  HandleProperty('ZReserved3', Filer, 98);
end;

{ Designer registration }
procedure Register;
begin
  RegisterComponents('VBX', [
    TChartFX]);
end;

end.
