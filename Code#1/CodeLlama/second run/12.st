// 12.415940284729004s
// 2 (VAR_END fehlt; RETURN falsch eingesetzt, input variable falsch)
```c
FUNCTION SINH(x: REAL): REAL;
VAR
    exp_x: REAL;
BEGIN
    exp_x := EXP(x);
    RETURN (exp_x - 1) / (exp_x + 1);
END SINH;
```