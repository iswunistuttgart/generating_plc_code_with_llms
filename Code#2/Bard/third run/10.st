// 5.38s
// 2
VAR_INPUT
  X : REAL;
END_VAR
VAR
  SigmoidValue : REAL;
END_VAR

PROGRAM main

SigmoidValue := 1.0 / (1.0 + exp(-X));

WRITE("Sigmoid value of " & REAL_TO_STRING(X) & ": " & REAL_TO_STRING(SigmoidValue));

END_PROGRAM