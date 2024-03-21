//14.32s
//2
PROGRAM FillLevelMonitor
VAR
    FillLevelAnalog: INT;  // Analog value (0 - 32767)
    FillLevelPercent: REAL;  // Fill level in percentage (0-100%)
    LowLevel: BOOL := FALSE;  // Output for low fill level
    OkLevel: BOOL := FALSE;   // Output for ok fill level
    HighLevel: BOOL := FALSE; // Output for high fill level
    WarningHorn: BOOL := FALSE; // Output for warning horn
END_VAR

BEGIN
    // Read the analog fill level value (0 - 32767), e.g., from a sensor
    FillLevelAnalog := YourAnalogInputValue;

    // Convert the analog fill level to a percentage (0-100%)
    FillLevelPercent := (REAL(FillLevelAnalog) / 32767.0) * 100.0;

    // Use the CASE instruction to categorize the fill level
    CASE
        FillLevelPercent < 1.0:
            LowLevel := TRUE;
            OkLevel := FALSE;
            HighLevel := FALSE;
            WarningHorn := TRUE;
        FillLevelPercent >= 1.0 AND FillLevelPercent <= 70.0:
            LowLevel := FALSE;
            OkLevel := TRUE;
            HighLevel := FALSE;
            WarningHorn := FALSE;
        FillLevelPercent > 70.0:
            LowLevel := FALSE;
            OkLevel := FALSE;
            HighLevel := TRUE;
            WarningHorn := FALSE;
    END_CASE;
END_PROGRAM
