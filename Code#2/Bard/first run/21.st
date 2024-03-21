// 26.65s
// 13.56s
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

START

  IF RST AND RST_TIMER = FALSE THEN
    state := 0;
    timer1 := t#0s;
    timer2 := t#0s;
    cycles2 := 0;
  END_IF;

  IF OVER_TEMP THEN
    state := 0;
    FAIL := TRUE;
    STATUS := 9;
  ELSE
    IF IN AND OVER_TEMP = FALSE THEN
      IF state = 0 THEN
        // Standby
        STATUS := 110;
        IF RST_TIMER = FALSE THEN
          state := 1;
          timer1 := PRE_HEAT_TIME;
          last := TIME_OF_DAY;
        END_IF;
      ELSIF state = 1 THEN
        // Pre-heating
        PRE_HEAT := TRUE;
        IF timer1 > 0 THEN
          FAIL := NOT OIL_TEMP AND TIME_OF_DAY - last >= PRE_HEAT_TIME;
          IF FAIL THEN
            STATUS := 1;
            state := 0;
          END_IF;
        ELSE
          state := 2;
          timer1 := PRE_VENT_TIME;
          last := TIME_OF_DAY;
          MOTOR := TRUE;
        END_IF;
      ELSIF state = 2 THEN
        // Pre-ventilation
        IF timer1 > 0 THEN
          FAIL := FLAME AND TIME_OF_DAY - last >= PRE_VENT_TIME;
          IF FAIL THEN
            STATUS := 3;
            state := 0;
          END_IF;
        ELSE
          state := 3;
          timer1 := PRE_IGNITE_TIME;
          last := TIME_OF_DAY;
          IGNITE := TRUE;
        END_IF;
      ELSIF state = 3 THEN
        // Pre-ignition
        IF timer1 > 0 THEN
          FAIL := NOT FLAME AND TIME_OF_DAY - last >= PRE_IGNITE_TIME;
          IF FAIL THEN
            STATUS := 4;
            state := 0;
          END_IF;
        ELSE
          state := 4;
          timer1 := SAFETY_TIME;
          last := TIME_OF_DAY;
          COIL1 := TRUE;
        END_IF;
      ELSIF state = 4 THEN
        // Ignition
        IF timer1 > 0 THEN
          FAIL := NOT FLAME AND TIME_OF_DAY - last >= SAFETY_TIME;
          IF FAIL THEN
            STATUS := 4;
            state := 0;
          END_IF;
        ELSE
          state := 5;
          timer1 := POST_IGNITE_TIME;
          last := TIME_OF_DAY;
          tx := TIME_OF_DAY;
          KWH := 0;
        END_IF;
      ELSIF state =  5 THEN
        // Post-ignition
        IF timer1 > 0 THEN
          KWH := KW1 * (TIME_OF_DAY - tx);
        ELSE
          state := 6;
          RUNTIME1 := RUNTIME1 + TIME_OF_DAY - tx;
          IF STAGE2 AND CYCLES2 < 2 THEN
            cycles2 := cycles2 + 1;
            timer2 := STAGE2_DELAY;
            state := 7;
          ELSE
            COIL2 := TRUE;
          END_IF;
        END_IF;
      ELSIF state = 6 THEN
        // Stage 1
        RUNTIME1 := RUNTIME1 + TIME_OF_DAY - tx;
        KWH := KWH + KW1 * (TIME_OF_DAY - tx);
        IF NOT FLAME OR OVER_TEMP THEN
          state := 0;
          FAIL := TRUE;
          IF NOT FLAME THEN
            STATUS := 5;
          END_IF;
        ELSIF STAGE2 THEN
          cycles2 := cycles2 + 1;
          timer2 := STAGE2_DELAY;
          state := 7;
        END_IF;
      ELSIF state = 7 THEN
        // Stage 2 delay
        IF timer2 > 0 THEN
          // Do nothing, wait for timer
        ELSE
          state := 8;
          COIL2 := TRUE;
        END_IF;
      ELSIF state = 8 THEN
        // Stage 2
        RUNTIME2 := RUNTIME2 + TIME_OF_DAY - tx;
        KWH := KWH + KW2 * (TIME_OF_DAY - tx);
        IF NOT FLAME OR OVER_TEMP THEN
          state := 0;
          FAIL := TRUE;
          IF NOT FLAME THEN
            STATUS := 5;
          END_IF;
        END_IF;
      END_IF;

IF RST AND RST_TIMER = FALSE THEN
  RST_TIMER := TRUE;
  timer1 := LOCKOUT_TIME;
END_IF;

IF RST_TIMER > 0 THEN
  STATUS := 0;
END_IF;

END_START