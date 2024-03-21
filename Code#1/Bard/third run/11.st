//6.85s
// 2
PROGRAM SignFunction

VAR
  x: REAL;
  y: REAL;

FUNCTION Sign(x: REAL): REAL;
  BEGIN
    IF x > 0 THEN
      y := 1.0;
    ELSIF x < 0 THEN
      y := -1.0;
    ELSE
      y := 0.0;
    END_IF;
    Sign := y;
  END_FUNCTION;

BEGIN
  x := 1.0;
  y := Sign(x);
END_PROGRAM