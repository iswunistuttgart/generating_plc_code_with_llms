// 4.57s
// 4
VAR_INPUT
    x : REAL;
END_VAR

VAR
    signResult : INT;
END_VAR

// Sign function implementation
IF x > 0 THEN
    signResult := 1;
ELSIF x < 0 THEN
    signResult := -1;
ELSE
    signResult := 0;
END_IF
