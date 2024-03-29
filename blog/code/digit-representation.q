// digit representation
// integer to digits in a given base

10 vs 1                         // vs is the idiomatic method
10 vs 1234
10 vs 3657362
2 vs 10                         // works for any numeric base
5 vs 342

10 sv enlist 1                  // sv is the reverse
10 sv 1 2 3 4
10 sv 3 6 5 7 3 6 2
2 sv 1 0 1 0                    // also for any numeric base
5 sv 2 3 3 2

(5 sv 2 3 3 2)={sum y*x xexp reverse til count y}

// base 10 only
"J"$/:string 1
"J"$/:string 1234
"J"$/:string 3657362

value each string 1             // value achieves the same
value each string 1234
value each string 3657362

.Q.n?string 1
.Q.n?string 1234
.Q.n?string 3657362

// speed test - atom
\ts:100000 10 vs 1234
\ts:100000 "J"$/:string 1234
\ts:100000 value each string 1234
\ts:100000 .Q.n?string 1234

// speed test - vector
n:1000?1000
\ts:100 10 vs/:n
\ts:100 "J"$/:/:string n
\ts:100 value each'string n
\ts:100 .Q.n?string n
