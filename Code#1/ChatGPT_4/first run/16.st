//65.48s
//4
PROGRAM TrafficLightControl
VAR
    North_green, North_yellow, North_red: BOOL;
    East_green, East_yellow, East_red: BOOL;
    TrafficCycleTimer: TON;
END_VAR

(* Initialize the timer with PT as 10 seconds *)
TrafficCycleTimer(IN:= TRUE, PT:= T#10s);

(* Traffic light control logic *)
IF TrafficCycleTimer.ET < T#5s THEN
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF TrafficCycleTimer.ET >= T#5s AND TrafficCycleTimer.ET < T#5500ms THEN
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF TrafficCycleTimer.ET >= T#5500ms AND TrafficCycleTimer.ET < T#9500ms THEN
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
ELSIF TrafficCycleTimer.ET >= T#9500ms AND TrafficCycleTimer.ET < T#10s THEN
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF;

(* Reset the timer if the cycle is complete *)
IF TrafficCycleTimer.ET >= T#10s THEN
    TrafficCycleTimer.IN := FALSE; (* Stop the timer *)
    TrafficCycleTimer();           (* Reset the timer *)
    TrafficCycleTimer.IN := TRUE;  (* Restart the timer *)
END_IF;

TrafficCycleTimer(); (* Call the timer *)
END_PROGRAM
