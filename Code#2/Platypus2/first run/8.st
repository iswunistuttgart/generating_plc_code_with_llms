// 102.14219069480896s
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

IF (X > 0) THEN
    RETURN
ELSE
    X := -X;
ENDIF

FOR i := 1 TO 200 STEP 5 DO
    w := 0.0;
    we := 1.0 / X;
    ewx := EXP(we);
    FOR j := 1 TO 200 STEP 5 DO
        IF (j > i) THEN
            IF (ewx < 1.0) THEN
                w1e := we * ewx;
                IF (w1e >= 1.0) THEN
                    RETURN
                END_IF
                w := w + w1e / j;
            ELSE
                RETURN
            END_IF
        END_IF
    NEXT
ENDFOR
X := -X * LOG(w);
END_PROGRAM