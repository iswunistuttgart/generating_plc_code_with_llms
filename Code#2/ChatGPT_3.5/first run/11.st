// 4.88s
// 4
VAR_INPUT
    x : REAL;
END_VAR

VAR
    result : INT;
END_VAR

(* Sign function implementation *)
IF x > 0 THEN
    result := 1;
ELSIF x < 0 THEN
    result := -1;
ELSE
    result := 0;
END_IF;
