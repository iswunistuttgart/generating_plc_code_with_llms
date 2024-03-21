// 81.71327662467957s
// 2
```
PROGRAM GATE_CONTROLLER
VAR
    Start_Loop : BOOL := FALSE;
    one_hour : TIME := T#1h;
    One_Hour_Timer : TON;
    Gate_Open : BOOL := FALSE;
    Close_Gate_Inst : BOOL := FALSE;
    Sensed_Car : BOOL := FALSE;
    Sensed_Car_Inst : BOOL := FALSE;
    Sensed_App : BOOL := FALSE;
    Mobile_Inst : BOOL := FALSE;
    Auth : STRING;
    my_defined_str : STRING := 'abcd';
END_VAR

IF Start_Loop THEN
    One_Hour_Timer.TON := TRUE;
ELSE
    IF One_Hour_Timer.Q THEN
        IF Gate_Open THEN
            Close_Gate_Inst := TRUE;
        ELSE
            IF Sensed_Car OR Sensed_App THEN
                IF Auth = my_defined_str THEN
                    Gate_Open := TRUE;
                END_IF;
            END_IF;
        END_IF;
    END_IF;
END_IF;

IF Close_Gate_Inst THEN
    Gate_Open := FALSE;
END_IF;

IF Sensed_Car OR Sensed_App THEN
    IF Auth = my_defined_str THEN
        Mobile_Inst := TRUE;
    END_IF;
END_IF;

IF Mobile_Inst THEN
    IF NOT Gate_Open THEN
        Gate_Open := TRUE;
    ELSE
        Close_Gate_Inst := TRUE;
    END_IF;
END_IF;
```