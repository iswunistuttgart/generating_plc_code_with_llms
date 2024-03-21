//38.21s
//2
PROGRAM FillLevelCheck
VAR
    nAnalogValue: INT; // Raw analog value from the sensor (0 - 32767)
    rFillLevel: REAL;  // Scaled fill level (0.0 - 100.0%)
    xLowLevel: BOOL;   // Output for low level
    xOkLevel: BOOL;    // Output for ok level
    xHighLevel: BOOL;  // Output for high level
    xWarningHorn: BOOL; // Output for warning horn (< 1% level)
END_VAR

// Scale the analog value to a percentage (0-100%)
rFillLevel := (REAL(nAnalogValue) / 32767) * 100;

// Determine the range of the fill level and set outputs accordingly
CASE TRUE OF
    rFillLevel < 1.0:
        xWarningHorn := TRUE; // Activate the warning horn
        xLowLevel := FALSE;
        xOkLevel := FALSE;
        xHighLevel := FALSE;
    rFillLevel >= 1.0 AND rFillLevel < 20.0:
        xLowLevel := TRUE;
        xOkLevel := FALSE;
        xHighLevel := FALSE;
        xWarningHorn := FALSE; // Deactivate the warning horn
    rFillLevel >= 20.0 AND rFillLevel <= 80.0:
        xLowLevel := FALSE;
        xOkLevel := TRUE;
        xHighLevel := FALSE;
        xWarningHorn := FALSE; // Deactivate the warning horn
    rFillLevel > 80.0:
        xLowLevel := FALSE;
        xOkLevel := FALSE;
        xHighLevel := TRUE;
        xWarningHorn := FALSE; // Deactivate the warning horn
    ELSE
        xLowLevel := FALSE;
        xOkLevel := FALSE;
        xHighLevel := FALSE;
        xWarningHorn := FALSE; // Default case, no level detected
END_CASE

END_PROGRAM
