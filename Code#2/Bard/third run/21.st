// 25.93s
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

BURNER:

IF OVER_TEMP THEN
  STATUS := 9;
  RETURN;
END_IF;

IF RST AND RST_TIMER THEN
  RST_TIMER := FALSE;
  state := 110;
  RETURN;
END_IF;

IF RST THEN
  RST_TIMER := TRUE;
  tx := LOCKOUT_TIME;
  RETURN;
END_IF;

IF IN AND NOT OVER_TEMP THEN
  state := 111;
ELSE
  IF state >= 111 THEN
    state := 110;
  END_IF;
  RETURN;
END_IF;

IF state = 110 THEN
  STATUS := 110;
  MOTOR := FALSE;
  COIL1 := FALSE;
  COIL2 := FALSE;
  PRE_HEAT := FALSE;
  IGNITE := FALSE;
  FAIL := FALSE;
  KWH := 0;
  RUNTIME1 := 0;
  RUNTIME2 := 0;
  CYCLES := 0;
ELSE
  IF state = 111 THEN
    STATUS := 111;
    PRE_HEAT := TRUE;
    timer1 := PRE_HEAT_TIME;
    tx := timer1;
    IF NOT OIL_TEMP AND (TIME_SINCE(last) > tx) THEN
      state := 110;
      FAIL := TRUE;
      STATUS := 1;
    END_IF;
    IF FLAME AND (TIME_SINCE(last) > tx) THEN
      state := 110;
      FAIL := TRUE;
      STATUS := 2;
    END_IF;
  ELSIF state = 112 THEN
    STATUS := 112;
    MOTOR := TRUE;
    COIL1 := TRUE;
    timer1 := PRE_VENT_TIME;
    tx := timer1;
    IF FLAME AND (TIME_SINCE(last) > tx) THEN
      state := 110;
      FAIL := TRUE;
      STATUS := 3;
    END_IF;
  ELSIF state = 113 THEN
    STATUS := 113;
    COIL2 := TRUE;
    IF NOT FLAME AND (TIME_SINCE(last) > SAFETY_TIME) THEN
      state := 110;
      FAIL := TRUE;
      STATUS := 4;
    END_IF;
    IF NOT FLAME AND MULTIPLE_IGNITION AND STAGE2 THEN
      IGNITE := TRUE;
      timer2 := PRE_IGNITE_TIME;
      tx := timer2;
    END_IF;
    IF STAGE2 AND (TIME_SINCE(last) > STAGE2_DELAY) THEN
      COIL2 := FALSE;
      cycles2 := cycles2 + 1;
      RUNTIME2 := RUNTIME2 + TIME_SPAN(last_change);
    last_change := TIME;
    IF STAGE2 THEN
      state := 112;
    ELSE
      state := 110;
    END_IF;
  ENDIF;
END_IF;

IF TIME_SINCE(last) > tx THEN
  IF state = 111 THEN
    MOTOR := TRUE;
    timer1 := PRE_VENT_TIME;
    tx := timer1;
    state := 112;
  ELSIF state = 112 THEN
    IGNITE := TRUE;
    timer2 := PRE_IGNITE_TIME;
    tx := timer2;
    state := 113;
  ELSIF state = 113 THEN
    IF MULTIPLE_IGNITION AND NOT FLAME THEN
      IGNITE := TRUE;
      timer2 := PRE_IGNITE_TIME;
      tx := timer2;
    ELSE
      KWH := KW1 + KW2 * cycles2;
      RUNTIME1 := RUNTIME1 + TIME_SPAN(last_change);
      CYCLES := CYCLES + cycles2;
      cycles2 := 0;
      state := 110;
    END_IF;
  END_IF;
END_IF;

timer1 := timer1 - TIME_SPAN(last);
timer2 := timer2 - TIME_SPAN(last);
last := TIME;

END_FUNCTION_BLOCK
