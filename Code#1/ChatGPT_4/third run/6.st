//49.52s
// 3
PROGRAM CraneLiftController
VAR
    // Inputs
    diConvTop : BOOL; // Top conveyor light barrier
    diConvBottom : BOOL; // Bottom conveyor light barrier
    diLiftTop : BOOL; // Lift at top position
    diLiftBottom : BOOL; // Lift at bottom position
    diLiftUnload : BOOL; // Lift at unloading position
    diBoxLift : BOOL; // Crate fully at the lift
    
    // Outputs
    doConvTop : BOOL; // Top conveyor belt control
    doConvBottom : BOOL; // Bottom conveyor belt control
    doConvLift : BOOL; // Lift conveyor belt control
    doLiftTop : BOOL; // Control to move lift to top
    doLiftBottom : BOOL; // Control to move lift to bottom
    doLiftUnload : BOOL; // Control to move lift to unload

    // Internal variables
    bTopRequested : BOOL; // Flag indicating top request
    bBottomRequested : BOOL; // Flag indicating bottom request
    bLiftMoving : BOOL; // Flag indicating lift is moving
    bUnloadProcess : BOOL; // Flag indicating unloading process
END_VAR

// Initial conveyor belt control - always on until light barriers are triggered
doConvTop := NOT diConvTop;
doConvBottom := NOT diConvBottom;

// Detect crate at top and request lift
IF diConvTop AND NOT bLiftMoving THEN
    bTopRequested := TRUE;
    bLiftMoving := TRUE;
    doConvTop := FALSE; // Stop top conveyor belt
END_IF

// Detect crate at bottom and request lift
IF diConvBottom AND NOT bLiftMoving THEN
    bBottomRequested := TRUE;
    bLiftMoving := TRUE;
    doConvBottom := FALSE; // Stop bottom conveyor belt
END_IF

// Lift movement logic
IF bLiftMoving THEN
    IF bTopRequested THEN
        doLiftTop := TRUE;
        doLiftBottom := FALSE;
        doLiftUnload := FALSE;
        IF diLiftTop THEN // When lift reaches top
            doConvLift := NOT diBoxLift; // Turn on lift conveyor until box is fully on
            IF diBoxLift THEN // Box is fully at lift
                bTopRequested := FALSE;
                bLiftMoving := FALSE;
                doLiftUnload := TRUE; // Move to unloading position
                bUnloadProcess := TRUE;
            END_IF
        END_IF
    ELSIF bBottomRequested THEN
        doLiftTop := FALSE;
        doLiftBottom := TRUE;
        doLiftUnload := FALSE;
        IF diLiftBottom THEN // When lift reaches bottom
            doConvLift := NOT diBoxLift; // Turn on lift conveyor until box is fully on
            IF diBoxLift THEN // Box is fully at lift
                bBottomRequested := FALSE;
                bLiftMoving := FALSE;
                doLiftUnload := TRUE; // Move to unloading position
                bUnloadProcess := TRUE;
            END_IF
        END_IF
    END_IF
END_IF

// Unloading process
IF bUnloadProcess AND diLiftUnload THEN
    doConvLift := TRUE; // Turn on lift conveyor to unload
    IF NOT diBoxLift THEN // Box has left the lift
        bUnloadProcess := FALSE;
        doLiftTop := FALSE; // Reset lift movement controls
        doLiftBottom := FALSE;
        doLiftUnload := FALSE;
        doConvLift := FALSE; // Stop lift conveyor
    END_IF
END_IF

END_PROGRAM
