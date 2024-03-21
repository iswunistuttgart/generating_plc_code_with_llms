//42.76s
//2
PROGRAM TrafficLightControl
VAR
    // Traffic Light Outputs
    North_green, North_yellow, North_red : BOOL;
    East_green, East_yellow, East_red : BOOL;

    // Timer
    CycleTimer : TON;

    // Constants for timing intervals
    CONST
        CYCLE_TIME : TIME := T#10000ms;
        NORTH_GREEN_TIME : TIME := T#5000ms;
        NORTH_YELLOW_TIME : TIME := T#500ms;
        EAST_GREEN_TIME : TIME := T#4000ms;
        EAST_YELLOW_TIME : TIME := T#500ms;
    END_CONST
END_VAR

CycleTimer(IN := TRUE, PT := CYCLE_TIME); // Timer is always running

// North light control
IF CycleTimer.ET < NORTH_GREEN_TIME THEN
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
ELSIF CycleTimer.ET < (NORTH_GREEN_TIME + NORTH_YELLOW_TIME) THEN
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
ELSE
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
END_IF

// East light control
IF CycleTimer.ET >= NORTH_GREEN_TIME AND CycleTimer.ET < (NORTH_GREEN_TIME + NORTH_YELLOW_TIME) THEN
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF CycleTimer.ET >= (NORTH_GREEN_TIME + NORTH_YELLOW_TIME) AND CycleTimer.ET < (NORTH_GREEN_TIME + NORTH_YELLOW_TIME + EAST_GREEN_TIME) THEN
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
ELSIF CycleTimer.ET >= (CYCLE_TIME - EAST_YELLOW_TIME) THEN
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
ELSE
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
END_IF

// Reset the timer if the cycle is complete
IF CycleTimer.ET >= CYCLE_TIME THEN
    CycleTimer(IN := FALSE); // Reset timer
    CycleTimer(IN := TRUE);  // Restart timer
END_IF
END_PROGRAM
