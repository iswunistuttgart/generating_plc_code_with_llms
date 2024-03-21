// 9.336573362350464s
// 1
function FC1003(IN, OUT){
    var IN_MIN = 0;
    var IN_MAX = 255;
    var OUT_MIN = -20;
    var OUT_MAX = 40;

    if (IN >= IN_MIN && IN <= IN_MAX) {
        OUT = (IN - IN_MIN) * (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN) + OUT_MIN;
    }
}