//86.18s
//2
PROGRAM FillLevelCheck
VAR
    xAnalogValue : INT; (* Input: Fill level as analog value 0-32767 *)
    xFillLevelPercent : REAL; (* Converted fill level in percent *)
    xLowLevel : BOOL; (* Output: Low level indicator *)
    xOkLevel : BOOL; (* Output: OK level indicator *)
    xHighLevel : BOOL; (* Output: High level indicator *)
    xWarningHorn : BOOL; (* Output: Warning horn *)
END_VAR

(* Convert the analog value to a percentage: 0-32767 to 0-100% *)
xFillLevelPercent := (xAnalogValue / 32767) * 100;

(* Determine the fill level range using CASE instruction *)
CASE TRUE OF
    xFillLevelPercent < 1.0:
        xWarningHorn := TRUE; (* Activate warning horn *)
        xLowLevel := TRUE;
        xOkLevel := FALSE;
        xHighLevel := FALSE;
    xFillLevelPercent >= 1.0 AND xFillLevelPercent < 20.0:
        xLowLevel := TRUE; (* Indicate low level *)
        xOkLevel := FALSE;
        xHighLevel := FALSE;
        xWarningHorn := FALSE; (* Deactivate warning horn *)
    xFillLevelPercent >= 20.0 AND xFillLevelPercent < 80.0:
        xLowLevel := FALSE;
        xOkLevel := TRUE; (* Indicate OK level *)
        xHighLevel := FALSE;
        xWarningHorn := FALSE; (* Deactivate warning horn *)
    xFillLevelPercent >= 80.0:
        xLowLevel := FALSE;
        xOkLevel := FALSE;
        xHighLevel := TRUE; (* Indicate high level *)
        xWarningHorn := FALSE; (* Deactivate warning horn *)
END_CASE

END_PROGRAM
