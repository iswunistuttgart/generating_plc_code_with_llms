// 4.66s
// 2
VAR_INPUT
  X : REAL;
END_VAR

Sigmoid(X) := 1 / (1 + EXP(-X));

Write_To_Display("Sigmoid(X):", Sigmoid(X));