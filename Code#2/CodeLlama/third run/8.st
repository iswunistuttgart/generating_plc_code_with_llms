// 57.669310569763184s
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
    we := 1;
    w1e := 1;
    ewx := 1;
    last := 0;
    WHILE (i < 20) AND (ABS(w - w1e) > 1E-6) DO
        i := i + 1;
        we := we * X / (i * (i + 1));
        w1e := w1e + we;
        ewx := ewx * ABS(X);
        IF last = 0 THEN
            last := ABS(w - w1e) / ewx;
        ELSE
            last := ABS(last - (ABS(w - w1e) / ewx));
        END_IF;
    END_WHILE;
    RETURN w1e;
END_FUNCTION;
```