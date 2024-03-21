//25.24s
//2
FUNCTION Fibonacci : DINT
VAR_INPUT
    n : DINT; // The nth Fibonacci number to calculate
END_VAR
VAR
    a : DINT := 0;
    b : DINT := 1;
    i : DINT;
    temp : DINT;
END_VAR

// Handle the base cases
IF n = 0 THEN
    RETURN 0;
ELSIF n = 1 THEN
    RETURN 1;
END_IF

// Calculate the nth Fibonacci number iteratively
FOR i := 2 TO n DO
    temp := a + b;
    a := b;
    b := temp;
END_FOR

RETURN b;
END_FUNCTION
