//16.58s
//2
PROGRAM CraneLiftSystem
VAR
    doConvTop: BOOL := FALSE;     // Conveyor belt for top
    doConvBottom: BOOL := FALSE;  // Conveyor belt for bottom
    diConvTop: BOOL := FALSE;     // Light barrier for top conveyor
    diConvBottom: BOOL := FALSE;  // Light barrier for bottom conveyor
    doLiftTop: BOOL := FALSE;     // Lift control for top position
    doLiftBottom: BOOL := FALSE;  // Lift control for bottom position
    diLiftTop: BOOL := FALSE;     // Lift position for top
    diLiftBottom: BOOL := FALSE;  // Lift position for bottom
    doConvLift: BOOL := FALSE;    // Conveyor belt on the lift
    diBoxLift: BOOL := FALSE;     // Crate at the lift
    doLiftUnload: BOOL := FALSE;  // Lift control for unloading position
    diLiftUnload: BOOL := FALSE;  // Lift position for unloading
END_VAR

METHOD RequestLift
    IF diConvTop AND NOT doLiftTop THEN
        doConvTop := FALSE;    // Stop the top conveyor
        doLiftTop := TRUE;     // Move the lift to the top position
    ELSIF diConvBottom AND NOT doLiftBottom THEN
        doConvBottom := FALSE; // Stop the bottom conveyor
        doLiftBottom := TRUE;  // Move the lift to the bottom position
    END_IF
END_METHOD

METHOD MoveLift
    IF doLiftTop AND diLiftTop THEN
        doConvLift := TRUE;    // Turn on the lift conveyor
        IF diBoxLift THEN
            doLiftTop := FALSE; // Move the lift to unloading position
            doLiftUnload := TRUE;
        END_IF
    ELSIF doLiftBottom AND diLiftBottom THEN
        doConvLift := TRUE;    // Turn on the lift conveyor
        IF diBoxLift THEN
            doLiftBottom := FALSE;  // Move the lift to unloading position
            doLiftUnload := TRUE;
        END_IF
    END_IF
END_METHOD

METHOD UnloadLift
    IF doLiftUnload AND diLiftUnload THEN
        doConvLift := FALSE; // Turn off the lift conveyor
        doLiftUnload := FALSE; // Reset the lift control for unloading position
        // Place code here to convey the crate from the lift to the unloading conveyor
    END_IF
END_METHOD

END_PROGRAM
