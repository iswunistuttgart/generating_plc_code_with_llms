//5.75s
//2
FUNCTION CalculateFibonacci: INT
VAR_INPUT
    n: INT;  // The position of the Fibonacci number to calculate
END_VAR

VAR
    result: INT;
END_VAR

BEGIN
    IF n <= 0 THEN
        result := 0;
    ELSIF n = 1 THEN
        result := 1;
    ELSE
        result := CalculateFibonacci(n - 1) + CalculateFibonacci(n - 2);
    END_IF

    RETURN result;
END_FUNCTION
