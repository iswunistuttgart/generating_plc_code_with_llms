// 21.80210542678833s
// 2
FUNCTION FUNCTION_BLOCK INTERLOCK()
    VAR_INPUT
        I1 : BOOL;
        I2 : BOOL;
        TL : TIME;
    END_VAR
    VAR_OUTPUT
        Q1 : BOOL;
        Q2 : BOOL;
    END_VAR
    VAR
        T1 : TOF;
        T2 : TOF;
    END_VAR

    IF (I1.AND. I2) THEN
        RETURN
    END_IF

    T1 = TIME(TL);
    WAITFOR(T1.LE. TIME(0));

    Q1 = NOT(I1);
    Q2 = NOT(I2);
END FUNCTION