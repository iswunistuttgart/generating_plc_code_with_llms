// 7.62s
// 2
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

START

    IF Start_Loop = TRUE THEN
        Close_Gate_Inst := TRUE;
    END_IF;

    IF Sensed_Car = TRUE THEN
        IF Auth = my_defined_str THEN
            Gate_Open := TRUE;
            Close_Gate_Inst := FALSE;
        END_IF;
    END_IF;

    IF Mobile_Inst = TRUE THEN
        IF Auth = my_defined_str THEN
            Gate_Open := TRUE;
            Close_Gate_Inst := FALSE;
        END_IF;
    END_IF;

    IF NOT Gate_Open AND Close_Gate_Inst THEN
        Close_Gate_Inst := FALSE;
        IF One_Hour_Timer.Q THEN
            Gate_Open := FALSE;
        ELSE
            One_Hour_Timer.Start(one_hour);
        END_IF;
    END_IF;

    One_Hour_Timer.RUN := Start_Loop;

END_START