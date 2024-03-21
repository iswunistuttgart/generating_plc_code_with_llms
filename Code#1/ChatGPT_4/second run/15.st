// 48.69s
// 2
FUNCTION FC1002 : BOOL
VAR_INPUT
    sensorDetected : BOOL; // TRUE if ultrasonic sensor detects something
    switchEA : BOOL;       // TRUE if the monitoring system is switched on
END_VAR

VAR_OUTPUT
    hornPHU : BOOL;        // Horn for acoustic warning signal
    alarmPAL : BOOL;       // Alarm signal
    indicatorP1 : BOOL;    // Indicator for monitoring system status
END_VAR

VAR
    detectionStartTime : TIME;
    systemActive : BOOL;
    static lastDetectionTime : TIME := 0;
END_VAR

// System control logic
IF switchEA THEN
    indicatorP1 := TRUE;  // Monitoring system is active
    systemActive := TRUE;

    IF sensorDetected THEN
        IF NOT hornPHU THEN
            detectionStartTime := TIME();  // Start the detection timer
        END_IF

        hornPHU := TRUE;  // Activate horn

        // Check if detection lasts longer than 3 seconds
        IF TIME() - detectionStartTime > T#3s THEN
            hornPHU := FALSE;   // Turn off horn
            alarmPAL := TRUE;   // Activate alarm
        END_IF
    ELSE
        hornPHU := FALSE;
        alarmPAL := FALSE;
        detectionStartTime := 0;
    END_IF
ELSE
    // Reset all outputs and states when the system is switched off
    hornPHU := FALSE;
    alarmPAL := FALSE;
    indicatorP1 := FALSE;
    systemActive := FALSE;
    detectionStartTime := 0;
END_IF

FC1002 := systemActive;

END_FUNCTION
