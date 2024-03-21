//13.09s
// 2
PROGRAM TrafficLight

VAR
  North_green: BOOL;
  North_yellow: BOOL;
  North_red: BOOL;
  East_green: BOOL;
  East_yellow: BOOL;
  East_red: BOOL;
  timer: TIME;

BEGIN

  // Initialize all lights to red
  North_green := FALSE;
  North_yellow := FALSE;
  North_red := TRUE;
  East_green := FALSE;
  East_yellow := FALSE;
  East_red := TRUE;

  // Start the timer
  TON(IN := TRUE, PT := #10000ms, Q := timer);

  WHILE TRUE DO
    // Check the timer value and set the light signals accordingly
    IF timer.ET THEN
      // North light green
      North_green := TRUE;
      North_yellow := FALSE;
      North_red := FALSE;
      East_green := FALSE;
      East_yellow := FALSE;
      East_red := TRUE;

      // Wait for 5000ms
      DELAY(5000);

      // North light yellow
      North_green := FALSE;
      North_yellow := TRUE;
      North_red := FALSE;
      East_green := FALSE;
      East_yellow := FALSE;
      East_red := TRUE;

      // Wait for 500ms
      DELAY(500);

      // North light red, East light green
      North_green := FALSE;
      North_yellow := FALSE;
      North_red := TRUE;
      East_green := TRUE;
      East_yellow := FALSE;
      East_red := FALSE;

      // Wait for 4000ms
      DELAY(4000);

      // East light yellow
      North_green := FALSE;
      North_yellow := FALSE;
      North_red := TRUE;
      East_green := FALSE;
      East_yellow := TRUE;
      East_red := FALSE;

      // Wait for 500ms
      DELAY(500);

      // Reset the timer
      TOF(IN := timer.Q, PT := #10000ms, Q := timer);
    END_IF;
  END_WHILE;

END_PROGRAM