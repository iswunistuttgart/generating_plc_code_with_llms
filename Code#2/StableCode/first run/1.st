// 31.137200593948364s
// 2

var
		xAllOn, xAllOff : BOOL;
		xAlar1, xAlar2 : BOOL;

end var

CASE xAlar1 OF
	xAlar1 := TRUE;
	xAlarm2 := FALSE;
	xAlar2 := FALSE;
	xAlar1 := xAlar2 := FALSE;
	xAllOn := TRUE;
	xAllOff := FALSE;
	xAlar1 := xAlar2 := xAllOff := xAllOn := FALSE;
	xAlarm2 := TRUE;
END_CASE

CASE xAlar2 OF
	xAlar2 := TRUE;
	xAlarm1 := FALSE;
	xAlar1 := FALSE;
	xAlar2 := FALSE;
	xAllOn := TRUE;
	xAllOff := FALSE;
	xAlar1 := xAlar2 := xAllOff := xAllOn := FALSE;
	xAlarm1 := TRUE;
END_CASE