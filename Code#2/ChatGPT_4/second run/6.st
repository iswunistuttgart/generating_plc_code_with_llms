// 47.53s
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
    (* digital outputs *)
    doConvTop : BOOL;
    doConvBottom : BOOL;
    doConvLift : BOOL;
    doLiftTop : BOOL;
    doLiftBottom : BOOL;
    doLiftUnload : BOOL;
    (* digital inputs *)
    diConvTop : BOOL;
    diConvBottom : BOOL;
    diLiftTop : BOOL;
    diLiftBottom : BOOL;
    diLiftUnload : BOOL;
    diBoxLift : BOOL;
    (* status variables *)
    selectLift : UINT;
    ConvTopOn : BOOL;
    ConvBottomOn : BOOL;
END_VAR

(* Handle the conveyor belts *)
IF diConvTop THEN
    doConvTop := FALSE;
    selectLift := TOP_POSITION;
END_IF;

IF diConvBottom THEN
    doConvBottom := FALSE;
    selectLift := BOTTOM_POSITION;
END_IF;

(* Control the lift *)
CASE selectLift OF
    TOP_POSITION:
        IF NOT diLiftTop THEN
            doLiftTop := TRUE;
            doLiftBottom := FALSE;
            doLiftUnload := FALSE;
        ELSIF diLiftTop THEN
            doConvLift := TRUE;
            IF diBoxLift THEN
                selectLift := UNLOAD_POSITION;
            END_IF;
        END_IF;
    
    BOTTOM_POSITION:
        IF NOT diLiftBottom THEN
            doLiftBottom := TRUE;
            doLiftTop := FALSE;
            doLiftUnload := FALSE;
        ELSIF diLiftBottom THEN
            doConvLift := TRUE;
            IF diBoxLift THEN
                selectLift := UNLOAD_POSITION;
            END_IF;
        END_IF;

    UNLOAD_POSITION:
        doConvLift := FALSE;
        doLiftUnload := TRUE;
        IF diLiftUnload THEN
            selectLift := UNLOAD_BOX;
        END_IF;

    UNLOAD_BOX:
        doLiftUnload := FALSE;
        IF NOT diBoxLift THEN
            selectLift := WAIT;
        END_IF;

    WAIT:
        doLiftTop := FALSE;
        doLiftBottom := FALSE;
        doLiftUnload := FALSE;
END_CASE;
