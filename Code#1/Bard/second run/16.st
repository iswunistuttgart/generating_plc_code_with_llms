//14.26s
// 2
PROGRAM TrafficLight
VAR
  North_green: BOOL;
  North_yellow: BOOL;
  North_red: BOOL;
  East_green: BOOL;
  East_yellow: BOOL;
  East_red: BOOL;
  timer: TON(TIME);

(* Set initial states of lights *)
North_green := FALSE;
North_yellow := FALSE;
North_red := TRUE;
East_green := TRUE;
East_yellow := FALSE;
East_red := FALSE;

(* Start the timer *)
timer.IN := TRUE;

(* Traffic light logic *)
CASE timer.ET OF
  0 TO 5000:
    North_green := TRUE;
    East_green := FALSE;
  5000 TO 5500:
    North_green := FALSE;
    North_yellow := TRUE;
  5500 TO 9500:
    North_red := TRUE;
    East_green := TRUE;
  9500 TO 10000:
    East_red := TRUE;
    East_yellow := TRUE;
  ELSE:
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
END_CASE;

END_PROGRAM
