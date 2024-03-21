// 56.3s
// 4
PROGRAM CraneLiftControl
VAR CONSTANT
    WAIT : UINT:= 0;
    TOP_POSITION : UINT:= 1;
    BOTTOM_POSITION : UINT:= 2;
    GETBOX : UINT:= 3;
    UNLOAD_POSITION : UINT:= 4;
    UNLOAD_BOX : UINT:= 5;
END_VAR

VAR
    (*-- digital outputs --*)
    doConvTop: BOOL;
    doConvBottom: BOOL;
    doConvLift: BOOL;
    doLiftTop: BOOL;
    doLiftBottom: BOOL;
    doLiftUnload: BOOL;
    (*-- digital inputs --*)
    diConvTop: BOOL;
    diConvBottom: BOOL;
    diLiftTop: BOOL;
    diLiftBottom: BOOL;
    diLiftUnload: BOOL;
    diBoxLift: BOOL;
    (*-- status variables --*)
    selectLift: UINT;
    ConvTopOn: BOOL;
    ConvBottomOn: BOOL;
END_VAR

// Initial states
doConvTop := TRUE;
doConvBottom := TRUE;
doConvLift := FALSE;
doLiftTop := FALSE;
doLiftBottom := FALSE;
doLiftUnload := FALSE;

// Light barrier logic
IF diConvTop THEN
    doConvTop := FALSE;
    selectLift := TOP_POSITION;
ELSIF diConvBottom THEN
    doConvBottom := FALSE;
    selectLift := BOTTOM_POSITION;
END_IF

// Lift logic
CASE selectLift OF
    TOP_POSITION:
        IF diLiftTop THEN
            doConvLift := TRUE;
            IF diBoxLift THEN
                selectLift := UNLOAD_POSITION;
            END_IF
        ELSE
            doLiftTop := TRUE;
            doLiftBottom := FALSE;
        END_IF
    BOTTOM_POSITION:
        IF diLiftBottom THEN
            doConvLift := TRUE;
            IF diBoxLift THEN
                selectLift := UNLOAD_POSITION;
            END_IF
        ELSE
            doLiftBottom := TRUE;
            doLiftTop := FALSE;
        END_IF
    UNLOAD_POSITION:
        doConvLift := FALSE;
        doLiftUnload := TRUE;
        IF diLiftUnload THEN
            selectLift := UNLOAD_BOX;
        END_IF
    UNLOAD_BOX:
        IF NOT diBoxLift THEN
            doLiftUnload := FALSE;
            selectLift := WAIT;
            doConvTop := TRUE;
            doConvBottom := TRUE;
        END_IF
    WAIT:
        // Waiting for the next crate
        doLiftTop := FALSE;
        doLiftBottom := FALSE;
        doLiftUnload := FALSE;
END_CASE
