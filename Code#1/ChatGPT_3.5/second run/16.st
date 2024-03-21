//10.81s
//2
PROGRAM TrafficLightControl
VAR
    North_green: BOOL := TRUE;  // North green light
    North_yellow: BOOL := FALSE;  // North yellow light
    North_red: BOOL := FALSE;  // North red light
    East_green: BOOL := FALSE;  // East green light
    East_yellow: BOOL := FALSE;  // East yellow light
    East_red: BOOL := TRUE;  // East red light
    Timer: TON;  // Timer to control the light cycle
END_VAR

BEGIN
    // Initialize the timer parameters
    Timer(IN := TRUE, PT := T#5000ms);

    // Control the traffic light cycle
    IF Timer.Q THEN
        // First 5000ms - North green, East red
        North_green := TRUE;
        North_yellow := FALSE;
        North_red := FALSE;
        East_green := FALSE;
        East_yellow := FALSE;
        East_red := TRUE;
    ELSIF Timer.ET THEN
        // 5000ms to 5500ms - North yellow, East red
        North_green := FALSE;
        North_yellow := TRUE;
        North_red := FALSE;
        East_green := FALSE;
        East_yellow := FALSE;
        East_red := TRUE;
    ELSIF Timer.Q2 THEN
        // 5500ms to 9500ms - North red, East green
        North_green := FALSE;
        North_yellow := FALSE;
        North_red := TRUE;
        East_green := TRUE;
        East_yellow := FALSE;
        East_red := FALSE;
    ELSIF Timer.ET2 THEN
        // 9500ms to 10000ms - North red, East yellow
        North_green := FALSE;
        North_yellow := FALSE;
        North_red := TRUE;
        East_green := FALSE;
        East_yellow := TRUE;
        East_red := FALSE;
    END_IF
END_PROGRAM
