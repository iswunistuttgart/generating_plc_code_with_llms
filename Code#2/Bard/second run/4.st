// 4.93s
// 2
VAR
  aiLevel : INT;
  PercentLevel : UINT;
  doLow : BOOL;
  doOk : BOOL;
  doHigh : BOOL;
  doAlarm : BOOL;
END_VAR

CASE aiLevel
  WHEN 0..500 THEN
    PercentLevel := 0;
    doLow := TRUE;
    doOk := FALSE;
    doHigh := FALSE;
    doAlarm := FALSE;
  WHEN 501..1500 THEN
    PercentLevel := (aiLevel - 500) * 2;
    doLow := FALSE;
    doOk := TRUE;
    doHigh := FALSE;
    doAlarm := FALSE;
  WHEN 1501..32767 THEN
    PercentLevel := (aiLevel - 1500) * 4 + 50;
    doLow := FALSE;
    doOk := FALSE;
    doHigh := TRUE;
    doAlarm := FALSE;
  END_CASE;

IF PercentLevel < 1 THEN
  doAlarm := TRUE;
END_IF;