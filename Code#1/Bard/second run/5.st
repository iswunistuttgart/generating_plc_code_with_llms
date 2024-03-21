//10.81s
// 2
PROGRAM GateController
VAR
  Start_Loop: BOOL;
  Auth_Str: STRING(20);
  One_Hour_Timer: TIME;
  Gate_Open: BOOL;
  Gate_Close: BOOL;

(* Start the timer when Start_Loop is FALSE *)
IF NOT Start_Loop THEN
  One_Hour_Timer := T#3600S;
END_IF;

(* Check if the timer has timed out *)
IF (One_Hour_Timer = T#0S) AND (NOT Gate_Close) THEN
  Gate_Close := TRUE;
END_IF;

(* Check if the app or the car is present and the Auth string matches *)
IF (App_Present OR Car_Present) AND (Auth_Str = 'my_defined_str') THEN
  Gate_Open := TRUE;
END_IF;

(* Set the gate outputs *)
WriteDigitalOutput(1, Gate_Open);
WriteDigitalOutput(2, Gate_Close);

END_PROGRAM
