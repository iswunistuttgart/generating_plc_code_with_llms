// 10.66s
// 2
VAR_INPUT
  X : REAL;
END_VAR
VAR
  w : REAL;
  i : INT;
  we : REAL;
  w1e : REAL;
  ewx : REAL;
  last : DWORD;
END_VAR

we := 0.0;
w1e := 1.0;
ewx := X;
last := 0;

i := 1;
WHILE ABS(w - w1e) > 0.000001 DO
  w := ewx / we;
  w1e := we;
  we := w + ewx / w;

  IF last = 255 THEN
    i := 0;
  END_IF;
  last := last + 1;
END_WHILE;

w := ewx / w;

Write_To_Display("Lambert W(x):", w);