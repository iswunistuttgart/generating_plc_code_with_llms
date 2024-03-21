// 9.368720054626465s
// 2
IF container.level < low THEN
    output.level = 0;
ELSE IF container.level > ok THEN
    output.level = 100;
ELSE 
    output.level = (container.level - low) * 100 / (ok - low);
END IF;