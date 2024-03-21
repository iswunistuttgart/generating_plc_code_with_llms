//16.82s
// 2
(* Program to control a simple traffic light with two lights *)

VAR
  cycleTimer: TON; (* Timer for the traffic light cycle *)
  northGreen: BOOL; (* Flag indicating North light is green *)
  northYellow: BOOL; (* Flag indicating North light is yellow *)
  northRed: BOOL; (* Flag indicating North light is red *)
  eastGreen: BOOL; (* Flag indicating East light is green *)
  eastYellow: BOOL; (* Flag indicating East light is yellow *)
  eastRed: BOOL; (* Flag indicating East light is red *)

(* Main program *)
PROGRAM Main
BEGIN
  (* Initialize timer and output variables *)
  cycleTimer.IN := TRUE; (* Start the timer *)
  northGreen := FALSE;
  northYellow := FALSE;
  northRed := TRUE;
  eastGreen := FALSE;
  eastYellow := FALSE;
  eastRed := TRUE;

  REPEAT
    (* Update output variables based on timer state and elapsed time *)
    IF cycleTimer.Q THEN
      IF cycleTimer.ET >= 0 AND cycleTimer.ET < 5000 THEN
        northGreen := TRUE;
        northYellow := FALSE;
        northRed := FALSE;
        eastGreen := FALSE;
        eastYellow := FALSE;
        eastRed := TRUE;
      ELSIF cycleTimer.ET >= 5000 AND cycleTimer.ET < 5500 THEN
        northGreen := FALSE;
        northYellow := TRUE;
        northRed := FALSE;
        eastGreen := FALSE;
        eastYellow := FALSE;
        eastRed := TRUE;
      ELSIF cycleTimer.ET >= 5500 AND cycleTimer.ET < 9500 THEN
        northGreen := FALSE;
        northYellow := FALSE;
        northRed := TRUE;
        eastGreen := TRUE;
        eastYellow := FALSE;
        eastRed := FALSE;
      ELSIF cycleTimer.ET >= 9500 AND cycleTimer.ET < 10000 THEN
        northGreen := FALSE;
        northYellow := FALSE;
        northRed := TRUE;
        eastGreen := FALSE;
        eastYellow := TRUE;
        eastRed := FALSE;
      ELSE
        (* Reset timer and output variables for next cycle *)
        cycleTimer.IN := TRUE;
        northGreen := FALSE;
        northYellow := FALSE;
        northRed := TRUE;
        eastGreen := FALSE;
        eastYellow := FALSE;
        eastRed := TRUE;
      END_IF;
    END_IF;
  UNTIL FALSE; (* Loop indefinitely *)
END_PROGRAM