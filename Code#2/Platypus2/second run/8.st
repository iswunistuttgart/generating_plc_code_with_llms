// 76.72757077217102s
// 2
PROGRAM lambertw
VAR_INPUT
    X : REAL;
END_VAR
VAR
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
END_VAR
IF (X > 0) THEN
    RETURN;
ENDIF
w := SQRT(X);
i := 0;
DO WHILE (w < X) DO
    w1e := EXP(w);
    ewx := LOG(w1e);
    IF (ewx > i) THEN
        we := ewx;
        last := i;
    END_IF
    i := i + 1;
END_DO
w := X / we;
LAMBERTW := w;
