uses crt;
var i:integer;

begin
    {clrscr;}
    if paramcount = 0 then
    begin
         writeln('Tidak ada parameter...');
         halt; {Kode kesalahan}
    end;

    writeln('Nama program : ',ParamStr(0));
    for i:=1 to Paramcount do
      writeln('Parameter',i,' : ',Paramstr(i));
      {readln;
      exit;}
end.