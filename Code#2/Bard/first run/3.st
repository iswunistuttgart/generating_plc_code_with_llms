// 5.01s
// 2
VAR_INPUT
    X : INT;
END_VAR
VAR
    t1 : DINT;
    t2 : DINT;
    y_tmp : INT;
END_VAR

START

    IF X = 0 THEN
        Y := 0;
    ELSIF X = 1 THEN
        Y := 1;
    ELSE
        Y := 0;
        x_tmp := 1;
        t1 := 1;

        FOR i := 2 TO X DO
            Y := Y + x_tmp;
            t2 := t1;
            t1 := Y;
            x_tmp := t2;
        END_FOR;
    END_IF;

END_START