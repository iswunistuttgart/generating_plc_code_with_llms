// 7.6s
// 2
FUNCTION FC1001 :BOOL
VAR_INPUT
  MEW: REAL;
  SP: REAL;
  HYS: REAL;
END_VAR
VAR_IN_OUT
   OUT:BOOL;
END_VAR
VAR
   P_HYS: REAL;
END_VAR

FC1001 := TRUE;

IF MEW >= SP THEN
  P_HYS := SP * HYS;
  IF MEW - P_HYS > 0 THEN
    OUT := FALSE;
  ENDIF;
ELSE
  P_HYS := SP * HYS;
  IF MEW + P_HYS < 0 THEN
    OUT := TRUE;
  ENDIF;
ENDIF;

RETURN OUT;
END_FUNCTION