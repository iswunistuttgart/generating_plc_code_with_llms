// 62.53s
// 2
FUNCTION_BLOCK FB1005
VAR_INPUT
    START: BOOL;      // Sensor signal for measurement start/end
    THICKNESS: DWORD; // Thickness measurement from lasers
    V_MAX, V_MIN: REAL; // Tolerance band limits
END_VAR

VAR_OUTPUT
    M_MAX, M_MIN: DWORD; // Maximum and Minimum thickness measurements
    P1: BOOL;            // Reject light
END_VAR

VAR
    CurrentValue: REAL;
    MeasurementInProgress: BOOL := FALSE;
END_VAR

BEGIN
    IF START AND NOT MeasurementInProgress THEN
        // Start of a new measurement
        MeasurementInProgress := TRUE;
        M_MAX := 0;
        M_MIN := DWORD(MAX_INT); // Set to maximum possible value
    ELSIF NOT START AND MeasurementInProgress THEN
        // End of measurement
        MeasurementInProgress := FALSE;

        // Check if the thickness values are outside the tolerance band
        IF (M_MAX > REAL_TO_DWORD(V_MAX)) OR (M_MIN < REAL_TO_DWORD(V_MIN)) THEN
            P1 := TRUE; // Activate reject light
        ELSE
            P1 := FALSE;
        END_IF;
    END_IF;

    IF MeasurementInProgress THEN
        // Convert thickness to REAL for comparison
        CurrentValue := DWORD_TO_REAL(THICKNESS);

        // Update max and min values
        IF CurrentValue > DWORD_TO_REAL(M_MAX) THEN
            M_MAX := THICKNESS;
        END_IF;
        IF CurrentValue < DWORD_TO_REAL(M_MIN) THEN
            M_MIN := THICKNESS;
        END_IF;
    END_IF;
END_FUNCTION_BLOCK
