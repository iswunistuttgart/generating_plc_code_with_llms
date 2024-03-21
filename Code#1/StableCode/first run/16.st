// 42.11583971977234s
// 1
var traffic_light = {
    "North": {"Green": false, "Yellow": false, "Red": true}, 
    "East": {"Green": true, "Yellow": false, "Red": false}
};

// Set initial state of the lights
var current_state = traffic_light;

// Timer to control the cycle
var timer = 0;

// Function to update the state of the lights
function update_lights() {
    if (timer < 10) {
        // North green
        current_state["North"]["Green"] = true;

        // North yellow
        if (timer > 500 && timer < 900) {
            current_state["North"]["Yellow"] = true;
        } else {
            current_state["North"]["Yellow"] = false;
        }

        // North red
        if (timer > 9500 && timer < 10000) {
            current_state["North"]["Red"] = false;
        } else {
            current_state["North"]["Red"] = true;
        }
    } else if (timer >= 10 && timer < 500) {
        // East green
        current_state["East"]["Green"] = true;

        // East yellow
        if (timer > 5500 && timer < 9500) {
            current_state["East"]["Yellow"] = false;
        } else {
            current_state["East"]["Yellow"] = true;
        }

        // East red
        if (timer > 9500 && timer < 10000) {
            current_state["East"]["Red"] = true;
        } else {
            current_state["East"]["Red"] = false;
        }
    }
}

// Function to update the state of the lights every 10ms
setInterval(update_lights, 10);