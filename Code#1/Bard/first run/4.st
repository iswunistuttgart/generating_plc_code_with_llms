//12.27s
// 2
(* Program to monitor fill level in a container *)

VAR
  fillLevelAnalog: INT; (* Analog value of fill level (0-32767) *)
  fillLevelPercent: REAL; (* Fill level in percent (0-100%) *)
  isLow: BOOL; (* Fill level is low *)
  isOk: BOOL; (* Fill level is ok *)
  isHigh: BOOL; (* Fill level is high *)
  isWarningHornOn: BOOL; (* Warning horn is on *)

(* Main program *)
PROGRAM Main
BEGIN
  fillLevelAnalog := ReadAnalogInput();
  fillLevelPercent := ConvertAnalogToPercent(fillLevelAnalog);

  CASE fillLevelPercent OF
    0.0 TO 1.0:
      isLow := TRUE;
      isOk := FALSE;
      isHigh := FALSE;
      isWarningHornOn := TRUE;
    1.1 TO 30.0:
      isLow := FALSE;
      isOk := TRUE;
      isHigh := FALSE;
      isWarningHornOn := FALSE;
    30.1 TO 90.0:
      isLow := FALSE;
      isOk := TRUE;
      isHigh := FALSE;
      isWarningHornOn := FALSE;
    90.1 TO 100.0:
      isLow := FALSE;
      isOk := FALSE;
      isHigh := TRUE;
      isWarningHornOn := FALSE;
  END_CASE;

  WriteOutput(isLow, isOk, isHigh, isWarningHornOn);
END_PROGRAM

(* Function to convert analog value to percent *)
FUNCTION ConvertAnalogToPercent(analogValue: INT): REAL
VAR
  percent: REAL;
BEGIN
  percent := (REAL)analogValue / 32767.0 * 100.0;
  RETURN(percent);
END_FUNCTION