// 12.408095121383667s
// 2 (VAR_END fehlt, input variable falsch, RETURN falsch)
```c
FUNCTION SIGN(x:REAL):INTEGER;
VAR
    y:INTEGER;
BEGIN
    IF x > 0 THEN
        y := 1;
    ELSE
        y := -1;
    END_IF;
    RETURN y;
END_FUNCTION;
```