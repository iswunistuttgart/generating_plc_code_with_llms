// 50.7s
// 4
VAR
    Start_Loop : BOOL := FALSE;
    one_hour : TIME := T#1h;            (* 1 hour duration for timer *)
    One_Hour_Timer : TON;               (* Timer for 1 hour countdown *)
    Gate_Open : BOOL := FALSE;          (* Indicates if gate is open *)
    Close_Gate_Inst : BOOL := FALSE;    (* Instruction to close gate *)
    Sensed_Car : BOOL := FALSE;         (* Detects presence of car *)
    Sensed_Car_Inst : BOOL := FALSE;    (* Car detection instance *)
    Sensed_App : BOOL := FALSE;         (* Detects signal from app *)
    Mobile_Inst : BOOL := FALSE;        (* Mobile app detection instance *)
    Auth : STRING;                      (* Authentication string *)
    my_defined_str : STRING := 'abcd';  (* Defined authentication string *)
END_VAR

(* Timer control *)
IF Start_Loop = FALSE THEN
    One_Hour_Timer(IN := TRUE, PT := one_hour);
ELSE
    One_Hour_Timer(IN := FALSE);
END_IF;

(* Check if timer has timed out and gate is open *)
IF One_Hour_Timer.Q AND Gate_Open THEN
    Close_Gate_Inst := TRUE;
    Gate_Open := FALSE;
END_IF;

(* Check for car or app presence and correct authentication *)
IF (Sensed_Car OR Sensed_App) AND (Auth = my_defined_str) THEN
    Gate_Open := TRUE;
    Sensed_Car_Inst := Sensed_Car;
    Mobile_Inst := Sensed_App;
ELSE
    IF NOT One_Hour_Timer.Q THEN
        Close_Gate_Inst := FALSE;
    END_IF;
END_IF;
