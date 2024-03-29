// stepped dictionary

show d:(10*til 10)!til 10;
d 10 40 35 -10 100                              // non existent keys return a null of type value d

s:`s#d                                          // apply sorted attribute
s~d
attr each(d;s)
s 10 40 35 -10 100                              // returns value of max key less than or equal to the index

show s:`s#0 1 10 100!1 2 3 4                    // comparable to if else and bin
ifelse:{$[x>=100;4;x>=10;3;x>=1;2;x>=0;1;0N]}
binsort:{1+0 1 10 100 bin x}
(s;ifelse;binsort)@\:/:12 100 0

show s:`s#0 1 10 100!`bin1`bin2`bin3`bin4       // allows direct mapping to datatypes other than long
binsort:{`b1`b2`b3`b4 0 1 10 100 bin x}         // whereas bin must index another data structure
(s;binsort)@\:12 63

r:10000?100
\ts:2000 s r
\ts:2000 binsort r                              // comparable times

// `s#10 30 20!1 3 2                            // 's-fail. keys must be ordered
