// 19.88591504096985s
// 4
```c
FUNCTION_BLOCK PLC_PROGRAM
VAR_INPUT
    YEAR : INT;
END_VAR
VAR_OUTPUT
    LEAPYEAR : BOOL;
END_VAR
IF (YEAR MOD 4 = 0) AND ((YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0)) THEN
    LEAPYEAR := TRUE;
ELSE
    LEAPYEAR := FALSE;
END_IF
```