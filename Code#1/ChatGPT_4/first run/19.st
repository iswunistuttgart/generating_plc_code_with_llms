// 56.28s
// 4
FUNCTION_BLOCK FB1005
VAR_INPUT
    START     : BOOL;    // Signal to start/stop measurement (from sensor S1)
    THICKNESS : DWORD;   // Measured thickness from lasers
    V_MAX     : REAL;    // Upper tolerance limit
    V_MIN     : REAL;    // Lower tolerance limit
END_VAR

VAR_OUTPUT
    M_MAX     : REAL;    // Maximum measured thickness
    M_MIN     : REAL;    // Minimum measured thickness
    P1        : BOOL;    // Reject light (ON if outside tolerance)
END_VAR

VAR
    CurrentThickness : REAL;
    MeasurementActive : BOOL;
END_VAR

BEGIN
    IF START THEN
        // Convert the DWORD thickness measurement to REAL
        CurrentThickness := DWORD_TO_REAL(THICKNESS);

        // Initialize min/max values at the start of a new measurement
        IF NOT MeasurementActive THEN
            M_MAX := CurrentThickness;
            M_MIN := CurrentThickness;
            MeasurementActive := TRUE;
        END_IF

        // Update min and max values
        IF CurrentThickness > M_MAX THEN
            M_MAX := CurrentThickness;
        END_IF
        IF CurrentThickness < M_MIN THEN
            M_MIN := CurrentThickness;
        END_IF
    ELSE
        // End of measurement, check tolerance and reset
        IF MeasurementActive THEN
            P1 := (M_MAX > V_MAX) OR (M_MIN < V_MIN);  // Check if outside tolerance
            MeasurementActive := FALSE;  // Reset for next cycle
        END_IF
    END_IF
END_FUNCTION_BLOCK
