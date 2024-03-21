// 15.67s
// 3
PROGRAM InterlockProgram
VAR_INPUT
    I1: BOOL;  // Input to switch Q1
    I2: BOOL;  // Input to switch Q2
END_VAR

VAR_OUTPUT
    Q1: BOOL;  // Output Q1
    Q2: BOOL;  // Output Q2
END_VAR

VAR
    TimerQ1: TON := (PT := T#1s);  // Timer for Q1
    TimerQ2: TON := (PT := T#1s);  // Timer for Q2
    TL: TIME := T#500ms;           // Dead time between Q1 and Q2
    LastQ1State: BOOL := FALSE;    // Last state of Q1
    LastQ2State: BOOL := FALSE;    // Last state of Q2
END_VAR

METHOD InterlockLogic
    // Update timers
    TimerQ1(IN := I1);
    TimerQ2(IN := I2);

    // Determine the next state of Q1
    IF I1 AND NOT Q2 AND TimerQ2.Q THEN
        Q1 := TRUE;
        LastQ1State := TRUE;
    ELSIF NOT I1 THEN
        Q1 := FALSE;
        TimerQ1(IN := FALSE);  // Reset the timer if I1 is OFF
    END_IF

    // Determine the next state of Q2
    IF I2 AND NOT Q1 AND TimerQ1.Q THEN
        Q2 := TRUE;
        LastQ2State := TRUE;
    ELSIF NOT I2 THEN
        Q2 := FALSE;
        TimerQ2(IN := FALSE);  // Reset the timer if I2 is OFF
    END_IF

    // Check for mutual locking
    IF LastQ1State AND TimerQ2.ET < TL THEN
        Q1 := FALSE;
    END_IF

    IF LastQ2State AND TimerQ1.ET < TL THEN
        Q2 := FALSE;
    END_IF

    // Update last states
    LastQ1State := Q1;
    LastQ2State := Q2;
END_METHOD

END_PROGRAM
