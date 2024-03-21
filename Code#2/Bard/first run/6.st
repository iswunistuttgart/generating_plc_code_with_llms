// 9.91s
// 2
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
    doConvTop: BOOL := FALSE;
    doConvBottom: BOOL := FALSE;
    doConvLift: BOOL := FALSE;
    doLiftTop: BOOL := FALSE;
    doLiftBottom: BOOL := FALSE;
    doLiftUnload: BOOL := FALSE;
    (*-- digital inputs*)
    diConvTop: BOOL := FALSE;
    diConvBottom: BOOL := FALSE;
    diLiftTop: BOOL := FALSE;
    diLiftBottom: BOOL := FALSE;
    diLiftUnload: BOOL := FALSE;
    diBoxLift: BOOL := FALSE;
    (*-- status variables*)
    selectLift: UINT := 0;
    ConvTopOn: BOOL := FALSE;
    ConvBottomOn: BOOL := FALSE;
END_VAR

START

    IF diConvTop THEN
        ConvTopOn := TRUE;
        doConvTop := FALSE;
        selectLift := TOP_POSITION;
    END_IF;

    IF diConvBottom THEN
        ConvBottomOn := TRUE;
        doConvBottom := FALSE;
        selectLift := BOTTOM_POSITION;
    END_IF;

    CASE selectLift
        WHEN TOP_POSITION OR BOTTOM_POSITION THEN
            IF diLiftTop AND ConvTopOn THEN
                doLiftTop := TRUE;
                selectLift := GETBOX;
            ELSIF diLiftBottom AND ConvBottomOn THEN
                doLiftBottom := TRUE;
                selectLift := GETBOX;
            END_IF;
        WHEN GETBOX THEN
            IF diBoxLift THEN
                doConvLift := TRUE;
            END_IF;
        WHEN UNLOAD_POSITION THEN
            IF diLiftUnload THEN
                doLiftUnload := TRUE;
                selectLift := UNLOAD_BOX;
            END_IF;
        WHEN UNLOAD_BOX THEN
            IF diConvTop OR diConvBottom THEN
                selectLift := WAIT;
            END_IF;
    END_CASE;

END_START