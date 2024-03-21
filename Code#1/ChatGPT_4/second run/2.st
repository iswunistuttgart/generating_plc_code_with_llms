//18.14s
//4
FUNCTION Factorial: LINT
VAR_INPUT
    n: INT; // Input value to calculate the factorial of
END_VAR
VAR
    i: INT;
    result: LINT := 1; // Initialize result to 1 (0! = 1)
END_VAR

FOR i := 1 TO n DO
    result := result * i;
END_FOR

Factorial := result; // Return the factorial result
END_FUNCTION

PROGRAM BinomialCoefficient
VAR
    n: INT; // Total number of items
    k: INT; // Number of items to choose
    binomCoeff: LINT; // Binomial coefficient result
END_VAR

// Ensure that 0 <= k <= n, otherwise the binomial coefficient is not defined
IF k >= 0 AND k <= n THEN
    binomCoeff := Factorial(n) / (Factorial(k) * Factorial(n - k));
ELSE
    binomCoeff := 0; // If the condition is not met, the result is 0
END_IF

END_PROGRAM
