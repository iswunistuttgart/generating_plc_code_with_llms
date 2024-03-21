// 4.19s
// 3
VAR_INPUT
  N : INT;
  K : INT;
  i : INT;
END_VAR

VAR
  C_nk : INT := 1;
END_VAR

IF K > N THEN
  C_nk := 0;
ELSE
  i := 0;
  WHILE i <= K - 1 DO
    C_nk := C_nk * (N - i);
    C_nk := C_nk / (i + 1);
    i := i + 1;
  END_WHILE;
END_IF;