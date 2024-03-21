// 45.91958475112915s
// 1
#include <iostream> 
#include <string> 

using namespace std; 

// Function block FB1005 
void FUNCTION_BLOCK::FB1005() { 
    VAR var ; 
    // Variables declaration 
    bool P1 = false;
    double D_MAX = 0.0, D_MIN = 999999999.0; 

    START: 
        DICKE = true;
        V_MAX = 0.0;
        V_MIN = 999999999.0;

        // Measurement cycle 
        while (DICKE) { 
            if (S1 == 1 && P1 == false) { 
                D_MAX = M_MAX;
                D_MIN = M_MIN;
                P1 = true;
            } else if (S1 == 0 && P1 == true) { 
                // End of measurement 
                if (D_MAX > V_MAX || D_MIN < V_MIN) 
                    P1 = false; 
            }

            if (DICKE == false) 
                break; 
        } 

        // Output value assignment 
        D_MAX = M_MAX;
        D_MIN = M_MIN;

        // Flag double word assignment 
        MD_1 = 0x0002; 
    END: ;
}