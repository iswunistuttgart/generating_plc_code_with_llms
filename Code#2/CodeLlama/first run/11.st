// 28.231884717941284s
// 2
```
FUNCTION sign(x : REAL) : REAL;
VAR
    y : REAL;
END_VAR
IF (x > 0.0) THEN
    y := 1.0;
ELSIF (x < 0.0) THEN
    y := -1.0;
ELSE
    y := 0.0;
END_IF
RETURN y;
END_FUNCTION
```