//6.88s
//2
PROGRAM SignFunction
VAR_INPUT
    x: REAL;  // Input value for the sign function
END_VAR

VAR_OUTPUT
    signResult: INT;  // Output value of the sign function (-1, 0, or 1)
END_VAR

METHOD CalculateSign
    IF x < 0.0 THEN
        signResult := -1;
    ELSIF x > 0.0 THEN
        signResult := 1;
    ELSE
        signResult := 0;
    END_IF
END_METHOD

END_PROGRAM
