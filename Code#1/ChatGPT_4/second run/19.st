// 39.94s
// 2
FUNCTION_BLOCK FB1005
VAR_INPUT
    Laser1 : REAL;      // Measurement from Laser 1
    Laser2 : REAL;      // Measurement from Laser 2
    S1 : BOOL;          // Sensor to start/end measurement
    V_MAX : REAL;       // Upper tolerance limit
    V_MIN : REAL;       // Lower tolerance limit
END_VAR

VAR_OUTPUT
    M_MAX : REAL;       // Maximum measured thickness
    M_MIN : REAL;       // Minimum measured thickness
    P1 : BOOL;          // Reject indicator
END_VAR

VAR
    measuring : BOOL := FALSE;  // Indicates if currently measuring
    currentThickness : REAL;
END_VAR

BEGIN
    IF S1 THEN
        IF NOT measuring THEN
            // Start of a new measurement
            M_MAX := -REAL_MAX;
            M_MIN := REAL_MAX;
            measuring := TRUE;
            P1 := FALSE;
        END_IF

        // Calculate current thickness
        currentThickness := ABS(Laser1 - Laser2);

        // Update M_MAX and M_MIN
        IF currentThickness > M_MAX THEN
            M_MAX := currentThickness;
        END_IF

        IF currentThickness < M_MIN THEN
            M_MIN := currentThickness;
        END_IF

        // Check if the current measurement is out of tolerance
        IF (M_MAX > V_MAX) OR (M_MIN < V_MIN) THEN
            P1 := TRUE;  // Plate is scrap
        END_IF
    ELSE
        IF measuring THEN
            // End of measurement
            measuring := FALSE;
        END_IF
    END_IF
END_FUNCTION_BLOCK
