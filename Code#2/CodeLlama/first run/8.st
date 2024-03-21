// 61.65190291404724s
// 2
```
FUNCTION lambertw(x : REAL) : REAL
VAR
    w : REAL;
    i : INT;
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
END_VAR
BEGIN
    IF x = 0 THEN RETURN 0; END_IF;
    w := 0;
    i := 0;
    we := 1;
    w1e := 1;
    ewx := 1;
    last := 0;
    WHILE TRUE DO
        IF x < 0 THEN
            RETURN -lambertw(-x);
        END_IF;
        IF i = 0 THEN
            we := w;
            w1e := w * w + x;
            ewx := w1e / we;
        ELSE
            last := we;
            we := w;
            w1e := w * w + x;
            ewx := w1e / we;
            IF ABS(ewx - last) < 0.000000000000001 THEN
                RETURN w;
            END_IF;
        END_IF;
        i := i + 1;
        w := w + ewx;
    END_WHILE;
END_FUNCTION
```