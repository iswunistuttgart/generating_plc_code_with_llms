// 8.03s
//2
FUNCTION CalculateBinomialCoefficient: INT
VAR_INPUT
    n: INT;  // The total number of items (n)
    k: INT;  // The number of items to choose (k)
END_VAR

VAR
    result: INT;
    i: INT;
    nFactorial: INT := 1;  // Initialize n! to 1
    kFactorial: INT := 1;  // Initialize k! to 1
END_VAR

BEGIN
    result := 0;

    IF n >= k THEN
        FOR i := 1 TO n DO
            nFactorial := nFactorial * i;
        END_FOR

        FOR i := 1 TO k DO
            kFactorial := kFactorial * i;
        END_FOR

        result := nFactorial / (kFactorial * (n - k)!);
    END_IF

    RETURN result;
END_FUNCTION
