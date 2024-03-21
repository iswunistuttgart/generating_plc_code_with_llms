// 4.87s
// 3
VAR_INPUT
    N : INT;
    K : INT;
    i : INT;
END_VAR

VAR
    binomialCoefficient : INT := 1;
END_VAR

START

    FOR i := 0 TO K DO
        binomialCoefficient := binomialCoefficient * (N - i) / i;
    END_FOR;

END_START