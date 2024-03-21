// 9.77s
// 2
FUNCTION FC1002 :BOOL
VAR_INPUT
  E_A, SENSOR: BOOL;
  ZEITW: TIME;
END_VAR
VAR_IN_OUT
  ZEIT:TON;
  P_HU, P_AL: BOOL;
END_VAR

FC1002 := TRUE;

IF E_A THEN
  P1 := TRUE;
ELSE
  P1 := FALSE;
  ZEIT := 0;
  P_HU := FALSE;
  P_AL := FALSE;
ENDIF;

IF SENSOR THEN
  IF P1 THEN
    ZEIT := ZEIT + 1;
    IF ZEIT >= 3 THEN
      ZEIT := 0;
      WRITE("Warning signal switched off, alarm switched on");
      P_HU := FALSE;
      P_AL := TRUE;
    END_IF;
  ELSE
    WRITE("Ultrasonic sensor reports an approach");
    P_HU := TRUE;
  END_IF;
ELSE
  IF P_AL THEN
    WRITE("Alarm switched off, monitoring system switched off");
    P_AL := FALSE;
  END_IF;
END_IF;

RETURN FC1002;
END_FUNCTION