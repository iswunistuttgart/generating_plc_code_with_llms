// 9.07s
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

START

    ewx := 1;
    we := X;
    last := 0;

    i := 1;

    WHILE ((abs(we - ewx) > 0.0001) AND (i < 100)) DO
        we := (we + ewx) / 2;

        w1e := ewx * exp(w);

        ewx := (w * we) - X;

        IF (last = 1) AND (we < 0) THEN
            ewx := 0;
        END_IF;

        last := abs(we) > abs(ewx);

        i := i + 1;
    END_WHILE;

    w := we;
END_START