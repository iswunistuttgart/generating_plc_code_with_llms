//7.39s
// 2
PROGRAM FillLevelCheck

VAR
  fillLevelAnalogValue: INT;
  fillLevelPercent: REAL;
  lowLevelOutput: BOOL;
  okLevelOutput: BOOL;
  highLevelOutput: BOOL;
  warningHornOutput: BOOL;

BEGIN

  // Read the fill level analog value
  fillLevelAnalogValue := ReadAnalogInput(AnalogInputChannel);

  // Convert the analog value to a percentage
  fillLevelPercent := REAL(fillLevelAnalogValue) / 32767.0 * 100.0;

  // Check the fill level and set the output variables accordingly
  CASE fillLevelPercent OF
    0.0 TO 1.0:
      lowLevelOutput := TRUE;
      okLevelOutput := FALSE;
      highLevelOutput := FALSE;
      warningHornOutput := TRUE;
    1.0 TO 90.0:
      lowLevelOutput := FALSE;
      okLevelOutput := TRUE;
      highLevelOutput := FALSE;
      warningHornOutput := FALSE;
    90.0 TO 100.0:
      lowLevelOutput := FALSE;
      okLevelOutput := FALSE;
      highLevelOutput := TRUE;
      warningHornOutput := FALSE;
    ELSE:
      // Invalid fill level
  END_CASE;

  // Write the output variables to the outputs
  WriteDigitalOutput(LowLevelOutputChannel, lowLevelOutput);
  WriteDigitalOutput(OkLevelOutputChannel, okLevelOutput);
  WriteDigitalOutput(HighLevelOutputChannel, highLevelOutput);
  WriteDigitalOutput(WarningHornOutputChannel, warningHornOutput);

END_PROGRAM