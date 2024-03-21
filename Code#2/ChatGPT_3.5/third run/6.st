// 13.35s
// 3
VAR CONSTANT
    WAIT : UINT := 0;
    TOP_POSITION : UINT := 1;
    BOTTOM_POSITION : UINT := 2;
    GETBOX : UINT := 3;
    UNLOAD_POSITION : UINT := 4;
    UNLOAD_BOX : UINT := 5;
END_VAR

VAR
    (*-- digital outputs*)
    doConvTop: BOOL;
    doConvBottom: BOOL;
    doConvLift: BOOL;
    doLiftTop: BOOL;
    doLiftBottom: BOOL;
    doLiftUnload: BOOL;
    (*-- digital inputs*)
    diConvTop: BOOL;
    diConvBottom: BOOL;
    diLiftTop: BOOL;
    diLiftBottom: BOOL;
    diLiftUnload: BOOL;
    diBoxLift: BOOL;
    (*-- status variables*)
    selectLift: UINT;
    ConvTopOn: BOOL;
    ConvBottomOn: BOOL;
END_VAR

CASE selectLift OF
    WAIT:
        // Wait for a conveyor belt to be activated
        IF diConvTop THEN
            doConvTop := FALSE; // Stop conveyor belt
            ConvTopOn := FALSE;
            selectLift := TOP_POSITION;
        ELSIF diConvBottom THEN
            doConvBottom := FALSE; // Stop conveyor belt
            ConvBottomOn := FALSE;
            selectLift := BOTTOM_POSITION;
        END_IF

    TOP_POSITION:
        // Move lift to top position
        IF NOT ConvTopOn THEN
            doLiftTop := TRUE;
            doLiftBottom := FALSE;
            ConvTopOn := TRUE;
        END_IF

        // Check if the lift is in the requested position
        IF diLiftTop THEN
            selectLift := GETBOX;
        END_IF

    BOTTOM_POSITION:
        // Move lift to bottom position
        IF NOT ConvBottomOn THEN
            doLiftTop := FALSE;
            doLiftBottom := TRUE;
            ConvBottomOn := TRUE;
        END_IF

        // Check if the lift is in the requested position
        IF diLiftBottom THEN
            selectLift := GETBOX;
        END_IF

    GETBOX:
        // Move the box onto the lift conveyor
        doConvLift := TRUE;

        // Check if the box is completely at the lift
        IF diBoxLift THEN
            doConvLift := FALSE; // Stop lift conveyor
            selectLift := UNLOAD_POSITION;
        END_IF

    UNLOAD_POSITION:
        // Move lift to unload position
        doLiftUnload := TRUE;

        // Check if the lift is in the unload position
        IF diLiftUnload THEN
            selectLift := UNLOAD_BOX;
        END_IF

    UNLOAD_BOX:
        // Move the box onto the unloading conveyor
        doConvLift := TRUE;

        // Check if the box has left the lift
        IF NOT diBoxLift THEN
            doConvLift := FALSE; // Stop lift conveyor
            selectLift := WAIT; // Reset for the next request
        END_IF
END_CASE
