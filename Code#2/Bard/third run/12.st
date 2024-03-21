// 5.71s
// 2
VAR
  X : REAL;
  HyperbolicSinValue : REAL;
END_VAR

PROGRAM main

HyperbolicSinValue := SIN(SQRT(2) * EXP(X));

WRITE("Hyperbolic sine value of " & REAL_TO_STRING(X) & ": " & REAL_TO_STRING(HyperbolicSinValue));

END_PROGRAM