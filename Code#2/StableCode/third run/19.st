// 42.342976808547974s
// 1
#include <IEC61131_FC.hh>
#include "FB1005.h"
using namespace IEC61131_FC;

int FUNCTION_BLOCK::calculate() {
    int m = 0;
    if (START) {
        // start new measurement
        M_MAX = -INFINITY;
        M_MIN = INFINITY;
        D_MAX = -INFINITY;
        D_MIN = INFINITY;
        P1 = false;
        return 0;
    }
    // check the plate thickness
    REAL t = (S1.getValue() > 0)? V_MAX : V_MIN;
    if (t == V_MAX || t == V_MIN) {
        P1 = true;
        return 0;
    }
    if (t < M_MAX) M_MAX = t;
    else if (t > M_MIN) M_MIN = t;
    // check the difference between two lasers
    REAL d = abs(DIKE - LASER1.getValue());
    if (d > D_MAX) D_MAX = d;
    else if (d < D_MIN) D_MIN = d;
    return 0;
}