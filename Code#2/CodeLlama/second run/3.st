// 26.722729206085205s
// 2
```
FUNCTION Fibonacci(X : INT) : INT
BEGIN
    IF X = 0 THEN RETURN 0; END_IF;
    IF X = 1 THEN RETURN 1; END_IF;
    t1 := Fibonacci(X - 2);
    t2 := Fibonacci(X - 1);
    x_tmp := t1 + t2;
    RETURN x_tmp;
END_FUNCTION
```