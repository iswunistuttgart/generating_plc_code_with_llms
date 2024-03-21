// 22.99s
// 2
PROGRAM BinomialCoefficientCalculation
VAR_INPUT
    N : INT;
    K : INT;
END_VAR
VAR
    i : INT;
    BinomialCoefficient : INT;
    MinK : INT;
END_VAR

BinomialCoefficient := 1; // Initialize result

// Ensure that K is not greater than N
IF K > N THEN
    BinomialCoefficient := 0; // Invalid input
ELSE
    // Calculate the minimum of K and N - K
    MinK := K;
    IF N - K < MinK THEN
        MinK := N - K;
    END_IF

    // Calculate Binomial Coefficient
    FOR i := 0 TO MinK - 1 DO
        BinomialCoefficient := BinomialCoefficient * (N - i);
        BinomialCoefficient := BinomialCoefficient DIV (i + 1);
    END_FOR
END_IF
