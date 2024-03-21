//8.29s
// 2
PROGRAM HyperbolicSineFunction
VAR
  x: REAL;
  y: REAL;

FUNCTION Sinh(x: REAL): REAL
BEGIN
  Sinh := (EXP(x) - EXP(-x)) / 2.0;
END_FUNCTION;

BEGIN
  x := 1.0;
  y := Sinh(x);
  WriteOutput("Sinh(" + STR(x) + ") = " + STR(y));
  
  x := -2.0;
  y := Sinh(x);
  WriteOutput("Sinh(" + STR(x) + ") = " + STR(y));
END_PROGRAM
