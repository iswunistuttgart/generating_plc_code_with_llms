// 36.75s
// 4
PROGRAM InterlockProgram
VAR
    I1, I2: BOOL;       // Inputs
    Q1, Q2: BOOL;       // Outputs
    TL: TIME;           // Dead time
    Timer1, Timer2: TON; // Timers for dead time
END_VAR

BEGIN
    // Timer logic for Q1
    IF NOT I2 AND (Timer2.Q OR NOT Timer2.IN) THEN
        IF I1 THEN
            Timer1(IN := TRUE, PT := TL);
            IF Timer1.Q THEN
                Q1 := TRUE;
            END_IF;
        ELSE
            Timer1(IN := FALSE);
            Q1 := FALSE;
        END_IF;
    ELSE
        Q1 := FALSE;
    END_IF;

    // Timer logic for Q2
    IF NOT I1 AND (Timer1.Q OR NOT Timer1.IN) THEN
        IF I2 THEN
            Timer2(IN := TRUE, PT := TL);
            IF Timer2.Q THEN
                Q2 := TRUE;
            END_IF;
        ELSE
            Timer2(IN := FALSE);
            Q2 := FALSE;
        END_IF;
    ELSE
        Q2 := FALSE;
    END_IF;
END_PROGRAM
