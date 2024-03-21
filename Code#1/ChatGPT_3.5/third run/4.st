//10.25s
//2
PROGRAM FillLevelCheck
VAR_INPUT
    analogValue: INT := 0 TO 32767; // Input analog value (0 - 32767)
END_VAR

VAR_OUTPUT
    lowLevel: BOOL := FALSE;  // Output for low fill level
    okLevel: BOOL := FALSE;   // Output for ok fill level
    highLevel: BOOL := FALSE; // Output for high fill level
    warningHorn: BOOL := FALSE; // Output for warning horn
END_VAR

VAR
    fillLevelPercentage: INT := 0 TO 100; // Internal variable for fill level in percentage
END_VAR

CASE fillLevelPercentage OF
    (0 TO 1):   // Below 1%
        lowLevel := FALSE;
        okLevel := FALSE;
        highLevel := FALSE;
        warningHorn := TRUE;
    (2 TO 70):  // 2% to 70%
        lowLevel := FALSE;
        okLevel := TRUE;
        highLevel := FALSE;
        warningHorn := FALSE;
    (71 TO 100): // 71% to 100%
        lowLevel := FALSE;
        okLevel := FALSE;
        highLevel := TRUE;
        warningHorn := FALSE;
    ELSE        // Any other values
        lowLevel := TRUE;
        okLevel := FALSE;
        highLevel := FALSE;
        warningHorn := FALSE;
END_CASE

END_PROGRAM
