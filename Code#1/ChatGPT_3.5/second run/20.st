// 16.52s
// 4
PROGRAM InterlockProgram
VAR
    I1: BOOL;      // Input for Q1
    I2: BOOL;      // Input for Q2
    Q1: BOOL;      // Output Q1
    Q2: BOOL;      // Output Q2
    TL: TIME := T#1S;  // Dead time between the two outputs
    TimerQ1: TON;   // Timer for Q1
    TimerQ2: TON;   // Timer for Q2
END_VAR

VAR CONSTANT
    TRUE_TIME: TIME := T#0S;  // Constant representing TRUE for a timer
END_VAR

BEGIN
    // Interlock logic for Q1
    IF NOT Q2 AND I1 THEN
        // Start the timer for Q1 if Q2 is FALSE and I1 is TRUE
        TimerQ1(IN := TRUE, PT := TL);
        // Set Q1 to TRUE if the timer for Q1 has elapsed
        Q1 := TimerQ1.Q;
    ELSE
        // Reset the timer for Q1 if Q2 is TRUE or I1 is FALSE
        TimerQ1(IN := FALSE);
        // Set Q1 to FALSE
        Q1 := FALSE;
    END_IF

    // Interlock logic for Q2
    IF NOT Q1 AND I2 THEN
        // Start the timer for Q2 if Q1 is FALSE and I2 is TRUE
        TimerQ2(IN := TRUE, PT := TL);
        // Set Q2 to TRUE if the timer for Q2 has elapsed
        Q2 := TimerQ2.Q;
    ELSE
        // Reset the timer for Q2 if Q1 is TRUE or I2 is FALSE
        TimerQ2(IN := FALSE);
        // Set Q2 to FALSE
        Q2 := FALSE;
    END_IF
END_PROGRAM
