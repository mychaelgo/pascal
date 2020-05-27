program tetris_2player;

uses crt;

type _points = array [1..4] of record
        x,y : longint;
     end;
     tetris = record
        points : _points;
        cshape, nshape, xmodel, xtetris, ymodel, ytetris : longint;
     end;

Const template : array [1..8] of _points =
	(((x:1; y:1),(x:1; y:2),(x:2; y:1),(x:2; y:2)),
 	((x:2; y:1),(x:1; y:1),(x:3; y:1),(x:4; y:1)),
    ((x:1; y:2),(x:1; y:1),(x:1; y:3),(x:2; y:3)),
    ((x:2; y:2),(x:2; y:1),(x:2; y:3),(x:1; y:3)),
    ((x:1; y:2),(x:1; y:1),(x:2; y:2),(x:2; y:3)),
    ((x:1; y:2),(x:2; y:1),(x:2; y:2),(x:1; y:3)),
    ((x:1; y:2),(x:1; y:1),(x:1; y:3),(x:2; y:2)),
    ((x:1; y:2),(x:2; y:1),(x:2; y:2),(x:2; y:3)));

var field : array [1..79,1..25] of boolean;
    tetris1, tetris2, ttetris : tetris;
    quit,gameover : boolean;
    answer : char;

procedure init_field;
var i : longint;
begin
     clrscr; fillchar(field,sizeof(field),0);
     for i := 3 to 22 do
     begin
        gotoxy(20,i); write(#186); field[20,i] := true;
        gotoxy(36,i); write(#186); field[36,i] := true;
        gotoxy(60,i); write(#186); field[60,i] := true;
        gotoxy(76,i); write(#186); field[76,i] := true;
     end;
     for i := 1 to 15 do
     begin
        gotoxy(20+i,23); write(#205); field[20+i,23] := true;
        gotoxy(60+i,23); write(#205); field[60+i,23] := true;
     end;
     gotoxy(20,23); write(#200);
     gotoxy(60,23); write(#200);
     gotoxy(36,23); write(#188);
     gotoxy(76,23); write(#188);
     gotoxy(6,4); write('Next:');
     gotoxy(46,4); write('Next:');
end;

procedure drawtetris(objek : tetris; mode : Boolean);
var i : longint;
	c : char;
begin
	if mode then c := #178 else c := #32;
	for i := 1 to 4 do
	begin
        field[objek.points[i].x,objek.points[i].y] := mode;
        gotoxy(objek.points[i].x, objek.points[i].y);
        write(c);
    end;
    gotoxy(1,1);
End;

procedure dropnew(var objek : tetris);
var i : longint;
begin
    if objek.cshape <> 0 then
    begin
        for i := 1 to 4 do
        begin
            ttetris.points[i].x := template[objek.nshape,i].x + objek.xmodel;
            ttetris.points[i].y := template[objek.nshape,i].y + objek.ymodel;
        end;
        drawtetris(ttetris,false);
    end;
    objek.cshape := objek.nshape;
    objek.nshape := random(8) + 1;
    for i := 1 to 4 do
    begin
        objek.points[i].x := template[objek.cshape,i].x + objek.xtetris;
        objek.points[i].y := template[objek.cshape,i].y + objek.ytetris;
        ttetris.points[i].x := template[objek.nshape,i].x + objek.xmodel;
        ttetris.points[i].y := template[objek.nshape,i].y + objek.ymodel;
        if field[objek.points[i].x,objek.points[i].y] then
        begin
            gameover := true;
            break;
        end;
    end;
    drawtetris(objek,true);
    drawtetris(ttetris,true);
end;

procedure init_tetris(var objek : tetris; id : longint);
begin
     objek.nshape := random(8) + 1;
     if id = 1 then
     begin
        objek.xmodel := 7; objek.xtetris := 26;
     end else begin
        objek.xmodel := 47; objek.xtetris := 66;
     end;
     objek.ymodel := 5; objek.ytetris := 2;
     dropnew(objek);
end;

procedure eliminate(objek : tetris; y : longint);
var i,j,k : longint;
    blank : boolean;
begin
    for i := y downto 3 do
    begin
        blank := false;
        for j := objek.xmodel + 14 to objek.xmodel + 28 do
            if not field[j,i] then
            begin
                blank := true;
                break;
            end;
        if not blank then
        begin
            for k := i downto 3 do
            begin
                gotoxy(objek.xmodel + 14,k);
                for j := (objek.xmodel + 14) to (objek.xmodel + 28) do
                begin
                    if field[j,k-1] then write(#178) else write(#32);
                    field[j,k] := field[j,k-1];
                end;
            end;
            eliminate(objek,i);
            break;
        end;
    end;
end;

procedure slide(var objek : tetris);
var i : longint;
    dropped : boolean;
begin
    drawtetris(objek,false);
    ttetris := objek;
    dropped := false;
    for i := 1 to 4 do
    begin
        inc(ttetris.points[i].y);
        if field[ttetris.points[i].x,ttetris.points[i].y] then
        begin
            dropped := true;
            break;
        end;
    end;
    if not dropped then objek := ttetris;
    drawtetris(objek,true);
    if dropped then
    begin
        eliminate(objek,22);
        dropnew(objek);
    end;
end;

procedure rotate(var objek : tetris);
var i : longint;
    collide : boolean;
begin
    drawtetris(objek,false);
    ttetris := objek;
    collide := false;
    for i := 2 to 4 do
    begin
        ttetris.points[i].y := objek.points[1].y + objek.points[i].x - objek.points[1].x;
        ttetris.points[i].x := objek.points[1].x - objek.points[i].y + objek.points[1].y;
        if field[ttetris.points[i].x,ttetris.points[i].y] then
        begin
            collide := true;
            break;
        end;
    end;
    if not collide then objek := ttetris;
    drawtetris(objek,true);
end;

procedure shift(var objek : tetris; x, y : longint);
var i : longint;
    collide : boolean;
begin
    drawtetris(objek,false);
    ttetris := objek;
    collide := false;
    for i := 1 to 4 do
    begin
        ttetris.points[i].x := objek.points[i].x + x;
        ttetris.points[i].y := objek.points[i].y + y;
        if field[ttetris.points[i].x,ttetris.points[i].y] then
        begin
            collide := true;
            break;
        end;
    end;
    if not collide then objek := ttetris;
    drawtetris(objek,true);
    if collide then eliminate(objek,22);
end;

procedure userinput;
var i : longint;
    c : char;
begin
    for i := 1 to 20 do
    begin
        if keypressed then
        begin
             c := upcase(readkey);
             case c of
             'W' : if tetris1.cshape <> 1 then rotate(tetris1);
             #72 : if tetris2.cshape <> 1 then rotate(tetris2);
             'A' : shift(tetris1,-1,0);
             #75 : shift(tetris2,-1,0);
             'S' : shift(tetris1,0,1);
             #80 : shift(tetris2,0,1);
             'D' : shift(tetris1,1,0);
             #77 : shift(tetris2,1,0);
             #27 : gameover := true;
             #32 : repeat delay(10); until keypressed;
             end;
        end;
        delay(10);
    end;
end;

begin
    randomize;
    while not quit do
    begin
        init_field;
        init_tetris(tetris1,1);
        init_tetris(tetris2,2);
        gameover := false;
        while not gameover do
        begin
            slide(tetris1);
            slide(tetris2);
            userinput;
        end;
        gotoxy(1,25); write('Play Again[Y/N]? ');
        repeat
            answer := upcase(readkey);
        until answer in ['Y','N',#27];
        if (answer = 'N') or (answer = #27) then break;
    end;
end.
