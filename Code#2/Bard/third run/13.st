// 7.75s
// 2
VAR CONSTANT
  MAXNUMBERS : UINT := 99;
END_VAR

VAR
  aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
  nCnt : INT := 0;
END_VAR

PROGRAM main

FOR i := 0 TO 99 DO
  aNumbers[i] := rnd(100);
END_FOR;

nCnt := 0;

REPEAT
  IF aNumbers[nCnt] = 10 THEN
    WRITE("The number 10 was found. Search aborted.");
    EXIT;
  ELSEIF nCnt = MAXNUMBERS THEN
    WRITE("The number " & INT_TO_STRING(searchNumber) & " was not found in the list.");
    EXIT;
  ENDIF;

  WRITE("Searching for the number " & INT_TO_STRING(searchNumber) & "...");
  WAIT;

  nCnt := nCnt + 1;
UNTIL (nCnt = MAXNUMBERS OR aNumbers[nCnt] = searchNumber) OR aNumbers[nCnt] = 10;

END_PROGRAM