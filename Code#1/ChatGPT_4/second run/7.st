//31.16s
// 4
PROGRAM CraneLoadCalculation
VAR
    aiLoadReceptor1: INT; // Analog input from load receptor 1
    aiLoadReceptor2: INT; // Analog input from load receptor 2
    aiLoadReceptor3: INT; // Analog input from load receptor 3
    aiLoadReceptor4: INT; // Analog input from load receptor 4
    aiLoadReceptor5: INT; // Analog input from load receptor 5
    rTotalLoad: REAL;     // Variable for total load
    rAverageLoad: REAL;   // Variable for average load
END_VAR

VAR CONSTANT
    NUM_RECEPTORS: INT := 5; // Constant for the number of load receptors
    MAX_ANALOG_VALUE: INT := 32767; // Constant for maximum analog value
END_VAR

VAR
    arLoadValues: ARRAY[1..NUM_RECEPTORS] OF INT; // Array to store load values
    i: INT; // Loop counter
END_VAR

// Assign analog values to the array
arLoadValues[1] := aiLoadReceptor1;
arLoadValues[2] := aiLoadReceptor2;
arLoadValues[3] := aiLoadReceptor3;
arLoadValues[4] := aiLoadReceptor4;
arLoadValues[5] := aiLoadReceptor5;

rTotalLoad := 0; // Initialize total load

// Calculate total load using a FOR loop
FOR i := 1 TO NUM_RECEPTORS DO
    rTotalLoad := rTotalLoad + arLoadValues[i];
END_FOR

// Calculate average load
rAverageLoad := rTotalLoad / NUM_RECEPTORS;

END_PROGRAM
