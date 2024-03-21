//10.45s
// 2
PROGRAM GateController

VAR
  Start_Loop: BOOL;
  Gate_Open: BOOL;
  App_Or_Car_Sensed: BOOL;
  Auth_String: STRING(10);
  One_Hour_Timer: TIME;

BEGIN

  // Check if the start loop signal is active
  IF Start_Loop THEN
    // Start the one-hour timer
    TON(IN := TRUE, PT := #1H, Q := One_Hour_Timer);

    // Check if the gate is open and the timer has timed out
    IF Gate_Open AND One_Hour_Timer.ET THEN
      // Close the gate
      Gate_Open := FALSE;
    END_IF;

    // Check if the app or car is sensed and the authentication string matches
    IF App_Or_Car_Sensed AND Auth_String = 'my_defined_str' THEN
      // Open the gate
      Gate_Open := TRUE;
    END_IF;
  ELSE
    // Stop the one-hour timer
    TOF(IN := One_Hour_Timer.Q, PT := #1H, Q := One_Hour_Timer);
  END_IF;

END_PROGRAM