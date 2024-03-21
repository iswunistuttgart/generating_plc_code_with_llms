//70.06s
//4
PROGRAM GateController
VAR
    Start_Loop : BOOL; (* Input: Control variable to start/stop the loop *)
    Gate_Open : BOOL; (* Output: Indicates if the gate is open *)
    One_Hour_Timer : TON; (* Timer that counts for 1 hour *)
    Sensor_Car : BOOL; (* Input: Senses the car *)
    Sensor_App : BOOL; (* Input: Senses the app *)
    Auth_Str : STRING; (* Input: Authorization string from the app or car *)
    my_defined_str : STRING := 'SecretPass'; (* Predefined authorization string *)
END_VAR

(* Initialize the timer with PT as 1 hour *)
One_Hour_Timer(PT := T#1h);

(* Start the one hour timer when Start_Loop is FALSE *)
IF NOT Start_Loop AND NOT One_Hour_Timer.Q THEN
    One_Hour_Timer.IN := TRUE; (* Start the timer *)
ELSIF Start_Loop OR One_Hour_Timer.Q THEN
    One_Hour_Timer.IN := FALSE; (* Stop the timer if Start_Loop is TRUE or the timer has finished *)
END_IF

(* Timer control logic *)
IF One_Hour_Timer.Q THEN
    IF Gate_Open THEN
        Gate_Open := FALSE; (* Close the gate if it's open after 1 hour *)
    END_IF
ELSE
    (* Check for car/app sensor and valid authorization string to open the gate *)
    IF (Sensor_Car OR Sensor_App) AND (Auth_Str = my_defined_str) THEN
        Gate_Open := TRUE; (* Open the gate if auth matches *)
    END_IF
END_IF

(* Update the timer *)
One_Hour_Timer();

END_PROGRAM
