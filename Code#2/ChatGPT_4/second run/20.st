// 32.83s
// 3
FUNCTION_BLOCK INTERLOCK
VAR_INPUT
    I1 : BOOL;  (* Input for controlling Q1 *)
    I2 : BOOL;  (* Input for controlling Q2 *)
    TL : TIME;  (* Dead time between switching outputs *)
END_VAR
VAR_OUTPUT
    Q1 : BOOL;  (* Output Q1 *)
    Q2 : BOOL;  (* Output Q2 *)
END_VAR
VAR
    T1 : TOF;  (* Off-delay timer for Q1 *)
    T2 : TOF;  (* Off-delay timer for Q2 *)
END_VAR

(* Timer logic for Q1 *)
T1(IN := NOT Q1, PT := TL);
IF I1 AND T2.Q THEN
    Q1 := TRUE;
    Q2 := FALSE;
END_IF;

(* Timer logic for Q2 *)
T2(IN := NOT Q2, PT := TL);
IF I2 AND T1.Q THEN
    Q2 := TRUE;
    Q1 := FALSE;
END_IF;

END_FUNCTION_BLOCK
