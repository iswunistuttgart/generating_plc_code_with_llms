// 47.32065200805664s
// 1
// Traffic Light Program in IEC 61131-3
// This program implements a simple traffic light program with two two lights, north and east. Each light is represented with the Booleans North_green, North_yellow, North_red, East_green, East_yellow, East_red. This program should use a TON timer and a whole cycle is 10000ms long. Between 0ms and 5000ms the North light should be green and the East light red. After that for 500ms the North light turns yellow. Between 5500ms and 9500ms the North light is red while the East light is green. Between 9500ms and 10000ms the east light is yellow.
// Following rules should be followed:
//- variables should be declared between VAR and END_VAR
//- when using control structures do not forget END_<controll structure>
//- switch cases should be avoided unless instructed in the task
//- use the right quotation marks for the string type
//- implementing a function should be avoided
//- only when implementing a function: the variables should be declared inside the function; the return value should be stored in a variable named after the function; RETURN should be used correctly, to return to the main method and not to return a value
// Only following variables should be used:
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

// Function to implement the traffic light program
void TrafficLight() 
{ 
    // Declare variables for each light
    VAR
        North_green = TRUE; 
        North_yellow = FALSE; 
        North_red = FALSE; 
        East_green = TRUE; 
        East_yellow = FALSE; 
        East_red = FALSE; 

    END_VAR

    // Set the timer
    T1 = TON(10000);

    // Loop until the timer expires
    WHILE (T1 > 0) 
    DO
        IF North_green THEN
            North_yellow = TRUE; 
            North_red = FALSE; 
        ELSEIF North_yellow THEN
            North_red = TRUE; 
            North_green