//12.33s
// 2 nicht alle Variablen deklariert
PROGRAM CraneLift

VAR
  diConvTop: BOOL; // Light barrier for top conveyor belt
  diConvBottom: BOOL; // Light barrier for bottom conveyor belt
  doConvTop: BOOL; // Control signal for top conveyor belt
  doConvBottom: BOOL; // Control signal for bottom conveyor belt
  doLiftTop: BOOL; // Control signal for lift to top position
  doLiftBottom: BOOL; // Control signal for lift to bottom position
  doLiftUnload: BOOL; // Control signal for lift to unload position
  diLiftTop: BOOL; // Sensor indicating lift is in top position
  diLiftBottom: BOOL; // Sensor indicating lift is in bottom position
  diLiftUnload: BOOL; // Sensor indicating lift is in unload position
  doConvLift: BOOL; // Control signal for lift conveyor belt
  diBoxLift: BOOL; // Sensor indicating box is on lift

BEGIN

  // Handle top conveyor belt
  IF diConvTop THEN
    doConvTop := FALSE; // Stop top conveyor belt
    RequestLift('top'); // Request lift to top position
  ELSE
    doConvTop := TRUE; // Start top conveyor belt
  END_IF;

  // Handle bottom conveyor belt
  IF diConvBottom THEN
    doConvBottom := FALSE; // Stop bottom conveyor belt
    RequestLift('bottom'); // Request lift to bottom position
  ELSE
    doConvBottom := TRUE; // Start bottom conveyor belt
  END_IF;

  // Move lift to requested position
  IF liftRequested AND NOT liftAtPosition THEN
    IF requestedPosition = 'top' THEN
      doLiftTop := TRUE;
      doLiftBottom := FALSE;
    ELSIF requestedPosition = 'bottom' THEN
      doLiftTop := FALSE;
      doLiftBottom := TRUE;
    END_IF;
  ELSE
    doLiftTop := FALSE;
    doLiftBottom := FALSE;
  END_IF;

  // Handle lift conveyor belt
  IF liftAtPosition AND diBoxLift THEN
    doConvLift := TRUE; // Start lift conveyor belt
  ELSE
    doConvLift := FALSE; // Stop lift conveyor belt
  END_IF;

  // Move lift to unload position
  IF liftAtPosition AND diBoxLift THEN
    doLiftUnload := TRUE;
  ELSE
    doLiftUnload := FALSE;
  END_IF;

  // Unload box
  IF liftAtPosition AND diBoxLift AND diLiftUnload THEN
    UnloadBox();
    liftRequested := FALSE;
  END_IF;

END_PROGRAM