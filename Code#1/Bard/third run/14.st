// 9.13s
// 2
FUNCTION FC1001(current_value: REAL, switching_value: REAL, hysteresis_percent: REAL): BOOL;
VAR
  previous_value: REAL;
  hysteresis_value: REAL;
  output_state: BOOL;

BEGIN

  // Initialize variables on first call
  IF NOT FC1001_initialized THEN
    previous_value := current_value;
    FC1001_initialized := TRUE;
  END_IF;

  // Calculate hysteresis value
  hysteresis_value := switching_value * hysteresis_percent / 100.0;

  // Determine output state based on current value and hysteresis
  IF current_value > switching_value + hysteresis_value THEN
    output_state := TRUE;
  ELSIF current_value < switching_value - hysteresis_value THEN
    output_state := FALSE;
  ELSE
    output_state := previous_value; // Maintain previous state to prevent fluttering
  END_IF;

  // Update previous value for next call
  previous_value := current_value;

  FC1001 := output_state;
END_FUNCTION