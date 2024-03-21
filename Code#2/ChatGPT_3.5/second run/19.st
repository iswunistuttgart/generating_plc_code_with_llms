// 11.44s
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
    M_MAX, M_MIN: REAL;
END_VAR
METHOD Messung : BOOL
    // Measure the thickness and update M_MAX, M_MIN
    M_MAX := MAX(M_MAX, DICKE);
    M_MIN := MIN(M_MIN, DICKE);

    // Check if the measured values are outside the tolerance band
    IF M_MAX > V_MAX OR M_MIN < V_MIN THEN
        P1 := TRUE;  // Turn on the reject light
    ELSE
        P1 := FALSE; // Turn off the reject light
    END_IF;

    // Return FALSE to end the measurement
    RETURN FALSE;
END_METHOD

METHOD StartMeasurement : BOOL
    // Start a new measurement cycle
    M_MAX := 0;
    M_MIN := 0;
    P1 := FALSE; // Turn off the reject light

    // Return TRUE to start the measurement
    RETURN TRUE;
END_METHOD

METHOD EndMeasurement : BOOL
    // Update output values with the results of the measurement
    D_MAX := M_MAX;
    D_MIN := M_MIN;

    // Return FALSE to end the measurement
    RETURN FALSE;
END_METHOD

METHOD FB1005 : BOOL
    // Check if the measurement is ongoing
    IF START THEN
        // If not in the measurement, start a new cycle
        IF NOT FO THEN
            FO := TRUE;
            RETURN StartMeasurement();
        // If already in the measurement, continue
        ELSE
            RETURN Messung();
        END_IF;
    // If the sensor is off, end the measurement
    ELSE
        IF FO THEN
            FO := FALSE;
            RETURN EndMeasurement();
        END_IF;
    END_IF;
END_METHOD
END_FUNCTION_BLOCK
