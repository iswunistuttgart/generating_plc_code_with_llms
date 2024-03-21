//12.0s
// 2
(* Program to control a gate *)

VAR
  Start_Loop: BOOL; (* Start loop flag *)
  One_Hour_Timer: TIME; (* One-hour timer *)
  Gate_Open: BOOL; (* Gate open flag *)
  Auth_String: STRING(50); (* Authentication string *)
  My_Defined_Str: STRING(50) := 'my_defined_str'; (* My defined authentication string *)
  App_Or_Car_Sensed: BOOL; (* App or car sensed flag *)

(* Main program *)
PROGRAM Main
BEGIN
  IF NOT Start_Loop THEN
    TON(PT:= 1h, IN:= TRUE, OUT:= One_Hour_Timer.Q); (* Start one-hour timer *)
  END_IF;

  IF One_Hour_Timer.Q AND Gate_Open THEN
    Gate_Open := FALSE; (* Close gate if timer timed out and gate is still open *)
  END_IF;

  IF App_Or_Car_Sensed THEN
    CASE Auth_String OF
      My_Defined_Str: Gate_Open := TRUE; (* Open gate if authentication string matches *)
      ELSE: Gate_Open := FALSE; (* Keep gate closed if authentication string does not match *)
    END_CASE;
  END_IF;

  WriteOutput(Gate_Open); (* Write gate open flag to output *)
END_PROGRAM