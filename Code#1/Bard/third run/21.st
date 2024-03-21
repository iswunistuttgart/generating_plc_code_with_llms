// 13.61s
// 2
FUNCTION_BLOCK BURNER

VAR
IN: BOOL;             // Start signal
OVER_TEMP: BOOL;      // Boiler thermostat protection
OIL_TEMP: BOOL;       // Oil temperature signal
STAGE2: BOOL;        // Second stage activation
RST: BOOL;            // Reset signal
STATUS: INT;       // Status output (110-Standby, 111-Startup, 112-Stage 1, 113-Stage 2)
ERROR: INT;         // Error output (0-No error, 1-Oil warming timeout, 2-Flame during pre-heat, ...)

internal_state: INT; // Internal state machine variable
timer_preheat: TIME;  // Timer for pre-heating
timer_prevent: TIME;  // Timer for pre-ventilation
timer_safety: TIME;   // Timer for flame safety
timer_post_ignit: TIME; // Timer for post-ignition delay
timer_stage2: TIME;   // Timer for stage 2 delay
timer_lockout: TIME;  // Timer for lockout

BEGIN

// Initialize variables
internal_state := 110; // Standby
timer_preheat := 0s;
timer_prevent := 0s;
timer_safety := 0s;
timer_post_ignit := 0s;
timer_stage2 := 0s;
timer_lockout := 0s;
STATUS := 110;
ERROR := 0;

// Main loop
WHILE TRUE DO

// Check for reset
IF RST THEN
  IF timer_lockout.ET THEN
    internal_state := 110;
    STATUS := 110;
    ERROR := 0;
  END_IF;
ELSE

  // Check overall conditions
  IF OVER_TEMP THEN
    internal_state := 110;
    STATUS := 110;
    ERROR := 9;
  ELSIF internal_state = 110 AND IN THEN
    internal_state := 111;
    STATUS := 111;
  END_IF;

  // State machine
  CASE internal_state OF
    111: // Startup sequence
      TOF(IN := TRUE, PT := #PRE_HEAT_TIME, Q := timer_preheat);
      IF OIL_TEMP AND timer_preheat.ET THEN
        internal_state := 112;
        STATUS := 112;
        timer_prevent := 0s;
      ELSIF timer_preheat.ET THEN
        internal_state := 110;
        STATUS := 110;
        ERROR := 1;
      END_IF;
    112: // Stage 1 operation
      TOF(IN := TRUE, PT := #PRE_VENTILATION_TIME, Q := timer_prevent);
      IF timer_prevent.ET THEN
        TOF(IN := TRUE, PT := #PRE_IGNITE_TIME, Q := timer_post_ignit);
        TOF(IN := TRUE, PT := #SAFETY_TIME, Q := timer_safety);
        IF (TIMER_IGNITION_ACTIVE) THEN
          ERROR := 2;
        ELSIF NOT TIMER_FLAME_DETECTED THEN
          ERROR := 4;
        ELSIF timer_safety.ET THEN
          internal_state := 112; // Restart ignition
          timer_post_ignit := 0s;
        ELSE
          TOF(IN := TRUE, PT := #POST_IGNITE_TIME, Q := timer_post_ignit);
          IF timer_post_ignit.ET AND NOT TIMER_FLAME_DETECTED THEN
            ERROR := 5;
          ELSE
            timer_stage2 := #STAGE2_DELAY;
          END_IF;
        END_IF;
      END_IF;
    113: // Stage 2 operation
      TOF(IN := TRUE, PT := timer_stage2, Q := timer_stage2);
      IF STAGE2 AND timer_stage2.ET THEN
        internal_state := 113; // Continue in stage 2
        timer_stage2 := 0s;
      ELSEIF NOT TIMER_FLAME_DETECTED OR MULTIPLE_IGNITION THEN
        internal_state := 112; // Restart ignition
// 23.8s
      ELSEIF NOT TIMER_FLAME_DETECTED OR MULTIPLE_IGNITION THEN
        internal_state := 112; // Restart ignition
        timer_post_ignit := 0s;
      END_IF;
    END_CASE;

    // Lockout timer
  TOF(IN := TRUE, PT := #LOCKOUT_TIME, Q := timer_lockout);

END_IF;

END_WHILE;

END_FUNCTION_BLOCK