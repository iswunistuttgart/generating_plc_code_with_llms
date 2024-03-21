// 12.6s
// 4
VAR CONSTANT
    WAIT : UINT:= 0;
    TOP_POSITION : UINT:= 1;
    BOTTOM_POSITION : UINT:= 2;
    GETBOX : UINT:= 3;
    UNLOAD_POSITION : UINT:= 4;
    UNLOAD_BOX : UINT:= 5;
END_VAR

VAR
    doConvTop: BOOL;
    doConvBottom: BOOL;
    doConvLift: BOOL;
    doLiftTop: BOOL;
    doLiftBottom: BOOL;
    doLiftUnload: BOOL;
    diConvTop: BOOL;
    diConvBottom: BOOL;
    diLiftTop: BOOL;
    diLiftBottom: BOOL;
    diLiftUnload: BOOL;
    diBoxLift: BOOL;
    selectLift: UINT;
    ConvTopOn: BOOL;
    ConvBottomOn: BOOL;
END_VAR

CASE selectLift OF
    WAIT:
        // Check if either light barrier is activated
        IF diConvTop THEN
            doConvTop := FALSE;
            ConvTopOn := FALSE;
            selectLift := TOP_POSITION;
        ELSIF diConvBottom THEN
            doConvBottom := FALSE;
            ConvBottomOn := FALSE;
            selectLift := BOTTOM_POSITION;
        END_IF;
        // Reset lift control signals
        doLiftTop := FALSE;
        doLiftBottom := FALSE;
        doLiftUnload := FALSE;
    TOP_POSITION:
        // Move lift to top position
        doLiftTop := TRUE;
        IF diLiftTop THEN
            doLiftTop := FALSE;
            selectLift := GETBOX;
        END_IF;
    BOTTOM_POSITION:
        // Move lift to bottom position
        doLiftBottom := TRUE;
        IF diLiftBottom THEN
            doLiftBottom := FALSE;
            selectLift := GETBOX;
        END_IF;
    GETBOX:
        // Activate lift conveyor until crate is at lift
        doConvLift := TRUE;
        IF diBoxLift THEN
            doConvLift := FALSE;
            selectLift := UNLOAD_POSITION;
        END_IF;
    UNLOAD_POSITION:
        // Move lift to unload position
        doLiftUnload := TRUE;
        IF diLiftUnload THEN
            doLiftUnload := FALSE;
            selectLift := UNLOAD_BOX;
        END_IF;
    UNLOAD_BOX:
        // Unload box onto the unloading conveyor
        // Once the box has left the lift, it's ready for the next request
        IF NOT diBoxLift THEN
            selectLift := WAIT;
        END_IF;
END_CASE;
