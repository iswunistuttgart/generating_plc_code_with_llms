// 6.18s
// 2
VAR CONSTANT
  MAXNUMBERS : UINT := 99;
END_VAR

VAR
  aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
  nCnt : INT;
END_VAR

FOR nCnt := 0 TO MAXNUMBERS DO
  aNumbers[nCnt] := RAND();
END_FOR;

REPEAT
  IF aNumbers[nCnt] = 10 THEN
    EXIT;
  END_IF;

  IF aNumbers[nCnt] = targetNum THEN
    FOUND := TRUE;
    EXIT;
  END_IF;

  nCnt := nCnt + 1;
UNTIL (nCnt = MAXNUMBERS) OR FOUND;

IF FOUND THEN
  Write_To_Display("Number found:", targetNum);
ELSE
  Write_To_Display("Number not found:", targetNum);
END_IF;