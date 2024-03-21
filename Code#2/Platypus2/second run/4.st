// 66.161550283432s
// 2
IF (aiLevel < 1) THEN
    doAlarm := TRUE;
ELSEIF (aiLevel > 99) THEN
    doAlarm := FALSE;
ELSE
    doAlarm := FALSE;
ENDIF;

CASE aiLevel OF
    0..1:
        doLow := TRUE;
        2..98:
            doOk := TRUE;
            99..32767:
                doHigh := TRUE;
    ELSE:
        doAlarm := FALSE;
END_CASE;