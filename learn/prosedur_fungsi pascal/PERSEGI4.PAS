Program PersegiPanjang;                	{judul Program Utama}
uses crt;

Procedure Hitung_Luas(p,l:integer);       {Prosedur dengan parameter}
var
	ls:integer;										{variabel lokal}
begin
 ls:=p*l;
 writeln('Luas     :',ls);
end;

Procedure Hitung_Keliling(p,l:integer);	{Prosedur dengan parameter}
var
	kel:integer;									{variabel lokal}
begin
 kel:=(2*p)+(2*l);
 writeln('Keliling :',kel);
end;

{===program utama===}
var
  pj,lbr:integer;
begin
  clrscr;
  writeln('Program Untuk Menghitung luas dan keliling persegipanjang');
  writeln;
  write('Masukan panjang : ');readln(pj);
  write('Masukan lebar   : ');readln(lbr);
  writeln;
  Hitung_Luas(pj,lbr); 							{Memanggil prosedur Hitung_Luas}
  Hitung_Keliling(pj,lbr);                {Memanggil prosedur Hitung_Keliling}
  readln;
end.












