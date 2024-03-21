// 66.81055355072021s
// 2
PROGRAM fibunacci
VAR_INPUT
    X : INT;
END_VAR
VAR
    t1 : DINT;
    t2 : DINT;
    x_tmp : INT;
END_VAR
IF X = 0 THEN
    RETURN(0);
ELSE IF X = 1 THEN
    RETURN(1);
ELSE
    t1 := 0;
    t2 := 1;
    WHILE t1 < X DO
        x_tmp := t1 + t2;
        t1 := t2;
        t2 := x_tmp;
    END_WHILE;
    RETURN(t2);
ENDIF;