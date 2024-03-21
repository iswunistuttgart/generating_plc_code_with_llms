// 23.772063970565796s
// 2
```
FUNCTION binomial(N,K) : REAL;
VAR
    i : INT;
    result : REAL := 1.0;
END_VAR
FOR i IN 1..N DO
    IF i <= K THEN
        result := result * (N - i + 1) / i;
    END_IF;
END_FOR;
RETURN result;
END_FUNCTION;
```