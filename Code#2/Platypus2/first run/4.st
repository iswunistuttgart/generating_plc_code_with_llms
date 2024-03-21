// 54.82225155830383s
// 2
IF (aiLevel < 1) THEN
    DO_ALARM := TRUE;
ELSEIF (aiLevel > 99) THEN
    DO_HIGH := TRUE;
ELSEIF (aiLevel > 50) THEN
    DO_OK := TRUE;
ELSEIF (aiLevel < 10) THEN
    DO_LOW := TRUE;
END_CASE;