// 51.102221727371216s
// 2
```
FUNCTION LambertW(X : REAL) : REAL
VAR
    w : REAL;
    i : INT;
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
END_VAR
BEGIN
    IF X < 0 THEN
        RETURN -1;
    END_IF;
    i := 0;
    we := X;
    w1e := 1;
    ewx := 1;
    last := 0;
    WHILE (ABS(we) > 1E-6 AND ABS(w1e - we) > 1E-6) DO
        i := i + 1;
        IF i = 50 THEN
            RETURN -1;
        END_IF;
        w := we / (2 * i);
        w1e := we;
        ewx := ewx * w;
        we := we + w;
    END_WHILE;
    RETURN we;
END_FUNCTION
```