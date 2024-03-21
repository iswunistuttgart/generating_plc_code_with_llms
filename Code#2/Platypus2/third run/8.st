// 109.79130363464355s
// 2
PROGRAM lambertw
VAR
    X : REAL;
    i : INT;
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
END_VAR

IF VAR_INPUT.X > 0 THEN
    WRITE(0, '(A)') 'The Lambert W function is only defined for X < 1'
    RETURN
ENDIF

w := SQRT(X);
i := 0;
we := 0;
w1e := 0;
ewx := 0;
last := 0;

WHILE w > 0 DO
    IF we < 1E-6 THEN
        i := i + 1;
        we := we + (w - w1e) / i;
        w1e := w;
    ELSE
        ewx := w * we;
        w := X - ewx;
        IF last <> i THEN
            RETURN w
        END_IF
        last := i;
    END_IF
END_WHILE

WRITE(0, '(A)') 'The Lambert W function is not defined for X = 1'
