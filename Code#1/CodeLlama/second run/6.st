// 63.66718077659607s
// 3
```
PROGRAM CraneLift
VAR
	doConvTop : BOOL;
	doConvBottom : BOOL;
	diConvTop : BOOL;
	diConvBottom : BOOL;
	doLiftTop : BOOL;
	doLiftBottom : BOOL;
	diLiftTop : BOOL;
	diLiftBottom : BOOL;
	doConvLift : BOOL;
	diBoxLift : BOOL;
	doLiftUnload : BOOL;
END_VAR

IF doConvTop THEN
	IF NOT diConvTop THEN
		doLiftTop := TRUE;
	END_IF;
END_IF;

IF doConvBottom THEN
	IF NOT diConvBottom THEN
		doLiftBottom := TRUE;
	END_IF;
END_IF;

IF doLiftTop OR doLiftBottom THEN
	IF NOT (diLiftTop AND diLiftBottom) THEN
		doConvLift := TRUE;
	END_IF;
END_IF;

IF doConvLift THEN
	IF diBoxLift THEN
		doLiftUnload := TRUE;
	END_IF;
END_IF;

IF doLiftUnload THEN
	doConvLift := FALSE;
END_IF;
```