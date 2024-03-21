// 83.29438614845276s
// 1
function FC1003(IN_MIN, IN_MAX, OUT_MIN, OUT_MAX)
if IN_MIN > IN_MAX then
return -256.0;
else if IN_MIN < 0 then
return -256.0 + (((IN_MIN * (OUT_MAX - OUT_MIN)) / (IN_MAX - IN_MIN)) * 100);
else if IN_MAX > 255 then
return 256.0;
else if IN_MAX < 0 then
return 256.0 + (((IN_MAX * (OUT_MAX - OUT_MIN)) / (IN_MAX - IN_MIN)) * 100);
return ((IN_MIN * (OUT_MAX - OUT_MIN)) / (IN_MAX - IN_MIN)) * 100;