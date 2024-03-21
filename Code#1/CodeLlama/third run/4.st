// 24.229226112365723s
// 2
```
PROGRAM fill_level_check;
VAR
    analog_value : WORD;
    percentage : REAL;
    low, ok, high : BOOL;
END_VAR;

CASE percentage OF
    0..10 : low := TRUE;
    11..90 : ok := TRUE;
    91..100 : high := TRUE;
END_CASE;

IF analog_value < 1 THEN
    warning_horn := TRUE;
END_IF;
```