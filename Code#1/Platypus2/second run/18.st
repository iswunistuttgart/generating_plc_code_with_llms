// 33.85395860671997s
// 2
IF IN_MIN = 0 THEN
OUT_MIN = -20;
ELSE IF IN_MIN > 0 THEN
OUT_MIN = IN_MIN * (-1);
OUT_MIN = OUT_MIN + 20;
ELSE IF IN_MAX < 255 THEN
OUT_MAX = IN_MAX * (-1);
OUT_MAX = OUT_MAX + 20;
ELSE IF IN_MAX > 255 THEN
OUT_MAX = 20;