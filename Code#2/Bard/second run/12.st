// 4.59s
// 2
VAR
  X : REAL;
  Sinh : REAL;
END_VAR

Sinh(X) := EXP(X) - EXP(-X) / 2;

Write_To_Display("Sinh(X):", Sinh(X));