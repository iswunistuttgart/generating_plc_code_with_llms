// 12.43s
// 2
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

T1(IN:=TRUE, PT:=10000); (* 10-second cycle *)

IF T1.Q THEN
    (* Between 0ms and 5000ms *)
    IF T1.ET < 5000 THEN
        North_green := TRUE;
        North_yellow := FALSE;
        North_red := FALSE;
        East_green := FALSE;
        East_yellow := FALSE;
        East_red := TRUE;

    (* Between 5000ms and 5500ms *)
    ELSIF T1.ET < 5500 THEN
        North_green := FALSE;
        North_yellow := TRUE;
        North_red := FALSE;
        East_green := FALSE;
        East_yellow := FALSE;
        East_red := TRUE;

    (* Between 5500ms and 9500ms *)
    ELSIF T1.ET < 9500 THEN
        North_green := FALSE;
        North_yellow := FALSE;
        North_red := TRUE;
        East_green := TRUE;
        East_yellow := FALSE;
        East_red := FALSE;

    (* Between 9500ms and 10000ms *)
    ELSE
        North_green := FALSE;
        North_yellow := FALSE;
        North_red := TRUE;
        East_green := FALSE;
        East_yellow := TRUE;
        East_red := FALSE;
    END_IF;
ELSE
    (* Reset lights when the timer is not active *)
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := FALSE;
END_IF
