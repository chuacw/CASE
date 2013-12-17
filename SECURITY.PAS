unit Security;

interface

function TransformString(const S: string): string;

implementation

{ 26 is Control Z. (EOF)
  By using it as the xor value, we prevent ourself
  from generating a EOF }
function TransformString;
var
 I: Word;
begin
 Result := S;
 for I := 1 to Length(Result) do
  Result[I] := Chr(Ord(Result[I]) xor 26);
end;

end.
