// 16.803051948547363s
// 2 (VAR_END fehlt, input variable falsch, RETURN falsch)
```c
FUNCTION SIGMOID(x:REAL):REAL;
VAR
    y:REAL;
BEGIN
    IF x < -50 THEN
        y := 0;
    ELSIF x > 50 THEN
        y := 1;
    ELSE
        y := 1 / (1 + EXP(-x));
    END_IF;
    RETURN y;
END_FUNCTION;
```