// 242.4499442577362s
// 1
def BURNER(IN, OVER_TEMP, PRE_HEAT, OIL_TEMP, FAIL, STATUS, PRE_HEAT_TIME, PRE_VENTILATION_TIME, PPR_IGNITION_TIME, POST_IGNITION_TIME, SAFETY_TIME, LOCKOUT_TIME):
if not IN:
FAIL = True
elif OVER_TEMP:
PRE_HEAT = False
elif PRE_HEAT and OIL_TEMP:
if not FAIL:
STATUS[110] = 1
PRE_VENTILATION_TIME = 0
PPR_IGNITION_TIME = 0
POST_IGNITION_TIME = 0
SAFETY_TIME = 0
LOCKOUT_TIME = 0
if PRE_HEAT and OIL_TEMP:
PRE_VENTILATION_TIME = 1
PPR_IGNITION_TIME = 1
POST_IGNITION_TIME = 1
SAFETY_TIME = 1
LOCKOUT_TIME = 1
if PRE_HEAT and OIL_TEMP and FAIL:
elif PRE_HEAT and OIL_TEMP and not FAIL:
PRE_VENTILATION_TIME = 0.5
PPR_IGNITION_TIME = 0.5
POST_IGNITION_TIME = 0.5
SAFETY_TIME = 0.5
LOCKOUT_TIME = 0.5
if PRE_HEAT and OIL_TEMP and FAIL and not STATUS[112]:
elif PRE_HEAT and OIL_TEMP and not FAIL:
PRE_VENTILATION_TIME = 0.75
PPR_IGNITION_TIME = 0.75
POST_IGNITION_TIME = 0.75
SAFETY_TIME = 0.75
LOCKOUT_TIME = 0.75
if PRE_HEAT and OIL_TEMP and FAIL and STATUS[112]:
elif PRE_HEAT and OIL_TEMP and not FAIL and STATUS[112]:
PRE_VENTILATION_TIME = 0.875
PPR_IGNITION_TIME = 0.875
POST_IGNITION_TIME = 0.875
SAFETY_TIME = 0.875
LOCKOUT_TIME = 0.875
if PRE_HEAT and OIL_TEMP and FAIL and STATUS[112] and not STATUS[113]:
elif PRE_HEAT and OIL_TEMP and not FAIL and STATUS[112] and not STATUS[113]:
PRE_VENTILATION_TIME = 0.9375
PPR_IGNITION_TIME = 0.9375
POST_IGNITION_TIME = 0.9375
SAFETY_TIME = 0.9375
LOCKOUT_TIME = 0.9375