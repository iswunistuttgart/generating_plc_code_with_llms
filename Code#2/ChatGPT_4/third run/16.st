// 53.11s
// 4
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

// Initialize and start the timer
T1(IN := TRUE, PT := T#10000ms);

// Logic for North light
North_green := T1.ET < T#5000ms;
North_yellow := T1.ET >= T#5000ms AND T1.ET < T#5500ms;
North_red := T1.ET >= T#5500ms;

// Logic for East light
East_green := T1.ET >= T#5500ms AND T1.ET < T#9500ms;
East_yellow := T1.ET >= T#9500ms AND T1.ET < T#10000ms;
East_red := T1.ET < T#5500ms OR T1.ET >= T#10000ms;

// Reset timer if it completes the cycle
IF T1.Q THEN
    T1.IN := FALSE; // Reset timer
    T1(IN := TRUE, PT := T#10000ms); // Restart timer
END_IF;
