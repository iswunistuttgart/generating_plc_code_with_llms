// 17.9s
// 3
FUNCTION_BLOCK FB1005
VAR_INPUT
    START: BOOL;       // Start of the measurement (connected to sensor S1)
    THICKNESS: REAL;   // Input representing the difference between two laser measurements
    V_MAX: REAL;       // Maximum allowed thickness
    V_MIN: REAL;       // Minimum allowed thickness
END_VAR

VAR_OUTPUT
    D_MAX: REAL;       // Largest plate thickness value
    D_MIN: REAL;       // Smallest plate thickness value
    P1: BOOL;          // Reject light signal
END_VAR

VAR
    SensorActive: BOOL := FALSE;  // Flag indicating if the sensor is active
    TempD_MAX: REAL := 0.0;       // Temporary storage for the largest value
    TempD_MIN: REAL := 0.0;       // Temporary storage for the smallest value
END_VAR

METHOD CheckThickness : BOOL
    IF SensorActive THEN
        // During and after the measurement
        D_MAX := TempD_MAX;
        D_MIN := TempD_MIN;

        // Check if values are outside the tolerance band
        IF (D_MAX > V_MAX OR D_MIN < V_MIN) THEN
            P1 := TRUE;  // Switch on reject light
        ELSE
            P1 := FALSE; // Switch off reject light
        END_IF

        // Reset temporary storage at the end of the measurement
        IF NOT START THEN
            TempD_MAX := THICKNESS;
            TempD_MIN := THICKNESS;
            SensorActive := FALSE;
        END_IF

        // Output the result of the thickness check
        CheckThickness := TRUE;
    ELSE
        // At the start of a new measurement
        SensorActive := START;

        // Initialize temporary storage at the start of a new measurement
        IF SensorActive THEN
            TempD_MAX := THICKNESS;
            TempD_MIN := THICKNESS;
        END_IF

        // Output the result of the thickness check
        CheckThickness := FALSE;
    END_IF
END_METHOD
END_FUNCTION_BLOCK
