// 14.56s
// 4
PROGRAM SignFunction
VAR_INPUT
    x : REAL; // Input variable
END_VAR
VAR
    signX : INT; // Result of the sign function
END_VAR

IF x < 0 THEN
    signX := -1; // x is negative
ELSIF x > 0 THEN
    signX := 1; // x is positive
ELSE
    signX := 0; // x is zero
END_IF;
