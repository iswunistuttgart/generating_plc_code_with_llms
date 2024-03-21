//7.59s
//2
FUNCTION Sign : INT
VAR_INPUT
    value: REAL;  // Input value to determine the sign of
END_VAR_INPUT
VAR_OUTPUT
    sign: INT;    // Output sign value (-1, 0, or 1)
END_VAR_OUTPUT
BEGIN
    IF value < 0 THEN
        sign := -1;
    ELSIF value = 0 THEN
        sign := 0;
    ELSE
        sign := 1;
    END_IF
END_FUNCTION
