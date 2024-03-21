// 10.12s
// 2
VAR
  lastI1Value: BOOL; (* Boolean variable to store the previous value of I1 *)
  lastI2Value: BOOL; (* Boolean variable to store the previous value of I2 *)
  interlockTime: TIMER; (* Timer for interlock dead time *)
  outputQ1: BOOL; (* Boolean variable to control output Q1 *)
  outputQ2: BOOL; (* Boolean variable to control output Q2 *)

BEGIN
  interlockTime := TIMER;
  lastI1Value := FALSE;
  lastI2Value := FALSE;

  WHILE TRUE DO
    IF I1 THEN
      (* Check if interlock time is over *)
      IF (interlockTime.ET >= TL) THEN
        outputQ1 := TRUE;
      END_IF;
    ELSE
      outputQ1 := FALSE;
    END_IF;

    IF I2 THEN
      (* Check if interlock time is over *)
      IF (interlockTime.ET >= TL) THEN
        outputQ2 := TRUE;
      END_IF;
    ELSE
      outputQ2 := FALSE;
    END_IF;

    (* Update interlock time *)
    interlockTime.IN := FALSE;

    (* Delay for 1 millisecond to avoid excessive processing *)
    DELAY 0.001;
  END_WHILE;

  (* Update output devices based on output variables *)
  WriteOutput(outputQ1, outputQ1Output);
  WriteOutput(outputQ2, outputQ2Output);