// 13.32s
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

T1(IN:=TRUE, PT:=10000);

IF T1.Q THEN
    // Between 0ms and 5000ms, North is green, and East is red
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF T1.ET < 5000 THEN
    // Between 5000ms and 5500ms, North turns yellow
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF T1.ET < 9500 THEN
    // Between 5500ms and 9500ms, North is red, and East is green
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
ELSE
    // Between 9500ms and 10000ms, East turns yellow
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF;
