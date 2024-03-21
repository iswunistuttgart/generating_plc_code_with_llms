//13.22s
//2
PROGRAM TrafficLightControl
VAR
    North_green: BOOL := FALSE;
    North_yellow: BOOL := FALSE;
    North_red: BOOL := FALSE;
    East_green: BOOL := FALSE;
    East_yellow: BOOL := FALSE;
    East_red: BOOL := FALSE;

    TrafficLightCycleTimer: TON := (PT := T#10000ms);
END_VAR

CASE TrafficLightCycleTimer.IN THEN
    0:  // Between 0ms and 5000ms
        North_green := TRUE;
        East_green := FALSE;
        East_red := TRUE;
    5000:  // After 5000ms, North light turns yellow
        North_green := FALSE;
        North_yellow := TRUE;
    5500:  // Between 5500ms and 9500ms
        North_yellow := FALSE;
        North_red := TRUE;
        East_green := TRUE;
        East_red := FALSE;
    9500:  // Between 9500ms and 10000ms
        East_green := FALSE;
        East_yellow := TRUE;
    10000:  // Reset the timer and the cycle
        TrafficLightCycleTimer(IN := FALSE, PT := T#10000ms);
        North_red := FALSE;
        East_yellow := FALSE;
        North_green := TRUE;
        East_red := TRUE;
END_CASE

TrafficLightCycleTimer(IN := TRUE);
