//9.66s
// 2
PROGRAM SignFunction
VAR
  x: REAL;
  y: REAL;

FUNCTION Sign(x: REAL): REAL
BEGIN
  IF x >= 0 THEN
    Sign := 1.0;
  ELSE
    Sign := -1.0;
  END_IF;
END_FUNCTION;

BEGIN
  x := 1.0;
  y := Sign(x);
  WriteOutput("Sign(" + STR(x) + ") = " + STR(y));
  
  x := -2.0;
  y := Sign(x);
  WriteOutput("Sign(" + STR(x) + ") = " + STR(y));
END_PROGRAM
