// 7.13s
// 3
VAR_INPUT
    X : REAL;
END_VAR

VAR
    w : REAL;
    i : INT;
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
END_VAR

// Initialize variables
w := 0.0;
last := 0;

FOR i := 1 TO 50 DO
    we := w * EXP(w);
    w1e := (w + 1.0) * EXP(w);
    ewx := EXP(w * X);

    w := w - (we - X) / (we + w1e - 2.0 * X * w1e / (2.0 * w + 1.0));

    IF ABS(last - REAL_TO_DWORD(w)) < 1 THEN
        EXIT;
    END_IF

    last := REAL_TO_DWORD(w);
END_FOR
