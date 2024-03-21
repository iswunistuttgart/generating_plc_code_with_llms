//23.35s
// 2 nicht alle Variablen deklariert
(* Program to control a crane lift *)

VAR
  diConvTop: BOOL; (* Light barrier top conveyor belt *)
  diConvBottom: BOOL; (* Light barrier bottom conveyor belt *)
  doConvTop: BOOL; (* Conveyor belt top *)
  doConvBottom: BOOL; (* Conveyor belt bottom *)
  doLiftTop: BOOL; (* Lift top *)
  doLiftBottom: BOOL; (* Lift bottom *)
  doConvLift: BOOL; (* Lift conveyor belt *)
  diLiftTop: BOOL; (* Lift position top *)
  diLiftBottom: BOOL; (* Lift position bottom *)
  diLiftUnload: BOOL; (* Lift position unload *)
  liftRequested: BOOL; (* Lift requested flag *)

(* Main program *)
PROGRAM Main
BEGIN
  IF diConvTop THEN
    doConvTop := FALSE; (* Stop top conveyor belt when light barrier is activated *)
    IF NOT liftRequested THEN
      doLiftTop := TRUE; (* Move lift to top position if not already requested *)
      liftRequested := TRUE; (* Mark lift as requested *)
    END_IF;
  END_IF;

  IF diConvBottom THEN
    doConvBottom := FALSE; (* Stop bottom conveyor belt when light barrier is activated *)
    IF NOT liftRequested THEN
      doLiftBottom := TRUE; (* Move lift to bottom position if not already requested *)
      liftRequested := TRUE; (* Mark lift as requested *)
    END_IF;
  END_IF;

  IF diLiftTop AND liftRequested THEN
    doConvLift := TRUE; (* Start lift conveyor belt when lift is in position and requested *)
  END_IF;

  IF diBoxLift THEN
    doConvLift := FALSE; (* Stop lift conveyor belt when box reaches lift *)
  END_IF;

  IF diLiftUnload THEN
    doLiftUnload := TRUE; (* Move lift to unload position when it reaches the position *)
  END_IF;

  IF diLiftUnload AND NOT diBoxLift THEN
    liftRequested := FALSE; (* Reset lift requested flag when box leaves lift *)
  END_IF;
END_PROGRAM