// 165.8231418132782s
// 1

/*
 * This program implements a gate controller that opens and closes a gate based on various conditions.
 * The program uses IEC 61131-3 structured text to define the logic for the gate operations.
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
} else {
    /* Open the gate */
    Gate_Open = TRUE;
}

/* Check if the timer has timed out */
if (One_Hour_Timer > 0 && One_Hour_Timer <= 3600) {
    /* Close the gate */
    Gate_Open = FALSE;
} else {
    /* Reset the timer */
    One_Hour_Timer = 0;
}

/* Check if the app or car is detected */
if (Detected == TRUE && Auth_String == "my_defined_str") {
    /* Open the gate */
    Gate_Open = TRUE;
} else {
    /* Close the gate */
    Gate_Open = FALSE;
}

/* Check if the timer has timed out and the gate is still open */
if (One_Hour_Timer > 0 && One_Hour_Timer <= 3600 && Gate_Open == TRUE) {
    /* Close the gate */
    Gate_Open = FALSE;
}

/* Check if the app or car is detected and the Auth string matches my_defined_str */
if (Detected == TRUE && Auth_String == "my_defined_str") {
    /* Open the gate */
    Gate_Open = TRUE;
} else {
    /* Close the gate */
    Gate_Open = FALSE;
}

/* Check if the timer has timed out and the app or car is detected */
if (One_Hour_Timer > 0 && One_Hour_Timer <= 3600 && Detected == TRUE) {
    /* Close the gate */
    Gate_Open = FALSE;
}

/*