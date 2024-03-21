// 19.71s
// 4
PROGRAM FibonacciCalculation
VAR_INPUT
    X : INT; // Input position in Fibonacci sequence
END_VAR
VAR
    t1 : DINT; // Previous Fibonacci number
    t2 : DINT; // Current Fibonacci number
    x_tmp : INT; // Temporary variable for loop
END_VAR

t1 := 0;
t2 := 1;

IF X = 0 THEN
    t2 := 0; // Fibonacci(0)
ELSIF X = 1 THEN
    t2 := 1; // Fibonacci(1)
ELSE
    FOR x_tmp := 2 TO X DO
        t2 := t1 + t2; // Calculate next Fibonacci number
        t1 := t2 - t1; // Update previous Fibonacci number
    END_FOR
END_IF
