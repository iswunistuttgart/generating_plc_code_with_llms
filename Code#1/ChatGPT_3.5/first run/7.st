//9.39s
//2
PROGRAM CraneControl
VAR
    LoadReceptorValues: ARRAY[1..5] OF INT;  // Array to store load values for 5 receptors
    TotalLoad: INT := 0;  // Total load
    AverageLoad: INT := 0;  // Average load
    NumLoadReceptors: INT := 5;  // Number of load receptors (constant)
    AnalogInputRangeMin: INT := 0;  // Minimum value for analog inputs (constant)
    AnalogInputRangeMax: INT := 32767;  // Maximum value for analog inputs (constant)
END_VAR

FOR i := 1 TO NumLoadReceptors DO
    // Read analog values from load receptors (replace with actual readings)
    LoadReceptorValues[i] := ReadAnalogValue(i);  // Replace with your function

    // Ensure the values are within the specified range
    IF LoadReceptorValues[i] < AnalogInputRangeMin THEN
        LoadReceptorValues[i] := AnalogInputRangeMin;
    ELSIF LoadReceptorValues[i] > AnalogInputRangeMax THEN
        LoadReceptorValues[i] := AnalogInputRangeMax;
    END_IF

    TotalLoad := TotalLoad + LoadReceptorValues[i];  // Calculate total load
END_FOR

IF NumLoadReceptors > 0 THEN
    AverageLoad := TotalLoad / NumLoadReceptors;  // Calculate average load
ELSE
    AverageLoad := 0;  // Handle the case when there are no load receptors
END_IF

// Your program logic continues here

END_PROGRAM
