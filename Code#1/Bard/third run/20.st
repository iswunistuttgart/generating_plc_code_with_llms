// 8.08s
// 2
PROGRAM Interlock

VAR
  I1: BOOL;
  I2: BOOL;
  Q1: BOOL;
  Q2: BOOL;
  Q1Timer: TIME;
  Q2Timer: TIME;

BEGIN

  // Initialize timers
  Q1Timer := 0.0s;
  Q2Timer := 0.0s;

  WHILE TRUE DO
    // Check input I1
    IF I1 THEN
      // Enable timer for Q1
      TOF(IN := TRUE, PT := #TL, Q := Q1Timer);

      // Set output Q1
      Q1 := TRUE;

      // Reset output Q2
      Q2 := FALSE;

      // Clear Q2 timer
      Q2Timer := 0.0s;
    END_IF;

    // Check input I2
    IF I2 THEN
      // Enable timer for Q2
      TOF(IN := TRUE, PT := #TL, Q := Q2Timer);

      // Set output Q2
      Q2 := TRUE;

      // Reset output Q1
      Q1 := FALSE;

      // Clear Q1 timer
      Q1Timer := 0.0s;
    END_IF;

    // Check if Q2 can be enabled
    IF Q2Timer > TL AND NOT Q2 THEN
      // Enable Q2
      Q2Timer := 0.0s;

      Q2 := TRUE;
    END_IF;

    // Check if Q1 can be enabled
    IF Q1Timer > TL AND NOT Q1 THEN
      // Enable Q1
      Q1Timer := 0.0s;

      Q1 := TRUE;
    END_IF;
  END_WHILE;

END_PROGRAM