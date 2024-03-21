// 130.59191465377808s
// 1

/*
 * This program implements a gate controller that opens and closes a gate based on various conditions.
 * The program uses IEC 61131-3 structured text language to define the logic of the controller.
 */

/*
 * Variables
 */

/* Define variables for the gate controller */
int One_Hour_Timer;
bool Start_Loop;
string Auth_String;

/*
 * Functions
 */

/* Define functions for the gate controller */
void Open_Gate();
void Close_Gate();
void Check_Auth_String(string input);

/*
 * Main program
 */

/* Start the main program */
Start_Loop = TRUE;

/* Initialize variables */
One_Hour_Timer = 0;
Auth_String = "my_defined_str";

/* Loop until the gate is closed or the program is stopped */
while (Start_Loop) {
    /* Check if the gate is open */
    if (Gate_Open == TRUE) {
        /* If the gate is open, check if it has been opened for more than 1 hour */
        if (One_Hour_Timer > 3600) {
            /* If it has been opened for more than 1 hour, close the gate */
            Close_Gate();
        } else {
            /* If it hasn't been opened for more than 1 hour, continue checking */
            One_Hour_Timer++;
        }
    }

    /* Check if there is a car or app detected */
    if (Car_Detected == TRUE || App_Detected == TRUE) {
        /* If there is a car or app detected, check the authorization string */
        Check_Auth_String(input);
    }
}