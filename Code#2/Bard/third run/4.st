// 6.8s
// 2
VAR
  aiLevel : INT;
  PercentLevel : UINT;
  doLow : BOOL := FALSE;
  doOk : BOOL := FALSE;
  doHigh : BOOL := FALSE;
  doAlarm : BOOL := FALSE;
END_VAR

PROGRAM main

CASE aiLevel
  WHEN 0 TO AI_LOW_LEVEL THEN
    doLow := TRUE;

  WHEN AI_LOW_LEVEL + 1 TO AI_OK_LEVEL THEN
    doLow := FALSE;
    doOk := TRUE;

  WHEN AI_OK_LEVEL + 1 TO AI_HIGH_LEVEL THEN
    doLow := FALSE;
    doOk := FALSE;
    doHigh := TRUE;

  WHEN AI_HIGH_LEVEL + 1 TO 32767 THEN
    doLow := FALSE;
    doOk := FALSE;
    doHigh := FALSE;
END_CASE;

IF PercentLevel < 1 THEN
  doAlarm := TRUE;
END_IF;

END_PROGRAM