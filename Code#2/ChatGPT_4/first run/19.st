// 53.3s
// 4
FUNCTION_BLOCK FB1005
VAR_INPUT
    START : BOOL; // Start/end signal for measurement
    DICKE : REAL; // Thickness measurement from laser sensors
    V_MAX : REAL; // Maximum tolerance value
    V_MIN : REAL; // Minimum tolerance value
END_VAR
VAR_OUTPUT
    D_MAX : REAL; // Maximum thickness detected
    D_MIN : REAL; // Minimum thickness detected
    P1 : BOOL; // Reject light signal
END_VAR
VAR
    FO : BOOL; // Flag for ongoing measurement
END_VAR

// Measurement start
IF START AND NOT FO THEN
    // Initialize values at the start of measurement
    D_MAX := DICKE;
    D_MIN := DICKE;
    P1 := FALSE; // Reset reject light
    FO := TRUE; // Set flag indicating measurement is ongoing
ELSIF NOT START AND FO THEN
    // Measurement end
    FO := FALSE; // Reset measurement flag

    // Check if thickness is outside tolerance band
    IF D_MAX > V_MAX OR D_MIN < V_MIN THEN
        P1 := TRUE; // Activate reject light if out of tolerance
    END_IF
END_IF;

// During measurement
IF FO THEN
    // Update maximum and minimum thickness values
    IF DICKE > D_MAX THEN
        D_MAX := DICKE;
    END_IF;
    IF DICKE < D_MIN THEN
        D_MIN := DICKE;
    END_IF;
END_IF;

END_FUNCTION_BLOCK
