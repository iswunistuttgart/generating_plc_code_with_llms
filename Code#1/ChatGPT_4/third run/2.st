//27.38s
//2
FUNCTION_BLOCK BinomialCoefficient
VAR_INPUT
    n : INT; // Total number of items
    k : INT; // Number of items to choose
END_VAR

VAR_OUTPUT
    result : LREAL; // The binomial coefficient result (using LREAL due to potential for large numbers)
END_VAR

VAR
    i : INT;
    numerator : LREAL := 1;
    denominator : LREAL := 1;
END_VAR

// Calculate the factorial for a given number
FUNCTION Factorial : LREAL
    VAR_INPUT
        value : INT;
    END_VAR
    VAR
        i : INT;
        fact : LREAL := 1;
    END_VAR
    FOR i := 2 TO value DO
        fact := fact * i;
    END_FOR
    Factorial := fact;
END_FUNCTION

// Calculate the binomial coefficient C(n, k)
METHOD Calculate : LREAL
    // Check for valid input
    IF (n < 0) OR (k < 0) OR (k > n) THEN
        result := -1; // Return -1 for invalid input
        RETURN;
    END_IF

    // Calculate n! / (k!(n-k)!)
    numerator := Factorial(n);
    denominator := Factorial(k) * Factorial(n - k);
    result := numerator / denominator;
    RETURN result;
END_METHOD
END_FUNCTION_BLOCK
