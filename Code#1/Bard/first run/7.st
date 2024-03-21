//12.5s
// 2
(* Program to calculate total load and average load *)

CONST
  NUM_LOAD_RECEPTORS = 5; (* Number of load receptors *)
  MAX_ANALOG_VALUE = 32767; (* Maximum analog input value *)

VAR
  loadValues: ARRAY[0..NUM_LOAD_RECEPTORS - 1] OF REAL; (* Array to store load values *)
  totalLoad: REAL; (* Total load *)
  averageLoad: REAL; (* Average load *)

(* Main program *)
PROGRAM Main
BEGIN
  (* Read load values from analog inputs *)
  FOR i := 0 TO NUM_LOAD_RECEPTORS - 1 DO
    loadValues[i] := ReadAnalogInput(i) / MAX_ANALOG_VALUE;
  END_FOR;

  (* Calculate total load *)
  totalLoad := 0.0;
  FOR i := 0 TO NUM_LOAD_RECEPTORS - 1 DO
    totalLoad := totalLoad + loadValues[i];
  END_FOR;

  (* Calculate average load *)
  averageLoad := totalLoad / NUM_LOAD_RECEPTORS;

  (* Write total load and average load to outputs *)
  WriteOutput(totalLoad, averageLoad);
END_PROGRAM