// 23.42s
// 4
VAR_INPUT
    x : REAL; // Input value
END_VAR

VAR
    signResult : INT; // Result of the sign function
END_VAR

// Implementing the sign function
IF x < 0 THEN
    signResult := -1;
ELSIF x = 0 THEN
    signResult := 0;
ELSE
    signResult := 1;
END_IF;
