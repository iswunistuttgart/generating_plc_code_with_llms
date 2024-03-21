//6.85s
//2
FUNCTION CalculateFibonacci : INT
VAR_INPUT
    n : INT;  // The position in the Fibonacci sequence (0-based)
END_VAR_INPUT
VAR_OUTPUT
    result : INT;  // The Fibonacci number at position 'n'
END_VAR_OUTPUT
VAR
    fibNMinus2 : INT := 0;  // Initial values for the first two Fibonacci numbers
    fibNMinus1 : INT := 1;
    fibN : INT;
    i : INT;
END_VAR

IF n = 0 THEN
    result := fibNMinus2;  // Special case for n = 0
ELSIF n = 1 THEN
    result := fibNMinus1;  // Special case for n = 1
ELSE
    FOR i := 2 TO n DO
        fibN := fibNMinus1 + fibNMinus2;
        fibNMinus2 := fibNMinus1;
        fibNMinus1 := fibN;
    END_FOR

    result := fibN;
END_IF

END_FUNCTION
