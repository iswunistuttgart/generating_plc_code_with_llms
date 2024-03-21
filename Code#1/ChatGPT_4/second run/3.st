//24.56s
//2
FUNCTION Fibonacci: LINT
VAR_INPUT
    n: INT; // The n-th Fibonacci number to calculate
END_VAR
VAR
    a: LINT := 0; // First number in the sequence
    b: LINT := 1; // Second number in the sequence
    i: INT;
    temp: LINT;
END_VAR

IF n = 0 THEN
    RETURN 0; // The 0th Fibonacci number is 0
ELSIF n = 1 THEN
    RETURN 1; // The 1st Fibonacci number is 1
ELSE
    FOR i := 2 TO n DO
        temp := a + b; // Calculate the next Fibonacci number
        a := b; // Move to the next number in the sequence
        b := temp; // Set the new value
    END_FOR
    RETURN b; // The n-th Fibonacci number
END_IF
END_FUNCTION

PROGRAM Main
VAR
    n: INT := 10; // Example: Calculate the 10th Fibonacci number
    fibNumber: LINT; // Variable to store the result
END_VAR

fibNumber := Fibonacci(n); // Call the function and store the result

END_PROGRAM
