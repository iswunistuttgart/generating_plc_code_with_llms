// 119.65785598754883s
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
    IF (diLiftTop) THEN
        doLiftTop := TRUE;
    END_IF;
    IF (diLiftBottom) THEN
        doLiftBottom := TRUE;
    END_IF;
    IF (diBoxLift) THEN
        doConvLift := TRUE;
    END_IF;
    IF (doConvTop AND ConvTopOn) THEN
        selectLift := TOP_POSITION;
    ELSIF (doConvBottom AND ConvBottomOn) THEN
        selectLift := BOTTOM_POSITION;
    ELSE
        selectLift := GETBOX;
    END_IF;
    IF (selectLift = GET