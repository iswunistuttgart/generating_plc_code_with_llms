// 28.61563515663147s
// 2
```
FUNCTION Fibunacci(X: INT): INT
BEGIN
    IF (X = 0) THEN
        RETURN 0;
    ELSEIF (X = 1) THEN
        RETURN 1;
    ELSE
        t1 := Fibunacci(X - 2);
        t2 := Fibunacci(X - 1);
        x_tmp := t1 + t2;
        RETURN x_tmp;
    END_IF;
END_FUNCTION
```