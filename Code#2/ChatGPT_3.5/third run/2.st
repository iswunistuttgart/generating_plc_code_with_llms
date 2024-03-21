// 4.04s
// 4
VAR_INPUT
    N : INT;
    K : INT;
    i : INT;
END_VAR

VAR
    result : INT;
END_VAR

result := 1;

// Calculate N choose K
FOR i := 1 TO K DO
    result := result * (N - i + 1) / i;
END_FOR
