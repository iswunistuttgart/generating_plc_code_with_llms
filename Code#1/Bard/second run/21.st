// 13.89s
// 2
FUNCTION_BLOCK BURNER

VAR
  IN: BOOL;                     (* Start burner control input *)
  OVER_TEMP: BOOL;               (* Boiler thermostat protection *)
  OIL_TEMP: BOOL;               (* Oil temperature signal *)
  STAGE2: BOOL;                 (* Stage 2 activation input *)
  RST: BOOL;                    (* Reset input *)
  PRE_HEAT: BOOL;                (* Fuel oil warming output *)
  FAN: BOOL;                    (* Fan output *)
  IGNITION: BOOL;               (* Ignition output *)
  OIL_VALVE: BOOL;               (* Oil valve output *)
  FAIL: BOOL;                   (* Failure output *)
  STATUS: INT;                  (* Status output *)

(* Internal variables *)
  state: INT;
  timer_preheat: TON(TIME);
  timer_prevent: TON(TIME);
  timer_preign: TON(TIME);
  timer_safety: TON(TIME);
  timer_postig: TON(TIME);
  timer_stage2: TON(TIME);
  timer_lockout: TON(TIME);
  multiple_ignition: BOOL;
  last_flame_sensor: BOOL;

(* Initialization *)
state := 110;
timer_preheat.IN := FALSE;
timer_prevent.IN := FALSE;
timer_preign.IN := FALSE;
timer_safety.IN := FALSE;
timer_postig.IN := FALSE;
timer_stage2.IN := FALSE;
timer_lockout.IN := FALSE;
multiple_ignition := FALSE;
last_flame_sensor := FALSE;

(* Start all timers *)
timer_preheat.IN := TRUE;
timer_prevent.IN := TRUE;
timer_preign.IN := TRUE;
timer_safety.IN := TRUE;
timer_postig.IN := TRUE;
timer_stage2.IN := TRUE;
timer_lockout.IN := TRUE;

(* Function logic *)
CASE state OF
  110: (* Standby *)
    IF IN AND NOT OVER_TEMP THEN
      state := 111;
      timer_preheat.IN := TRUE;
      PRE_HEAT := TRUE;
    END_IF;
  111: (* Startup sequence *)
    IF timer_preheat.ET >= PRE_HEAT_TIME THEN
      IF OIL_TEMP THEN
        state := 112;
        FAN := TRUE;
        timer_prevent.IN := TRUE;
      ELSE
        FAIL := TRUE;
        STATUS := 1;
        state := 110;
      END_IF;
    ELSIF last_flame_sensor THEN
      FAIL := TRUE;
      STATUS := 2;
      state := 110;
    END_IF;
  112: (* Burner runs on stage 1 *)
    IF timer_prevent.ET >= PRE_VENTILATION_TIME THEN
      IGNITION := TRUE;
      timer_preign.IN := TRUE;
    ELSIF last_flame_sensor THEN
      FAIL := TRUE;
      STATUS := 3;
      state := 110;
    END_IF;
  113: (* Burner runs on stage 2 *)
    IF STAGE2 AND NOT OVER_TEMP THEN
      state := 112;
      timer_stage2.IN := TRUE;
    END_IF;
  112, 113: (* Stage 1 or 2 running *)
    IF timer_preign.ET >= PRE_IGNITION_TIME THEN
      OIL_VALVE := TRUE;
      timer_safety.IN := TRUE;
    ELSIF OVER_TEMP THEN
      state := 110;
      STATUS := 9;
    END_IF;
    IF timer_safety.ET >= SAFETY_TIME THEN
      FAIL := TRUE;
      STATUS := 4;
      state := 110;
    ELSIF NOT last_flame_sensor THEN
      FAIL := TRUE;
      STATUS := 5;
      IF multiple_ignition THEN
        state := 112;
        timer_prevent.IN := TRUE;
      ELSE
        state := 110;
      END_IF;
    END_IF;
    IF timer_postig.ET >= POST_IGNITION_TIME THEN
      IGNITION := FALSE;
    END_IF;
    IF STAGE2 AND timer_stage2.ET >= STAGE2_DELAY THEN
      state := 
// 30.44s
    IF STAGE2 AND timer_stage2.ET >= STAGE2_DELAY THEN
      state := 113;
      OIL_VALVE := FALSE;
      timer_preign.IN := TRUE;
    END_IF;
  END_CASE;

(* Reset logic *)
IF RST AND NOT OVER_TEMP THEN
  IF timer_lockout.ET >= LOCKOUT_TIME THEN
    state := 110;
    FAIL := FALSE;
    STATUS := 0;
  END_IF;
END_IF;

(* Update last flame sensor state *)
last_flame_sensor := NOT last_flame_sensor;

(* Output assignments *)
OUTPUT
  PRE_HEAT: BOOL;
  FAN: BOOL;
  IGNITION: BOOL;
  OIL_VALVE: BOOL;
  FAIL: BOOL;
  STATUS: INT;

END_FUNCTION_BLOCK
