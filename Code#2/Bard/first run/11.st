// 5.49s
// 4
VAR
    Y : REAL;
END_VAR

START

    IF x < 0 THEN
        Y := -1.0;
    ELSIF x = 0 THEN
        Y := 0.0;
    ELSE
        Y := 1.0;
    END_IF;
END_START