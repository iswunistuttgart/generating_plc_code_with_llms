// 59.56291842460632s
// 2
```
FUNCTION_BLOCK INTERLOCK
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
    ON_START
        T1 := FALSE;
        T2 := FALSE;
    END_ON_START
    ON_CLOCK
        IF I1 THEN
            IF NOT T1 THEN
                Q1 := TRUE;
                T1 := CLOCK;
            ELSE
                Q1 := FALSE;
            END_IF;
        ELSE
            Q1 := FALSE;
        END_IF;
        IF I2 THEN
            IF NOT T2 THEN
                Q2 := TRUE;
                T2 := CLOCK;
            ELSE
                Q2 := FALSE;
            END_IF;
        ELSE
            Q2 := FALSE;
        END_IF;
    END_ON_CLOCK
END_FUNCTION_BLOCK
```