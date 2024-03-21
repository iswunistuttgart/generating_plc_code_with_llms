//11.85s
//2
PROGRAM TrafficLightControl
VAR
    North_green: BOOL := FALSE;
    North_yellow: BOOL := FALSE;
    North_red: BOOL := FALSE;
    East_green: BOOL := FALSE;
    East_yellow: BOOL := FALSE;
    East_red: BOOL := FALSE;
    TrafficLightTimer: TON := (PT := T#10000ms);
END_VAR

METHOD ControlTrafficLights
    IF NOT TrafficLightTimer.IN THEN
        // Timer has not started yet, initialize the lights
        North_green := TRUE;
        East_red := TRUE;
    ELSE
        IF TrafficLightTimer.Q THEN
            // Timer has completed one cycle, reset it
            TrafficLightTimer(IN := FALSE);
        ELSE
            // Traffic light sequence within one cycle
            IF TrafficLightTimer.ET > T#0ms AND TrafficLightTimer.ET <= T#5000ms THEN
                North_green := TRUE;
                East_red := TRUE;
                North_yellow := FALSE;
                East_yellow := FALSE;
                North_red := FALSE;
            ELSIF TrafficLightTimer.ET > T#5000ms AND TrafficLightTimer.ET <= T#5500ms THEN
                North_green := FALSE;
                North_yellow := TRUE;
                North_red := FALSE;
            ELSIF TrafficLightTimer.ET > T#5500ms AND TrafficLightTimer.ET <= T#9500ms THEN
                North_green := FALSE;
                East_red := FALSE;
                North_yellow := FALSE;
                East_yellow := FALSE;
                North_red := TRUE;
                East_green := TRUE;
            ELSIF TrafficLightTimer.ET > T#9500ms AND TrafficLightTimer.ET <= T#10000ms THEN
                East_green := FALSE;
                East_yellow := TRUE;
                East_red := FALSE;
            END_IF
        END_IF
    END_IF
END_METHOD

END_PROGRAM
