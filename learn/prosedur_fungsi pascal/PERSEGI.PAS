Program PersegiPanjang;             {Judul Program Utama}
uses crt;
var   										{deklarasi variabel global}
  p,l:byte; 								{p :panjang, l:lebar}
  ls,kel:integer; 						{ls:luas, kel:keliling}
begin
  clrscr;
  writeln('Program Untuk Menghitung luas dan keliling persegipanjang');
  writeln;
  write('Masukan panjang : ');readln(p);
  write('Masukan lebar   : ');readln(l);
  writeln;

  ls:=p*l; 									{luas=panjang x lebar}
  Kel:=(2*p)+(2*l);						{keliling=(2 x panjang) + (2 x lebar)}

  writeln('Luas     : ',ls);
  writeln('Keliling : ',kel);
  readln;
end.



























