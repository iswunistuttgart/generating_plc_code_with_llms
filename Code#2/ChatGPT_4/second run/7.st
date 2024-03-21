// 18.24s
// 2
VAR CONSTANT
    MAX_INDEX: USINT := 4;  (* Represents the highest index for load receptors *)
END_VAR

VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT;  (* Array of load values from receptors *)
    iCnt : USINT;                           (* Loop counter *)
    sumWeight : DINT;                       (* Total sum of weights *)
    avgWeight : INT;                        (* Average weight *)
END_VAR

(* Initialize sum *)
sumWeight := 0;

(* Calculate the sum of the weights *)
FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR;

(* Calculate the average weight, dividing by the number of receptors *)
avgWeight := sumWeight / (MAX_INDEX + 1);
