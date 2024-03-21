// 4.81s
// 2
VAR_INPUT
  x : REAL;
END_VAR

Sign(x) := IF x > 0 THEN 1 ELSE -1;

Write_To_Display("Sign(X):", Sign(x));