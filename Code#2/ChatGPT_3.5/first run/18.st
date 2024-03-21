// 7.1s
// 4
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R: REAL;
    IN_MAX, IN_MIN: REAL;
    OUT_MAX, OUT_MIN: REAL;
END_VAR
VAR_OUTPUT
    OUT_R: REAL;
    FEH: BOOL;
END_VAR
VAR_TEMP
    DIFF1, DIFF2: REAL;
END_VAR

(* Check if input is within the specified range *)
IF (IN_R >= IN_MIN) AND (IN_R <= IN_MAX) THEN
    (* Calculate the differences between the input and output ranges *)
    DIFF1 := OUT_MAX - OUT_MIN;
    DIFF2 := IN_MAX - IN_MIN;

    (* Calculate the scaled temperature value within the output range *)
    OUT_R := OUT_MIN + ((IN_R - IN_MIN) / DIFF2) * DIFF1;

    (* Set FEH (Function Executed Healthy) to TRUE *)
    FEH := TRUE;
ELSE
    (* Set FEH to FALSE if input is outside the specified range *)
    FEH := FALSE;
END_IF
