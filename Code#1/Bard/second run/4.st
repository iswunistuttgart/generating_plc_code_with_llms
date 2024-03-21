//8.39s
// 2
PROGRAM FillLevelCheck
VAR
  fillLevelAnalog: INT;
  fillLevelPercent: REAL;
  lowOutput: BOOL;
  okOutput: BOOL;
  highOutput: BOOL;
  warningHorn: BOOL;

(* Read fill level analog value *)
fillLevelAnalog := ReadAnalogInput(1);

(* Convert fill level analog value to percentage *)
fillLevelPercent := fillLevelAnalog * 100.0 / 32767.0;

(* Determine fill level range *)
CASE fillLevelPercent OF
  0.0 TO 1.0:
    lowOutput := TRUE;
    okOutput := FALSE;
    highOutput := FALSE;
    warningHorn := TRUE;
  1.0 TO 95.0:
    lowOutput := FALSE;
    okOutput := TRUE;
    highOutput := FALSE;
    warningHorn := FALSE;
  ELSE:
    lowOutput := FALSE;
    okOutput := FALSE;
    highOutput := TRUE;
    warningHorn := FALSE;
END_CASE;

(* Set outputs *)
WriteDigitalOutput(1, lowOutput);
WriteDigitalOutput(2, okOutput);
WriteDigitalOutput(3, highOutput);
WriteDigitalOutput(4, warningHorn);

END_PROGRAM
