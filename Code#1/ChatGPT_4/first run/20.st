// 52.57s
// 4
PROGRAM InterlockProgram
VAR
    I1, I2      : BOOL;         // Inputs
    Q1, Q2      : BOOL;         // Outputs
    TL          : TIME;         // Dead time
    TimerQ1, TimerQ2 : TON;     // Timers for dead time
END_VAR

BEGIN
    // Update timers
    TimerQ1(IN := NOT Q1, PT := TL);
    TimerQ2(IN := NOT Q2, PT := TL);

    // Logic for Q1
    IF I1 AND TimerQ2.Q THEN
        Q1 := TRUE;
    ELSIF NOT I1 OR (I2 AND TimerQ1.Q) THEN
        Q1 := FALSE;
    END_IF

    // Logic for Q2
    IF I2 AND TimerQ1.Q THEN
        Q2 := TRUE;
    ELSIF NOT I2 OR (I1 AND TimerQ2.Q) THEN
        Q2 := FALSE;
    END_IF
END_PROGRAM
