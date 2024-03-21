// 18.12s
// 2
FUNCTION FC1002

VAR
  ultrasonic_sensor: BOOL;
  horn_on: BOOL;
  alarm_on: BOOL;
  timer_elapsed: BOOL;
  monitoring_enabled: BOOL;

(* Initialize variables *)
ultrasonic_sensor := FALSE;
horn_on := FALSE;
alarm_on := FALSE;
timer_elapsed := FALSE;

(* Check if ultrasonic sensor detects an approach *)
IF ultrasonic_sensor THEN
  (* Start timer *)
  timer_elapsed := FALSE;

  (* Turn on horn *)
  horn_on := TRUE;
ELSE
  (* Turn off horn *)
  horn_on := FALSE;

  (* Check if timer has elapsed *)
  IF timer_elapsed THEN
    (* Turn off alarm *)
    alarm_on := FALSE;
  END_IF;
END_IF;

(* Check if monitoring is enabled *)
IF monitoring_enabled THEN
  (* Check if horn has been on for 3 seconds *)
  IF horn_on AND NOT timer_elapsed THEN
    timer_elapsed := TRUE;
    IF timer.ET >= 3000 THEN
      (* Horn has been on for 3 seconds, turn off horn and turn on alarm *)
      horn_on := FALSE;
      alarm_on := TRUE;
    END_IF;
  END_IF;
ELSE
  (* Turn off horn and alarm *)
  horn_on := FALSE;
  alarm_on := FALSE;
END_IF;

(* Return output states *)
RETURN horn_on, alarm_on;

END_FUNCTION
