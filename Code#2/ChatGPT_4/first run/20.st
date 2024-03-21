// 65.85s
// 3
FUNCTION_BLOCK INTERLOCK
VAR_INPUT
    I1 : BOOL; // Input for Q1
    I2 : BOOL; // Input for Q2
    TL : TIME; // Dead time between switching outputs
END_VAR
VAR_OUTPUT
    Q1 : BOOL; // Output 1
    Q2 : BOOL; // Output 2
END_VAR
VAR
    T1 : TOF; // Timer for Q1
    T2 : TOF; // Timer for Q2
END_VAR

// Timer logic
T1(IN := NOT I1, PT := TL);
T2(IN := NOT I2, PT := TL);

// Interlock logic
IF I1 AND T2.Q THEN
    Q1 := TRUE;
    Q2 := FALSE;
ELSIF I2 AND T1.Q THEN
    Q1 := FALSE;
    Q2 := TRUE;
ELSE
    Q1 := Q1 AND NOT I2; // Maintain current state of Q1 unless I2 is triggered
    Q2 := Q2 AND NOT I1; // Maintain current state of Q2 unless I1 is triggered
END_IF;

END_FUNCTION_BLOCK
