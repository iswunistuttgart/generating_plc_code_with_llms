// 26.481043577194214s
// 2
```
FUNCTION Fibunacci(X : INT) : INT
BEGIN
    IF X = 0 THEN RETURN 0; END_IF;
    IF X = 1 THEN RETURN 1; END_IF;
    t1 := Fibunacci(X-1);
    t2 := Fibunacci(X-2);
    x_tmp := t1 + t2;
    RETURN x_tmp;
END_FUNCTION
```