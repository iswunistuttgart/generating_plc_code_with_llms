//12.63s
// 2
PROGRAM NumberSearch
VAR
  numbers: ARRAY[1..100] OF INT;
  i: INT;
  found: BOOL;

(* Generate random numbers *)
FOR i := 1 TO 100 DO
  numbers[i] := RANDOM(1, 100);
END_FOR;

(* Search for the number 10 *)
i := 1;
found := FALSE;
REPEAT
  IF numbers[i] = 10 THEN
    found := TRUE;
    EXIT;
  END_IF;
  i := i + 1;
UNTIL (i > 100) OR found;

(* Output the result *)
IF found THEN
  WriteOutput("Number 10 found at index " + STR(i));
ELSE
  WriteOutput("Number 10 not found in the list");
END_IF;

END_PROGRAM
