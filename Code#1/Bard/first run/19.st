// 9.82s
// 2
FUNCTION_BLOCK FB1005(
START: BOOL;
THICKNESS MD_1: BYTE;
V_MAX: REAL;
V_MIN: REAL;
D_MAX: BYTE;
D_MIN: BYTE;
)
VAR
currentThickness: REAL; (* Current thickness measurement )
largestThickness: REAL; ( Largest thickness measurement in current cycle )
smallestThickness: REAL; ( Smallest thickness measurement in current cycle )
rejectLight: BOOL; ( Flag indicating whether reject light is on *)

BEGIN
(* Initialize variables *)
largestThickness := 0.0;
smallestThickness := 0.0;
rejectLight := FALSE;

(* Continuously check for measurement start )
WHILE TRUE DO
IF START THEN
currentThickness := REAL(MD_1); ( Convert thickness value from flag double word *)

  (* Check for new largest or smallest thickness record *)
  IF currentThickness > largestThickness THEN
    largestThickness := currentThickness;
    D_MAX := MD_1; (* Update largest thickness output *)
  ELSIF currentThickness < smallestThickness THEN
    smallestThickness := currentThickness;
    D_MIN := MD_1;
  END_IF;

  (* Check for out-of-tolerance thickness *)
  IF currentThickness < V_MIN OR currentThickness > V_MAX THEN
    rejectLight := TRUE;

    (* Disable further measurement until restart *)
    START := FALSE;
  ELSE
    rejectLight := FALSE;
  END_IF;
END_IF;

(* Delay for 1 millisecond to avoid excessive processing *)
DELAY 0.001;
END_WHILE;
END_FUNCTION_BLOCK

VAR
  sensorS1: BOOL; (* Input signal from sensor S1 *)
  thicknessMD1: BYTE; (* Flag double word representing thickness measurement *)
  vMax: REAL; (* Maximum thickness tolerance *)
  vMin: REAL; (* Minimum thickness tolerance *)
  thicknessDMax: BYTE; (* Output flag double word for largest thickness *)
  thicknessDMin: BYTE; (* Output flag double word for smallest thickness *)

(* Call FB1005 to check plate thickness and update output variables *)
FB1005(sensorS1, thicknessMD1, vMax, vMin, thicknessDMax, thicknessDMin);

(* Update output devices based on output variables *)
WriteOutput(thicknessDMax, thicknessDMaxOutput);
WriteOutput(thicknessDMin, thicknessDMinOutput);