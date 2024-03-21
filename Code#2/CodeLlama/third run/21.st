// 435.3805413246155s
// 2
```
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN : BOOL;
    STAGE2 : BOOL;
    OVER_TEMP : BOOL;
    OIL_TEMP : BOOL := TRUE;
    FLAME : BOOL;
    RST : BOOL;
    RST_TIMER : BOOL;
    PRE_HEAT_TIME : TIME := t#5s;
    PRE_VENT_TIME : TIME := t#15s;
    PRE_IGNITE_TIME : TIME := t#15s;
    POST_IGNITE_TIME : TIME := t#25s;
    STAGE2_DELAY : TIME := t#10s;
    SAFETY_TIME : TIME := t#5s;
    LOCKOUT_TIME : TIME := t#10s;
    MULTIPLE_IGNITION : BOOL := TRUE;
    KW1 : REAL;
    KW2 : REAL;
END_VAR
VAR_OUTPUT
    MOTOR : BOOL;
    COIL1 : BOOL;
    COIL2 : BOOL;
    PRE_HEAT : BOOL;
    IGNITE : BOOL;
    FAIL : BOOL;
    KWH : REAL;
    STATUS : BYTE;
END_VAR
VAR_IN_OUT
    RUNTIME1 : UDINT;
    RUNTIME2 : UDINT;
    CYCLES : UDINT;
END_VAR
VAR
    state : INT;
    last : TIME;
    tx : TIME;
    last_change : TIME;
    timer1 : TON;
    timer2 : TON;
    oil_temp_last : BOOL;
    cycles2 : UDINT;
END_VAR

IF IN THEN
    IF NOT OVER_TEMP THEN
        IF NOT FLAME THEN
            IF NOT RST THEN
                IF NOT RST_TIMER THEN
                    state := 110;
                    last := TIME;
                    tx := PRE_HEAT_TIME;
                    timer1.PT := PRE_HEAT_TIME;
                    timer2.PT := STAGE2_DELAY;
                    IF NOT OIL_TEMP THEN
                        oil_temp_last := FALSE;
                    ELSE
                        oil_temp_last := TRUE;
                    END_IF;
                ELSE
                    state := 113;
                    last := TIME;
                    tx := STAGE2_DELAY;
                    timer1.PT := PRE_HEAT_TIME;
                     _TIME;
                      ;
                  
                                                                                                   
                 0_TIME;
                                                                                                                                                                                                                                                    TIME;
                                                                                                                                                                                                                                                                                                     _TIME;
                                                                                                                                      ;
                                                                                  
                 0_TIME;
                                                                                                                                                                                                    TIME;
                   
                    TIME;
                                                                                                                                                     _TIME;
                                                                                                                                                                                      ;
                                  
                 0_TIME;
                                                                                                                                                                                                                                                                                                                                                    TIME;
                                                                                                                                                     _TIME;
                                                                                                                                                                                                                                                      ;
                 0_TIME;
                                                                  
                                                                                                                                                                                                   
                    TIME;
                                                                                                                                                     _TIME;
                                                                                                                                                                                                                                                      ;
                 0_TIME;
                                                                  
                                                                                                                                                                                                                                                    TIME;
                                                                                                                                                     _TIME;
                                                                                                                                                                                                                                                      ;
                 0_TIME;
                                                                  
                                                                                                                                                                                                                                                    TIME;
                                                                                                                                                     _TIME;
                                                                                                                                                                                                                                   
                    ;
                 0_TIME;
                     
                  
                                                                                                                                                                                                                                    TIME;
                                                                                                                                     _TIME;
                                                                                                                                                                                                                                   
                    ;
                 0_TIME;
                   
                                                      _TIME;
                  
                                                                                                                                                                                                                                                                                                                     TIME;
                    _TIME;
                                                                                                                                                                                                                                                 0_TIME;
                                                                                                      ;
                                                  
                                                                                                                                                                                                                                                                                                                     TIME;
                    _TIME;
                                                                                                                                                                                                                                                 0_TIME;
                                                                                                                                      ;
                  
                        TIME;
                                                                                                                                                                                                                     _TIME;
                   
                                                                                                                                                   
                   
                                                                 0_TIME;
                                                                                                                                      ;
                  
                                                                                                                                                                                                                                                                                                                     _TIME;
                                                                                                        TIME;
                                                                    TIME;
                 0_TIME;
                                                                                                                                    ;
                                      _TIME;
                  
                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                 0_TIME;
                                                                                                                                    TIME;
                                                                                                   ;
                                                                                                      _TIME;
                    
                                                                                                                                                                   
                   
                                                                                                                                 0_TIME;
                                                                                                                                                                                    TIME;
                                                   ;
                                                                                                      _TIME;
                    
                                                                                                                                                                                                                                                                                                   
                   
                 0_TIME;
                                                                                                                                                                                                                                                                                                   ;
                     _TIME;
                      TIME;
                                                                                                                                   
                   
                                                                                                                                                                                                                 0_TIME;
                                                                                                                                                                                                                                                                                                   ;
                     _TIME;
                    TIME;
                     
                                                                                                                                                                                                   
                    _TIME;
                                                 0_TIME;
                   
                    TIME;
                                                                                                                                                   ;
                    
                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                    _TIME;
                 0_TIME;
                    TIME;
                   
                                                                                   ;
                    
                                                                                                                                                   
                    TIME;
                     
                                                                                                                                                                                                                                                                                                                 0_TIME;
                                                                                                                                                                                                                                   ;
                     _TIME;
                                                                                                                                                    TIME;
                    ;
                     
                                                                                                                                                                                                                                                 0_TIME;
                                                                                                                        TIME;
                                  
                                     _TIME;
                                                                                                                   
                   
                                                                                                                      ;
                   
                                                                                                                                                                                 0_TIME;
                                                                                                                                                                                                                                                                  
                     _TIME;
                                                                                                                                                                                                                                                                                                      ;
                    TIME;
                                                                   
                   
                 0_TIME;
