unit Filename;

interface
uses WinTypes;

function IsValidFileName(const FileName: string): Bool;
function IsValidPathName(const PathName: string): Bool;

implementation
uses Classes, SysUtils;

function IsValidFileName(const FileName: string): Bool;
var
 AFileStream: TFileStream;
begin
{ Attempt to validate the file name by first opening it.
  If opens successfully, the file is closed.
  If not opened successfully, attempt to create...
  If can't create, filename is invalid and returns CanClose as False }
   try
    Result := FileExists(FileName);
   except
    Result := False;
   end;
end;

function PosR(SourceP, DestP: string): Integer; assembler;
const
ofs=0;
seg=2;
asm
	PUSH	DS
        PUSHF
	LDS	SI,SourceP
        XOR     AX,AX
	CLD
        LODSB
	OR	AL,AL
	JE	@@2
        ADD     SI,AX
        DEC     SI
	MOV	DL,AL
	XOR	DH,DH
	LES	DI,DestP
	MOV	CL,ES:[DI]
	XOR	CH,CH
	SUB	CX,DX
	JB	@@2
	INC	CX
	INC	DI
        ADD     DI,CX
        DEC     DI
@@0:
        STD
@@1:	LODSB
	REPNE	SCASB
	JNE	@@2
	MOV	AX,DI
	MOV	BX,CX
	MOV	CX,DX
	DEC	CX
	REPE	CMPSB
	JE	@@3
	MOV	DI,AX
	MOV	CX,BX
	MOV	SI,WORD PTR SourceP.ofs
	INC	SI
	JMP	@@0
@@2:	XOR	AX,AX
	JMP	@@4
@@3:	SUB	DI,WORD PTR DestP.ofs
        MOV     AX,DI
        INC     AX
@@4:    POPF
        POP	DS
end;

type
 TAction = (taNone, taCreate, taRemove);
var
 ExistingPath: string;

function InternalValidPathName(const PathName: string; Action: TAction): Bool;
begin
  if PathName=EmptyStr then exit;
  try
   case Action of
    taCreate:
     begin
      MkDir(PathName);
      if ExistingPath=EmptyStr then
       ExistingPath := Copy(PathName, 1, PosR('\', PathName));
     end;
    taRemove:
     if PathName<>ExistingPath then
      begin
       RmDir(PathName);
       Result := InternalValidPathName(System.Copy(PathName, 1, PosR('\', PathName)-1), taRemove);
      end;
   end;
   Result := True;
  except
   { If assuming PathName = \PATH1\PATH2\PATH3, and exception occured,
     and PATH1 exists, exception occurs because Path2 doesn't exist,
     recurse with PathName = \PATH1\PATH2 }
   Result := InternalValidPathName(System.Copy(PathName, 1, PosR('\', PathName)-1), Action);
   if Result then
    begin
     try
      case Action of
       taCreate: MkDir(PathName);
       taRemove: RmDir(PathName);
      end;
     except
      Result := False;
     end;
    end;
  end;
end;

{ Assumes that there's no drive listed in the PathName}
function IsValidPathName(const PathName: string): Bool;
begin
 ExistingPath := EmptyStr;
 Result := InternalValidPathName(PathName, taCreate);
 InternalValidPathName(PathName, taRemove);
 ExistingPath := EmptyStr;
end;

end.
