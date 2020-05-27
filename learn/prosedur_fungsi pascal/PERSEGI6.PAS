Program PersegiPanjang;                    	{judul Program Utama}
uses crt;

Procedure Hitung_Luas(p,l:integer; var ls:integer);       {Prosedur dengan parameter}
begin
  ls:=p*l;
  writeln('p  = ',p);
  writeln('l  = ',l);
  writeln('ls = ',ls);
end;

{===program utama===}
var
  pj,lbr,luas:integer;
begin
  clrscr;
  writeln('Program Untuk Menghitung luas persegipanjang');
  pj:=10;
  lbr:=6;
  writeln;

  Hitung_Luas(pj,lbr,luas); 			{Memanggil prosedur Hitung_Luas}
  writeln;
  writeln('pj   = ',pj);
  writeln('lbr  = ',lbr);
  writeln('luas = ',luas);
  readln;
end.












