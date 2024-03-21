//12.15s
// 2
PROGRAM NumberSearch

VAR
  numbers: ARRAY[0..99] OF INT;
  targetNumber: INT := 10;
  found: BOOL := FALSE;
  index: INT;

BEGIN

  // Initialize the list with random numbers
  FOR index := 0 TO 99 DO
    numbers[index] := RANDOM(1, 100);
  END_FOR;

  index := 0;

  REPEAT
    IF numbers[index] = targetNumber THEN
      found := TRUE;
      EXIT;
    END_IF;

    index := index + 1;
  UNTIL index = 100;

  // Handle the result
  IF found THEN
    WRITE_STRING('The number ' + STRING(targetNumber) + ' was found at index ' + STRING(index));
  ELSE
    WRITE_STRING('The number ' + STRING(targetNumber) + ' was not found in the list');
  END_IF;

END_PROGRAM