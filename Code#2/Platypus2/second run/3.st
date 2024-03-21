// 69.35136008262634s
// 2
PROGRAM fibunacci;

VAR_INPUT
    X : INT;
END_VAR
VAR
    t1 : DINT;
    t2 : DINT;
    x_tmp : INT;
END_VAR

BEGIN
    IF (X > 0) THEN
        t1 := 0;
        t2 := 1;
        WHILE (t2 < X) DO
            x_tmp := t1 + t2;
            t1 := t2;
            t2 := x_tmp;
        END_WHILE;
    ELSE
        PRINT("Error: X must be greater than 0");
    END_IF;
END_PROGRAM fibunacci;