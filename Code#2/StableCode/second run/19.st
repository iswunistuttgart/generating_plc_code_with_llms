// 70.05346393585205s
// 1
#include <iostream> 
#include <string> 
using namespace std; 

// Function block FB1005 
void FUNCTION_BLOCK::FB1005() { 
    // Declare variables 
    bool P1 = false;
    double D_MAX, D_MIN; 

    // Check the plate thickness 
    if (MD_1 == true) { 
        // If MD_1 is true, then it means that the panel has been produced 
        // and must be checked after firing whether the thickness of the 
        // panel is within a specified tolerance band. 
        double V_MAX = VAR.V_MAX;
        double V_MIN = VAR.V_MIN;

        // Get the measurements from the two lasers 
        double M1 = SENSOR.S1.M1; 
        double M2 = SENSOR.S1.M2; 

        // Calculate the difference between the two laser measurements 
        double D = abs(M1 - M2); 

        // If the difference is greater than tolerance band, then the panel 
        // is considered scrap. 
        if (D > V_MAX || D < V_MIN) { 
            P1 = true;
        } 
    } 

    // Output the largest (M_MAX) or smallest value (M_MIN) of the plate 
    // thickness. 
    if (MD_2 == true) { 
        double M_MAX, M_MIN; 

        // Get the measurements from the two lasers 
        double M1 = SENSOR.S1.M1; 
        double M2 = SENSOR.S1.M2; 

        // Calculate the difference between the two laser measurements 
        double D = abs(M1 - M2); 

        // If the difference is greater than tolerance band, then the panel 
        // is considered scrap. 
        if (D > V_MAX || D < V_MIN) { 
            P1 = true;
        } 
    } 

    // Output the largest (M_MAX) or smallest value (M_MIN) of the plate 
    // thickness. 
    if (MD_3 == true) { 
        double M_MAX, M_MIN; 

        // Get the measurements from the two lasers 
        double M1 = SENSOR.S1.M1; 
        double M2 = SENSOR.S1.M2; 

        // Calculate the difference between the two laser measurements 
        double D = abs(M1 - M2); 

        // If the difference