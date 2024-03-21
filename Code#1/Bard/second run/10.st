//7.15s
// 2
PROGRAM SigmoidFunction
VAR
  x: REAL;
  y: REAL;

FUNCTION Sigmoid(x: REAL): REAL
VAR
  exp_x: REAL;

BEGIN
  exp_x := EXP(-x);
  Sigmoid := 1.0 / (1.0 + exp_x);
END_FUNCTION;

BEGIN
  x := 1.0;
  y := Sigmoid(x);
  WriteOutput("Sigmoid(" + STR(x) + ") = " + STR(y