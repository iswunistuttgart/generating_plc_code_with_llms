// 13.27s
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
  IN : BOOL;
  STAGE2 : BOOL;
  OVER_TEMP : BOOL;
  OIL_TEMP : BOOL := TRUE;
  FLAME : BOOL;
  RST : BOOL;
  RST_TIMER : BOOL;
  PRE_HEAT_TIME : TIME := t#5s;
  PRE_VENT_TIME : TIME := t#15s;
  PRE_IGNITE_TIME : TIME := t#15s;
  POST_IGNITE_TIME : TIME := t#25s;
  STAGE2_DELAY : TIME := t#10s;
  SAFETY_TIME : TIME := t#5s;
  LOCKOUT_TIME : TIME := t#10s;
  MULTIPLE_IGNITION : BOOL := TRUE;
  KW1 : REAL;
  KW2 : REAL;
END_VAR
VAR_OUTPUT
  MOTOR : BOOL;
  COIL1 : BOOL;
  COIL2 : BOOL;
  PRE_HEAT : BOOL;
  IGNITE : BOOL;
  FAIL : BOOL;
  KWH : REAL;
  STATUS : BYTE;
END_VAR
VAR_IN_OUT
  RUNTIME1 : UDINT;
  RUNTIME2 : UDINT;
  CYCLES : UDINT;
END_VAR
VAR
  state : INT;
  last : TIME;
  tx : TIME;
  last_change : TIME;
  timer1 : TON;
  timer2 : TON;
  oil_temp_last : BOOL;
  cycles2 : UDINT;
END_VAR

// Initialize state and timers
state := 110;
last := TIME := T_CPU;
last_change := T_CPU;
timer1(PT := LOCKOUT_TIME);
timer2(PT := 0);
cycles2 := 0;

WHILE TRUE DO
  // Check for reset and lockout
  IF RST THEN
    IF timer1.Q THEN
      IF NOT OVER_TEMP THEN
        state := 110;
        timer1 := 0;
      END_IF;
    END_IF;
  ELSEIF NOT RST_TIMER THEN
    timer1 := 0;
  END_IF;

  // Check for overall burner shutdown
  IF OVER_TEMP THEN
    state := 110;
    FAIL := TRUE;
    STATUS := 9;
  ELSE
    FAIL := FALSE;

    // State machine for burner operation
    CASE state OF
      110: // Wait for start signal
        IF IN THEN
          state := 111;
          PRE_HEAT := TRUE;
          last_change := T_CPU;
        END_IF;
      111: // Pre-heating
        IF timer1.Q THEN // Lockout if no start after lockout time
          FAIL := TRUE;
          STATUS := 10;
          state := 110;
        ELSIF OIL_TEMP AND T_DEF(last_change - T_CPU) >= PRE_HEAT_TIME THEN
          state := 112;
          MOTOR := TRUE;
          timer1 := 0;
          last_change := T_CPU;
        END_IF;
      112: // Pre-ventilation
        IF timer1.Q THEN // Failure if pre-ventilation time exceeded
          FAIL := TRUE;
          STATUS := 3;
          state := 110;
        ELSIF T_DEF(last_change - T_CPU) >= PRE_VENT_TIME THEN
          state := 113;
          IGNITE := TRUE;
          timer1 := 0;
          last_change := T_CPU;
        END_IF;
      113: // Ignition and post-ignition
        IF timer1.Q THEN // Failure if safety time passed without flame
          FAIL := TRUE;
          STATUS := 4;
          state := 110;
        ELSIF NOT FLAME THEN // Failure if flame detected during ignition
          FAIL := TRUE;
          STATUS := 2;
          state := 110;
        ELSIF T_DEF(last_change - T_CPU) >= POST_IGNITE_TIME THEN
          IF STAGE2 AND T_DEF(last_change - T_CPU) >= STAGE2_DELAY THEN
            cycles2 := cycles2 + 1;
            coil2 := TRUE;
            RUNTIME2 := RUNTIME2 + T_DEF(
        // 26.16s
        ELSIF NOT FLAME AND MULTIPLE_IGNITION THEN
  // Restart ignition if flame absent and multiple ignition enabled
  state := 112;
  IGNITE := FALSE;
  timer1 := 0;
  last_change := T_CPU;
END_IF;
END_CASE;
  END_IF;

  // Update runtime counters and status
  IF state >= 112 THEN
    RUNTIME1 := RUNTIME1 + T_DEF(T_CPU - last);
  END_IF;
  KWH := KW1 * RUNTIME1 + KW2 * RUNTIME2;
  STATUS := state;

  // Update timers
  timer1(IN := state >= 111);
  timer2(IN := state == 113);

  // Update last measurement time
  last := T_CPU;

  WAIT;
END_WHILE;

END_FUNCTION;