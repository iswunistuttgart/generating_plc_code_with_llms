// 7.38s
// 2
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

CONSTANT
    MAX_ITERATIONS : INT := 50;
    EPSILON : REAL := 1.0E-8;
END_CONSTANT

w := X;

FOR i := 1 TO MAX_ITERATIONS DO
    ewx := EXP(w);
    we := w * ewx;
    w1e := w + 1.0;
    w := w - (we - X) / (w1e * ewx - (w + 2.0) * we / (2.0 * w1e));
    IF ABS(w - last) < EPSILON THEN
        EXIT;
    END_IF;
    last := w;
END_FOR;
