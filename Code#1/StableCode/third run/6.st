// 25.270546674728394s
// 1
//IEC 61131-3 Program of a Crane Lift
//Two Conveyors (doConvTop, doConvBottom) Transport Crate to a Lift
//When Light Barrier (diConvTop or diConvBottom) is Activated, The corresponding Conveyor Belt Stops and the Crane is Requested. If the Crane has not yet been requested, It Is Moved to the Corresponding Position (doLiftTop, doLiftBottom). If the Crane is in the requested position (diLiftTop or diLiftBottom), The Crane Conveyors are Switched On Until The Crate is CompleteLYt At The Lift (diBoxLift). The Lift Then Moves to the Unloading Position (doLiftUnload). Once It Has Reached the Position (diLiftUnload), The Crate Is ConveyeD onto the Unloading Conveyor. When The Box Has Left the Lift, It Is Free For The Next Request.