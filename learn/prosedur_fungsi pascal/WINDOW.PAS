uses crt;
var warna :byte;
begin
	warna:=1;
   clrscr;
   window(5,5,20,20);
   window(25,5,40,20);

   repeat
   	{textcolor(warna);}
      write('01011101010');
      if warna >= 255 then
      	warna:=1
      else
      	warna:=warna+1;
   until keypressed;
end.
