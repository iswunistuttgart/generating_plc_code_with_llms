// 23.199660062789917s
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

    IF (I1 = TRUE) THEN
        Q1 := TRUE;
    ELSEIF (I2 = TRUE) THEN
        Q2 := TRUE;
    ELSE
        WAITFOR(TL);
        IF (I1 = FALSE OR I2 = FALSE) THEN
            Q1 := FALSE;
            Q2 := FALSE;
        END IF;
    END IF;
END FUNCTION