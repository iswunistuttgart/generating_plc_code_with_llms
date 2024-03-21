// 151.2458050251007s
// 2
PROGRAM GateController;

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
    Auth : STRING := 'abcd';
    my_defined_str : STRING := 'abcd';
END_VAR

BEGIN
    IF Start_Loop THEN
        WHILE TRUE DO
            IF Gate_Open THEN
                CLOSE_GATE;
                Close_Gate_Inst := TRUE;
            END_IF;
            IF Sensed_Car THEN
                OPEN_GATE;
                Sensed_Car_Inst := TRUE;
            END_IF;
            IF Sensed_App THEN
                OPEN_GATE;
                Sensed_App_Inst := TRUE;
            END_IF;
            IF Close_Gate_Inst OR Sensed_Car_Inst OR Sensed_App_Inst THEN
                CLOSE_GATE;
                Gate_Open := FALSE;
            END_IF;
            IF TIMER_EXPIRED(One_Hour_Timer) THEN
                CLOSE_GATE;
                Gate_Open := FALSE;
            END_IF;
        END_WHILE;
    END_IF;
END_PROGRAM.