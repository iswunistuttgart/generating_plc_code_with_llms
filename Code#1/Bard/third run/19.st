// 8.77s
// 2
FUNCTION_BLOCK FB1005

VAR
  START: BOOL;
  THICKNESS: BYTE;
  V_MAX: REAL;
  V_MIN: REAL;
  D_MAX: BYTE;
  D_MIN: BYTE;

  M_MAX: REAL;
  M_MIN: REAL;
  reject: BOOL;

BEGIN

  // Initialize variables
  M_MAX := 0.0;
  M_MIN := 0.0;
  reject := FALSE;

  // Read start signal
  START := SensorS1;

  // Read thickness
  THICKNESS := MD_1;

  // Check for new measurement
  IF START AND NOT reject THEN
    // Reset reject flag and minimum and maximum thickness values
    reject := FALSE;
    M_MAX := 0.0;
    M_MIN := 0.0;

    // Calculate thickness from laser measurements
    M_MAX := laser_measurement1 - laser_measurement2;

    // Check if thickness is outside tolerance
    IF M_MAX > V_MAX OR M_MAX < V_MIN THEN
      reject := TRUE;
      P1 := TRUE;
    END_IF;

    // Update minimum thickness value
    IF M_MIN = 0.0 OR M_MIN > M_MAX THEN
      M_MIN := M_MAX;
    END_IF;
  END_IF;

  // Write maximum thickness value to output
  D_MAX := INT(M_MAX);

  // Write minimum thickness value to output
  D_MIN := INT(M_MIN);

END_FUNCTION_BLOCK