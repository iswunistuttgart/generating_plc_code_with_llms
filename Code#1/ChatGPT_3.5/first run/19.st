// 20.66s
// 3
FUNCTION_BLOCK FB1005
VAR_INPUT
    START: BOOL;      // Start the measurement (connected to sensor S1)
    THICKNESS: REAL;  // Input representing the thickness of the ceramic plate
    V_MAX: REAL;      // Maximum allowed thickness
    V_MIN: REAL;      // Minimum allowed thickness
END_VAR

VAR_OUTPUT
    M_MAX: REAL;      // Largest thickness recorded during the measurement
    M_MIN: REAL;      // Smallest thickness recorded during the measurement
    P1: BOOL;         // Output for the reject light
END_VAR

VAR
    D_MAX: BOOL;      // Flag indicating if the largest thickness is outside the specified range
    D_MIN: BOOL;      // Flag indicating if the smallest thickness is outside the specified range
    ThicknessStarted: BOOL;  // Flag indicating if the thickness measurement has started
    LastThickness: REAL;     // Last recorded thickness during the measurement
END_VAR

METHOD MeasureThickness
    IF START THEN
        // Start of a new measurement cycle
        M_MAX := THICKNESS;  // Initialize largest thickness
        M_MIN := THICKNESS;  // Initialize smallest thickness
        D_MAX := FALSE;      // Initialize flags
        D_MIN := FALSE;
        ThicknessStarted := TRUE;  // Set the flag to indicate the measurement has started
    END_IF

    IF ThicknessStarted THEN
        // During the measurement cycle
        IF THICKNESS > M_MAX THEN
            M_MAX := THICKNESS;  // Update largest thickness
        END_IF

        IF THICKNESS < M_MIN THEN
            M_MIN := THICKNESS;  // Update smallest thickness
        END_IF

        LastThickness := THICKNESS;  // Record the last thickness
    END_IF

    // After the measurement cycle
    IF NOT START AND ThicknessStarted THEN
        ThicknessStarted := FALSE;  // Reset the flag to indicate the end of the measurement
        D_MAX := M_MAX > V_MAX;     // Check if the largest thickness is outside the specified range
        D_MIN := M_MIN < V_MIN;     // Check if the smallest thickness is outside the specified range
    END_IF

    // Output the reject light signal
    P1 := D_MAX OR D_MIN;
END_METHOD

END_FUNCTION_BLOCK
