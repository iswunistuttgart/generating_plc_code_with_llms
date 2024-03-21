// 70.74627470970154s
// 2
IF (aiLevel < 1) THEN
    doAlarm := TRUE;
ELSEIF (aiLevel > 99) THEN
    doHigh := TRUE;
ELSEIF (aiLevel >= 1 AND aiLevel <= 99) THEN
    doOk := TRUE;
END_IF;
CASE aiLevel OF
    0..1:
        doLow := TRUE;
        2..99:
            doOk := TRUE;
        100..32767:
            doHigh := TRUE;
    ELSE:
        doAlarm := TRUE;
END_CASE;