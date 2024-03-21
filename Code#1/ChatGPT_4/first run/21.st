// 108.14s
// 3
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN           : BOOL;  // Start command
    OVER_TEMP    : BOOL;  // Boiler over-temperature protection
    OIL_TEMP     : BOOL;  // Oil reached temperature signal
    STAGE2       : BOOL;  // Command to activate stage 2
    MULTIPLE_IGNITION : BOOL; // Flag for retrying ignition
    RST          : BOOL;  // Reset command
END_VAR

VAR_OUTPUT
    PRE_HEAT     : BOOL;  // Pre-heating active
    FAIL         : BOOL;  // Failure state
    STATUS       : INT;   // Status code
END_VAR

VAR
    PRE_HEAT_TIME        : TON; // Timer for pre-heat time
    PRE_VENTILATION_TIME : TON; // Timer for pre-ventilation time
    PRE_IGNITE_TIME      : TON; // Timer before ignition
    SAFETY_TIME          : TON; // Timer for flame sensor safety check
    POST_IGNITE_TIME     : TON; // Timer for post-ignition operation
    STAGE2_DELAY         : TON; // Timer for delay to stage 2
    LOCKOUT_TIME         : TON; // Lockout timer after a fault
    OperationStage       : INT; // Current operation stage
    LockoutActive        : BOOL; // Lockout state
END_VAR

(* Additional implementation details would go here *)
