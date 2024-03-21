// 22.66158437728882s
// 2
```
FUNCTION sign(x:REAL):REAL;
VAR
    y:REAL;
BEGIN
    IF (x > 0) THEN
        y := 1;
    ELSIF (x < 0) THEN
        y := -1;
    ELSE
        y := 0;
    END_IF;
    RETURN y;
END_FUNCTION;
```