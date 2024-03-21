// 132.5140266418457s
// 1

/*
 * This program implements a gate controller that opens and closes a gate based on various conditions.
 * The program uses IEC 61131-3 structured text language to define the logic for the gate operations.
 */

/* Define variables */
int One_Hour_Timer;
string Auth_String = "my_defined_str";

/* Start loop */
start_loop:

/* Check if the gate is open */
if (Gate_Open == TRUE) {
    /* Close the gate */
    Gate_Open = FALSE;
}

/* Check if the timer has timed out */
if (One_Hour_Timer > 0) {
    /* If the timer has timed out and the gate is still open, close it */
    if ((One_Hour_Timer == 60) && (Gate_Open == TRUE)) {
        Gate_Open = FALSE;
    }
} else {
    /* Reset the timer */
    One_Hour_Timer = 0;
}

/* Check if the gate is closed */
if (Gate_Open == FALSE) {
    /* Open the gate */
    Gate_Open = TRUE;
}

/* Check if the app or car has been detected */
if ((Detected == TRUE) && (Auth_String == "my_defined_str")) {
    /* If the app or car has been detected and the Auth string matches, open the gate */
    Gate_Open = TRUE;
}

/* Check if the timer is running */
if (One_Hour_Timer > 0) {
    /* Increment the timer by one second */
    One_Hour_Timer++;
} else {
    /* Reset the timer */
    One_Hour_Timer = 0;
}