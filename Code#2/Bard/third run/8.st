// 9.37s
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

PROGRAM main

last := 1;
i := 0;
w := 1.0;
ewx := X;

WHILE last <> 0 DO
  we := 1.0 / ewx;
  w1e := w + we;
  ewx := X * w1e;
  last := abs(w - w1e);
  i := i + 1;
  IF i > 10 THEN
    WRITE("Error: Convergence not reached");
    STOP;
  END_IF;
END_WHILE;

WRITE("Lambert W of " & REAL_TO_STRING(X) & ": " & REAL_TO_STRING(w));

END_PROGRAM