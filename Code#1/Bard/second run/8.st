//7.84s
// 2
PROGRAM LambertW
VAR
  x: REAL;
  w: REAL;
  tolerance: REAL := 0.0001;
  maxIterations: INT := 50;

FUNCTION LambertW(x: REAL): REAL
VAR
  i: INT;
  w0: REAL;
  w1: REAL;
  error: REAL;

BEGIN
  w0 := 1.0;
  FOR i := 1 TO maxIterations DO
    w1 := exp(-w0) * (w0 + 1.0) / (x * exp(w0));
    error := ABS(w1 - w0);
    IF error <= tolerance THEN
      EXIT;
    END_IF;
    w0 := w1;
  END_FOR;
  LambertW := w1;
END_FUNCTION;

BEGIN
  x := 1.0;
  w := LambertW(x);
  WriteOutput("LambertW(" + STR(x) + ") = " + STR(w));
END_PROGRAM
