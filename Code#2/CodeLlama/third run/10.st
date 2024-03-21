// 23.59233784675598s
// 2
```
FUNCTION SIGMOID(X : REAL) : REAL;
VAR
    Y : REAL;
BEGIN
    IF (X < 0.0) THEN
        Y := 1.0 / (1.0 + EXP(-X));
    ELSE
        Y := X;
    END_IF;
    RETURN Y;
END_FUNCTION;
```