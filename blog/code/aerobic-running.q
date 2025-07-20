// garmin offers a feature called race predictor
// based on training history and VO2 max
// it predicts times for 5k, 10k, half marathon (21.1k) and marathon (42.2k) distances (under ideal conditions)

// we can produce a model from the data to find predictions for any* distance
// * this is an aerobic running model, meaning shorter distances will be overestimated (they use progressivley more of the anaerobic system)
// personally, these are very optimistic predictions for me

// as of today, garmin predicts for me:
// 5k:    00:19:31
// 10k:   00:41:12
// 21.1k: 01:34:17
// 42.2k: 03:28:38

// use least squares regression to model these data points
// https://en.wikipedia.org/wiki/Least_squares
// given 4 data points, we need at worst a cubic polynomial
// kdb+ has a keyword for this: https://code.kx.com/q/ref/lsq/#polynomial-fitting
// the model will produce pace per km and total time

d:5 10 21.1 42.2
t:00:19:31 00:41:12 01:34:17 03:28:38
c:first enlist[t%d]lsq d xexp/:n:til count d            // pt%pd gives pace
p:sum c*xexp[;n]::                                      // polynomial
f:{`pace`time!18h$p[x]*1,x}

// graphed at https://www.wolframalpha.com/input?i=218.1794%2B3.543859x-0.0717128x%5E2%2B0.0007533305x%5E3
first c         // constant term is 03:38 minutes

// cubic will match inputs exactly
t~(f each 5 10 21.1 42.2)`time

// we can reduce the the degree of the polynomial at the expense of accuracy
rp:{sum y*xexp[x;]til count y}
rf:{18h$prd x*rp[x;y]}

// oscillates around the true value as degree increases
show([]degree:til 4)!flip(`$string d)!rf/:\:[d;](1+til count c)#\:c

// predict some random distances (up to 100k)
{x!f each x}asc -5?100
