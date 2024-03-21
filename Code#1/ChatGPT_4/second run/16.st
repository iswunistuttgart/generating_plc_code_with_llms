//41.0s
//4
PROGRAM TrafficLightControl
VAR
    North_green, North_yellow, North_red: BOOL; // North traffic lights
    East_green, East_yellow, East_red: BOOL; // East traffic lights
    CycleTimer: TON; // Timer for controlling the cycle
END_VAR

// Start the cycle timer
CycleTimer(IN:=TRUE, PT:=T#10000ms);

// Control North traffic light
IF CycleTimer.ET < T#5000ms THEN
    // Between 0ms and 5000ms, North is green and East is red
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF CycleTimer.ET < T#5500ms THEN
    // Between 5000ms and 5500ms, North turns yellow
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSE
    // After 5500ms, North is red
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
END_IF;

// Control East traffic light
IF CycleTimer.ET >= T#5500ms AND CycleTimer.ET < T#9500ms THEN
    // Between 5500ms and 9500ms, East is green
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
ELSIF CycleTimer.ET >= T#9500ms THEN
    // Between 9500ms and 10000ms, East turns yellow
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF;

// Reset the timer after the cycle completes
IF CycleTimer.ET >= CycleTimer.PT THEN
    CycleTimer.IN := FALSE; // Stop the timer
    CycleTimer( IN:=FALSE ); // Reset the timer
    CycleTimer.IN := TRUE; // Restart the timer for the next cycle
END_IF;

END_PROGRAM
