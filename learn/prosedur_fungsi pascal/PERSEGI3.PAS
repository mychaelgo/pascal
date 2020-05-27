Program PersegiPanjang;                {judul Program Utama}
uses crt;
var 												{deklarasi variabel global}
	 p,l:byte; 									{p :panjang, l:lebar}

Procedure Hitung_Luas;                 {Prosedur dengan parameter}
var
	ls:integer;									{variabel lokal}
begin
 ls:=p*l;
 writeln('Luas     :',ls);
end;

Procedure Hitung_Keliling;					{Prosedur dengan parameter}
var
	kel:integer;								{variabel lokal}
begin
 kel:=(2*p)+(2*l);
 writeln('Keliling :',kel);
end;

{===program utama===}
begin
  clrscr;
  writeln('Program Untuk Menghitung luas dan keliling persegipanjang');
  writeln;
  write('Masukan panjang : ');readln(p);
  write('Masukan lebar   : ');readln(l);
  writeln;
  Hitung_Luas; 								{Memanggil prosedur Hitung_Luas}
  Hitung_Keliling;                     {Memanggil prosedur Hitung_Keliling}
  readln;
end.










