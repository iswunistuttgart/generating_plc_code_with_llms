// 29.920950174331665s
// 2
// IEC 61131-3 Structured Text Program of a Fill Level Check
// fill level in a container should be monitored in three ranges: low, ok and high
// use one output each for low,ok and high
// the fill level is read in via an analog value (0 - 32767) and should be converted internally to 0-100%
IF aiLevel <= 32767 THEN
    PercentLevel = 100;
ELSE
    PercentLevel = (aiLevel * 100) / 32767;
END_IF
// check if the content falls below 1%
DO_IF(PercentLevel < 1)
    PlaySound("WarningHorn");
END_DO_IF
// solve this application by using CASE instruction
CASE PercentLevel
    WHEN 0 THEN
        doLow = TRUE;
    WHEN 25 THEN
        doOk = TRUE;
    WHEN 50 THEN
        doHigh = TRUE;
    WHEN 75 THEN
        doAlarm = TRUE;
    END_CASE