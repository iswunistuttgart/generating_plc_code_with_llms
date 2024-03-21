//7.84
//3
PROGRAM FibonacciCalculation
VAR_INPUT
    n: INT; // The position of the Fibonacci number to calculate
END_VAR

VAR_OUTPUT
    fibonacciNumber: INT; // The calculated Fibonacci number
END_VAR

VAR
    i: INT;
    fib1: INT := 0; // Initialize the first Fibonacci number
    fib2: INT := 1; // Initialize the second Fibonacci number
END_VAR

METHOD CalculateFibonacci
    IF n <= 0 THEN
        fibonacciNumber := 0; // Fibonacci number at position 0 or negative positions
    ELSIF n = 1 THEN
        fibonacciNumber := 1; // Fibonacci number at position 1
    ELSE
        FOR i := 2 TO n DO
            fibonacciNumber := fib1 + fib2;
            fib1 := fib2;
            fib2 := fibonacciNumber;
        END_FOR
    END_IF
END_METHOD

END_PROGRAM
