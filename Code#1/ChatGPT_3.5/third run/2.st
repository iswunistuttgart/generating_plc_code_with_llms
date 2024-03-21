//6.82s
//4
PROGRAM BinomialCoefficient
VAR_INPUT
    n: UINT; // Total number of items
    k: UINT; // Number of items to choose
END_VAR

VAR_OUTPUT
    binomialCoeff: UINT; // Binomial coefficient result
END_VAR

VAR
    i: UINT;
    j: UINT;
    result: UINT;
END_VAR

METHOD CalculateBinomialCoeff
    IF k > n THEN
        binomialCoeff := 0; // Invalid input, k cannot be greater than n
    ELSE
        result := 1;
        FOR i := 1 TO k DO
            result := result * (n - i + 1) / i;
        END_FOR
        binomialCoeff := result;
    END_IF
END_METHOD

END_PROGRAM
