// 45.5s
// 2
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
    selectLift: UINT := WAIT;
    ConvTopOn: BOOL;
    ConvBottomOn: BOOL;
END_VAR

// Control Logic
CASE selectLift OF
    WAIT:
    BEGIN
        IF diConvTop THEN
            doConvTop := FALSE;
            selectLift := TOP_POSITION;
        ELSIF diConvBottom THEN
            doConvBottom := FALSE;
            selectLift := BOTTOM_POSITION;
        END_IF;
    END

    TOP_POSITION:
    BEGIN
        doLiftTop := TRUE;
        doLiftBottom := FALSE;
        IF diLiftTop THEN
            doConvLift := TRUE;
            selectLift := GETBOX;
        END_IF;
    END

    BOTTOM_POSITION:
    BEGIN
        doLiftBottom := TRUE;
        doLiftTop := FALSE;
        IF diLiftBottom THEN
            doConvLift := TRUE;
            selectLift := GETBOX;
        END_IF;
    END

    GETBOX:
    BEGIN
        IF diBoxLift THEN
            doConvLift := FALSE;
            selectLift := UNLOAD_POSITION;
        END_IF;
    END

    UNLOAD_POSITION:
    BEGIN
        doLiftUnload := TRUE;
        IF diLiftUnload THEN
            selectLift := UNLOAD_BOX;
        END_IF;
    END

    UNLOAD_BOX:
    BEGIN
        // Assuming there's an output to control unloading conveyor (not specified in VAR)
        // doUnloadingConveyor := TRUE;
        // Reset lift position and unload flag after the box has left
        IF NOT diBoxLift THEN
            doLiftUnload := FALSE;
            selectLift := WAIT;
        END_IF;
    END
END_CASE;
