// 12.79s
// 2
FUNCTION FC1002(E_A: BOOL, ultrasonic_presence: BOOL, P_HU: BOOL, P_AL: BOOL, P1: BOOL):
VAR
  monitoring_active: BOOL;
  presence_detected: BOOL;
  presence_timer: TIME;

BEGIN

  // Determine monitoring activation based on switch E_A
  monitoring_active := E_A;

  // Update presence_detected based on ultrasonic_presence and monitoring_active
  IF monitoring_active THEN
    IF ultrasonic_presence THEN
      presence_detected := TRUE;
    ELSIF NOT presence_detected THEN
      TOF(IN := TRUE, PT := #3000ms, Q := presence_timer);
    ELSE
      IF presence_timer.ET THEN
        presence_detected := FALSE;
      END_IF;
    END_IF;
  ELSE
    presence_detected := FALSE;
  END_IF;

  // Set output signals based on presence_detected and monitoring_active
  P_HU := monitoring_active AND presence_detected;
  P_AL := monitoring_active AND presence_detected AND presence_timer.ET;
  P1 := monitoring_active;

  FC1002 := (monitoring_active, presence_detected);
END_FUNCTION