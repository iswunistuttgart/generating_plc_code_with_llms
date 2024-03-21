// 38.196704626083374s
// 1
var traffic_light = {
    "North": {"Green": false, "Yellow": false, "Red": true}, 
    "East": {"Green": true, "Yellow": false, "Red": false}
};

// Set initial state of the lights
var current_state = traffic_light;

// Timer for the TON
var timer = 0;

// Function to update the state of the lights
function update_lights() {
    // Update the North green and North yellow
    if (timer < 500) {
        current_state["North"]["Green"] = true;
        current_state["North"]["Yellow"] = false;
    } else if (timer >= 500 && timer <= 9500){
        current_state["North"]["Green"] = false;
        current_state["North"]["Yellow"] = true;
    } else {
        current_state["North"]["Green"] = false;
        current_state["North"]["Yellow"] = false;
    }

    // Update the North red and East green
    if (timer >= 9500 && timer <= 10000) {
        current_state["East"]["Green"] = true;
        current_state["East"]["Yellow"] = false;
        current_state["East"]["Red"] = false;
    } else if (timer > 10000){
        current_state["East"]["Green"] = false;
        current_state["East"]["Yellow"] = false;
        current_state["East"]["Red"] = true;
    }
}

// Function to update the timer
function update_timer() {
    timer++;
    update_lights();
}