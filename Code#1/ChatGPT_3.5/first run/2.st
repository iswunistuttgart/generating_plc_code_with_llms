//7.4s
//2
FUNCTION CalculateBinomialCoefficient : INT
VAR_INPUT
    n : INT;  // The total number of items (n)
    k : INT;  // The number of items to choose (k)
END_VAR_INPUT
VAR_OUTPUT
    result : INT;  // The binomial coefficient result
END_VAR_OUTPUT
VAR
    i : INT;
    numerator : INT := 1;
    denominator : INT := 1;
END_VAR

IF (k < 0) OR (k > n) THEN
    result := 0;  // Invalid input, return 0
ELSE
    FOR i := 1 TO k DO
        numerator := numerator * (n - i + 1);
        denominator := denominator * i;
    END_FOR

    result := numerator / denominator;
END_IF

END_FUNCTION
