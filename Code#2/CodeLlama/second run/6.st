// 118.81949257850647s
// 2
```
PROGRAM CraneLift
VAR
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

PROGRAM
    IF (diConvTop) THEN
        doConvTop := TRUE;
        ConvTopOn := TRUE;
    END_IF;
    IF (diConvBottom) THEN
        doConvBottom := TRUE;
        ConvBottomOn := TRUE;
    END_IF;
    IF (doConvTop AND NOT diLiftTop) THEN
        selectLift := TOP_POSITION;
    ELSIF (doConvBottom AND NOT diLiftBottom) THEN
        selectLift := BOTTOM_POSITION;
    END_IF;
    IF (selectLift = GETBOX) THEN
        doConvLift := TRUE;
        WHILE (diBoxLift) DO
            WAIT FOR 100ms;
        END_WHILE;
        selectLift := UNLOAD_POSITION;
    ELSIF (selectLift = UNLOAD_POSITION AND diLiftUnload) THEN
        doConvL