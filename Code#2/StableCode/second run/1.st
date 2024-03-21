// 27.63962745666504s
// 2
// Declare the variables
VAR 
	xAllOn : BOOL;
	xAllOff : BOOL;

	xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

// Define the functions
FUNCTION On() 
BEGIN 
    xAllOn := TRUE; 
    RETURN; 
END; 
 
FUNCTION Off() 
BEGIN 
    xAllOff := FALSE; 
    RETURN; 
END; 

// Implementing a function
FUNCTION Alarm1() 
BEGIN 
    IF (xAlarm1 = TRUE) THEN 
        On();
    ELSE
        Off();
    END IF; 
    RETURN; 
END; 
 
FUNCTION Alarm2() 
BEGIN 
    IF (xAlarm2 = TRUE) THEN 
        On();
    ELSE
        Off();
    END IF; 
    RETURN; 
END; 

// Implementing a switch case
CASE xAlarm1 OF 
    TRUE: Alarm1(); BREAK; 
    FALSE: Alarm2(); BREAK; 
END_CASE;