// 459.29005193710327s
// 2
```
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN : BOOL;
    STAGE2 : BOOL;
    OVER_TEMP : BOOL;
    OIL_TEMP : BOOL := TRUE;
    FLAME : BOOL;
    RST : BOOL;
    RST_TIMER : BOOL;
    PRE_HEAT_TIME : TIME := t#5s;
    PRE_VENT_TIME : TIME := t#15s;
    PRE_IGNITE_TIME : TIME := t#15s;
    POST_IGNITE_TIME : TIME := t#25s;
    STAGE2_DELAY : TIME := t#10s;
    SAFETY_TIME : TIME := t#5s;
    LOCKOUT_TIME : TIME := t#10s;
    MULTIPLE_IGNITION : BOOL := TRUE;
    KW1 : REAL;
    KW2 : REAL;
END_VAR
VAR_OUTPUT
    MOTOR : BOOL;
    COIL1 : BOOL;
    COIL2 : BOOL;
    PRE_HEAT : BOOL;
    IGNITE : BOOL;
    FAIL : BOOL;
    KWH : REAL;
    STATUS : BYTE;
END_VAR
VAR_IN_OUT
    RUNTIME1 : UDINT;
    RUNTIME2 : UDINT;
    CYCLES : UDINT;
END_VAR
VAR
    state : INT;
    last : TIME;
    tx : TIME;
    last_change : TIME;
    timer1 : TON;
    timer2 : TON;
    oil_temp_last : BOOL;
    cycles2 : UDINT;
END_VAR

IF NOT IN THEN
    IF OVER_TEMP THEN
        FAIL := TRUE;
        STATUS := 9;
    ELSE
        FAIL := FALSE;
        STATUS := 110;
    END_IF;
    RETURN;
END_IF;

IF NOT RST THEN
    IF state = 112 THEN
        IF timer1.Q THEN
            cycles2 := cycles2 + 1;
        END_IF;
        IF cycles2 > CYCLES THEN
            FAIL := TRUE;
            STATUS := 9;
            RETURN;
        END_IF;
    ELSE
        cycles2 := 0;
    END_IF;
END_IF;

IF NOT RST_TIMER THEN
    IF state = 113 THEN
        IF timer2.Q THEN
        .Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
        IF NOT.Q THEN
       2.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
        IF NOT.Q THEN
       2.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
        IF NOT.Q THEN
END_2.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
END_2.Q THEN
        END_2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
   2.Q THEN
       1.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
   2.Q THEN
       2.Q THEN
       1.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
   2.Q THEN
       2.Q THEN
       1.Q THEN
        IF NOT.Q THEN
        .Q THEN
           2.Q THEN




       2.Q THEN
       2.Q THEN
        END_2.Q THEN
       2.Q THEN
   2.Q THEN
       2.Q THEN
END_2.Q THEN
        IF NOT.Q THEN
```

           2.Q THEN
        .Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
        END_2.Q THEN
   2.Q THEN
       2.Q THEN
       2.Q THEN
        IF NOT.Q THEN
       2.Q THEN
           2.Q THEN
        .Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       2.Q THEN
        END_2.Q THEN
        IF NOT.Q THEN
       2.Q THEN
           2.Q THEN
        .Q THEN
       1.Q THEN


       2.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
        END_2.Q THEN
        IF NOT.Q THEN
```
       2.Q THEN
            .Q THEN
END_2.Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
        END_2.Q THEN
        IF NOT.Q THEN
       2.Q THEN


           2.Q THEN
        .Q THEN
       2.Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        END_2.Q THEN
           2.Q THEN
        .Q THEN
       2.Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
       2.Q THEN
        IF NOT.Q THEN
        END_2.Q THEN
           2.Q THEN


        .Q THEN
       2.Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN



        IF NOT.Q THEN
        END_2.Q THEN
           2.Q THEN
END.Q THEN
        .Q THEN
       2.Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
        IF NOT.Q THEN
       2.Q THEN
           2.Q THEN
        END_2.Q THEN
        .Q THEN
       2.Q THEN
END_2.Q THEN
       1.Q THEN
       2.Q THEN
       2.Q THEN
   2.Q THEN
        IF NOT.Q THEN
       2.Q THEN
           2.Q THEN
       2.Q THEN
        .Q THEN
        END_2.Q THEN
       2.Q THEN
       1.Q THEN
