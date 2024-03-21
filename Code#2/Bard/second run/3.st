// 4.52s
// 2
VAR_INPUT
  X : INT;
END_VAR
VAR
  t1 : DINT;
  t2 : DINT;
  x_tmp : INT := 0;
END_VAR

IF X = 0 THEN
  x_tmp := 0;
ELSIF X = 1 THEN
  x_tmp := 1;
ELSE
  t1 := 0;
  t2 := 1;
  FOR i := 2 TO X DO
    x_tmp := t1 + t2;
    t1 := t2;
    t2 := x_tmp;
  END_FOR;
END_IF;

X := x_tmp;