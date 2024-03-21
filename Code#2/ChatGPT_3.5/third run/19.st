// 11.08s
// 2
FUNCTION_BLOCK FB1005
VAR_INPUT
    START: BOOL;
    DICKE, V_MAX, V_MIN: REAL;
END_VAR

VAR_OUTPUT
    D_MAX, D_MIN: REAL;
    P1: BOOL;
END_VAR

VAR
    FO: BOOL;
    OldDicke: REAL;
END_VAR

METHOD MeasureThickness: BOOL
    VAR
        Messwert: REAL;
    END_VAR
    // Measurement logic goes here
    // Replace the following line with your actual measurement code
    Messwert := ABS(RAND(1.0));
    D_MAX := MAX(Messwert, D_MAX);
    D_MIN := MIN(Messwert, D_MIN);
    RETURN TRUE;
END_METHOD

METHOD CheckReject: BOOL
    // Check if the measured values are outside the tolerance band
    IF (D_MAX > V_MAX OR D_MIN < V_MIN) THEN
        P1 := TRUE; // Switch on reject light
        RETURN TRUE;
    ELSE
        P1 := FALSE; // Switch off reject light
        RETURN FALSE;
    END_IF;
END_METHOD

METHOD ResetValues: BOOL
    // Reset measured values at the start of a new measurement cycle
    D_MAX := 0.0;
    D_MIN := 9999.9; // Adjust the initial value based on your actual expected range
    RETURN TRUE;
END_METHOD

METHOD FBExecution: BOOL
    // Main execution logic of the function block
    IF START THEN
        IF NOT FO THEN
            // Start a new measurement cycle
            ResetValues();
            FO := TRUE;
        END_IF;
        
        // Perform thickness measurement
        IF MeasureThickness() THEN
            // Check for reject condition
            CheckReject();
        END_IF;
    ELSE
        FO := FALSE; // Reset the flag when the sensor signal is not active
    END_IF;
    
    RETURN TRUE;
END_METHOD

END_FUNCTION_BLOCK
