// 10.46s
// 2
FUNCTION_BLOCK INTERLOCK
VAR_INPUT
    I1: BOOL;
    I2: BOOL;
    TL: TIME;
END_VAR
VAR_OUTPUT
    Q1: BOOL;
    Q2: BOOL;
END_VAR
VAR
    T1: TOF;
    T2: TOF;
END_VAR

METHOD InterlockControl: BOOL
    // Control the interlock logic
    IF NOT T1.PT THEN
        // Start timer T1 when I1 is TRUE
        T1(IN := I1, PT := TL);
    ELSE
        // Reset timer T1 when I1 goes FALSE
        T1(IN := NOT I1);
    END_IF;

    IF NOT T2.PT THEN
        // Start timer T2 when I2 is TRUE
        T2(IN := I2, PT := TL);
    ELSE
        // Reset timer T2 when I2 goes FALSE
        T2(IN := NOT I2);
    END_IF;

    // Set Q1 only if T1 is not running and I1 is TRUE
    IF NOT T1.Q THEN
        Q1 := I1;
    END_IF;

    // Set Q2 only if T2 is not running and I2 is TRUE
    IF NOT T2.Q THEN
        Q2 := I2;
    END_IF;

    // Return TRUE to keep the method running
    RETURN TRUE;
END_METHOD

METHOD Initialize: BOOL
    // Reset timers and outputs at the beginning
    T1(IN := FALSE);
    T2(IN := FALSE);
    Q1 := FALSE;
    Q2 := FALSE;

    // Return FALSE to end the initialization
    RETURN FALSE;
END_METHOD

METHOD INTERLOCK: BOOL
    // Run the initialization at the start
    IF NOT T1.Q THEN
        RETURN Initialize();
    ELSE
        // Run the interlock control logic
        RETURN InterlockControl();
    END_IF;
END_METHOD
END_FUNCTION_BLOCK
