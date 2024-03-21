//36.02s
//2
PROGRAM FillLevelCheck
VAR
    nAnalogValue : INT; // Analog value input (0 - 32767)
    fFillLevel : REAL; // Converted fill level (0 - 100%)
    xLow : BOOL; // Output for low level
    xOk : BOOL; // Output for ok level
    xHigh : BOOL; // Output for high level
    xWarningHorn : BOOL; // Output for warning horn (<1%)
END_VAR

// Convert the analog value to a percentage
fFillLevel := REAL(nAnalogValue) * 100.0 / 32767.0;

// Check the fill level and set the outputs accordingly
CASE fFillLevel OF
    0.0 ..< 1.0:
        xLow := FALSE;
        xOk := FALSE;
        xHigh := FALSE;
        xWarningHorn := TRUE; // Activate warning horn if below 1%
    1.0 ..< 20.0:
        xLow := TRUE;
        xOk := FALSE;
        xHigh := FALSE;
        xWarningHorn := FALSE;
    20.0 ..< 80.0:
        xLow := FALSE;
        xOk := TRUE;
        xHigh := FALSE;
        xWarningHorn := FALSE;
    80.0 .. 100.0:
        xLow := FALSE;
        xOk := FALSE;
        xHigh := TRUE;
        xWarningHorn := FALSE;
    ELSE
        // Handle out of range values, if necessary
END_CASE

END_PROGRAM
