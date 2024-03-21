// 57.71s
// 4
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

(* Start the timer *)
T1(IN := TRUE, PT := T#10000MS);

(* Control the North and East traffic lights based on the elapsed time of the timer *)
IF T1.ET < T#5000MS THEN
    (* 0ms to 5000ms: North green, East red *)
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF T1.ET < T#5500MS THEN
    (* 5000ms to 5500ms: North yellow, East red *)
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
ELSIF T1.ET < T#9500MS THEN
    (* 5500ms to 9500ms: North red, East green *)
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
ELSE
    (* 9500ms to 10000ms: North red, East yellow *)
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF;

(* Reset the timer at the end of the cycle *)
IF T1.Q THEN
    T1.IN := FALSE;
    T1(IN := TRUE);  (* Restart the timer *)
END_IF;
