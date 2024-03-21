//9.83s
// 1
(* Program to search for the number 10 in a list of 100 random numbers )
VAR
randNum: INT; ( Random number )
numFound: BOOL; ( Flag indicating whether the number 10 has been found *)

(* Main program )
PROGRAM Main
BEGIN
numFound := FALSE; ( Initialize the flag *)

REPEAT
randNum := Random(101); (* Generate a random number between 0 and 100 (inclusive) *)
IF randNum = 10 THEN
  numFound := TRUE;
  EXIT; (* Exit the loop if the number 10 is found *)
END_IF;
UNTIL (numFound OR (i >= 100)); (* Continue searching until the number is found or the loop iterates 100 times *)

IF numFound THEN
WRITE('Number 10 found in the list');
ELSE
WRITE('Number 10 not found in the list');
END_IF;
END_PROGRAM