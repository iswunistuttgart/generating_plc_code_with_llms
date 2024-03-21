// 7.85s
// 2
VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR

VAR
    NumberToFind : INT := 10;
    bNumberFound : BOOL := FALSE;
END_VAR

(* Initialize array with random numbers for illustration purposes *)
FOR nCnt := 0 TO MAXNUMBERS DO
    aNumbers[nCnt] := RAND(1, 20); (* Replace with actual logic for generating random numbers *)
END_FOR;

(* Search for the specific number in the list *)
nCnt := 0;
REPEAT
    IF aNumbers[nCnt] = NumberToFind THEN
        bNumberFound := TRUE;
        EXIT;
    END_IF;
    nCnt := nCnt + 1;
UNTIL nCnt > MAXNUMBERS OR bNumberFound;

(* Check if the number was found or the end of the list is reached *)
IF bNumberFound THEN
    (* Number found *)
    // Your logic here
ELSE
    (* Number not found in the list *)
    // Your logic here
END_IF;
