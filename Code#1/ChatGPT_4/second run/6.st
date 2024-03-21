//49.85s
// 4
PROGRAM CraneLift
VAR
    // Conveyor belts
    doConvTop: BOOL;    // Actuator for the top conveyor belt
    doConvBottom: BOOL; // Actuator for the bottom conveyor belt
    doConvLift: BOOL;   // Actuator for the lift conveyor belt
    // Light barriers
    diConvTop: BOOL;    // Sensor for the top conveyor belt
    diConvBottom: BOOL; // Sensor for the bottom conveyor belt
    // Lift positions
    doLiftTop: BOOL;    // Move lift to the top position
    doLiftBottom: BOOL; // Move lift to the bottom position
    doLiftUnload: BOOL; // Move lift to the unloading position
    // Lift position sensors
    diLiftTop: BOOL;    // Sensor for the lift at the top position
    diLiftBottom: BOOL; // Sensor for the lift at the bottom position
    diLiftUnload: BOOL; // Sensor for the lift at the unloading position
    // Box sensors
    diBoxLift: BOOL;    // Sensor for the box at the lift
    // Control flags
    bRequestTop: BOOL;    // Flag indicating a request for the top position
    bRequestBottom: BOOL; // Flag indicating a request for the bottom position
    bUnloadProcess: BOOL; // Flag indicating the lift is in the unloading process
END_VAR

// Logic for detecting crates and requesting lift
IF diConvTop THEN
    doConvTop := FALSE; // Stop the top conveyor belt
    bRequestTop := TRUE; // Set the request flag for top position
END_IF

IF diConvBottom THEN
    doConvBottom := FALSE; // Stop the bottom conveyor belt
    bRequestBottom := TRUE; // Set the request flag for bottom position
END_IF

// Logic for moving lift to requested position
IF bRequestTop AND NOT bRequestBottom AND NOT diLiftTop THEN
    doLiftTop := TRUE; // Request lift to move to top position
    doLiftBottom := FALSE; // Ensure lift is not moving to bottom
    doLiftUnload := FALSE; // Ensure lift is not moving to unload
ELSIF bRequestBottom AND NOT bRequestTop AND NOT diLiftBottom THEN
    doLiftBottom := TRUE; // Request lift to move to bottom position
    doLiftTop := FALSE; // Ensure lift is not moving to top
    doLiftUnload := FALSE; // Ensure lift is not moving to unload
END_IF

// Logic for operating lift conveyor belt
IF (diLiftTop AND bRequestTop) OR (diLiftBottom AND bRequestBottom) THEN
    doConvLift := TRUE; // Turn on the lift conveyor belt
    // Reset request flags as the lift is now servicing the request
    bRequestTop := FALSE;
    bRequestBottom := FALSE;
    bUnloadProcess := TRUE; // Start the unloading process
ELSE
    doConvLift := FALSE; // Turn off the lift conveyor belt
END_IF

// Logic for box on lift conveyor belt
IF diBoxLift AND bUnloadProcess THEN
    // Box is completely at the lift, move to unloading position
    doLiftUnload := TRUE;
    // Turn off lift conveyor belt as box is now moving to unload
    doConvLift := FALSE;
END_IF

// Logic for unloading box
IF diLiftUnload AND bUnloadProcess THEN
    // Box has reached unloading position, conveyor belt unloads the box
    doConvLift := TRUE;
    // Once the box has left the lift, it is free for the next request
    IF NOT diBoxLift THEN
        bUnloadProcess := FALSE;
        doLiftUnload := FALSE;
    END_IF
END_IF

END_PROGRAM
