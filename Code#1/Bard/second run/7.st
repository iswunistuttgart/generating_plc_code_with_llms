//13.74s
// 2
PROGRAM Crane
CONST
  NUMBER_OF_LOAD_RECEPTORS: INT := 5;
  MAXIMUM_LOAD_VALUE: INT := 32767;

VAR
  loadValues: ARRAY[1..NUMBER_OF_LOAD_RECEPTORS] OF INT;
  totalLoad: INT;
  averageLoad: REAL;

(* Read load values from analog inputs *)
FOR i := 1 TO NUMBER_OF_LOAD_RECEPTORS DO
  loadValues[i] := ReadAnalogInput(i);
END_FOR;

(* Calculate total load *)
totalLoad := 0;
FOR i := 1 TO NUMBER_OF_LOAD_RECEPTORS DO
  totalLoad := totalLoad + loadValues[i];
END_FOR;

(* Calculate average load *)
averageLoad := REAL(totalLoad) / REAL(NUMBER_OF_LOAD_RECEPTORS);

(* Output total load and average load *)
WriteAnalogOutput(1, totalLoad);
WriteAnalogOutput(2, averageLoad);

END_PROGRAM
