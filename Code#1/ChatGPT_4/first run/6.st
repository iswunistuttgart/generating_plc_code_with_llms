//80.85s
//2
PROGRAM CraneLift
VAR
    doConvTop : BOOL; (* Output: Drives the top conveyor belt *)
    doConvBottom : BOOL; (* Output: Drives the bottom conveyor belt *)
    doConvLift : BOOL; (* Output: Drives the lift's conveyor belt *)
    doLiftTop : BOOL; (* Output: Moves the lift to the top position *)
    doLiftBottom : BOOL; (* Output: Moves the lift to the bottom position *)
    doLiftUnload : BOOL; (* Output: Moves the lift to the unloading position *)
    diConvTop : BOOL; (* Input: Light barrier for the top conveyor belt *)
    diConvBottom : BOOL; (* Input: Light barrier for the bottom conveyor belt *)
    diLiftTop : BOOL; (* Input: Sensor indicating the lift is at the top position *)
    diLiftBottom : BOOL; (* Input: Sensor indicating the lift is at the bottom position *)
    diLiftUnload : BOOL; (* Input: Sensor indicating the lift is at the unloading position *)
    diBoxLift : BOOL; (* Input: Sensor indicating the box is completely at the lift *)
    LiftRequested : BOOL; (* Internal: Indicates if the lift has been requested *)
    LiftPosition : STRING := ''; (* Internal: Indicates the requested position of the lift *)
END_VAR

(* Check light barriers and request lift *)
IF diConvTop THEN
    doConvTop := FALSE; (* Stop top conveyor belt *)
    LiftRequested := TRUE;
    LiftPosition := 'Top';
ELSIF diConvBottom THEN
    doConvBottom := FALSE; (* Stop bottom conveyor belt *)
    LiftRequested := TRUE;
    LiftPosition := 'Bottom';
END_IF

(* Move lift to requested position if not already there *)
IF LiftRequested THEN
    CASE LiftPosition OF
        'Top':
            IF NOT diLiftTop THEN
                doLiftTop := TRUE; (* Move lift to top *)
                doLiftBottom := FALSE;
                doLiftUnload := FALSE;
            END_IF
        'Bottom':
            IF NOT diLiftBottom THEN
                doLiftBottom := TRUE; (* Move lift to bottom *)
                doLiftTop := FALSE;
                doLiftUnload := FALSE;
            END_IF
    END_CASE
END_IF

(* When lift is in position and the box is completely at the lift, move to unloading *)
IF (LiftPosition = 'Top' AND diLiftTop) OR (LiftPosition = 'Bottom' AND diLiftBottom) THEN
    IF diBoxLift THEN
        doConvLift := TRUE; (* Turn on lift conveyor belt *)
        IF diLiftUnload THEN
            (* When crate is at unloading position, unload the crate *)
            doLiftUnload := TRUE;
            doConvTop := FALSE;
            doConvBottom := FALSE;
            doConvLift := FALSE;
            LiftRequested := FALSE; (* Reset lift request *)
        END_IF
    END_IF
END_IF

END_PROGRAM
