// 199.68022894859314s
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
    START_LOOP:
        WHILE (Start_Loop) DO
            IF Gate_Open THEN
                Close_Gate_Inst := TRUE;
            END_IF
            IF Sensed_Car AND NOT Sensed_App THEN
                Sensed_Car_Inst := TRUE;
            END_IF
            IF Sensed_App AND NOT Sensed_Car THEN
                Mobile_Inst := TRUE;
            END_IF
            IF (Sensed_Car OR Sensed_App) AND Gate_Open = FALSE THEN
                Gate_Open := TRUE;
            END_IF
            IF Close_Gate_Inst THEN
                Gate_Open := FALSE;
            END_IF
            IF Mobile_Inst THEN
                Gate_Open := TRUE;
            END_IF
            IF (Sensed_Car OR Sensed_App) AND Gate_Open = TRUE THEN
                Gate_Open := FALSE;
            END_IF
            IF Gate_Open = TRUE THEN
                Close_Gate_Inst := FALSE;
            END_IF
            IF Mobile_Inst = FALSE THEN
                Gate_Open := FALSE;
            END_IF
            IF Sensed_Car_Inst = FALSE THEN
                Gate_Open := FALSE;
            END_IF
            IF (Sensed_App OR Sensed_Car) AND Gate_Open = TRUE THEN
                Gate_Open := FALSE;
            END_IF
            IF Gate_Open = FALSE THEN
                Close_Gate_Inst := FALSE;
            END_IF
            IF Mobile_Inst = FALSE THEN
                Gate_Open := FALSE;