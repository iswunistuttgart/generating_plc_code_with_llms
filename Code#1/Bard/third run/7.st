//6.78s
// 2
PROGRAM Crane

(* Define constants *)
CONST
  NUM_LOAD_RECEPTORS: INT := 5;
  MAX_LOAD_VALUE: INT := 32767;

(* Define variables *)
VAR
  loadValues: ARRAY[0..NUM_LOAD_RECEPTORS-1] OF INT;
  totalLoad: INT;
  averageLoad: REAL;

BEGIN

(* Read load values from analog inputs *)
FOR i := 0 TO NUM_LOAD_RECEPTORS-1 DO
  loadValues[i] := ReadAnalogInput(AnalogInputChannel + i);
END_FOR;

(* Calculate total load *)
totalLoad := 0;
FOR i := 0 TO NUM_LOAD_RECEPTORS-1 DO
  totalLoad := totalLoad + loadValues[i];
END_FOR;

(* Calculate average load *)
averageLoad := REAL(totalLoad) / NUM_LOAD_RECEPTORS;

(* Process average load *)
IF averageLoad > MAX_LOAD_VALUE / 2 THEN
  // Overloaded condition
ELSIF averageLoad < MAX_LOAD_VALUE / 4 THEN
  // Underloaded condition
ELSE
  // Normal load condition
END_IF;

END_PROGRAM