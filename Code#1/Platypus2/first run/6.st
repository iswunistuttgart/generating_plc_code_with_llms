// 181.94927048683167s
// 1
program crane_lift;

// Variables
int doConvTop, doConvBottom, doLiftTop, doLiftBottom, doConvLift, diConvTop, diConvBottom, diLiftTop, diLiftBottom, diBoxLift, diLiftUnload;

// Initialization
doConvTop = 0;
doConvBottom = 0;
doLiftTop = 0;
doLiftBottom = 0;
doConvLift = 0;
diConvTop = 1;
diConvBottom = 1;
diLiftTop = 0;
diLiftBottom = 0;
diBoxLift = 0;
diLiftUnload = 0;

// Main program
while (true) {
    // Check if the top conveyor is activated
    if (doConvTop == 1) {
        // Stop the top conveyor
        doConvTop = 0;
        // Request lift
        doLiftTop = 1;
    }

    // Check if the bottom conveyor is activated
    if (doConvBottom == 1) {
        // Stop the bottom conveyor
        doConvBottom = 0;
        // Request lift
        doLiftBottom = 1;
    }

    // Check if the lift has been requested
    if (doLiftTop == 1 || doLiftBottom == 1) {
        // Move the lift to the top position
        if (diLiftTop == 0) {
            diLiftTop = 1;
            doConvLift = 1;
        }

        // Move the lift to the bottom position
        if (diLiftBottom == 0) {
            diLiftBottom = 1;
            doConvLift = 1;
        }
    }

    // Check if the lift is in the requested position
    if (doLiftTop == 1 && diLiftTop == 1 || doLiftBottom == 1 && diLiftBottom == 1) {
        // Move the lift to the unloading position
        if (diLiftUnload ==