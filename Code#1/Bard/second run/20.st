// 9.84s
// 2
PROGRAM Interlock

VAR
  previous_Q1: BOOL;
  previous_Q2: BOOL;

(* Initialization *)
previous_Q1 := FALSE;
previous_Q2 := FALSE;

(* Check input I1 *)
IF I1 = TRUE THEN
  (* Check if Q2 was FALSE for at least TL milliseconds *)
  IF previous_Q2 = FALSE AND timer.ET >= TL THEN
    Q1 := TRUE;
  END_IF;
ELSE
  Q1 := FALSE;
END_IF;

(* Check input I2 *)
IF I2 = TRUE THEN
  (* Check if Q1 was FALSE for at least TL milliseconds *)
  IF previous_Q1 = FALSE AND timer.ET >= TL THEN
    Q2 := TRUE;
  END_IF;
ELSE
  Q2 := FALSE;
END_IF;

(* Store previous output states *)
previous_Q1 := Q1;
previous_Q2 := Q2;

(* Reset timer *)
timer.IN := TRUE;

END_PROGRAM
