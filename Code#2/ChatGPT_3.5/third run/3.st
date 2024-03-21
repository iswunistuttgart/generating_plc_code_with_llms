// 5.38s
// 2
VAR_INPUT
    X : INT;
END_VAR

VAR
    t1 : DINT;
    t2 : DINT;
    x_tmp : INT;
END_VAR

t1 := 0;
t2 := 1;

// Calculate Fibonacci number
IF X = 0 THEN
    x_tmp := t1;
ELSIF X = 1 THEN
    x_tmp := t2;
ELSE
    FOR i := 2 TO X DO
        x_tmp := t1 + t2;
        t1 := t2;
        t2 := x_tmp;
    END_FOR
END_IF
