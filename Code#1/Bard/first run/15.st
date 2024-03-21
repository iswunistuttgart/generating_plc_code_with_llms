// 16.13s
// 1
FUNCTION FC1002(sensorInput: BOOL, manualSwitch: BOOL, hornOutput: BOOL, alarmOutput: BOOL, indicatorOutput: BOOL):
VAR
sensorState: BOOL; (* Flag indicating the current sensor state )
presenceTimer: TOF; ( Timer for object presence detection )
alarmEnabled: BOOL; ( Flag indicating whether the alarm is enabled *)

BEGIN
sensorState := sensorInput; (* Update sensor state *)

(* Update presence timer )
presenceTimer.IN := sensorState; ( Start/stop timer based on sensor state *)

(* Determine alarm state )
IF presenceTimer.Q AND presenceTimer.ET >= 3000 THEN
alarmEnabled := TRUE; ( Alarm condition met after 3 seconds )
ELSE
alarmEnabled := FALSE; ( Alarm condition not met or reset *)
END_IF;

(* Control outputs )
hornOutput := sensorState AND NOT alarmEnabled; ( Horn on for approach, off for alarm )
alarmOutput := alarmEnabled AND manualSwitch; ( Alarm on for alarm condition and manual switch on )
indicatorOutput := manualSwitch; ( Indicator on when manual switch is on *)
END_FUNCTION

VAR
  sensorInput: BOOL; (* Analog input value from ultrasonic sensor *)
  manualSwitch: BOOL; (* Input value from manual switch E_A *)
  hornOutput: BOOL; (* Output signal for horn P_HU *)
  alarmOutput: BOOL; (* Output signal for alarm P_AL *)
  indicatorOutput: BOOL; (* Output signal for indicator P1 *)

sensorInput := ReadAnalogInput(sensorInput);
manualSwitch := ReadInput(manualSwitchInput);

(* Call FC1002 to update outputs based on sensor input and manual switch *)
FC1002(sensorInput, manualSwitch, hornOutput, alarmOutput, indicatorOutput);

(* Control output devices based on updated output variables *)
WriteOutput(hornOutput, hornOutputDevice);
WriteOutput(alarmOutput, alarmOutputDevice);
WriteOutput(indicatorOutput, indicatorOutputDevice);