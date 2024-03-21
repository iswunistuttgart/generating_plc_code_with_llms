// 9.94s
// 2
FUNCTION_BLOCK FB1005

VAR
  M_MAX: REAL;
  M_MIN: REAL;
  D_MAX: BOOL;
  D_MIN: BOOL;
  reject_light_switched_on: BOOL;
  current_thickness: REAL;
  start_detection: BOOL;
  previous_thickness: REAL;

(* Initialize variables *)
M_MAX := 0.0;
M_MIN := 0.0;
D_MAX := FALSE;
D_MIN := FALSE;
reject_light_switched_on := FALSE;
current_thickness := 0.0;
start_detection := FALSE;
previous_thickness := 0.0;

(* Check if measurement is started *)
IF S1 = TRUE THEN
  (* Start of measurement *)
  start_detection := TRUE;
  previous_thickness := 0.0;
ELSE
  (* Measurement is not started *)
  start_detection := FALSE;

  (* Set reject light if necessary *)
  IF M_MAX > V_MAX OR M_MIN < V_MIN THEN
    reject_light_switched_on := TRUE;
  ELSE
    reject_light_switched_on := FALSE;
  END_IF;
END_IF;

(* Check if thickness measurement is available *)
IF MD_1 = TRUE THEN
  (* Read thickness from input *)
  current_thickness := MD_1;

  (* Check if current thickness is maximum or minimum *)
  IF current_thickness > M_MAX THEN
    M_MAX := current_thickness;
    D_MAX := TRUE;
  ELSE
    D_MAX := FALSE;
  END_IF;

  IF current_thickness < M_MIN THEN
    M_MIN := current_thickness;
    D_MIN := TRUE;
  ELSE
    D_MIN := FALSE;
  END_IF;

  (* Reset reject light if necessary *)
  IF M_MAX <= V_MAX AND M_MIN >= V_MIN THEN
    reject_light_switched_on := FALSE;
  END_IF;

  (* Reset previous thickness *)
  previous_thickness := current_thickness;
END_IF;

(* Return output values *)
OUTPUT
  D_MAX: BOOL;
  D_MIN: BOOL;

END_FUNCTION
