// 26.41s
// 2
VAR
    aiLevel : INT;           (* Analog input representing the fill level *)
    PercentLevel : UINT;     (* Fill level as a percentage *)
    doLow : BOOL;            (* Output for low level indication *)
    doOk : BOOL;             (* Output for ok level indication *)
    doHigh : BOOL;           (* Output for high level indication *)
    doAlarm : BOOL;          (* Output for alarm indication *)
END_VAR

(* Convert the analog input to a percentage *)
PercentLevel := UINT(aiLevel * 100 / 32767);

(* Check the level and set outputs accordingly *)
CASE PercentLevel OF
    0..1:
        BEGIN
            doLow := TRUE;
            doOk := FALSE;
            doHigh := FALSE;
            doAlarm := TRUE; (* Activate alarm for less than 1% *)
        END
    2..79:
        BEGIN
            doLow := FALSE;
            doOk := TRUE;
            doHigh := FALSE;
            doAlarm := FALSE;
        END
    80..100:
        BEGIN
            doLow := FALSE;
            doOk := FALSE;
            doHigh := TRUE;
            doAlarm := FALSE;
        END
END_CASE;
