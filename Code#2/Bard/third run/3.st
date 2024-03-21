// 6.45s
// 2
VAR_INPUT
  X : INT;
END_VAR
VAR
  t1 : DINT;
  t2  : DINT;
  x_tmp : INT;
END_VAR

PROGRAM main
VAR
  result : INT;
END_VAR

IF X <= 1 THEN
  result := X;
ELSE
  t1 := 0;
  t2 := 1;

  FOR i := 2 TO X DO
    x_tmp := t1 + t2;
    t1 := t2;
    t2 := x_tmp;
  END_FOR;

  result := x_tmp;
END_IF;

WRITE("Fibonacci number for X = " & INT_TO_STRING(X) & " is: " & INT_TO_STRING(result));

END_PROGRAM