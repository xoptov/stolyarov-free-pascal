{ filter_ok.pas }
program FilterOk;
var
  c: char;
begin
  while not eof do
  begin
    read(c);
    if c = #10 then
      writeln('Ok');
  end;
  writeln('Goodbye!');
end.  
