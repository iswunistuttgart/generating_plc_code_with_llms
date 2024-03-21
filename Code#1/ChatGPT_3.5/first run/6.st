//14.34s
// 2
PROGRAM CraneLiftControl
VAR
    doConvTop: BOOL := FALSE;        // Conveyor belt for top crates
    doConvBottom: BOOL := FALSE;     // Conveyor belt for bottom crates
    diConvTop: BOOL := FALSE;        // Light barrier for top conveyor
    diConvBottom: BOOL := FALSE;     // Light barrier for bottom conveyor
    doLiftTop: BOOL := FALSE;        // Lift to top position
    doLiftBottom: BOOL := FALSE;     // Lift to bottom position
    diLiftTop: BOOL := FALSE;        // Lift position at top
    diLiftBottom: BOOL := FALSE;     // Lift position at bottom
    doConvLift: BOOL := FALSE;       // Conveyor belt for lifting crate
    diBoxLift: BOOL := FALSE;        // Crate at lift sensor
    doLiftUnload: BOOL := FALSE;     // Lift to unloading position
    diLiftUnload: BOOL := FALSE;     // Lift position at unloading
END_VAR

VAR
    LiftRequested: BOOL := FALSE;    // Flag to indicate lift request
    BoxInLift: BOOL := FALSE;        // Flag to indicate a crate in the lift
END_VAR

CASE LiftRequested OF
    FALSE:
        IF diConvTop THEN
            doConvTop := FALSE;  // Stop top conveyor
            doLiftTop := TRUE;   // Move the lift to top position
            LiftRequested := TRUE;
        ELSIF diConvBottom THEN
            doConvBottom := FALSE;  // Stop bottom conveyor
            doLiftBottom := TRUE;   // Move the lift to bottom position
            LiftRequested := TRUE;
        END_IF;
    TRUE:
        IF diLiftTop AND NOT BoxInLift THEN
            doConvLift := TRUE;   // Activate the lift conveyor
        END_IF;
        IF diBoxLift THEN
            doConvLift := FALSE;  // Stop lift conveyor when crate is in lift
            BoxInLift := TRUE;
            doLiftUnload := TRUE;  // Move the lift to unloading position
        END_IF;
        IF diLiftUnload AND BoxInLift THEN
            doConvLift := TRUE;   // Activate lift conveyor to unload crate
        END_IF;
        IF NOT diBoxLift AND diLiftUnload THEN
            doConvLift := FALSE;  // Stop lift conveyor when crate is unloaded
            doLiftUnload := FALSE;  // Reset unloading position
            doConvTop := TRUE;  // Resume the conveyor
            doConvBottom := TRUE;
            doLiftTop := FALSE;  // Reset lift position
            doLiftBottom := FALSE;
            LiftRequested := FALSE;
            BoxInLift := FALSE;
        END_IF;
END_CASE

END_PROGRAM
