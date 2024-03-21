//9.09s
// 2
PROGRAM LambertW

VAR
  x: REAL;
  w: REAL;

FUNCTION LambertW(x: REAL): REAL;
  VAR
    epsilon: REAL;
    y: REAL;
    oldY: REAL;
    i: INT;

  BEGIN
    epsilon := 0.0001;
    y := x;
    oldY := 0.0;
    i := 0;

    WHILE ABS(y - oldY) > epsilon DO
      i := i + 1;
      oldY := y;
      y := Exp(y) * (1.0 + y);
    END_WHILE;

    LambertW := y;
  END_FUNCTION;

BEGIN
  x := 0.5;
  w := LambertW(x);
END_PROGRAM