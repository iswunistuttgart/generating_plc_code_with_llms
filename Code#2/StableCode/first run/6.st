// 72.10725712776184s
// 1
Give me an IEC 61131-3 structured text program of a crane lift. Two conveyor belts (doConvTop, doConvBottom) transport crate<s> to a lift. When the light barrier (diConvTop or diConvBottom) is activated, the corresponding conveyor belt stops and the lift is requested. If the lift has not yet been requested, it is moved to the corresponding position (doLiftTop, doLiftBottom). If the lift is in the requested position (diLiftTop, diLiftBottom), the lift conveyor belt (doConvLift) is switched on until the crate is completely at the lift (diBoxLift). The lift then moves to the unloading position (doLiftUnload). Once it has reached the position (diLiftUnload), the crate is the box is conveyeD onto the unloading conveyor. When the box has left the lift, it is free for the next request.
Following rules should be followed:
- variables should be declared between VAR and END_VAR
- when using control structures do not forget END_<controll structure>
- switch cases should be avoided unless instructed in the task
- use the right quotation marks for the string type
- implementing a function should be avoided
- only when implementing a function: the variables should be declared inside the function; the return value should be stored in a variable named after the function; RETURN should be used correctly, to return to the main method and not to return a value
Only following variables should be used:import java.util.*;

public class CraneLift {
    public static void main(String[] args) {
        VAR
            CONSTANT
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