// 11.59s
// 4
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
    doConvTop : BOOL;
    doConvBottom : BOOL;
    doConvLift : BOOL;
    doLiftTop : BOOL;
    doLiftBottom : BOOL;
    doLiftUnload : BOOL;
    (*-- digital inputs*)
    diConvTop : BOOL;
    diConvBottom : BOOL;
    diLiftTop : BOOL;
    diLiftBottom : BOOL;
    diLiftUnload : BOOL;
    diBoxLift : BOOL;
    (*-- status variables*)
    selectLift : UINT;
    ConvTopOn : BOOL;
    ConvBottomOn : BOOL;
END_VAR

CASE selectLift OF
    WAIT :
        ConvTopOn := FALSE;
        ConvBottomOn := FALSE;
        IF diConvTop THEN
            selectLift := TOP_POSITION;
        ELSIF diConvBottom THEN
            selectLift := BOTTOM_POSITION;
        END_IF;
    TOP_POSITION :
        doLiftTop := TRUE;
        doLiftBottom := FALSE;
        IF diLiftTop THEN
            selectLift := GETBOX;
        END_IF;
    BOTTOM_POSITION :
        doLiftTop := FALSE;
        doLiftBottom := TRUE;
        IF diLiftBottom THEN
            selectLift := GETBOX;
        END_IF;
    GETBOX :
        doConvLift := TRUE;
        IF diBoxLift THEN
            doConvLift := FALSE;
            selectLift := UNLOAD_POSITION;
        END_IF;
    UNLOAD_POSITION :
        doLiftUnload := TRUE;
        IF diLiftUnload THEN
            selectLift := UNLOAD_BOX;
        END_IF;
    UNLOAD_BOX :
        doLiftUnload := FALSE;
        selectLift := WAIT;
END_CASE;

(* Stop conveyor belts if requested by light barrier *)
doConvTop := NOT diConvTop AND NOT ConvTopOn;
doConvBottom := NOT diConvBottom AND NOT ConvBottomOn;
