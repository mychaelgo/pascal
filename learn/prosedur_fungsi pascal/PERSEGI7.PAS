Program PersegiPanjang;                    	{judul Program Utama}
uses crt;

Function Luas(p,l:integer ):integer;
begin
  Luas:=p*l;
end;

{===program utama===}
var
  pj,lbr:integer;
begin
  clrscr;
  writeln('Program Untuk Menghitung luas persegipanjang');
  writeln;

  write('Masukan panjang : ');readln(pj);
  write('Masukan lebar   : ');readln(lbr);
D:\Tutorial-Artikel-Ebook\Coba\PERSEGI6.EXE  write('Luasnya = ',Luas(pj,lbr));
  readln;
end.












