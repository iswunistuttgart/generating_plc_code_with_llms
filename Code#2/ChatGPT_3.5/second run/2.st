// 4.61s
// 4
VAR_INPUT
    N : INT;
    K : INT;
    i : INT;
END_VAR

VAR
    result : INT;
    numerator : INT;
    denominator : INT;
END_VAR

result := 0;
numerator := 1;
denominator := 1;

IF K >= 0 AND K <= N THEN
    FOR i := 1 TO K DO
        numerator := numerator * (N - i + 1);
        denominator := denominator * i;
    END_FOR

    result := numerator / denominator;
END_IF
