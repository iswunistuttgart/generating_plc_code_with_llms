# Prompts

- Give me an IEC 61131-3 structured text program with two alarms represented by the variables xAlarm1 and xAlarm2. With the signal xAllOn all alarms should be set to TRUE. With the signal xAllOff all alarms should be set to FALSE. The signals should be turned off.
- Give me an IEC 61131-3 structured text program that calculates the binomial coefficient
- Give me an IEC 61131-3 structured text program that calculates a fibunacci number
- Give me an IEC 61131-3 structured text program of a fill level check. The fill level in a container should be monitored in three ranges: low, ok and high. Use one output each for low, ok and high. The fill level is read in via an analog value (0 - 32767) and should be should be converted internally to 0-100%. If the content falls below 1%, a warning horn should sound. Solve this application by using the CASE instruction.
- Give me an IEC 61131-3 structured text program of a Gate Controller. The variable One_Hour_Timer should start counting when Start_Loop is FALSE and it will time out after 1 hour of counting. If the timer timed out and the Gate is still open it should close. If it senses the app or the car and the Auth string matches my_defined_str the gate should open.
- Give me an IEC 61131-3 structured text program of a crane lift. Two conveyor belts (doConvTop, doConvBottom) transport crates to a lift. When the light barrier (diConvTop or diConvBottom) is activated, the corresponding conveyor belt stops and the lift is requested. If the lift has not yet been requested, it is moved to the corresponding position (doLiftTop, doLiftBottom). If the lift is in the requested position (diLiftTop, diLiftBottom), the lift conveyor belt (doConvLift) is switched on until the crate is completely at the lift (diBoxLift). The lift then moves to the unloading position (doLiftUnload). Once it has reached the position (diLiftUnload), the crate is the box is conveyed onto the unloading conveyor. When the box has left the lift, it is free for the next request.
- Give me an IEC 61131-3 structured text program of a crane. There are five load receptors on one crane. The load receptors are each connected to an analog input and provide values from 0 to 32767. To determine the total load and the average value, the individual loads must first be added together and divided by the number of load receptors. Solve the task using a FOR loop. As a result of the previous task, the sum of the individual loads could be calculated using a loop. So far, the variable declaration and the program code contain fixed numerical values. The purpose of this task is to replace as many fixed numerical values as possible from the declaration and program code with constants.
- Give me an IEC 61131-3 structured text program that implements the lambert w function.
- Give me an IEC 61131-3 structured text program that checks whether the int YEAR is a leap year or not.
- Give me an IEC 61131-3 structured text program that implements the sigmoid function.
- Give me an IEC 61131-3 structured text program that implements the sign function.
- Give me an IEC 61131-3 structured text program that implements the hyperbolic sine function with the uso of the exponential function.
- Give me an IEC 61131-3 structured text program that implements following function: A specific number is to be selected from a list of 100 numbers. The list contains random numbers. If the number 10 is found, the search is aborted. However, it is possible that the number does not exist in the list. Use the REPEAT and EXIT statements for the solution. Pay attention to the two abort conditions.
- Give me an IEC 61131-3 structured text function FC1001 with the following functionality. Depending on the constantly changing measured values of a sensor, an output should be switched on when a certain predeterminable switching value is exceeded and switched off when it falls below a certain predetermined switching value using a function FC 1001. In order to prevent possible switching back and forth (fluttering) at the switching value, a switching hysteresis in % of the switching value is specified at another function input. The measured values have the REAL data format thanks to a conversion function
- Give me an IEC 61131-3 structured text function FC1002 with the following functionality. An ultrasonic monitoring system detects all people and objects that approach the danger area in a three-dimensional protective field. If the ultrasonic sensor reports an approach, the horn P_HU emits an acoustic warning signal. If the perception of the person or object lasts longer than 3 seconds, the warning signal P_HU is switched off and an alarm P_AL is switched on. The monitoring system is switched on with the switch E_A and the switched on status is indicated with P1. To turn off the alarm, the monitoring system must be turned off using the E_A switch.
- Give me an IEC 61131-3 structured text program of a simple traffic light program with two two lights, north and east. Each light is represented with the Booleans North_green, North_yellow, North_red, East_green, East_yellow, East_red. This program should use a TON timer and a whole cycle is 10000ms long. Between 0ms and 5000ms the North light should be green and the East light red. After that for 500ms the North light turns yellow. Between 5500ms and 9500ms the North light is red while the East light is green. Between 9500ms and 10000ms the east light is yellow.
- Give me an IEC 61131-3 structured text program of a weather station. A temperature sensor measures the outside temperature. The temperature is read in via an analog input and should be displayed in text form in the house. 1) If the temperature is below 18°C, "Cold" should be displayed. 2) If the temperature is between 18°C and 25°, "Opt" (optimum) should be displayed. 3) If the temperature is above 25°C, "Hot" should be displayed. Solve this application by using IF, ELSIF and ELSE instructions. Evaluate the humidity as well as the temperature. The text "Opt" should only appear if the humidity is between 40 and 75% and the temperature is between 18 and 25°C, otherwise "Temp. OK" should be displayed. Solve the task with a nested IF statement.
- Give me an IEC 61131-3 structured text function FC1003 with the following functionality. A temperature sensor supplies values from 0 to 255 to a PLC digital input. These values correspond to a temperature of -20C to 40C, for example. Temperature values are to be used in the controller. For this purpose, a function FC 1003 is to be designed which converts the digital input floating point numbers from 0 to 255 into the temperature range from -20C to 40C. So that the range mapping can be used for any numerical range, the original range is to be defined by selectable lower limit (IN_MIN) and upper limit (IN_MAX) and the output range is also to be determined by specifying the lower limit (OUT_MIN) and upper limit (OUT_MAX).
- Give me an IEC 61131-3 structured text function block FB1005 with following functionality. When producing ceramic insulation panels, it must be checked after firing whether the thickness of the panel is within a specified tolerance band. To do this, the plates are pushed through a measuring point consisting of two lasers at a uniform speed. The thickness of the plates is determined from the difference between the measurements of the two lasers. For each measurement, the smallest and largest value of the plate thickness is recorded. If these are outside the tolerance band, the plate is considered scrap. A function block FB 1005 must be designed that checks the plate thickness, which results from the difference between the two laser measurements. During and after the measurement, the function block should output the largest (M_MAX) or smallest value (M_MIN) of the plate thickness. If the two values are outside the range specified with V_MAX and V_MIN, the reject light P1 is switched on. The measurement is started and ended with the sensor S1, which delivers a 1 signal as long as the ceramic plate is in the measuring device. At the start of a new measurement, the output values of the function block are overwritten with the values of the new measuring cycle. To test the function block FB 1005, sensor S1 is connected to the START input. A flag double word MD_1 is assigned to the THICKNESS function input. Any REAL numbers can be written to V-MAX and V_MIN. Flag double words are written to the output values D_MAX and D_MIN.
- Give me an IEC 61131-3 structured text program with an interlock functionality. The code has 2 inputs I1 and I2, which respectively switch the outputs Q1 and Q2. However, Q1 and Q2 are mutually locked so that only one output can be set to TRUE. The time TL determines a dead time between the two outputs. An output can only become TRUE if the other output was FALSE for at least the time TL.
- Give me an IEC 61131-3 structured text function block BURNER with following functionality. BURNER is a control interface for oil or gas burner operating at kilowatt hour meter and counter. The module controls a two-stage burner with optional fuel oil warming. The input IN is the control input that starts the burner only when the input OVER_TEMP is FALSE. OVER_TEMP is the boiler thermostat protection, which gets TRUE, if the boiler temperature has reached the maximum temperature. A burner start begins with the fuel oil warming, by PRE_HEAT gets TRUE. Then it waits for a signal at the input OIL_TEMP. If the signal OIL_TEMP is within the PRE_HEAT_TIME not TRUE and the oil temperature is not reached, the start sequence is interrupted and the output FAIL is set to TRUE. At the same time the error is spent at the Output STATUS. After fuel oil warming the motor gets on and sets the fan in operation. Then after a defned time the ignition is switched and the oil valve is opened. If no response of the fame sensor after specifed time (SAFETY_TIME), the module shows a failure. A fault is signaled even if the fame sensor responds before the ignition. If after a successful ignition, the fame breaks of and the set-variable MULTIPLE_IGNITION = TRUE, immediately a ignition is started. A second stage is activated automatically after the time STAGE2_DELAY when the input STAGE2 is TRUE. If a fault occurs, then the module is locked for a fxed time LOCKOUT_TIME and only after this time a RST can start the operation again. During the LOCKOUT_TIME, the RST Input must be FALSE. A TRUE at input OVER_TEMP stops immediately every action and reports the error 9. The status output indicates the current state of the module: 110 = Wait for Start signal ( Standby ); 111 = startup sequence is executed; 112 = burner runs on stage 1; 113 = burner runs at stage 2. A number of error conditions are provided at the output STATUS, if an error is present:1 = fuel oil warming has not responded within the PRE_HEAT_TIME; 2 = fame sensor is active during fuel oil warming (PRE_HEAT_TIME); 3 = fame sensor is active during the aeration period (PRE_VENTILATION_TIME); 4 = safety time ( Safety_Time) was passed without a fame; 5 = fame stops in operation; 9 = boiler overheating contact has tripped. Trace recording of a normal boot sequence: The signal IN starts the sequence with the output PRE_HEAT. After reaching the oil temperature (OIL_TEMP = TRUE), the engine started and the PRE_VENTILATION_TIME (time from engine start until oil valve is open) awaited. After an adjustable time (PPR_IGNITION_TIME) before opening the oil valve, the ignition is turned on. The ignition is then on until the POST_IGNITION_TIME has expired. The operating time per stage is measured independently in seconds.

# Programs

``` 
VAR
	xAllOn : BOOL;
	xAllOff : BOOL;

	xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

IF xAllOn THEN
	xAllOn := FALSE;
	
	xAlarm1 := TRUE;
	xAlarm2 := TRUE;
END_IF

IF xAllOff THEN
	xAllOff := FALSE;
	
	xAlarm1 := FALSE;
    xAlarm2 := FALSE;
END_IF
```

```
 FUNCTION BINOM : INT
  VAR_INPUT
    N : INT;
    K : INT;
    i : INT;
  END_VAR

  IF 2 * K > n THEN
  	k := n - k;
  END_IF;
  IF k > n THEN
  	RETURN;
  ELSIF k = 0 OR k = n THEN
  	BINOM := 1;
  ELSIF k = 1 THEN
  	BINOM := n;
  ELSE
  	BINOM := n;
  	n := n + 1;
  	FOR i := 2 TO k DO
  		BINOM := BINOM * (n - i) / i;
  	END_FOR;
  END_IF;

END_FUNCTION
```

```
FUNCTION FIB : DINT
  VAR_INPUT
    X : INT;
  END_VAR
  VAR
    t1 : DINT;
    t2 : DINT;
    x_tmp : INT;
  END_VAR

  t1 := DINT#0;
  t2 := DINT#0;
  X_tmp := X;
  IF X_tmp < 0 OR X_tmp > 46 THEN
  	FIB := DINT#-1;
  ELSIF X_tmp < 2 THEN
  	FIB := INT_TO_DINT(X_tmp);
  	RETURN;
  ELSE
  	(* the fibonacci number is the sum of the two suceeding fibonaci numbers *)
  	(* we store the numbers alternatively in t1 and t2 depending on pt *)
  	t2 := DINT#1;
  	WHILE X_tmp > 3 DO
  		X_tmp := X_tmp - 2;
  		t1 := t1 + t2;
  		t2 := t1 + t2;
  	END_WHILE;
  	IF X_tmp > 2 THEN t1 := t1 + t2; END_IF;
  	fib := t1 + t2;
  END_IF;
END_FUNCTION
```

```
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

(*scaling the analog input to percent*)
PercentLevel := INT_TO_UINT(aiLevel / 327);
(*reset all outputs*)
doAlarm := FALSE;
doLow := FALSE;
doOk := FALSE;
doHigh := FALSE;

CASE PercentLevel OF
    0: (*-- level alarm*)
        doAlarm := TRUE;
        doLow := TRUE;
    1..24: (*-- level is low*)
        doLow := TRUE;
    25..90:(*-- level is ok*)
        doOk := TRUE;
    ELSE (*-- level is high*)
        doHigh := TRUE;
END_CASE
```

```
VAR
    Start_Loop : BOOL := FALSE;
    one_hour : TIME := T#1h;
    One_Hour_Timer : TON;
    Gate_Open : BOOL := FALSE;
    Close_Gate_Inst : BOOL := FALSE;
    Sensed_Car : BOOL := FALSE;
    Sensed_Car_Inst : BOOL := FALSE;
    Sensed_App : BOOL := FALSE;
    Mobile_Inst : BOOL := FALSE;
    Auth : STRING;
    my_defined_str : STRING := 'abcd';
END_VAR

One_Hour_Timer(IN := NOT(Start_Loop), PT := one_hour);

IF One_Hour_Timer.Q THEN
  IF Gate_Open THEN
    Close_Gate_Inst := TRUE;
    Gate_Open := FALSE;
  END_IF;
END_IF;

IF Sensed_App THEN
  IF Auth = my_defined_str THEN
    Close_Gate_Inst := Mobile_Inst XOR Gate_Open;
    Gate_Open := Mobile_Inst;
  END_IF;
END_IF;

IF Sensed_Car THEN
  IF Auth = my_defined_str THEN
    Close_Gate_Inst := Sensed_Car_Inst XOR Gate_Open;
    Gate_Open := Sensed_Car_Inst;
  END_IF;
END_IF;


Start_Loop := One_Hour_Timer.Q;
```

```
VAR CONSTANT
    WAIT : UINT:= 0;
    TOP_POSITION : UINT:= 1;
    BOTTOM_POSITION : UINT:= 2;
    GETBOX : UINT:= 3;
    UNLOAD_POSITION : UINT:= 4;
    UNLOAD_BOX : UINT:= 5;
END_VAR

VAR
    (*-- digital outputs*)
    doConvTop: BOOL;
    doConvBottom: BOOL;
    doConvLift: BOOL;
    doLiftTop: BOOL;
    doLiftBottom: BOOL;
    doLiftUnload: BOOL;
    (*-- digital inputs*)
    diConvTop: BOOL;
    diConvBottom: BOOL;
    diLiftTop: BOOL;
    diLiftBottom: BOOL;
    diLiftUnload: BOOL;
    diBoxLift: BOOL;
    (*-- status variables*)
    selectLift: UINT;
    ConvTopOn: BOOL;
    ConvBottomOn: BOOL;
END_VAR

doConvTop := NOT diConvTop OR ConvTopOn;
doConvBottom := NOT diConvBottom OR ConvBottomOn;
CASE selectLift OF
    (*-- wait for request*)
    WAIT:
        IF (diConvTop = TRUE) THEN
            selectLift := TOP_POSITION;
        ELSIF (diConvBottom = TRUE) THEN
            selectLift := BOTTOM_POSITION;
        END_IF
    (*-- move lift to top position*)
    TOP_POSITION:
        doLiftTop := TRUE;
        IF (diLiftTop = TRUE) THEN
            doLiftTop := FALSE;
            ConvTopOn := TRUE;
            selectLift := GETBOX;
        END_IF
    (*-- move lift to bottom position*)
    BOTTOM_POSITION:
        doLiftBottom := TRUE;
        IF (diLiftBottom = TRUE) THEN
            doLiftBottom := FALSE;
            ConvBottomOn := TRUE;
            selectLift := GETBOX;
        END_IF
    (*-- move box to lift*)
    GETBOX:
        doConvLift := TRUE;
        IF (diBoxLift = TRUE) THEN
            doConvLift := FALSE;
            ConvTopOn := FALSE;
            ConvBottomOn := FALSE;
            selectLift := UNLOAD_POSITION;
        END_IF
    (*-- move lift to unload position*)
    UNLOAD_POSITION:
        doLiftUnload := TRUE;
        IF (diLiftUnload = TRUE) THEN
            doLiftUnload := FALSE;
            selectLift := UNLOAD_BOX;
        END_IF
    (*-- unload the box*)
    UNLOAD_BOX:
        doConvLift := TRUE;
        IF (diBoxLift = FALSE) THEN
            doConvLift := FALSE;
            selectLift := WAIT;
        END_IF
END_CASE
```

```
VAR CONSTANT
    MAX_INDEX: USINT := 4;
END_VAR
VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT;
    iCnt : USINT;
    sumWeight : DINT;
    avgWeight : INT;
END_VAR

sumWeight := 0;
FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR
avgWeight := DINT_TO_INT (sumWeight / (MAX_INDEX + 1));
```

```
FUNCTION LAMBERT_W : REAL
  VAR_INPUT
    X : REAL;
  END_VAR
  VAR
    w : REAL;
    i : INT;
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
  END_VAR

  IF x < -0.367879441171442 THEN
  	LAMBERT_W := -1000.0;
  	RETURN;
  (* return 0 if x = 0 *)
  ELSIF x = 0.0 THEN
  	RETURN;
  (* first an estimate is calculated *)
  ELSIF x <= 500.0 THEN
  	w := LN(x + 1.0);
  	w := 0.665 * (1.0 + 0.0195 * w) * w + 0.04;
  ELSE
  	w := LN(x - 4.0) - (1.0 - 1.0/LN(x)) * LN(LN(x));
  END_IF;
  (* use estimate to calculate exact result *)
  FOR i := 0 TO 5 DO
  	ewx := EXP(w);
  	we := w * ewx - x;
  	w1e := (w+1.0) * ewx;
  	last := REAL_TO_DWORD(w) AND DWORD#16#FFFF_FFFC;
  	w := w - (we / (w1e - (w+2.0) * we / (2.0 * w + 2.0)));
  	IF (REAL_TO_DWORD(w) AND DWORD#16#FFFF_FFFC) = last THEN EXIT; END_IF;
  END_FOR;
  LAMBERT_W := w;
  (* from OSCAT library; www.oscat.de  *)
END_FUNCTION
```

```
VAR 
    YEAR : INT
END_VAR

IF (year MOD INT#400) = INT#00 THEN
  leap_year := TRUE;
ELSIF (year MOD INT#100) = INT#00 THEN
  leap_year := FALSE;
ELSIF (year MOD INT#04) = INT#00 THEN
  leap_year := TRUE;
ELSE
  leap_year := FALSE;
END_IF;
```

```
FUNCTION SIGMOID : REAL
  VAR_INPUT
    X : REAL;
  END_VAR

  IF X > 20.0 THEN
  	SIGMOID := 1.0;
  ELSIF x < -85.0 THEN
  	SIGMOID := 0.0;
  ELSE
  	SIGMOID := 1.0 / (1.0 + EXP(-X));
  END_IF;
  (* from OSCAT library; www.oscat.de  *)
END_FUNCTION
```

```
FUNCTION SGN : INT
  VAR_INPUT
    x : REAL;
  END_VAR

  IF X > 0.0 THEN
  	sgn := 1;
  ELSIF X < 0.0 THEN
  	sgn := -1;
  ELSE
  	sgn := 0;
  END_IF;
  (* from OSCAT library; www.oscat.de  *)
END_FUNCTION
```

```
FUNCTION SINH : REAL
  VAR
    X : REAL;
  END_VAR

  IF ABS(x) < 2.0E-3 THEN
  	SINH := X;
  ELSE
  	SINH := (EXP(x) - EXP(-x)) * 0.5;
  END_IF;
  (* from OSCAT library; www.oscat.de  *)
END_FUNCTION
```

```
VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR

nCnt := 0;
REPEAT
    IF aNumbers[nCnt] = 10 THEN
    (*found the number 10*)
    EXIT;
    END_IF
    nCnt := nCnt + 1;
    UNTIL nCnt > MAXNUMBERS
END_REPEAT
```

```
FUNCTION FC1001 :BOOL
VAR_INPUT
	MEW: REAL;
	SP: REAL;
	HYS: REAL;
END_VAR
VAR_IN_OUT
 	OUT:BOOL;
END_VAR
VAR
 	P_HYS: REAL;
END_VAR

P_HYS:=MEW*HYS/100;
IF MEW<(SP-P_HYS/2) THEN
	OUT:=TRUE;
ELSIF
	MEW>(SP+P_HYS/2) THEN
	OUT:=FALSE;
ELSE
	OUT:=OUT;
END_IF 
```

```
FUNCTION FC1002 :BOOL
VAR_INPUT
	E_A, SENSOR: BOOL;
	ZEITW: TIME;
END_VAR
VAR_IN_OUT
	ZEIT:TON;
	P_HU, P_AL: BOOL;
END_VAR

IF NOT E_A THEN 
	FC1002:=FALSE;
	P_HU:=FALSE;
	P_AL:=FALSE;
ELSE
	FC1002:=TRUE;
	IF P_AL THEN 
		P_HU:=FALSE;
	ELSIF SENSOR THEN 
		P_HU:=FALSE;
	ELSE 
		P_HU:=TRUE;
	END_IF
END_IF
ZEIT(IN:=P_HU OR P_AL, PT:=ZEITW);
P_AL:=Zeit.Q; 
```

```
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

PROGRAM traffic_light
T1.PRE := 10000;
T1.TimerEnable := 1;
T1.Reset := T1.DN

IF T1.ACC > 0 AND T1.ACC < 5000 THEN
    North_green := TRUE;
    North_yellow := FALSE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
END_IF

IF T1.ACC > 5000 AND T1.ACC < 5500 THEN
    North_green := FALSE;
    North_yellow := TRUE;
    North_red := FALSE;
    East_green := FALSE;
    East_yellow := FALSE;
    East_red := TRUE;
END_IF

IF T1.ACC > 5500 AND T1.ACC < 9500 THEN
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
    East_red := FALSE;
END_IF

IF T1.ACC > 9500 AND T1.ACC < 10000 THEN
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
    East_red := FALSE;
END_IF

END_PROGRAM
```

```
VAR
    aiOutside : INT;
    aiHumidity: INT;
    sShowText : STRING[80];
END_VAR

IF aiOutside < 18 THEN
    sShowText := 'Cold';
ELSIF (aiOutside >= 18) AND (aiOutside <= 25) THEN
    IF (aiHumid >= 40) AND (aiHumid <= 75) THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. Ok';
    END_IF
ELSE
    sShowText := 'Hot';
END_IF;
```

```
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R:REAL;
    IN_MAX, IN_MIN:REAL;
    OUT_MAX, OUT_MIN:REAL;
END_VAR
VAR_OUTPUT
    OUT_R:REAL;
    FEH:BOOL;
END_VAR
VAR_TEMP
    DIFF1, DIFF2:REAL;
END_VAR

DIFF1:= IN_MAX-IN_MIN;
DIFF2:= OUT_MAX-OUT_MIN;
FEH := (DIFF1=0) OR (DIFF2=0);
IF NOT FEH THEN
    OUT_R:= (OUT_MAX-OUT_MIN) / DIFF1 * (IN_R-IN_MIN) + OUT_MIN;
ELSE 
    OUT_R:=0.0;
END_IF;
END_FUNCTION 
```

```
FUNCTION_BLOCK FB1005
VAR_INPUT
    START:BOOL; 
    DICKE, V_MAX, V_MIN:REAL;
END_VAR
VAR_OUTPUT
    D_MAX, D_MIN:REAL; 
    P1:BOOL;
END_VAR
VAR
    FO:BOOL;
END_VAR

IF NOT START THEN 
    FO:=START; 
    RETURN;
END_IF;
IF START=TRUE AND FO=FALSE THEN 
    D_MAX:=DICKE; 
    D_MIN:=DICKE; 
    P1:=FALSE;
END_IF;
FO:=START;
IF DICKE < D_MIN THEN 
    D_MIN:=DICKE; 
END_IF;
IF DICKE > D_MAX THEN 
    D_MAX:=DICKE; 
END_IF;
IF D_MIN < V_MIN OR D_MAX > V_MAX THEN 
    P1:=TRUE; 
END_IF;
END_FUNCTION_BLOCK 
```

```
FUNCTION_BLOCK INTERLOCK
    VAR_INPUT
        I1 : BOOL;
        I2 : BOOL;
        TL : TIME;
    END_VAR
    VAR_OUTPUT
        Q1 : BOOL;
        Q2 : BOOL;
    END_VAR
    VAR
        T1 : TOF;
        T2 : TOF;
    END_VAR

    T1(IN := I1, PT := TL);
    T2(IN := I2, PT := TL);

    Q1 := I1 AND NOT t2.Q;
    Q2 := I2 AND NOT t1.Q;

END_FUNCTION_BLOCK
```

```
FUNCTION_BLOCK BURNER
  VAR_INPUT
    IN : BOOL;
    STAGE2 : BOOL;
    OVER_TEMP : BOOL;
    OIL_TEMP : BOOL := TRUE;
    FLAME : BOOL;
    RST : BOOL;
    RST_TIMER : BOOL;
    PRE_HEAT_TIME : TIME := t#5s;
    PRE_VENT_TIME : TIME := t#15s;
    PRE_IGNITE_TIME : TIME := t#15s;
    POST_IGNITE_TIME : TIME := t#25s;
    STAGE2_DELAY : TIME := t#10s;
    SAFETY_TIME : TIME := t#5s;
    LOCKOUT_TIME : TIME := t#10s;
    MULTIPLE_IGNITION : BOOL := TRUE;
    KW1 : REAL;
    KW2 : REAL;
  END_VAR
  VAR_OUTPUT
    MOTOR : BOOL;
    COIL1 : BOOL;
    COIL2 : BOOL;
    PRE_HEAT : BOOL;
    IGNITE : BOOL;
    FAIL : BOOL;
    KWH : REAL;
    STATUS : BYTE;
  END_VAR
  VAR_IN_OUT
    RUNTIME1 : UDINT;
    RUNTIME2 : UDINT;
    CYCLES : UDINT;
  END_VAR
  VAR
    state : INT;
    last : TIME;
    tx : TIME;
    last_change : TIME;
    timer1 : ONTIME;
    timer2 : ONTIME;
    oil_temp_last : BOOL;
    cycles2 : UDINT;
  END_VAR

  tx:= UDINT_TO_TIME(T_PLC_MS(en:=true));

  (* check rst input and overtemp *)
  IF rst OR over_temp OR state = 0 THEN
  	IF status > BYTE#0 AND tx - last_change >= lockout_time AND rst THEN
  		status := BYTE#110;
  		fail := FALSE;
  		state := 1;
  	ELSE
  		(* normaler reset *)
  		motor := FALSE;
  		coil1 := FALSE;
  		coil2 := FALSE;
  		ignite := FALSE;
  		pre_heat := FALSE;
  		IF over_temp THEN
  			status := BYTE#9;
  			fail := TRUE;
  		END_IF;
  		last_change := tx;
  		last := tx;
  		state := 1;
  	END_IF;
  END_IF;

  (* check for timer rst and rst timer if true *)
  IF rst_timer THEN
  	runtime1 := UDINT#0;
  	runtime2 := UDINT#0;
  	cycles := UDINT#0;
  	cycles2 := UDINT#0;
  END_IF;

  (* quit here if an error is present *)
  IF (status > BYTE#0 AND status < BYTE#100) OR rst THEN RETURN; END_IF;

  (* start sequence *)
  CASE state OF

  1:	(* in signal starts oil pre heating *)
  	IF in AND flame THEN
  		state := 7;
  		pre_heat := FALSE;
  		status := BYTE#2;
  		last_change := tx;
  	ELSIF in THEN
  		pre_heat := TRUE;
  		state := 2;
  		last_change := tx;
  	END_IF;

  2:	(* after pre_heating time start motor *)
  	IF (tx- last_change >= pre_heat_time AND oil_temp) OR (oil_temp AND NOT oil_temp_last) THEN
  		motor := TRUE;
  		state := 3;
  		last_change := tx;
  	(* pre_heat_time ist abgelaufen und oil_temp ist nicht aktiv *)
  	ELSIF tx - last_change >= pre_heat_time AND NOT oil_temp THEN
  		state := 7;
  		pre_heat := FALSE;
  		status := BYTE#1;
  		last_change := tx;
  	(* flame monitor cannot be active at this time *)
  	ELSIF flame THEN
  		state := 7;
  		pre_heat := FALSE;
  		status := BYTE#2;
  		last_change := tx;
  	END_IF;

  3:	(* abwarten bis zündung eingeschaltet werden kann *)
  	IF tx - last_change >= pre_vent_time - pre_ignite_time THEN
  		ignite := TRUE;
  		state := 4;
  		last_change := tx;
  	(* flame monitor cannot be active at this time *)
  	ELSIF flame THEN
  		state := 7;
  		pre_heat := FALSE;
  		motor := FALSE;
  		status := BYTE#3;
  		last_change := tx;
  	END_IF;

  4:	(* warten bis oelzufuhr geoeffnet werden darf *)
  	IF tx - last_change >= pre_ignite_time THEN
  		coil1 := TRUE;
  		state := 5;
  		last_change := tx;
  	END_IF;

  5:	(* warten auf flammwaechter und falls noetig abschalten *)
  	IF tx - last_change >= safety_time OR flame THEN
  		IF NOT flame THEN
  			(* notabschaltung da flammwaechster nicht angesprochen hat *)
  			state := 7;
  			motor := FALSE;
  			coil1 := FALSE;
  			pre_heat := FALSE;
  			ignite := FALSE;
  			status := BYTE#4;
  			last_change := tx;
  		ELSE
  			state := 6;
  			last_change := tx;
  		END_IF;
  	END_IF;

  6:	(* brenner läuft, flammueberwachung und nach ablauf der nachigniteszeit ignite abschalten *)
  	IF NOT flame AND NOT multiple_ignition THEN
  		(* notabschaltung da flammwaechster keine flamme meldet *)
  		state := 7;
  		motor := FALSE;
  		coil1 := FALSE;
  		coil2 := FALSE;
  		pre_heat := FALSE;
  		ignite := FALSE;
  		status := BYTE#5;
  		last_change := tx;
  	ELSIF NOT flame AND multiple_ignition THEN
  		ignite := TRUE;
  		state := 5;
  		coil2 := FALSE;
  		last_change := tx;
  	ELSE
  		IF tx - last_change >= post_ignite_time THEN
  			(* post_ignite_time abgelaufen, ignite abschalten *)
  			ignite := FALSE;
  		END_IF;
  		IF tx - last_change >= stage2_delay AND stage2 THEN
  			coil2 := TRUE;
  		ELSE
  			coil2 := FALSE;
  		END_IF;
  	END_IF;
  END_CASE;

  (* abschaltung wenn kein eingangssignal *)
  IF NOT in THEN
  	state := 1;
  	motor := FALSE;
  	coil1 := FALSE;
  	coil2 := FALSE;
  	ignite := FALSE;
  	pre_heat := FALSE;
  	last_change := tx;
  END_IF;

  (* runtimezähler *)
  timer1(in := flame AND in AND motor AND coil1 AND NOT coil2, SECONDS := runtime1, CYCLES := cycles);
  cycles := timer1.CYCLES;
  runtime1 := timer1.SECONDS;

  timer2(in := flame AND in AND motor AND coil1 AND coil2, SECONDS := runtime2, CYCLES := cycles2);
  cycles2 := timer2.CYCLES;
  runtime2 := timer2.SECONDS;

  KWH := UDINT_TO_REAL(runtime1) * KW1 / 3600.0 + UDINT_TO_REAL(runtime2) * KW2 / 3600.0;

  (* zeit fuer naechsten aufruf merken *)
  last := tx;

  (* set fail output IF ERROR and Status  if normal operation *)

  IF status > BYTE#0 AND status < BYTE#100 THEN
  	fail := TRUE;
  ELSE
  	fail := FALSE;
  	IF NOT in THEN
  		status := BYTE#110;
  	ELSIF flame AND in AND motor AND coil2 AND coil1 THEN
  		status := BYTE#113;
  	ELSIF flame AND in AND motor AND coil1 THEN
  		status := BYTE#112;
  	ELSE
  		status := BYTE#111;
  	END_IF;
  END_IF;

  (* From OSCAT Library, www.OSCAT.de *)
  (* T_PLC_MS, ONTIME required *)
END_FUNCTION_BLOCK
```