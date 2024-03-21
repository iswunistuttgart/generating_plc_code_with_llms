// 102.11876630783081s
// 3
```
FUNCTION BURNER : BOOL;
VAR
    PRE_HEAT : BOOL;
    OIL_TEMP : BOOL;
    STAGE2 : BOOL;
    RST : BOOL;
    IN : BOOL;
    FAIL : BOOL;
    STATUS : UINT;
END_VAR
IF (IN = FALSE) THEN
    PRE_HEAT := FALSE;
    OIL_TEMP := FALSE;
    STAGE2 := FALSE;
    RST := FALSE;
    FAIL := FALSE;
    STATUS := 110;
END_IF;
IF (IN = TRUE) THEN
    IF (PRE_HEAT = FALSE) THEN
        PRE_HEAT := TRUE;
        OIL_TEMP := FALSE;
        STAGE2 := FALSE;
        RST := FALSE;
        FAIL := FALSE;
        STATUS := 111;
    END_IF;
    IF (PRE_HEAT = TRUE) THEN
        IF (OIL_TEMP = FALSE) THEN
            OIL_TEMP := TRUE;
            STAGE2 := FALSE;
            RST := FALSE;
            FAIL := FALSE;
            STATUS := 112;
        END_IF;
        IF (OIL_TEMP = TRUE) THEN
            IF (STAGE2 = FALSE) THEN
                STAGE2 := TRUE;
                RST := FALSE;
                FAIL := FALSE;
                STATUS := 113;
            END_IF;
            IF (STAGE2 = TRUE) THEN
                IF (RST = FALSE) THEN
                    RST := TRUE;
                    FAIL := FALSE;
                    STATUS := 110;
                END_IF;
                IF (RST = TRUE) THEN
                    IF (FAIL = FALSE) THEN
                        FAIL := TRUE;
                        STATUS := 9;
                    END_IF;
                    IF (FAIL = TRUE) THEN
                        FAIL := FALSE;
                        STATUS := 110;
                    END_IF;
                END_IF;
            END_IF;
        END_IF;
    END_IF;
END_IF;
BURNER := (PRE_HEAT AND OIL_TEMP) OR STAGE2;
```