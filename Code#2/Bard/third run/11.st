// 6.01s
// 2
VAR_INPUT
  x : REAL;
END_VAR
VAR
  SignValue : REAL;
END_VAR

PROGRAM main

IF x > 0 THEN
  SignValue := 1.0;
ELSIF x < 0 THEN
  SignValue := -1.0;
ELSE
  SignValue := 0.0;
ENDIF;

WRITE("Sign of " & REAL_TO_STRING(x) & ": " & REAL_TO_STRING(SignValue));

END_PROGRAM