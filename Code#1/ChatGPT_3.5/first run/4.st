//14.19s
//2
PROGRAM FillLevelMonitor
VAR
    AnalogValue: INT := 0;      // Analog value (0 - 32767)
    FillLevelPercentage: REAL;  // Fill level percentage (0 - 100%)
    LowLevel: BOOL := FALSE;    // Output for low fill level
    OkLevel: BOOL := FALSE;     // Output for ok fill level
    HighLevel: BOOL := FALSE;   // Output for high fill level
    WarningHorn: BOOL := FALSE; // Output for the warning horn
END_VAR

// Read the analog value (0 - 32767) from your sensor
AnalogValue := YourAnalogSensorFunction();  // Replace with your actual sensor reading

// Convert the analog value to a percentage (0 - 100%)
FillLevelPercentage := REAL(AnalogValue) / 327.67;

// Use the CASE instruction to categorize the fill level
CASE
    FillLevelPercentage < 1.0:
        WarningHorn := TRUE;
    FillLevelPercentage < 30.0:
        LowLevel := TRUE;
    FillLevelPercentage < 70.0:
        OkLevel := TRUE;
    ELSE
        HighLevel := TRUE;
END_CASE

// Reset other outputs to FALSE
IF WarningHorn = TRUE THEN
    LowLevel := FALSE;
    OkLevel := FALSE;
    HighLevel := FALSE;
ELSE
    WarningHorn := FALSE;
END_IF

// Your program logic continues here

END_PROGRAM
