VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

PROGRAM traffic_light
T1.PRE := 10000;
T1.TimerEnable := 1;
T1.Reset := T1.DN

IF T1.ACC > 0 AND T1.ACC < 5000 THEN
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
END_IF

IF T1.ACC > 5000 AND T1.ACC < 5500 THEN
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
END_IF

IF T1.ACC > 5500 AND T1.ACC < 9500 THEN
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
END_IF

IF T1.ACC > 9500 AND T1.ACC < 10000 THEN
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF

END_PROGRAM