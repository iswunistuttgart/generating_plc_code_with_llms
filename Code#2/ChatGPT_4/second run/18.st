// 37.69s
// 4
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R : REAL;      (* Input real value *)
    IN_MAX : REAL;    (* Input range maximum *)
    IN_MIN : REAL;    (* Input range minimum *)
    OUT_MAX : REAL;   (* Output range maximum *)
    OUT_MIN : REAL;   (* Output range minimum *)
END_VAR
VAR_OUTPUT
    OUT_R : REAL;     (* Output real value *)
    FEH : BOOL;       (* Error flag in case of invalid range *)
END_VAR
VAR_TEMP
    DIFF1 : REAL;     (* Temporary variable for differences *)
    DIFF2 : REAL;     (* Temporary variable for differences *)
END_VAR

(* Check for valid input range to avoid division by zero *)
IF IN_MAX <= IN_MIN THEN
    FEH := TRUE;
    RETURN;
END_IF;

(* Calculate the differences *)
DIFF1 := IN_MAX - IN_MIN;
DIFF2 := OUT_MAX - OUT_MIN;

(* Map the input value to the output range *)
OUT_R := OUT_MIN + ((IN_R - IN_MIN) * DIFF2) / DIFF1;

(* Set the error flag to false as no error occurred *)
FEH := FALSE;

END_FUNCTION
