// 6.4s
// 2
FUNCTION FC1003(IN: REAL; IN_MIN: REAL; IN_MAX: REAL; OUT_MIN: REAL; OUT_MAX: REAL): REAL;

VAR
  range_factor: REAL;
  scaled_value: REAL;

BEGIN

  // Calculate range factor
  range_factor := (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);

  // Scale input value
  scaled_value := IN - IN_MIN;

  // Convert scaled value to output range
  FC1003 := scaled_value * range_factor + OUT_MIN;

  RETURN FC1003;
END_FUNCTION