// 18.384238481521606s
// 1
//IEC 61131-3 Structured Text Program to Implement Lambert W Function

//Declare Global Variables
var PI = 3.14;
var EPSILON = 0.000000000000001;

function lambertW(w) {
    if (Math.abs(w.z) < EPSILON)
        return null;

    var s = w.y / w.z;
    var sinThetaOverLambda = Math.sin(PI * w.x) / PI;
    var cosThetaOverLambda = Math.cos(PI * w.x);

    var phi = 0;
    if (Math.abs(w.y) > EPSILON)
        phi = Math.atan2(sinThetaOverLambda, cosThetaOverLambda);

    return new THREE.Vector3(s * Math.cos(phi), s * Math.sin(phi), w.z);
}