//13.09s
// 2 nicht alle Variablen deklariert
PROGRAM CraneLift
VAR
  doConvTop: BOOL;
  doConvBottom: BOOL;
  diConvTop: BOOL;
  diConvBottom: BOOL;
  doLiftTop: BOOL;
  doLiftBottom: BOOL;
  diLiftTop: BOOL;
  diLiftBottom: BOOL;
  doConvLift: BOOL;
  doLiftUnload: BOOL;
  diLiftUnload: BOOL;

(* Stop the top conveyor belt when the light barrier is activated *)
IF diConvTop THEN
  doConvTop := FALSE;
END_IF;

(* Stop the bottom conveyor belt when the light barrier is activated *)
IF diConvBottom THEN
  doConvBottom := FALSE;
END_IF;

(* Request the lift for the top conveyor belt *)
IF diConvTop AND NOT doLiftTop THEN
  doLiftTop := TRUE;
END_IF;

(* Request the lift for the bottom conveyor belt *)
IF diConvBottom AND NOT doLiftBottom THEN
  doLiftBottom := TRUE;
END_IF;

(* Move the lift to the top position if it has been requested *)
IF doLiftTop THEN
  doLiftTop := TRUE;
  doLiftUnload := FALSE;
END_IF;

(* Move the lift to the bottom position if it has been requested *)
IF doLiftBottom THEN
  doLiftTop := FALSE;
  doLiftUnload := FALSE;
END_IF;

(* Switch on the lift conveyor belt if the lift is in the requested position *)
IF doLiftTop AND diLiftTop THEN
  doConvLift := TRUE;
END_IF;

(* Switch on the lift conveyor belt if the lift is in the requested position *)
IF doLiftBottom AND diLiftBottom THEN
  doConvLift := TRUE;
END_IF;

(* Turn off the lift conveyor belt if the box is completely at the lift *)
IF diBoxLift THEN
  doConvLift := FALSE;
END_IF;

(* Move the lift to the unloading position *)
IF doConvLift AND NOT diBoxLift THEN
  doLiftUnload := TRUE;
END_IF;

(* Unload the box onto the unloading conveyor *)
IF doLiftUnload AND diLiftUnload THEN
  doConvUnload := TRUE;
END_IF;

(* Free the lift for the next request *)
IF doConvUnload AND NOT diBoxLift THEN
  doLiftTop := FALSE;
  doLiftBottom := FALSE;
  doLiftUnload := FALSE;
END_IF;

END_PROGRAM
