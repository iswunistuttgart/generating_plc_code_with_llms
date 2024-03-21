//54.32s
//2
(* Define constants *)
CONST
    NUM_RECEPTORS : INT := 5; (* Number of load receptors *)
    MAX_VALUE : INT := 32767; (* Maximum value for each receptor *)
END_CONST

PROGRAM CraneLoadCalculation
VAR
    aiLoadReceptor1 : INT; (* Analog input value from load receptor 1 *)
    aiLoadReceptor2 : INT; (* Analog input value from load receptor 2 *)
    aiLoadReceptor3 : INT; (* Analog input value from load receptor 3 *)
    aiLoadReceptor4 : INT; (* Analog input value from load receptor 4 *)
    aiLoadReceptor5 : INT; (* Analog input value from load receptor 5 *)
    TotalLoad : INT; (* Sum of loads from all receptors *)
    AverageLoad : REAL; (* Average load across receptors *)
END_VAR

VAR CONSTANT
    MAX_ANALOG_VALUE : INT := MAX_VALUE; (* Replace fixed max value *)
    TOTAL_RECEPTORS : INT := NUM_RECEPTORS; (* Replace fixed count *)
END_VAR

TotalLoad := 0; (* Initialize TotalLoad *)
AverageLoad := 0; (* Initialize AverageLoad *)

(* Sum the loads from all receptors using a FOR loop *)
FOR i := 1 TO TOTAL_RECEPTORS DO
    CASE i OF
        1:
            TotalLoad := TotalLoad + aiLoadReceptor1;
        2:
            TotalLoad := TotalLoad + aiLoadReceptor2;
        3:
            TotalLoad := TotalLoad + aiLoadReceptor3;
        4:
            TotalLoad := TotalLoad + aiLoadReceptor4;
        5:
            TotalLoad := TotalLoad + aiLoadReceptor5;
    END_CASE
END_FOR

(* Calculate the average load *)
AverageLoad := TotalLoad / REAL(TOTAL_RECEPTORS);

END_PROGRAM
