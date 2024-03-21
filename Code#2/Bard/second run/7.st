// 5.28s
// 2
VAR CONSTANT
  MAX_INDEX: USINT := 4;
END_VAR

VAR
  (*-- array of weights *)
  aWeights : ARRAY[0..MAX_INDEX] OF INT;
  (*-- index counter *)
  iCnt : USINT;
  (*-- sum of weights *)
  sumWeight : DINT;
  (*-- average of weights *)
  avgWeight : INT;
END_VAR

FOR iCnt := 0 TO MAX_INDEX - 1 DO
  aWeights[iCnt] := Read_Analog_Input(iCnt);
  sumWeight := sumWeight + aWeights[iCnt];
END_FOR;

avgWeight := sumWeight / MAX_INDEX;

Write_To_Display("Total Weight:", sumWeight);
Write_To_Display("Average Weight:", avgWeight);