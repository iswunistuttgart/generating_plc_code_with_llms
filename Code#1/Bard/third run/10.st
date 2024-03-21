//7.98s
// 2
PROGRAM SigmoidFunction

VAR
  x: REAL;
  y: REAL;

FUNCTION Sigmoid(x: REAL): REAL;
  BEGIN
    y := 1.0 / (1.0 + Exp(-x));
    Sigmoid := y;
  END_FUNCTION;

BEGIN
  x := 1.0;
  y := Sigmoid(x);
END_PROGRAM