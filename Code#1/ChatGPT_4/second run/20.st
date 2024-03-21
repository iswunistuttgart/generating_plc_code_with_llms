// 48.24s
// 4
PROGRAM InterlockProgram
VAR
    I1, I2 : BOOL;       // Inputs
    Q1, Q2 : BOOL;       // Outputs
    TL : TIME;           // Dead time between outputs
    LastQ1Time, LastQ2Time : TIME;  // Time trackers for Q1 and Q2
END_VAR

BEGIN
    // Update time trackers
    IF Q1 THEN
        LastQ1Time := TIME();
    END_IF
    IF Q2 THEN
        LastQ2Time := TIME();
    END_IF

    // Logic for Q1
    IF I1 AND NOT Q2 AND (TIME() - LastQ2Time > TL) THEN
        Q1 := TRUE;
    ELSE
        Q1 := FALSE;
    END_IF

    // Logic for Q2
    IF I2 AND NOT Q1 AND (TIME() - LastQ1Time > TL) THEN
        Q2 := TRUE;
    ELSE
        Q2 := FALSE;
    END_IF
END_PROGRAM
