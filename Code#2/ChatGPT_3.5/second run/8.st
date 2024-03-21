// 7.08s
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

w := 0.0;
i := 0;
we := 0.0;
w1e := 0.0;

FOR i := 0 TO 1000 DO
    ewx := EXP(w * we);
    last := TIME();
    w := w - (w * we - X) / (we * (w + 1));
    IF ABS(ewx - EXP(w * we)) < 1.0E-9 OR ABS(TIME() - last) < T#1ms THEN
        EXIT; // Exit loop if convergence or max iterations reached
    END_IF;
END_FOR
