//13.18
//3
PROGRAM CraneLift
VAR
    doConvTop: BOOL := FALSE;  // Conveyor belt control for top conveyor
    doConvBottom: BOOL := FALSE;  // Conveyor belt control for bottom conveyor
    diConvTop: BOOL := FALSE;  // Light barrier for top conveyor
    diConvBottom: BOOL := FALSE;  // Light barrier for bottom conveyor
    doLiftTop: BOOL := FALSE;  // Lift control for the top position
    doLiftBottom: BOOL := FALSE;  // Lift control for the bottom position
    diLiftTop: BOOL := FALSE;  // Lift position sensor for the top position
    diLiftBottom: BOOL := FALSE;  // Lift position sensor for the bottom position
    doConvLift: BOOL := FALSE;  // Lift conveyor belt control
    diBoxLift: BOOL := FALSE;  // Crate sensor on the lift conveyor
    doLiftUnload: BOOL := FALSE;  // Lift control for unloading position
    diLiftUnload: BOOL := FALSE;  // Lift position sensor for unloading position
END_VAR

BEGIN
    // If the light barrier for the top conveyor is activated, stop the top conveyor
    IF diConvTop THEN
        doConvTop := FALSE;
    END_IF

    // If the light barrier for the bottom conveyor is activated, stop the bottom conveyor
    IF diConvBottom THEN
        doConvBottom := FALSE;
    END_IF

    // Request the lift to the top position if not already requested
    IF diConvTop AND NOT diLiftTop THEN
        doLiftTop := TRUE;
    END_IF

    // Request the lift to the bottom position if not already requested
    IF diConvBottom AND NOT diLiftBottom THEN
        doLiftBottom := TRUE;
    END_IF

    // If the lift has reached the requested top position, start the lift conveyor belt
    IF diLiftTop AND NOT diBoxLift THEN
        doConvLift := TRUE;
    END_IF

    // If the crate is detected on the lift conveyor, stop the lift conveyor belt
    IF diBoxLift THEN
        doConvLift := FALSE;
    END_IF

    // Request the lift to the unloading position if not already requested
    IF diBoxLift AND NOT diLiftUnload THEN
        doLiftUnload := TRUE;
    END_IF

    // If the lift has reached the unloading position, start unloading the crate onto the unloading conveyor
    IF diLiftUnload THEN
        doLiftUnload := FALSE;
        // Perform actions to unload the crate onto the unloading conveyor
    END_IF
END_PROGRAM
