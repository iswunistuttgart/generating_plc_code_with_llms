// 22.272629976272583s
// 3
```
PROGRAM AlarmExample
VAR
    xAlarm1 : BOOL;
    xAlarm2 : BOOL;
    xAllOn  : BOOL;
    xAllOff : BOOL;
END_VAR

IF (xAllOn) THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
ELSIF (xAllOff) THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
END_IF
```