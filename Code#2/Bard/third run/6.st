// 9.74s
// 3
VAR
  CONSTANT
    WAIT : UINT := 0;
    TOP_POSITION : UINT := 1;
    BOTTOM_POSITION : UINT := 2;
    GETBOX : UINT := 3;
    UNLOAD_POSITION : UINT := 4;
    UNLOAD_BOX : UINT := 5;
  END_VAR

VAR
  (*-- digital outputs*)
  doConvTop: BOOL := FALSE;
  doConvBottom: BOOL := FALSE;
  doConvLift: BOOL := FALSE;
  doLiftTop: BOOL := FALSE;
  doLiftBottom: BOOL := FALSE;
  doLiftUnload: BOOL := FALSE;
  (*-- digital inputs*)
  diConvTop: BOOL;
  diConvBottom: BOOL;
  diLiftTop: BOOL;
  diLiftBottom: BOOL;
  diLiftUnload: BOOL;
  diBoxLift: BOOL;
  (*-- status variables*)
  selectLift: UINT := 0;
  ConvTopOn: BOOL := FALSE;
  ConvBottomOn: BOOL := FALSE;
END_VAR

PROGRAM main

IF diConvTop = TRUE THEN
  ConvTopOn := FALSE;
  doConvTop := FALSE;
  selectLift := BOTTOM_POSITION;
  doLiftBottom := TRUE;
  WAIT;
END_IF;

IF diConvBottom = TRUE THEN
  ConvBottomOn := FALSE;
  doConvBottom := FALSE;
  selectLift := TOP_POSITION;
  doLiftTop := TRUE;
  WAIT;
END_IF;

IF diLiftTop = TRUE AND selectLift = TOP_POSITION THEN
  doLiftTop := FALSE;
  doConvLift := TRUE;

  IF diBoxLift = TRUE THEN
    doConvLift := FALSE;
    selectLift := UNLOAD_POSITION;
    doLiftUnload := TRUE;
    WAIT;
  END_IF;
END_IF;

IF diLiftBottom = TRUE AND selectLift = BOTTOM_POSITION THEN
  doLiftBottom := FALSE;
  doConvLift := TRUE;

  IF diBoxLift = TRUE THEN
    doConvLift := FALSE;
    selectLift := UNLOAD_BOX;
    WAIT;
  END_IF;
END_IF;

IF diLiftUnload = TRUE AND selectLift = UNLOAD_POSITION THEN
  doLiftUnload := FALSE;
  doConvLift := FALSE;
  doConvBottom := TRUE;
  ConvBottomOn := TRUE;
  selectLift := 0;
  WAIT;
END_IF;

END_PROGRAM