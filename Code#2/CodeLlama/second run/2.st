// 28.375280618667603s
// 2
```
FUNCTION binomial(N : INT; K : INT) : INT;
VAR
    result : INT := 1;
    i : INT := 0;
END_VAR
WHILE (i < N - K + 1) DO
    IF (K > i) THEN
        result := result * (N - i);
        result := result / (i + 1);
    END_IF;
    i := i + 1;
END_WHILE;
RETURN result;
END_FUNCTION;
```