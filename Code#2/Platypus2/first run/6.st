// 225.8638265132904s
// 2
PROGRAM crane_lift
    VAR
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

    (*-- digital outputs*)
    doConvTop := FALSE;
    doConvBottom := FALSE;
    doConvLift := FALSE;
    doLiftTop := FALSE;
    doLiftBottom := FALSE;
    doLiftUnload := FALSE;
    (*-- digital inputs*)
    diConvTop := FALSE;
    diConvBottom := FALSE;
    diLiftTop := FALSE;
    diLiftBottom := FALSE;
    diLiftUnload := FALSE;
    diBoxLift := FALSE;
    (*-- status variables*)
    selectLift := 0;
    ConvTopOn := FALSE;
    ConvBottomOn := FALSE;

    WHILE TRUE DO
        WAIT := WAIT + 1;
        IF (WAIT > 25) THEN
            (*-- digital outputs*)
            doConvTop := NOT doConvTop;
            doConvBottom := NOT doConvBottom;
            doL