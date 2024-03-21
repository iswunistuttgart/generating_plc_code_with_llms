// 33.59s
// 4
FUNCTION_BLOCK FB1005
VAR_INPUT
    START : BOOL;       // Start/end signal for the measurement
    DICKE, V_MAX, V_MIN : REAL; // Thickness measurement and tolerance values
END_VAR
VAR_OUTPUT
    D_MAX, D_MIN : REAL; // Outputs for max and min thickness values
    P1 : BOOL;           // Output for reject light
END_VAR
VAR
    FO : BOOL;           // Flag for ongoing measurement
END_VAR

IF START THEN
    IF NOT FO THEN
        // New measurement cycle begins
        FO := TRUE; // Flag to indicate measurement is ongoing
        D_MAX := DICKE; // Initialize max and min values
        D_MIN := DICKE;
    ELSE
        // Update max and min values during the measurement
        IF DICKE > D_MAX THEN
            D_MAX := DICKE;
        END_IF;
        IF DICKE < D_MIN THEN
            D_MIN := DICKE;
        END_IF;
    END_IF;
ELSE
    IF FO THEN
        // Measurement cycle ends
        FO := FALSE; // Reset flag
        // Check if measured values are outside the tolerance range
        P1 := (D_MAX > V_MAX) OR (D_MIN < V_MIN);
    END_IF;
END_IF;
END_FUNCTION_BLOCK
