// 37.72503590583801s
// 1

public static void FC1002(FUNCTION FUNCTION, VAR_INPUT VAR_IN_OUT) {
    //Declare variables
    VAR_INPUT E_A :BOOL = TRUE;
    VAR_INPUT SENSOR :BOOL;
    VAR_OUTPUT ZEITW :TIME;
    VAR_OUTPUT P_HU, P_AL: BOOL;
    
    //Set initial values
    ZEITW.HOUR = 0;
    ZEITW.MIN = 0;
    ZEITW.SEC = 0;
    P_HU = FALSE;
    P_AL = FALSE;

    //Switch on E_A
    if (E_A == TRUE) {
        //Set switch ON
        SENSOR = TRUE;

        //Wait for 3 seconds
        while ((ZEIT() < ZEITW + 3)) {
            //Do nothing
        }

        //Switch off P_HU and P_AL
        P_HU = FALSE;
        P_AL = TRUE;
    }

    //Return variables
    VAR_IN_OUT.ZEITW = ZEITW;
    VAR_IN_OUT.P_HU = P_HU;
    VAR_IN_OUT.P_AL = P_AL;
}