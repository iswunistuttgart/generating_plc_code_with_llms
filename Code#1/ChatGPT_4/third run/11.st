//22.62s
//4
FUNCTION Sign : INT
VAR_INPUT
    x : REAL; // Input to the sign function
END_VAR

// Determine the sign of the input x
IF x < 0 THEN
    Sign := -1; // x is negative
ELSIF x > 0 THEN
    Sign := 1; // x is positive
ELSE
    Sign := 0; // x is zero
END_IF

END_FUNCTION
