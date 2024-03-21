// 123.9272243976593s
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
        REPEAT
            IF Gate_Open AND (Sensed_Car OR Sensed_App) THEN
                Close_Gate_Inst := TRUE;
            END_IF
            IF One_Hour_Timer > one_hour THEN
                Close_Gate_Inst := TRUE;
            END_IF
            IF Gate_Open AND (Sensed_Car OR Sensed_App) THEN
                Gate_Open := FALSE;
            END_IF
        UNTIL Start_Loop = FALSE;
    END_IF
END_PROGRAM