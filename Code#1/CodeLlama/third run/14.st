// 41.154829025268555s
// 2 (Variablen falsch deklariert)
```
FUNCTION_BLOCK FC1001
VAR
    // Inputs
    INPUT ENABLE : BOOL;
    INPUT SENSOR_VALUE : REAL;
    INPUT SWITCHING_VALUE : REAL;
    INPUT HYSTERESIS : REAL;
    // Outputs
    OUTPUT OUTPUT : BOOL;
END_VAR
IF ENABLE THEN
    IF SENSOR_VALUE > (SWITCHING_VALUE + (HYSTERESIS / 100) * SWITCHING_VALUE) THEN
        OUTPUT := TRUE;
    ELSIF SENSOR_VALUE < (SWITCHING_VALUE - (HYSTERESIS / 100) * SWITCHING_VALUE) THEN
        OUTPUT := FALSE;
    ELSE
        OUTPUT := OUTPUT;
    END_IF;
END_IF;
```