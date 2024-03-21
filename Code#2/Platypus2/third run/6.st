// 229.21268105506897s
// 2
PROGRAM PLC;

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

(*-- main program*)
BEGIN
    (*-- initialization of the digital outputs*)
    doConvTop := FALSE;
    doConvBottom := FALSE;
    doConvLift := FALSE;
    doLiftTop := FALSE;
    doLiftBottom := FALSE;
    doLiftUnload := FALSE;

    (*-- initialization of the digital inputs*)
    diConvTop := FALSE;
    diConvBottom := FALSE;
    diLiftTop := FALSE;
    diLiftBottom := FALSE;
    diLiftUnload := FALSE;
    diBoxLift := FALSE;

    (*-- initialization of the status variables*)
    selectLift := 0;
    ConvTopOn := FALSE;
    ConvBottomOn := FALSE;

    (*-- main program loop*)
    WHILE TRUE DO
        (*-- check if a crate is requested*)
        IF diConvTop = TRUE OR diConvBottom = TRUE THEN
            selectLift := TOP_POSITION;