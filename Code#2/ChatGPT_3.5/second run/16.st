// 10.51s
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

T1(IN := TRUE, PT := T#5000ms);  // Timer T1 for the overall cycle

IF T1.Q THEN
    // Between 0ms and 5000ms
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSE
    // After 5000ms
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
END_IF;

IF NOT T1.Q AND T1.ET THEN
    // Between 5500ms and 9500ms
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
END_IF;

IF NOT T1.Q AND T1.ETT THEN
    // Between 9500ms and 10000ms
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF;
