// 14.54s 
// 2
FUNCTION_BLOCK FB_BURNER(
  IN: BOOL;
  OVER_TEMP: BOOL;
  OIL_TEMP: BOOL;
  STAGE2: BOOL;
  RST: BOOL;
  PRE_HEAT_TIME: TIME;
  SAFETY_TIME: TIME;
  STAGE2_DELAY: TIME;
  MULTIPLE_IGNITION: BOOL;
  LOCKOUT_TIME: TIME;
  // Add other required parameters:
  PPR_IGNITION_TIME: TIME;
  PRE_VENTILATION_TIME: TIME;
  POST_IGNITION_TIME: TIME;
)
VAR
  // Internal states
  currentState: INT;
  lockOutTimer: TON;
  stage1Timer: TON;
  stage2Timer: TON;
  ignitionActive: BOOL;
  flameDetected: BOOL;
  error: INT;

BEGIN
  // Initialize variables
  lockOutTimer.IN := FALSE;
  stage1Timer.IN := FALSE;
  stage2Timer.IN := FALSE;
  ignitionActive := FALSE;
  flameDetected := FALSE;
  error := 0;

  // State machine transitions
  CASE currentState OF
    // Standby
    0: IF IN AND NOT OVER_TEMP THEN
        currentState := 1;
        PRE_HEAT := TRUE; // Start fuel oil warming
      END_IF;
    // Fuel oil warming
    1: IF OIL_TEMP THEN
        currentState := 2;
        ENGINE_ON := TRUE; // Start engine
        stage1Timer.IN := TRUE; // Start stage 1 timer
      ELSIF TIME_GT(TIME_DIFF(T_NOW(), START_TIME), PRE_HEAT_TIME) THEN
        error := 1;
        currentState := 10; // Go to error state
        FAIL := TRUE;
      END_IF;
    // Pre-ventilation
    2: IF TIME_GT(TIME_DIFF(T_NOW(), START_TIME), PRE_VENTILATION_TIME) THEN
        currentState := 3;
        IGNITION := TRUE; // Activate ignition
        ignitionActive := TRUE;
      ELSIF flameDetected THEN
        error := 3;
        currentState := 10; // Go to error state
        FAIL := TRUE;
      END_IF;
    // Ignition phase
    3: IF TIME_GT(TIME_DIFF(T_NOW(), START_TIME), PPR_IGNITION_TIME + SAFETY_TIME) THEN
        error := 4;
        currentState := 10; // Go to error state
        FAIL := TRUE;
      ELSIF flameDetected THEN
        currentState := 4;
        OIL_VALVE := TRUE; // Open oil valve
        ignitionActive := FALSE;
      END_IF;
    // Burning stage 1
    4: IF flameDetected THEN
        IF MULTIPLE_IGNITION AND NOT flameDetected THEN
          currentState := 3; // Restart ignition if flame breaks
        END_IF;
        IF STAGE2 AND TIME_GT(TIME_DIFF(T_NOW(), START_TIME), stage1Timer.PT + STAGE2_DELAY) THEN
          currentState := 5;
          stage2Timer.IN := TRUE; // Start stage 2 timer
        END_IF;
      ELSE
        error := 5;
        currentState := 10; // Go to error state
        FAIL := TRUE;
      END_IF;
    // Burning stage 2
    5: IF flameDetected THEN
        IF MULTIPLE_IGNITION AND NOT flameDetected THEN
          currentState := 3; // Restart ignition if flame breaks
        END_IF;
      ELSE
        error := 5;
        currentState := 10; // Go to error state
        FAIL := TRUE;
      END_IF;
    // Error state
    10: IF RST AND NOT OVER_TEMP THEN
        IF TIME_GT(TIME_DIFF(T_NOW(), START_TIME), LOCKOUT_TIME) THEN
          currentState := 0; // Reset and go to standby
        END_IF;
      ELSE
        lockOutTimer.IN := TRUE; // Start lockout timer
      END_IF;
  END_CASE;

  // Update outputs based on current state
  CASE currentState OF
    0: STATUS := 110;
    1: STATUS := 111;
    2: STATUS := 111;
    3: STATUS := 111;
    4: STATUS := 112;
    5: STATUS := 1