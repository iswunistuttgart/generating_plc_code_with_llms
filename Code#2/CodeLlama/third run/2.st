// 25.620573043823242s
// 2
```
FUNCTION binomial(N : INT; K : INT) : INT;
VAR
    result : INT := 1;
    i : INT := 0;
END_VAR
WHILE (i <= N - K) DO
    result := result * (N - i);
    i := i + 1;
END_WHILE;
result := result / factorial(K);
RETURN result;
END_FUNCTION;
```