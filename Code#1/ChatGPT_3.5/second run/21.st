// 64.68s
// weiter generieren
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN: BOOL;                 // Control input to start the burner
    OVER_TEMP: BOOL;          // Boiler thermostat protection
    OIL_TEMP: BOOL;           // Signal indicating the oil temperature is reached
    MULTIPLE_IGNITION: BOOL;  // Enable multiple ignitions after flame failure
    STAGE2: BOOL;             // Input to activate the second stage
    RST: BOOL;                // Reset input to restart the operation after lockout time
END_VAR

VAR_OUTPUT
    PRE_HEAT: BOOL;         // Output to start fuel oil warming
    MOTOR_ON: BOOL;         // Output to activate the motor
    FAN_ON: BOOL;           // Output to activate the fan
    IGNITION_ON: BOOL;      // Output to activate the ignition
    OIL_VALVE_OPEN: BOOL;   // Output to open the oil valve
    STATUS: INT;            // Output status indicating the current state of the module
    FAIL: BOOL;             // Output indicating a failure
END_VAR

VAR
    PRE_HEAT_TIMER: TON;                // Timer for fuel oil warming
    PRE_VENT_TIMER: TON;                // Timer for pre-purge (pre-ventilation)
    IGNITION_TIMER: TON;                // Timer for ignition
    SAFETY_TIMER: TON;                  // Timer for safety time
    POST_IGNITION_TIMER: TON;           // Timer for post-ignition time
    STAGE2_DELAY_TIMER: TON;            // Timer for delay before activating stage 2
    LOCKOUT_TIMER: TON;                 // Timer for lockout time after a fault
    OPERATION_TIMER: TON := T#0S;       // Timer for measuring the overall operation time
    STAGE1_OPERATION_TIMER: TON := T#0S; // Timer for measuring stage 1 operation time
    STAGE2_OPERATION_TIMER: TON := T#0S; // Timer for measuring stage 2 operation time

    PRE_HEAT_TIME: TIME := T#5S;         // Pre-heating time
    PRE_VENTILATION_TIME: TIME := T#10S; // Pre-ventilation time
    PPR_IGNITION_TIME: TIME := T#5S;     // Time before opening the oil valve during ignition
    SAFETY_TIME: TIME := T#10S;           // Safety time
    POST_IGNITION_TIME: TIME := T#5S;    // Post-ignition time
    STAGE2_DELAY: TIME := T#60S;         // Delay before activating stage 2
    LOCKOUT_TIME: TIME := T#300S;        // Lockout time after a fault

    STANDBY: INT := 110;     // Standby state
    STARTUP: INT := 111;     // Startup state
    STAGE1_RUNNING: INT := 112;  // Burner running on stage 1 state
    STAGE2_RUNNING: INT := 113;  // Burner running on stage 2 state
    ERROR_FUEL_WARMING: INT := 1;  // Error: Fuel oil warming not responded within PRE_HEAT_TIME
    ERROR_FAME_SENSOR_PRE_HEAT: INT := 2;  // Error: Fame sensor active during fuel oil warming
    ERROR_FAME_SENSOR_VENT: INT := 3;  // Error: Fame sensor active during pre-ventilation
    ERROR_SAFETY_TIME: INT := 4;  // Error: Safety time passed without fame
    ERROR_FAME_STOPS: INT := 5;  // Error: Fame stops in operation
    ERROR_OVERHEATING: INT := 9;  // Error: Boiler overheating contact has tripped
END_VAR

METHOD BurnerControl : BOOL
    CASE STATUS OF
        STANDBY:
            IF IN AND NOT OVER_TEMP THEN
                // Start the fuel oil warming
                PRE_HEAT := TRUE;
                STATUS := STARTUP;
                OPERATION_TIMER(IN := TRUE);
            ELSE
                // Standby state
                STATUS := STANDBY;
            END_IF;
        STARTUP:
            // Fuel oil warming
            IF PRE_HEAT_TIMER.Q THEN
                // Check if fuel oil warming has responded within PRE_HEAT_TIME
                FAIL := TRUE;
                STATUS := ERROR_FUEL_WARMING;
            ELSIF OIL_TEMP AND NOT PRE_VENT_TIMER.Q THEN
                // Start the motor and fan after fuel oil warming
                MOTOR_ON := TRUE;
                FAN_ON := TRUE;
                STATUS := STAGE1_RUNNING;
                STAGE1_OPERATION_TIMER(IN := TRUE);
            END_IF;
        STAGE1_RUNNING:
            // Check if fame sensor is active during fuel oil warming
            IF IGNITION_ON AND PRE_HEAT_TIMER.Q THEN
                FAIL := TRUE;
                STATUS := ERROR_FAME_SENSOR_PRE_HEAT;
            ELSIF IGNITION_ON AND PRE_VENT_TIMER.Q THEN
                // Check if fame sensor is active during pre-ventilation
                FAIL := TRUE;
                STATUS := ERROR_FAME_SENSOR_VENT;
            ELSIF SAFETY_TIMER.Q THEN
                // Check if safety time has passed without fame
                FAIL := TRUE;
                STATUS := ERROR_SAFETY_TIME;
            ELSIF NOT IGNITION_ON AND POST_IGNITION_TIMER.Q THEN
                // Check if fame stops in operation
                FAIL := TRUE;
                STATUS := ERROR_FAME_STOPS;
            ELSIF OVER_TEMP THEN
                // Check if boiler overheating protection is active
                STATUS := ERROR_OVERHEATING;
            ELSIF STAGE2 AND STAGE2_DELAY_TIMER.Q THEN
                // Activate stage 2 after the delay
                STATUS := STAGE2_RUNNING;
                STAGE2_OPERATION_TIMER(IN := TRUE);
            END_IF;
        STAGE2_RUNNING:
            // Continue with stage 2 operation
            // (Additional logic for stage 2 can be added here)
            // ...
            IF OVER_TEMP THEN
                // Check if boiler overheating protection is active
                STATUS := ERROR_OVERHEATING;
            END_IF;
    END_CASE;

    // Check if the burner is in lockout state
    IF LOCKOUT_TIMER.Q THEN
        STATUS := 0;  // Reset the status to indicate the lockout state
        FAIL := FALSE;  // Reset the fail flag
    END_IF;

    // Reset the operation timer if the burner is not in operation
    IF STATUS = STANDBY OR STATUS = 0 THEN
        OPERATION_TIMER(IN := FALSE);
    END_IF;

    // Check for reset condition to restart the operation after lockout time
    IF NOT RST AND LOCKOUT_TIMER.Q THEN
        LOCKOUT_TIMER(IN := FALSE);
    ELSIF RST THEN
        LOCKOUT_TIMER(IN := TRUE, PT := LOCKOUT_TIME);
    END_IF;

    // Output status indicating the current state of the module
    BurnerControl := TRUE;
END_METHOD
END_FUNCTION_BLOCK
