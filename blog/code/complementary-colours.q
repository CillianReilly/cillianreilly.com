// complementary colour calculator
// the additive inverse of 255 in any base
// rgb: 255-255 0 0
// hex: 0xfffff-0xff0000
// binary (inverse is not): not flip 2 vs 255 0 0

// only for hex and rgb
cc:{
        y:first 256 vs y;       // convert to base 256
        y:255-y;                // invert
        // convert back to original input scheme
        f:("X"$"0123456789abcdef"flip 16 vs;::)`hex`rgb?x;
        f y
        }

cc[`hex;0xff0000]       // red > cyan
cc[`rgb;255 0 0]        // red > cyan
cc[`rgb;0 255 0]        // green > magneta
cc[`hex;0xffff00]       // yellow > blue

