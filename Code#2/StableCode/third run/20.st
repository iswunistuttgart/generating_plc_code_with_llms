// 21.822731971740723s
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

    WAITFOR(TL)
    IF (I1.OR. I2) THEN
        Q1 := TRUE;
        Q2 := FALSE;
    ELSE
        Q1 := FALSE;
        Q2 := TRUE;
    END_IF
END FUNCTION