// 29.54s
// 3
FUNCTION_BLOCK INTERLOCK
VAR_INPUT
    I1 : BOOL;  // Input for controlling Q1
    I2 : BOOL;  // Input for controlling Q2
    TL : TIME;  // Dead time between outputs
END_VAR
VAR_OUTPUT
    Q1 : BOOL;  // Output 1
    Q2 : BOOL;  // Output 2
END_VAR
VAR
    T1 : TOF;   // Timer for Q1
    T2 : TOF;   // Timer for Q2
END_VAR

// Timer for Q1
T1(IN := NOT Q1, PT := TL);

// Timer for Q2
T2(IN := NOT Q2, PT := TL);

// Logic for Q1 and Q2 with interlock functionality
IF I1 AND NOT Q2 AND T2.Q THEN
    Q1 := TRUE;
ELSE
    Q1 := FALSE;
END_IF;

IF I2 AND NOT Q1 AND T1.Q THEN
    Q2 := TRUE;
ELSE
    Q2 := FALSE;
END_IF;

END_FUNCTION_BLOCK
