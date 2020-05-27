program sort;
var
   angka: array[1..5] of integer;
   i,a, temp: integer;
begin
   {Mengisi array}
   angka[1] := 3;
   angka[2] := 5;
   angka[3] := 4;
   angka[4] := 2;
   angka[5] := 1;

   {Tampilkan data sebelum diurutkan}
   writeln('Sebelum diurutkan : ');
   for i:=1 to 5 do
   begin
      writeln('angka ke-', i, ' : ', angka[i]);
   end;

   {Lakukan pengurutan/sorting}
   for i:=1 to 4 do
   begin
     for a:=i+1 to 5 do
     begin
       if(angka[a] < angka[i]) then
       begin
         temp := angka[a];
         angka[a] := angka[i];
         angka[i] := temp;
       end;
     end;
   end;

   {Tampilkan data setelah diurutkan}
   writeln('Setelah diurutkan : ');
   for i:=1 to 5 do
   begin
     writeln('angka ke-', i, ' : ', angka[i]);
   end;
end.