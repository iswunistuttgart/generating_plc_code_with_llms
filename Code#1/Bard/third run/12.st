//8.86s
// 2
PROGRAM HyperbolicSine

VAR
x: REAL;
y: REAL;

FUNCTION Sinh(x: REAL): REAL;
BEGIN
y := (Exp(x) - Exp(-x)) / 2.0;
Sinh := y;
END_FUNCTION;

BEGIN
x := 1.0;
y := Sinh(x);
END_PROGRAM;