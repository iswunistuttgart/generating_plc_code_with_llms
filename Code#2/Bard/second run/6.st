// 6.96s
// 2
VAR CONSTANT
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
  diConvTop: BOOL := FALSE;
  diConvBottom: BOOL := FALSE;
  diLiftTop: BOOL := FALSE;
  diLiftBottom: BOOL := FALSE;
  diLiftUnload: BOOL := FALSE;
  diBoxLift: BOOL := FALSE;
  (*-- status variables*)
  selectLift: UINT := WAIT;
  ConvTopOn: BOOL := TRUE;
  ConvBottomOn: BOOL := TRUE;
END_VAR

Main_Control:
  IF diConvTop THEN
    doConvTop := FALSE;
    selectLift := TOP_POSITION;
  END_IF;

  IF diConvBottom THEN
    doConvBottom := FALSE;
    selectLift := BOTTOM_POSITION;
  END_IF;

  IF selectLift = TOP_POSITION THEN
    doLiftTop := TRUE;
    ConvTopOn := FALSE;
  ELSIF selectLift = BOTTOM_POSITION THEN
    doLiftBottom := TRUE;
    ConvBottomOn := FALSE;
  ELSIF selectLift = GETBOX THEN
    doConvLift := TRUE;
    IF diBoxLift THEN
      doConvLift := FALSE;
      selectLift := UNLOAD_POSITION;
    END_IF;
  ELSIF selectLift = UNLOAD_POSITION THEN
    doLiftUnload := TRUE;
    IF diLiftUnload THEN
      doLiftUnload := FALSE;
      selectLift := WAIT;
      ConveyorTopOn := TRUE;
      ConveyorBottomOn := TRUE;
    END_IF;
  END_IF;
END_MAIN_CONTROL;