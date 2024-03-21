// 30.53s
// 4
PROGRAM TrafficLightControl
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

// Initialize the timer
T1(IN := TRUE, PT := T#10000ms); // 10 seconds cycle time

// Reset all lights
North_green := FALSE;
North_yellow := FALSE;
North_red := FALSE;
East_green := FALSE;
East_yellow := FALSE;
East_red := FALSE;

// Control logic based on timer elapsed time (T1.ET)
IF T1.ET < T#5000ms THEN
    // 0ms to 5000ms: North light green, East light red
    North_green := TRUE;
    East_red := TRUE;
ELSIF T1.ET < T#5500ms THEN
    // 5000ms to 5500ms: North light yellow, East light red
    North_yellow := TRUE;
    East_red := TRUE;
ELSIF T1.ET < T#9500ms THEN
    // 5500ms to 9500ms: North light red, East light green
    North_red := TRUE;
    East_green := TRUE;
ELSE
    // 9500ms to 10000ms: North light red, East light yellow
    North_red := TRUE;
    East_yellow := TRUE;
END_IF;

// Reset the timer if the cycle completes
IF T1.Q THEN
    T1.IN := FALSE; // Reset the timer
    T1(IN := TRUE, PT := T#10000ms); // Restart the timer
END_IF;
