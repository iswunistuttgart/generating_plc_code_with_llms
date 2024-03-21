VAR CONSTANT
    WAIT : UINT:= 0;
    TOP_POSITION : UINT:= 1;
    BOTTOM_POSITION : UINT:= 2;
    GETBOX : UINT:= 3;
    UNLOAD_POSITION : UINT:= 4;
    UNLOAD_BOX : UINT:= 5;
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

doConvTop := NOT diConvTop OR ConvTopOn;
doConvBottom := NOT diConvBottom OR ConvBottomOn;
CASE selectLift OF
    (*-- wait for request*)
    WAIT:
        IF (diConvTop = TRUE) THEN
            selectLift := TOP_POSITION;
        ELSIF (diConvBottom = TRUE) THEN
            selectLift := BOTTOM_POSITION;
        END_IF
    (*-- move lift to top position*)
    TOP_POSITION:
        doLiftTop := TRUE;
        IF (diLiftTop = TRUE) THEN
            doLiftTop := FALSE;
            ConvTopOn := TRUE;
            selectLift := GETBOX;
        END_IF
    (*-- move lift to bottom position*)
    BOTTOM_POSITION:
        doLiftBottom := TRUE;
        IF (diLiftBottom = TRUE) THEN
            doLiftBottom := FALSE;
            ConvBottomOn := TRUE;
            selectLift := GETBOX;
        END_IF
    (*-- move box to lift*)
    GETBOX:
        doConvLift := TRUE;
        IF (diBoxLift = TRUE) THEN
            doConvLift := FALSE;
            ConvTopOn := FALSE;
            ConvBottomOn := FALSE;
            selectLift := UNLOAD_POSITION;
        END_IF
    (*-- move lift to unload position*)
    UNLOAD_POSITION:
        doLiftUnload := TRUE;
        IF (diLiftUnload = TRUE) THEN
            doLiftUnload := FALSE;
            selectLift := UNLOAD_BOX;
        END_IF
    (*-- unload the box*)
    UNLOAD_BOX:
        doConvLift := TRUE;
        IF (diBoxLift = FALSE) THEN
            doConvLift := FALSE;
            selectLift := WAIT;
        END_IF
END_CASE
